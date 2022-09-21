1、创建分区表
CREATE TABLE vehicles2(
category          int   NOT NULL, -- 车辆类别，0：未归类，1：bikes，2：cars，3：trucks，4：ambulances，5：sprinkler，6：slag car，7：forklift，...
name              text,  -- 车辆名字
color             text,  -- 车身颜色 
weight            float,  -- 车身重量
area              text,  -- 产地
madedate          date  NOT NULL -- 出厂日期	
-- 其他业务字段定义省略...
) PARTITION BY LIST(category); -- 采用列表分区方式，category为分区键

2、在这些目录上创建不同的表空间，但需要预先在文件系统上创建父目录/pgdata，并在该目录下创建子目录：bikes_space、cars_space、trucks_space、ambulances_space、others_space：
CREATE TABLESPACE bikes_tb LOCATION '/pgdata/bikes_space';
CREATE TABLESPACE cars_tb LOCATION '/pgdata/cars_space';
CREATE TABLESPACE trucks_tb LOCATION '/pgdata/trucks_space';
CREATE TABLESPACE ambulances_tb LOCATION '/pgdata/ambulances_space';
CREATE TABLESPACE others_tb LOCATION '/pgdata/others_space';

3、在不同的表空间上为vehicles2主表创建分区
CREATE TABLE vehicles2_unknown
PARTITION OF vehicles2
FOR VALUES IN (0)
TABLESPACE others_tb;

CREATE TABLE vehicles2_bikes
PARTITION OF vehicles2
FOR VALUES IN (1)
TABLESPACE bikes_tb;

CREATE TABLE vehicles2_cars
PARTITION OF vehicles2
FOR VALUES IN (2)
TABLESPACE cars_tb;

CREATE TABLE vehicles2_trucks
PARTITION OF vehicles2
FOR VALUES IN (3)
TABLESPACE trucks_tb;

CREATE TABLE vehicles2_ambulances
PARTITION OF vehicles2
FOR VALUES IN (4)
TABLESPACE ambulances_tb;

CREATE TABLE vehicles2_others
PARTITION OF vehicles2
FOR VALUES IN (5,6,7)
TABLESPACE others_tb;

4、插入一批车辆信息：
INSERT INTO vehicles2 VALUES
(0,'U001','RED',null,null,'2018-04-12');

INSERT INTO vehicles2 VALUES
(1,'B001','RED',null,null,'2014-03-25'),
(1,'B002','RED',null,null,'2014-06-15'),
(1,'B003','RED',null,null,'2016-11-23'),
(1,'B004','RED',null,null,'2018-08-05'),
(1,'B005','RED',null,null,'2017-08-25');

INSERT INTO vehicles2 VALUES
(2,'C001','WHITE',null,null,'2014-03-25'),
(2,'C002','RED',null,null,'2014-06-15'),
(2,'C003','RED',null,null,'2016-11-23'),
(2,'C004','GREY',null,null,'2018-08-05'),
(2,'C005','RED',null,null,'2017-08-25');

INSERT INTO vehicles2 VALUES
(3,'T001','WHITE',null,null,'2014-03-25'),
(3,'T002','BLUE',null,null,'2014-06-15'),
(3,'T003','RED',null,null,'2016-11-23'),
(3,'T004','GREY',null,null,'2018-08-05'),
(3,'T005','GREY',null,null,'2017-08-25');

INSERT INTO vehicles2 VALUES
(4,'A001','WHITE',null,null,'2017-04-25'),
(4,'A002','WHITE',null,null,'2017-09-30');


