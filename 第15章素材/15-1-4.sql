1、预置数据如下：
--==============================================================
--          table: employee 职员表
--==============================================================
CREATE TABLE employee(
    empid              int                 not null,  --职员工号
    empname            text                not null,  --职员姓名
    deptid             int                 not null,  --部门ID
    salary             int                 not null,  --工资
    constraint pk_employee primary key (empid)
);
CREATE INDEX idx_empdepid on employee (deptid);

--==============================================================
--          table: department   部门表
--==============================================================
CREATE TABLE department(
    deptid              int                  not null,  ---部门ID
    deptname            text                 not null,  ---部门名称
    parentid            int                  not null,  --上级部门ID
    constraint pk_department primary key (deptid)
);

--==============================================================
--          table: emp_order_insurance   职员保险表
--==============================================================
CREATE TABLE emp_order_insurance(
    empid              int                         not null,  --订购职员ID
    insuranceid        int                        not null,  --保险ID
    copies             int                         not null   --多少份
);
CREATE index idx_emp_order_insurance on emp_order_insurance(empid);

--==============================================================
--          table: insurance   保险类别表
--==============================================================
CREATE TABLE insurance(
    insuranceid          int                    not null,  --保险ID
    insurancename        text                   not null,  --保险名称
    companyname          text                   not null,  --保险公司
	orderlimit           int                    null,  --限制订购份数
    constraint pk_insurance primary key (insuranceid)
);
2、插入一批数据：
INSERT INTO employee SELECT generate_series(1,1000000),substr('abcdefghijklmnopqrstuvwxyz',(random()*23)::integer,3),FLOOR(RANDOM()*10000),random()*15000;

INSERT INTO department SELECT generate_series(1,10000),format('dept_%s', generate_series(1,10000)),FLOOR(RANDOM()*5000);

INSERT INTO emp_order_insurance SELECT generate_series(1,1000),FLOOR(RANDOM()*100),FLOOR(RANDOM()*500);

INSERT INTO insurance SELECT generate_series(1,100),format('Insurance%s', generate_series(1,100)),
format('Comp%s', FLOOR(RANDOM()*10)),500+FLOOR(RANDOM()*500);