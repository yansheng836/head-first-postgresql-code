--创建审计表
DROP TABLE IF EXISTS drop_audit CASCADE;  
CREATE TABLE drop_audit
(  
    classid         	oid,
    objid           	oid,
    objsubid        	oid,
    object_type     	text,
    schema_name     	text,
    object_name     	text,
    object_identify 	text,
    ddl_tag         	text,
    op_time         	timestamp
); 


