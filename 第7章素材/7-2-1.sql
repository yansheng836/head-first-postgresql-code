--����ְԱ��

drop table if exists hr_employee cascade;
create table hr_employee(
    empid              	int                  	not null,  --ְԱ����
    empname        		text                	not null,  --ְԱ����
    deptid              int                 	not null,  --����ID
    sex                 int                		not null,  --0���� 1��Ů
    cardno            	text                	not null,  --���֤��
    telephone       	text[]                 	not null,  --��ϵ�绰�б�
    birthdate        	date                	not null,  --��������
    createtime     		timestamp       		not null  --��ְʱ��
	
);

