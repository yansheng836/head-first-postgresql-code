CREATE TABLE teacher (id int NOT NULL,sname varchar(100));

CREATE TABLE student (sid int NOT NULL, teacher_id int NOT NULL DEFAULT 0,tname varchar(100));