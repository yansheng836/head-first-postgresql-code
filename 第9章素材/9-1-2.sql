-- Table: ְԱ��  
DROP TABLE IF EXISTS hr_employee CASCADE;  
CREATE TABLE hr_employee  
(  
    empid          int         NOT NULL,  --ְԱID
    empcode        text        NOT NULL,  --ְԱ����
    empname        text        NOT NULL,  --ְԱ����
    deptid         int         NOT NULL,  --����ID
    sex            smallint    NOT NULL,  --0���� 1��Ů
    cardno         text        NOT NULL,  --���֤��
    telephone      text        NOT NULL,  --��ϵ�绰
    birthdate      date        NOT NULL,  --��������
    createtime     timestamp   NOT NULL,  --��ְʱ��
    CONSTRAINT pk_hr_employee PRIMARY KEY(empid)
);  

  
-- Table: ��Ʊ�  
DROP TABLE IF EXISTS hr_employee_audit CASCADE;  
CREATE TABLE hr_employee_audit
(  
    operation       char(1)      NOT NULL,
    stamp            timestamp   NOT NULL,
    userid           text         NOT NULL,
    empname          text         NOT NULL
);  


