
--1.�������ݿ�
CREATE TABLESPACE  hr_data location '/pgdata/hrdata';
drop database if exists hr;
create database hr with tablespace=hr_data encoding=utf8;

--2.�����û�
create user hr password 'hr123';
grant all privileges on database hr to hr;
create schema hr authorization hr;

--3.��������
--Ѫ��0:A 1:B 2:AB 3:O //����ʹ��ö������
drop type blood cascade;
create type blood as enum('A','B','AB','O','OTHER');
--�Ա�--0���� 1��Ů
drop type sex cascade;
create type sex as enum('male','female');
--�������˹�ϵ:0:�Լ� 1:��ż 2:��ĸ 3:��Ů
drop type relationship cascade;
create type relationship as enum('me', 'mate','parent','children');

--4.��������������
--==============================================================
--          table: department   ���ű�
--==============================================================
\echo department;
drop table if exists department cascade;
create table department(
    deptid              int                  not null,  ---����ID
    deptname            text                 not null,  ---��������
    parentid            int                  not null,  --�ϼ�����ID
    createtime          timestamp            null,        --���Ŵ���ʱ��
    constraint pk_department primary key (deptid)
);

insert into department values
(0,'ETZ', -1),
(1001,'������', 0),
(1002,'����һ��', 1001),
(1003,'��������', 1001),
(1004,'���۲�', 0),
(1005,'����һ��', 1004),
(1006,'���۶���', 1004),
(1007,'������Դ��', 0),
(1008,'��Ʋ�', 1007),
(1009,'������', 1007),
(1010,'����', 0);

--==============================================================
--          table: employee   ְԱ��
--==============================================================
\echo employee;
drop table if exists employee cascade;
create table employee(
    empid              int                 not null,  --ְԱ����
    empname            text                not null,  --ְԱ����
    deptid             int                 not null,  --����ID
    sex                sex                 not null,  --0���� 1��Ů
    cardno             text                not null,  --���֤��
    telephone          text                not null,  --��ϵ�绰
    birthdate          date                not null,  --��������
    salary             int                 not null,  --����
    createtime     timestamp               not null,  --��ְʱ��
    constraint pk_employee primary key (empid)
);

insert into employee values
(100001, '������', 1002, 'male', '452123198510084651', '138515600001',to_date('19750101','YYYYMMDD'),100000, to_date('20000101','YYYYMMDD')),
(100002, '����', 1002, 'male', '452123198510084652', '138515600002',to_date('19760101','YYYYMMDD'),80000, to_date('20010101','YYYYMMDD')),
(100003, '����', 1002, 'female', '452123198510084653', '138515600003',to_date('19770101','YYYYMMDD'),70000, to_date('20020101','YYYYMMDD')),
(100004, '��һ', 1002, 'male', '452123198510084654', '138515600004',to_date('19780101','YYYYMMDD'),80000, to_date('20030101','YYYYMMDD')),
(100005, 'Ǯ��', 1003, 'male', '452123198510084655', '138515600005',to_date('19790101','YYYYMMDD'),60000, to_date('20040101','YYYYMMDD')),
(100006, '����', 1005, 'male', '452123198510084656', '138515600006',to_date('19800101','YYYYMMDD'),50000, to_date('20050101','YYYYMMDD')),
(100007, '����', 1006, 'male', '452123198510084657', '138515600007',to_date('19810101','YYYYMMDD'),40000, to_date('20060101','YYYYMMDD')),
(100008, '��ȫ', 1008, 'male', '452123198510084658', '138515600008',to_date('19820101','YYYYMMDD'),30000, to_date('20070101','YYYYMMDD')),
(100009, '���', 1009, 'male', '452123198510084659', '138515600009',to_date('19830101','YYYYMMDD'),25000, to_date('20080101','YYYYMMDD')),
(100010, '���в�', 1009, 'male', '452123198510084660', '138515600010',to_date('19840101','YYYYMMDD'),20000, to_date('20090101','YYYYMMDD')),
(100011, '�³�', 1009, 'female', '452123198510084661', '138515600011',to_date('19850101','YYYYMMDD'),19000, to_date('20100101','YYYYMMDD')),
(100012, '����', 1009, 'male', '452123198510084662', '138515600012',to_date('19860101','YYYYMMDD'),18000, to_date('20110101','YYYYMMDD')),
(100013, '��仨', 1009, 'female', '452123198510084663', '138515600013',to_date('19870101','YYYYMMDD'),17000, to_date('20120101','YYYYMMDD')),
(100014, '������', 1009, 'female', '452123198510084663', '138515600014',to_date('19870801','YYYYMMDD'),17000, to_date('20120101','YYYYMMDD')),
(100015, '�ܲ�', 1009, 'male', '452123198510084664', '138515600015',to_date('19880101','YYYYMMDD'),16000, to_date('20130101','YYYYMMDD'));

