<?php

/**
 *  | 023SITE
 *  +----------------------------------------------------------------------
 *  | Copyright (c) 2014 http://www.023site.com All rights reserved.
 *  +----------------------------------------------------------------------
 *  | Author:  IT童老  OneThink号:a53663184  <lwl@outlook.com>
 *
 */

namespace Addons\ImportData\Controller;

use Home\Controller\AddonsController;

class ImportController extends AddonsController
{

    /**
     * 导入入口
     *
     */
    public function start()
    {
        $file = think_decrypt($_POST['wpxr']);
        $file = json_decode($file, true);
        $path = C('DOWNLOAD_UPLOAD');
        $file_name = $path['rootPath'] . $file['savepath'] . $file['savename'];
        if (file_exists($file_name)) {
            // 解析
            $res = $this->parse($file_name);
            if ($res) {
                // 导入
                $this->import();
            } else {
                $this->show_msg('解析失败，可能文件不存在或者格式不正确！');
            }

        } else {
            $this->show_msg('文件不存在或者格式不正确！');
        }
    }

    /**
     * 导入
     *
     */
    protected function import()
    {
        $this->importCategory();
        $this->importPost();

        $this->importEnd('导入完成');

    }

    /**
     *  导入分类
     *
     */
    protected function importCategory()
    {
        $cat = $this->categories;
        if (empty($cat)) {
            return false;
        }

        $Category = D('Category');
        foreach ($cat as $key => $value) {
            $map = array();
            $map['name'] = array('eq', $value['category_nicename']);
            $res = $Category->where($map)->find(); // 验证是否存在
            if ($res) {
                continue;
            } else {
                $data = array();
                $data['name'] = $value['category_nicename'];
                $data['title'] = $value['cat_name'];
                $data['description'] = $value['category_description'];
                $data['allow_publish'] = 1;
                $data['check'] = 1; // 是否需要审核
                $data['model'] = array(2); // 模型分类
                $data['type'] = array(2, 1, 3);
                $data['icon'] = 31;
                $data['display'] = 1;
                $data['reply'] = 1; // 允许回复
                $data['sort'] = 1;
                $data['list_row'] = 10;
                $data['pid'] = 1;

                $_POST = $data;
                $res = $Category->update();
                if (!$res) {
                    $this->show_msg('导入分类：' . $data['title'] . '(' . $Category->getError() . ')......失败!......X');
                } else {
                    $this->show_msg('导入分类：' . $data['title'] . '......成功!......√');
                }
            }
        }
    }


    /**
     * 导入文章数据
     *
     */
    protected function importPost()
    {

        $post = $this->posts;
        foreach ($post as $key => $value) {
            // 不能导入标题和内容为空的文章
            if (empty($value['post_title']) || empty($value['post_content']) || $value['post_type'] != 'post') {
                continue;
            }
            $art = array();
            $art['title'] = $value['post_title'];
            $art['description'] = $value['post_title'];
            $art['content'] = $value['post_content'];

            if (isset($value['terms'])) {
                foreach ($value['terms'] as $val) {
                    if ($val['domain'] == 'category') {
                        $Category = D('Category');
                        $map = array();
                        $map['title'] = array('eq', $val['name']);
                        $res = $Category->where($map)->find(); // 验证是否存在
                        if($res){
                            $art['category_id'] = $res['id'];

                        }else {
                            // 默认
                            $art['category_id'] = 2;
                        }
                        break;

                    }
                }
            } else {
                // 默认
                $art['category_id'] = 2;
            }

            $art['model_id'] = 2;
            $art['type'] = 2;
            $art['pid'] = 0;

            $_POST = $art;
            $res = D('Document')->update();
            if (!$res) {
                $this->show_msg('导入文章：' . $art['title'] . '(' . D('Document')->getError() . ')......失败!......X');
            } else {
                $this->show_msg('导入文章：' . $art['title'] . '......成功!......√');
            }
        }

    }

    /**
     * 解析数据
     *
     */
    protected function parse($file_name)
    {
        // 导入扩展类
        $parse = parse_res_name('Addons://ImportData/Parsers', 'Tool');
        $parseObj = new $parse();
        $resoult = $parseObj->parse($file_name);
        if ($resoult) {
            $this->authors = $resoult['authors'];
            $this->posts = $resoult['posts'];
            $this->categories = $resoult['categories'];
            $this->tags = $resoult['tags'];
            return true;
        } else {
            return false;
        }
    }


    /**
     * 及时显示提示信息
     * @param  string $msg 提示信息
     * @param  string $class 提示信息
     */
    public function show_msg($msg, $class = '')
    {
        echo "showmsg(\"{$msg}\", \"{$class}\");";
        flush();
        ob_flush();
    }

    /**
     * 导入完成
     *
     */
    public function importEnd($msg)
    {
        echo "importEnd(\"{$msg}\");";
        flush();
        ob_flush();
    }
}