-- Table: 职员表  
DROP TABLE IF EXISTS hr_employee CASCADE;  
CREATE TABLE hr_employee  
(  
    empid          int         NOT NULL,  --职员ID
    empcode        text        NOT NULL,  --职员工号
    empname        text        NOT NULL,  --职员姓名
    deptid         int         NOT NULL,  --部门ID
    sex            smallint    NOT NULL,  --0：男 1：女
    cardno         text        NOT NULL,  --身份证号
    telephone      text        NOT NULL,  --联系电话
    birthdate      date        NOT NULL,  --出生日期
    createtime     timestamp   NOT NULL,  --入职时间
    CONSTRAINT pk_hr_employee PRIMARY KEY(empid)
);  

  
-- Table: 审计表  
DROP TABLE IF EXISTS hr_employee_audit CASCADE;  
CREATE TABLE hr_employee_audit
(  
    operation       char(1)      NOT NULL,
    stamp            timestamp   NOT NULL,
    userid           text         NOT NULL,
    empname          text         NOT NULL
);  


