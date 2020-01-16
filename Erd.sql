SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS chat;
DROP TABLE IF EXISTS promise;
DROP TABLE IF EXISTS good;
DROP TABLE IF EXISTS interest;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE board
(
	-- �Խ��� �Ǽ�(��������, ���ǻ���)
	boardnum int NOT NULL AUTO_INCREMENT COMMENT '�Խ��� �Ǽ�(��������, ���ǻ���)',
	-- ����id
	id varchar(20) NOT NULL COMMENT '����id',
	-- �Խ��� ����
	boardsubject varchar(200) NOT NULL COMMENT '�Խ��� ����',
	-- �Խ��� ����
	boardcontent varchar(4000) NOT NULL COMMENT '�Խ��� ����',
	-- �Խ��� �ۼ���¥
	boarduptime date NOT NULL COMMENT '�Խ��� �ۼ���¥',
	-- �Խ��� �з� �ڵ�
	boardtype int(2) NOT NULL COMMENT '�Խ��� �з� �ڵ�',
	PRIMARY KEY (boardnum)
);


CREATE TABLE chat
(
	-- ��ȭ �Ǽ�
	chatnum int NOT NULL AUTO_INCREMENT COMMENT '��ȭ �Ǽ�',
	-- ���ƿ� ���� ��� id
	id varchar(20) NOT NULL COMMENT '���ƿ� ���� ��� id',
	-- ���ƿ� ���� ��� id
	goodid varchar(20) NOT NULL COMMENT '���ƿ� ���� ��� id',
	-- ä�� ����
	chatcontent varchar(4000) COMMENT 'ä�� ����',
	-- ä�� �� ���� ����url
	chatpicurl varchar(50) COMMENT 'ä�� �� ���� ����url',
	PRIMARY KEY (chatnum)
);


CREATE TABLE good
(
	-- ���ƿ� ���� ��� id
	id varchar(20) NOT NULL COMMENT '���ƿ� ���� ��� id',
	-- ���ƿ� ���� ��� id
	goodid varchar(20) NOT NULL COMMENT '���ƿ� ���� ��� id',
	PRIMARY KEY (id, goodid)
);


CREATE TABLE interest
(
	-- ���ɻ� �̸�
	interestname varchar(20) NOT NULL COMMENT '���ɻ� �̸�',
	-- ���ɻ� ���� url
	interestpicurl varchar(50) NOT NULL COMMENT '���ɻ� ���� url',
	PRIMARY KEY (interestname)
);


CREATE TABLE promise
(
	-- ��� �Ǽ�
	promisenum int NOT NULL AUTO_INCREMENT COMMENT '��� �Ǽ�',
	-- ���ƿ� ���� ��� id
	id varchar(20) NOT NULL COMMENT '���ƿ� ���� ��� id',
	-- ���ƿ� ���� ��� id
	goodid varchar(20) NOT NULL COMMENT '���ƿ� ���� ��� id',
	-- ��� ��� ����
	promisesubject varchar(200) NOT NULL COMMENT '��� ��� ����',
	-- ������ ����
	promisecontent varchar(4000) NOT NULL COMMENT '������ ����',
	-- ���������
	promiseday date NOT NULL COMMENT '���������',
	-- ����
	lat double NOT NULL COMMENT '����',
	-- �浵
	lon double NOT NULL COMMENT '�浵',
	PRIMARY KEY (promisenum)
);


CREATE TABLE report
(
	-- �Ű� �Ǽ�
	reportnum int NOT NULL AUTO_INCREMENT COMMENT '�Ű� �Ǽ�',
	-- �ǽŰ��� ID
	reportid varchar(20) NOT NULL COMMENT '�ǽŰ��� ID',
	-- �Ű��� ID
	id varchar(20) NOT NULL COMMENT '�Ű��� ID',
	-- �Ű� ����
	reportcontent varchar(4000) NOT NULL COMMENT '�Ű� ����',
	-- �Ű� ��¥
	reporttime date NOT NULL COMMENT '�Ű� ��¥',
	-- �Ű� ���� ó������
	reportprocess int(2) NOT NULL COMMENT '�Ű� ���� ó������',
	PRIMARY KEY (reportnum)
);


CREATE TABLE user
(
	-- ����id
	id varchar(20) NOT NULL COMMENT '����id',
	-- ���� ��й�ȣ
	password varchar(30) NOT NULL COMMENT '���� ��й�ȣ',
	-- ���� ���� M/F
	gender varchar(3) NOT NULL COMMENT '���� ���� M/F',
	-- ���� ��ȭ��ȣ
	phone varchar(20) NOT NULL COMMENT '���� ��ȭ��ȣ',
	-- ���� �������
	birthday date NOT NULL COMMENT '���� �������',
	-- ���� ������ ����
	address varchar(8) NOT NULL COMMENT '���� ������ ����',
	-- ���� �г���
	nickname varchar(20) NOT NULL COMMENT '���� �г���',
	-- ���� �����ʻ��� URL 1
	profileurl1 varchar(50) NOT NULL COMMENT '���� �����ʻ��� URL 1',
	-- ���� �����ʻ��� URL 2
	profileurl2 varchar(50) COMMENT '���� �����ʻ��� URL 2',
	-- ���� �����ʻ��� URL 3
	profileurl3 varchar(50) COMMENT '���� �����ʻ��� URL 3',
	-- ���� �����ʻ��� URL 4
	profileurl4 varchar(50) COMMENT '���� �����ʻ��� URL 4',
	-- ���� Ű ����
	height int(3) NOT NULL COMMENT '���� Ű ����',
	-- ������ ü�� ����
	body varchar(10) NOT NULL COMMENT '������ ü�� ����',
	-- ���� �з� ����
	education varchar(20) NOT NULL COMMENT '���� �з� ����',
	-- ���� ���� ����
	pay varchar(30) NOT NULL COMMENT '���� ���� ����',
	-- ���� �λ縻
	greeting varchar(50) COMMENT '���� �λ縻',
	-- ���� ���� => ������� �������� ����� �Է�
	age int(2) COMMENT '���� ���� => ������� �������� ����� �Է�',
	-- ������ ������ ���ɻ� 1
	interestname1 varchar(20) COMMENT '������ ������ ���ɻ� 1',
	-- ������ ������ ���ɻ� 2
	interestname2 varchar(20) COMMENT '������ ������ ���ɻ� 2',
	-- ������ ������ ���ɻ�3
	interestname3 varchar(20) COMMENT '������ ������ ���ɻ�3',
	-- ������ ������ ���ɻ�4
	interestname4 varchar(20) COMMENT '������ ������ ���ɻ�4',
	-- ������ ������ ���ɻ� 5
	interestname5 varchar(20) COMMENT '������ ������ ���ɻ� 5',
	-- ������ ������ ���ɻ� 6
	interestname6 varchar(20) COMMENT '������ ������ ���ɻ� 6',
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE chat
	ADD FOREIGN KEY (id, goodid)
	REFERENCES good (id, goodid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE promise
	ADD FOREIGN KEY (id, goodid)
	REFERENCES good (id, goodid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE good
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE report
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



