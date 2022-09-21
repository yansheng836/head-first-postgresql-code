
--1.创建数据库
CREATE TABLESPACE  hr_data location '/pgdata/hrdata';
drop database if exists hr;
create database hr with tablespace=hr_data encoding=utf8;

--2.创建用户
create user hr password 'hr123';
grant all privileges on database hr to hr;
create schema hr authorization hr;

--3.创建类型
--血型0:A 1:B 2:AB 3:O //建议使用枚举类型
drop type blood cascade;
create type blood as enum('A','B','AB','O','OTHER');
--性别--0：男 1：女
drop type sex cascade;
create type sex as enum('male','female');
--跟订购人关系:0:自己 1:配偶 2:父母 3:子女
drop type relationship cascade;
create type relationship as enum('me', 'mate','parent','children');

--4.创建表并插入数据
--==============================================================
--          table: department   部门表
--==============================================================
\echo department;
drop table if exists department cascade;
create table department(
    deptid              int                  not null,  ---部门ID
    deptname            text                 not null,  ---部门名称
    parentid            int                  not null,  --上级部门ID
    createtime          timestamp            null,        --部门创建时间
    constraint pk_department primary key (deptid)
);

insert into department values
(0,'ETZ', -1),
(1001,'生产部', 0),
(1002,'生产一部', 1001),
(1003,'生产二部', 1001),
(1004,'销售部', 0),
(1005,'销售一部', 1004),
(1006,'销售二部', 1004),
(1007,'人力资源部', 0),
(1008,'会计部', 1007),
(1009,'宣传部', 1007),
(1010,'法务部', 0);

--==============================================================
--          table: employee   职员表
--==============================================================
\echo employee;
drop table if exists employee cascade;
create table employee(
    empid              int                 not null,  --职员工号
    empname            text                not null,  --职员姓名
    deptid             int                 not null,  --部门ID
    sex                sex                 not null,  --0：男 1：女
    cardno             text                not null,  --身份证号
    telephone          text                not null,  --联系电话
    birthdate          date                not null,  --出生日期
    salary             int                 not null,  --工资
    createtime     timestamp               not null,  --入职时间
    constraint pk_employee primary key (empid)
);

insert into employee values
(100001, '赵子龙', 1002, 'male', '452123198510084651', '138515600001',to_date('19750101','YYYYMMDD'),100000, to_date('20000101','YYYYMMDD')),
(100002, '王子', 1002, 'male', '452123198510084652', '138515600002',to_date('19760101','YYYYMMDD'),80000, to_date('20010101','YYYYMMDD')),
(100003, '王琳', 1002, 'female', '452123198510084653', '138515600003',to_date('19770101','YYYYMMDD'),70000, to_date('20020101','YYYYMMDD')),
(100004, '丁一', 1002, 'male', '452123198510084654', '138515600004',to_date('19780101','YYYYMMDD'),80000, to_date('20030101','YYYYMMDD')),
(100005, '钱博', 1003, 'male', '452123198510084655', '138515600005',to_date('19790101','YYYYMMDD'),60000, to_date('20040101','YYYYMMDD')),
(100006, '孙三', 1005, 'male', '452123198510084656', '138515600006',to_date('19800101','YYYYMMDD'),50000, to_date('20050101','YYYYMMDD')),
(100007, '李四', 1006, 'male', '452123198510084657', '138515600007',to_date('19810101','YYYYMMDD'),40000, to_date('20060101','YYYYMMDD')),
(100008, '周全', 1008, 'male', '452123198510084658', '138515600008',to_date('19820101','YYYYMMDD'),30000, to_date('20070101','YYYYMMDD')),
(100009, '吴刚', 1009, 'male', '452123198510084659', '138515600009',to_date('19830101','YYYYMMDD'),25000, to_date('20080101','YYYYMMDD')),
(100010, '冯有才', 1009, 'male', '452123198510084660', '138515600010',to_date('19840101','YYYYMMDD'),20000, to_date('20090101','YYYYMMDD')),
(100011, '陈晨', 1009, 'female', '452123198510084661', '138515600011',to_date('19850101','YYYYMMDD'),19000, to_date('20100101','YYYYMMDD')),
(100012, '卫青', 1009, 'male', '452123198510084662', '138515600012',to_date('19860101','YYYYMMDD'),18000, to_date('20110101','YYYYMMDD')),
(100013, '苗翠花', 1009, 'female', '452123198510084663', '138515600013',to_date('19870101','YYYYMMDD'),17000, to_date('20120101','YYYYMMDD')),
(100014, '王晓明', 1009, 'female', '452123198510084663', '138515600014',to_date('19870801','YYYYMMDD'),17000, to_date('20120101','YYYYMMDD')),
(100015, '曹操', 1009, 'male', '452123198510084664', '138515600015',to_date('19880101','YYYYMMDD'),16000, to_date('20130101','YYYYMMDD'));