--==============================================================
--          table: employee_ext   ְԱ��չ��Ϣ��
--==============================================================
\echo employee_ext;
drop table if exists employee_ext cascade;
create table employee_ext(
    empid                     int                 not null,  --ְԱID
    empname_en                text                 null,      --Ӣ����
    height                    int                 null,      --���
    bloodtype                 blood               null,     --Ѫ��0:A 1:B 2:AB 3:O
    address                   text                null,      --��ͥסַ
    emername                  text                null,     --������ϵ��
    emerntelephone            text                null,     --������ϵ�绰
    pics                      text[]              null,   --����������ͼƬ·��(����ͼ,��ͨͼ������ͼ)
    constraint pk_employee_ext primary key (empid)
);
insert into employee_ext values
(100001, 'zhaozilong', 177, 'A', '�Ͼ�', null,''),
(100002, 'wangzi', 175, 'O', '����', null, ''),
(100003, 'wanglin', 162, 'AB', '����', null, ''),
(100004, 'dingyi', 188, 'A', '��ͨ', null, ''),
(100005, 'qianbo', 169, 'O', '�ӱ�', null, ''),
(100006, 'sunsan', 176, 'B', '����', null, ''),
(100007, 'lisi', 173, 'O', '����', null, ''),
(100008, 'zhouquan', 174, 'AB', '�㶫', null, ''),
(100009, 'wugang', 179, 'A', '����', null, ''),
(100010, 'fenyoucai', 172, 'A', '����', '15050100010', ''),
(100011, 'chencheng', 168, 'B', '����', '15050100011', ''),
(100012, 'weiqing', 180, 'B', '�Ͼ�', '15050100012', ''),
(100013, 'miaocuihua', 171, 'A', '����', '15050100013', ''),
(100014, 'wangxiaoming', 165, 'A', '�ɶ�', '15050100014', ''),
(100015, 'cc', 166, 'B', '��ͨ', '15050100015', '');

--==============================================================
--          table: insurance   ְԱ����
--==============================================================
\echo insurance;
drop table if exists insurance cascade;
create table insurance(
    insuranceid          int                    not null,  --����ID
    insurancename        text                   not null,  --��������
    companyname          text                   not null,  --���չ�˾
    orderlimit           int                    not null,  --���ƶ�������
    duration             daterange              not null,  --������Ч�� ��Ч����-ʧЧ����
    constraint pk_insurance primary key (insuranceid)
);
insert into insurance values(1001, '�ؼ���', 'TEZ', 10, '[2019-01-01,2019-12-31]');
insert into insurance values(1002, '��ͯ��', 'TEZ', 1, '[2019-01-01,2019-12-31]');
insert into insurance values(1003, '������', 'TEZ', 5, '[2019-01-01,2019-12-31]');



--==============================================================
--          table: emp_order_insurance   ְԱ���ն������
--==============================================================
\echo emp_order_insurance;
drop table if exists emp_order_insurance cascade;
create table emp_order_insurance(
    empid              int                         not null,  --����ְԱID
    insuranceid        int                         not null,  --����id
    insurant           text                        not null,  --��������
    sex                sex                         not null,  --���������Ա�
    relationship       relationship                not null,  --�������˹�ϵ:0:���� 1:��ż 2:��ĸ 3:��Ů
    copies             int                         not null,  --���ٷ�
    insurancedate      date                        not null  -- Ͷ������ 
);
create index idx_emp_order_insurance on emp_order_insurance(empid);
INSERT INTO emp_order_insurance VALUES 
(100001, 1001, '������', 'male', 'me', 5, '2019-01-05'), 
(100004, 1001, '��һ', 'male', 'me', 5, '2019-01-05'),
(100006, 1001, '����', 'male', 'me', 5, '2019-01-05'), 
(100007, 1001, '����', 'male', 'me', 5, '2019-01-05'),
(100005, 1001, 'Ǯ��', 'male', 'me', 5, '2019-01-05'),
(100001, 1003, '������', 'male', 'me', 1, '2019-01-05'),
(100001, 1002, '������', 'male', 'me', 1, '2019-01-05'), 
(100004, 1002, '��һ', 'male', 'me', 1, '2019-01-05'),
(100006, 1002, '����', 'male', 'me', 1, '2019-01-05'),
(100003, 1001, '����', 'female', 'me', 5, '2019-01-05'),
(100003, 1002, '����', 'female', 'me', 1, '2019-01-05'),
(100003, 1003, '����', 'female', 'me', 1, '2019-01-05');

--==============================================================
--          table: employee_workhis   ְԱ����������
--==============================================================
\echo employee_workhis;
drop table if exists employee_workhis cascade;
create table employee_workhis(
    empid                int             not null,  --ְԱID
    begindate            date            not null,  --��ʼʱ��
    enddate              date            not null,  --��ֹʱ��
    companyname          text            not null,  --��˾����
    jobcontent           text            not null,  --ְ������
    witness              text            not null,  --֤��������
    telephone            text            not null   --֤���˵绰
);
create index idx_employee_workhis on employee_workhis(empid);


--����һ�ű���������Ĺ������²���
CREATE TABLE upd_dept (
    deptid             int                 not null,  --���ź�
    deptname           text                not null,  --������
    constraint pk_test primary key (deptid)
);
INSERT INTO upd_dept VALUES(1001,'dept1'),(1002,'dept2'),(1006,'dept6');
