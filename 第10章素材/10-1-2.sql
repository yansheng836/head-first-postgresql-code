1������һ�ų�����Ϣ��vehicles����
CREATE TABLE vehicles(
    name              text   PRIMARY KEY, -- ��������
    color             text,  -- ������ɫ 
    weight            float, -- ��������
    area              text,  -- ����
    manufacturerid    int    -- �����̱�ʶ
);

2���ֱ𴴽����г���bikes����С�γ���cars����������trucks�������Ƿֱ����Լ����еĶ����ֶΣ��������ӳ�����Ϣ��vehicles���̳У�������ʾ��
CREATE TABLE bikes(
    size              float NOT NULL  -- ���ܳߴ�,��������15��17��19��21��
) INHERITS(vehicles);

CREATE TABLE cars(
    displacement      float NOT NULL  -- ����
) INHERITS(vehicles);

CREATE TABLE trucks(
    load              float NOT NULL  -- �������
) INHERITS(vehicles);

3������һЩ���ݣ�
INSERT INTO bikes VALUES
('bike001','RED',30,'�Ϻ�',1001,17),
('bike002','RED',35,'����',1002,19),
('bike003','YELLOW',30,'����',1002,17),
('bike004','WHITE',30,'�Ϻ�',1001,21);

INSERT INTO cars VALUES
('car001','RED',630,'�Ϻ�',2001,1.5),
('car002','Golden',635,'����',2002,1.6),
('car003','YELLOW',730,'����',2002,2.5),
('car003','Grey',730,'����',2002,2.5),
('car003','YELLOW',630,'����',2005,1.6),
('car004','WHITE',700,'�Ϻ�',2001,2.0);

INSERT INTO bikes VALUES
('truck001','RED',1040,'����',1001,10),
('truck002','RED',1055,'����',1002,12),
('truck003','Grey',1500,'�Ϻ�',1001,30);