--==============================================================
--          table: employee_ext   职员扩展信息表
--==============================================================
\echo employee_ext;
drop table if exists employee_ext cascade;
create table employee_ext(
    empid                     int                 not null,  --职员ID
    empname_en                text                 null,      --英文名
    height                    int                 null,      --身高
    bloodtype                 blood               null,     --血型0:A 1:B 2:AB 3:O
    address                   text                null,      --家庭住址
    emername                  text                null,     --紧急联系人
    emerntelephone            text                null,     --紧急联系电话
    pics                      text[]              null,   --数组存放三种图片路径(缩略图,普通图，高清图)
    constraint pk_employee_ext primary key (empid)
);
insert into employee_ext values
(100001, 'zhaozilong', 177, 'A', '南京', null,''),
(100002, 'wangzi', 175, 'O', '苏州', null, ''),
(100003, 'wanglin', 162, 'AB', '河南', null, ''),
(100004, 'dingyi', 188, 'A', '南通', null, ''),
(100005, 'qianbo', 169, 'O', '河北', null, ''),
(100006, 'sunsan', 176, 'B', '湖南', null, ''),
(100007, 'lisi', 173, 'O', '湖北', null, ''),
(100008, 'zhouquan', 174, 'AB', '广东', null, ''),
(100009, 'wugang', 179, 'A', '扬州', null, ''),
(100010, 'fenyoucai', 172, 'A', '广西', '15050100010', ''),
(100011, 'chencheng', 168, 'B', '贵州', '15050100011', ''),
(100012, 'weiqing', 180, 'B', '南京', '15050100012', ''),
(100013, 'miaocuihua', 171, 'A', '安徽', '15050100013', ''),
(100014, 'wangxiaoming', 165, 'A', '成都', '15050100014', ''),
(100015, 'cc', 166, 'B', '南通', '15050100015', '');

--==============================================================
--          table: insurance   职员保险
--==============================================================
\echo insurance;
drop table if exists insurance cascade;
create table insurance(
    insuranceid          int                    not null,  --保险ID
    insurancename        text                   not null,  --保险名称
    companyname          text                   not null,  --保险公司
    orderlimit           int                    not null,  --限制订购份数
    duration             daterange              not null,  --保险有效期 生效日期-失效日期
    constraint pk_insurance primary key (insuranceid)
);
insert into insurance values(1001, '重疾险', 'TEZ', 10, '[2019-01-01,2019-12-31]');
insert into insurance values(1002, '儿童险', 'TEZ', 1, '[2019-01-01,2019-12-31]');
insert into insurance values(1003, '健康险', 'TEZ', 5, '[2019-01-01,2019-12-31]');



--==============================================================
--          table: emp_order_insurance   职员保险订购情况
--==============================================================
\echo emp_order_insurance;
drop table if exists emp_order_insurance cascade;
create table emp_order_insurance(
    empid              int                         not null,  --订购职员ID
    insuranceid        int                         not null,  --保险id
    insurant           text                        not null,  --被保险人
    sex                sex                         not null,  --被保险人性别
    relationship       relationship                not null,  --跟订购人关系:0:本人 1:配偶 2:父母 3:子女
    copies             int                         not null,  --多少份
    insurancedate      date                        not null  -- 投保日期 
);
create index idx_emp_order_insurance on emp_order_insurance(empid);
INSERT INTO emp_order_insurance VALUES 
(100001, 1001, '赵子龙', 'male', 'me', 5, '2019-01-05'), 
(100004, 1001, '丁一', 'male', 'me', 5, '2019-01-05'),
(100006, 1001, '孙三', 'male', 'me', 5, '2019-01-05'), 
(100007, 1001, '李四', 'male', 'me', 5, '2019-01-05'),
(100005, 1001, '钱博', 'male', 'me', 5, '2019-01-05'),
(100001, 1003, '赵子龙', 'male', 'me', 1, '2019-01-05'),
(100001, 1002, '赵子龙', 'male', 'me', 1, '2019-01-05'), 
(100004, 1002, '丁一', 'male', 'me', 1, '2019-01-05'),
(100006, 1002, '孙三', 'male', 'me', 1, '2019-01-05'),
(100003, 1001, '王琳', 'female', 'me', 5, '2019-01-05'),
(100003, 1002, '王琳', 'female', 'me', 1, '2019-01-05'),
(100003, 1003, '王琳', 'female', 'me', 1, '2019-01-05');

--==============================================================
--          table: employee_workhis   职员工作履历表
--==============================================================
\echo employee_workhis;
drop table if exists employee_workhis cascade;
create table employee_workhis(
    empid                int             not null,  --职员ID
    begindate            date            not null,  --起始时间
    enddate              date            not null,  --截止时间
    companyname          text            not null,  --公司名字
    jobcontent           text            not null,  --职责描述
    witness              text            not null,  --证明人姓名
    telephone            text            not null   --证明人电话
);
create index idx_employee_workhis on employee_workhis(empid);


--创建一张表用于下面的关联更新操作
CREATE TABLE upd_dept (
    deptid             int                 not null,  --部门号
    deptname           text                not null,  --部门名
    constraint pk_test primary key (deptid)
);
INSERT INTO upd_dept VALUES(1001,'dept1'),(1002,'dept2'),(1006,'dept6');
