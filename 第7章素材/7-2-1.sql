--创建职员表

drop table if exists hr_employee cascade;
create table hr_employee(
    empid              	int                  	not null,  --职员工号
    empname        		text                	not null,  --职员姓名
    deptid              int                 	not null,  --部门ID
    sex                 int                		not null,  --0：男 1：女
    cardno            	text                	not null,  --身份证号
    telephone       	text[]                 	not null,  --联系电话列表
    birthdate        	date                	not null,  --出生日期
    createtime     		timestamp       		not null  --入职时间
	
);

