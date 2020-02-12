SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS buy;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS chatroom;
DROP TABLE IF EXISTS promise;
DROP TABLE IF EXISTS good;
DROP TABLE IF EXISTS history;
DROP TABLE IF EXISTS interest;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS req;
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
	accept int(5),
	PRIMARY KEY (boardnum)
);


CREATE TABLE buy
(
	-- ���ų��� ��ȣ
	buynum int NOT NULL AUTO_INCREMENT COMMENT '���ų��� ��ȣ',
	-- ����id
	id varchar(20) NOT NULL COMMENT '����id',
	-- ���� ��ǰ ����
	buyprice int(10) NOT NULL COMMENT '���� ��ǰ ����',
	-- ������ ��¥
	buyday date NOT NULL COMMENT '������ ��¥',
	-- �ش� ���� ���� �Ǽ�
	buycount int(5) NOT NULL COMMENT '�ش� ���� ���� �Ǽ�',
	PRIMARY KEY (buynum)
);


CREATE TABLE chatroom
(
	-- ä�ù��ȣ
	chatnum int NOT NULL AUTO_INCREMENT COMMENT 'ä�ù��ȣ',
	-- ����id
	id varchar(20) NOT NULL COMMENT '����id',
	goodid varchar(20) NOT NULL,
	PRIMARY KEY (chatnum)
);


CREATE TABLE comment
(
	-- �Խ��� �Ǽ�(��������, ���ǻ���)
	boardnum int NOT NULL COMMENT '�Խ��� �Ǽ�(��������, ���ǻ���)',
	-- ���ǻ��� �ǵ�� ����
	commenttext varchar(4000) NOT NULL COMMENT '���ǻ��� �ǵ�� ����',
	-- �ǵ�鳯¥
	commentday date NOT NULL COMMENT '�ǵ�鳯¥',
	PRIMARY KEY (boardnum)
);


CREATE TABLE good
(
	-- ����id
	id varchar(20) NOT NULL COMMENT '����id',
	goodid varchar(20) NOT NULL,
	PRIMARY KEY (id, goodid)
);


CREATE TABLE history
(
	-- ����id
	id varchar(20) NOT NULL COMMENT '����id',
	historyid varchar(20) NOT NULL,
	PRIMARY KEY (id, historyid)
);


CREATE TABLE interest
(
	-- ���ɻ� �̸�
	interestname varchar(20) NOT NULL COMMENT '���ɻ� �̸�',
	-- ���ɻ� ���� url
	interestpicurl varchar(50) NOT NULL COMMENT '���ɻ� ���� url',
	PRIMARY KEY (interestname)
);


CREATE TABLE message
(
	-- �޼��� ������ȣ
	messagenum int NOT NULL AUTO_INCREMENT COMMENT '�޼��� ������ȣ',
	-- ä�ù��ȣ
	chatnum int NOT NULL COMMENT 'ä�ù��ȣ',
	-- �۽���
	messagesender varchar(20) NOT NULL COMMENT '�۽���',
	-- �޼��� ����
	messagecontent varchar(4000) NOT NULL COMMENT '�޼��� ����',
	-- �޼��� �ۼ���¥
	messageday date NOT NULL COMMENT '�޼��� �ۼ���¥',
	PRIMARY KEY (messagenum)
);


CREATE TABLE promise
(
	-- ��� �Ǽ�
	promisenum int NOT NULL AUTO_INCREMENT COMMENT '��� �Ǽ�',
	-- ����id
	id varchar(20) NOT NULL COMMENT '����id',
	goodid varchar(20) NOT NULL,
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
	reportcolumn varchar(100) NOT NULL,
	-- �Ű� ����
	reportcontent varchar(4000) NOT NULL COMMENT '�Ű� ����',
	-- �Ű� ��¥
	reporttime date NOT NULL COMMENT '�Ű� ��¥',
	PRIMARY KEY (reportnum)
);


CREATE TABLE req
(
	-- ����id
	id varchar(20) NOT NULL COMMENT '����id',
	goodid varchar(20) NOT NULL,
	PRIMARY KEY (id, goodid)
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
	email varchar(30) NOT NULL,
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
	-- ���� ���� ����
	agehigh varchar(10) NOT NULL COMMENT '���� ���� ����',
	-- ���� ���� ����
	agelow varchar(10) NOT NULL COMMENT '���� ���� ����',
	goodcnt int(3) NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (boardnum)
	REFERENCES board (boardnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE message
	ADD FOREIGN KEY (chatnum)
	REFERENCES chatroom (chatnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE chatroom
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


ALTER TABLE good
	ADD FOREIGN KEY (id, goodid)
	REFERENCES req (id, goodid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buy
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE history
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


ALTER TABLE req
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



