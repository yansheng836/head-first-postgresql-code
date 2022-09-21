1、定义一张车辆信息表（vehicles）：
CREATE TABLE vehicles(
    name              text   PRIMARY KEY, -- 车辆名字
    color             text,  -- 车身颜色 
    weight            float, -- 车身重量
    area              text,  -- 产地
    manufacturerid    int    -- 制造商标识
);

2、分别创建自行车表（bikes）、小轿车表（cars）、卡车表（trucks），它们分别定义自己独有的额外字段，并声明从车辆信息表（vehicles）继承，如下所示：
CREATE TABLE bikes(
    size              float NOT NULL  -- 车架尺寸,常见的是15、17、19、21寸
) INHERITS(vehicles);

CREATE TABLE cars(
    displacement      float NOT NULL  -- 排量
) INHERITS(vehicles);

CREATE TABLE trucks(
    load              float NOT NULL  -- 最大载重
) INHERITS(vehicles);

3、插入一些数据：
INSERT INTO bikes VALUES
('bike001','RED',30,'上海',1001,17),
('bike002','RED',35,'重庆',1002,19),
('bike003','YELLOW',30,'重庆',1002,17),
('bike004','WHITE',30,'上海',1001,21);

INSERT INTO cars VALUES
('car001','RED',630,'上海',2001,1.5),
('car002','Golden',635,'重庆',2002,1.6),
('car003','YELLOW',730,'重庆',2002,2.5),
('car003','Grey',730,'重庆',2002,2.5),
('car003','YELLOW',630,'北京',2005,1.6),
('car004','WHITE',700,'上海',2001,2.0);

INSERT INTO bikes VALUES
('truck001','RED',1040,'北京',1001,10),
('truck002','RED',1055,'重庆',1002,12),
('truck003','Grey',1500,'上海',1001,30);