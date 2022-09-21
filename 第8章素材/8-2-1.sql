CREATE TABLE employee_work_histories(
    empid				int			not null,  --职员ID
    begindate			date		not null,  --起始时间
    enddate				date		not null,  --截止时间
    companyname			text		not null,  --公司名字
    responsibilities	jiantext	not null,  --职责描述
    witness				text		not null,  --证明人姓名
    telephone			text		not null   --证明人电话
);