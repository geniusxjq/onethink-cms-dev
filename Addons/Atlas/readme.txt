ʹ�÷���:
1. ������ͼ���� ����Ϊ Atlas
2. ���ò��
3. �޸� \Application\Admin\Common\function.php
	135��  get_attribute_type������type ���� 

        'atlas'   =>  array('�ϴ���ͼ','varchar(255) NOT NULL'),

4. �޸�
	\Application\Admin\View\Article\Add.html
	
	��   
		<switch name="field.type">   
	֮�����

		<case value="pictures">
			{:hook('Atlas', array('name'=>$field['name'],'value'=>$field['value']))}
		</case>

5. �޸�
	\Application\Admin\View\Article\Edit.html
	
	��   
		<switch name="field.type">   
	֮�����

		<case value="pictures">
			{:hook('Atlas', array('name'=>$field['name'],'value'=>$data[$field['name']]))}
		</case>

5. ������Ҫ���Ӷ�ͼ�ϴ���ģ��  �����ֶ�  ����Ϊ ��ͼ�ϴ�

6. ǰ̨���ö�ͼʱ ȡ����Ӧ�ֶ��Ժ�  implode(',',�ֶ���) �Ժ�  ѭ����� __ROOT__{$v|get_cover='path'}