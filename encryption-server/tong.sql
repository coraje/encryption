SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE NOTICE;
DROP TABLE INQUIRY;
DROP TABLE RESERVE_FUND_HISTORY;
DROP TABLE ADDRESS;
DROP TABLE FRIEND_PROFILE;
DROP TABLE USER_OPTION;
DROP TABLE APPLICATION;
DROP TABLE IMAGE;
DROP TABLE REVIEW;
DROP TABLE MEMBER;
DROP TABLE MAIL;
DROP TABLE PRODUCT_OPTION;
DROP TABLE PRODUCT;




/* Create Tables */

CREATE TABLE NOTICE
(
	NOTICE_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	NOTICE_TITLE varchar(128),
	NOTICE_CONTENT varchar(128),
	REGISTRATION_DATE  datetime,
	PRIMARY KEY (NOTICE_ID)
);


CREATE TABLE INQUIRY
(
	INQUIRY_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	MEMBER_NO bigint(19) NOT NULL,
	INQUIRY_SUBJECT varchar(256),
	INQUIRY_CONTENT varchar(4000),
	REGISTRATION_DATE  datetime,
	RE_SEQ bigint(19),
	RE_LEV bigint(19),
	RE_REF bigint(19),
	PRIMARY KEY (INQUIRY_ID)
);


CREATE TABLE RESERVE_FUND_HISTORY
(
	RESERVE_FUND_HISTORY_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	MEMBER_NO bigint(19) NOT NULL,
	RESERVE_FUND bigint(19),
	RESERVE_DATE datetime,
	PRIMARY KEY (RESERVE_FUND_HISTORY_ID)
);


CREATE TABLE ADDRESS
(
	ADDRESS_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	MEMBER_NO bigint(19) NOT NULL UNIQUE,
	POST_CODE varchar(128),
	ADDRESS_MAIN varchar(128),
	ADDRESS_DETAIL varchar(128),
	PRIMARY KEY (ADDRESS_ID)
);


CREATE TABLE FRIEND_PROFILE
(
	APPLICATION_ID bigint(19) NOT NULL,
	FRIEND_NAME varchar(128),
	-- y.남자
	-- n.여자
	FRIEND_GENDER varchar(10) COMMENT 'y.남자
n.여자',
	FRIEND_MSISDN varchar(32),
	FRIEND_AGE bigint(19)
);


CREATE TABLE MEMBER
(
	MEMBER_NO bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	MEMBER_ID varchar(128) NOT NULL,
	PASSWD varchar(128),
	SOCIAL_SECURITY_NUMBER varchar(128),
	NAME varchar(128),
	MSISDN varchar(32),
	EMAIL varchar(128),
	JOIN_DATE datetime,
	WITHRAW_DATE datetime,
	RESERVE_FUND bigint(19),
	-- y 남자
	-- n 여자
	GENDER varchar(10) COMMENT 'y 남자
n 여자',
	AGE bigint(19),
	-- y : 기혼
	-- n : 미혼
	MARRIAGE varchar(10) COMMENT 'y : 기혼
n : 미혼',
	ANNIVERSARY varchar(128),
	MSISDN_SUB varchar(32),
	-- y : 동의
	-- n : 비동의
	SMS_OPT_IN varchar(10) COMMENT 'y : 동의
n : 비동의',
	EMAIL_OPT_IN varchar(10),
	BIRTHDAY varchar(128),
	ISADMIN varchar(5),
	PRIMARY KEY (MEMBER_NO)
);


CREATE TABLE IMAGE
(
	IMAGE_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	REVIEW_ID bigint(19) NOT NULL,
	IMAGE_PASS varchar(256),
	UPLOAD_DATE datetime,
	THUMB_NAIL_PATH varchar(256),
	PRIMARY KEY (IMAGE_ID)
);


CREATE TABLE REVIEW
(
	REVIEW_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	MEMBER_NO bigint(19) NOT NULL,
	-- 여행명 = 상품이름
	REVIEW_TITLE varchar(128) COMMENT '여행명 = 상품이름',
	REVIEW_CONTENT varchar(4000),
	REVIEW_RATING tinyint,
	REGISTRATION_DATE  datetime,
	PRODUCT_STATUS varchar(10),
	DELETE_DATE datetime,
	APPLICATION_ID bigint(19),
	PRIMARY KEY (REVIEW_ID)
);


CREATE TABLE APPLICATION
(
	APPLICATION_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	MEMBER_NO bigint(19) NOT NULL,
	PRODUCT_ID bigint(19) NOT NULL,
	SENDER_NAME varchar(128),
	PERSONNEL bigint(19),
	APPLICATION_DATE datetime,
	NAME varchar(32),
	GENDER varchar(10),
	MSISDN varchar(32),
	AGE bigint(19),
	-- y = 결제
	-- n = 미결제
	PAYMENT_STATUS varchar(10) COMMENT 'y = 결제
n = 미결제',
	-- y : 등록
	-- n : 미등록
	REVIEW_STATUS varchar(10) COMMENT 'y : 등록
n : 미등록',
	PAYMENT_DATE datetime,
	PRIMARY KEY (APPLICATION_ID)
);


CREATE TABLE MAIL
(
	MAIL_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	EMAIL varchar(128),
	MAIL_KEY varchar(128),
	CREATE_DATE datetime,
	PRIMARY KEY (MAIL_ID)
);


CREATE TABLE PRODUCT
(
	PRODUCT_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	PRODUCT_PRICE bigint(19),
	PRODUCT_TITLE varchar(128),
	PRODUCT_CONTENT varchar(4000),
	REGISTRATION_DATE  datetime,
	PRODUCT_MAINIMAGE_PATH varchar(128),
	PRODUCT_TEXTIMAGE_PATH varchar(128),
	PRODUCT_SUBIMAGE_PATH varchar(128),
	PRODUCT_DATE varchar(128),
	PRODUCT_COMMENT varchar(256),
	-- a : 진행예정
	-- b : 진행중
	-- c : 종료
	PROGESS varchar(10) COMMENT 'a : 진행예정
b : 진행중
c : 종료',
	-- a : 호텔
	-- b : 기차
	PRODUCT_STATUS varchar(10) COMMENT 'a : 호텔
b : 기차',
	DELETE_DATE datetime,
	PRIMARY KEY (PRODUCT_ID)
);


CREATE TABLE PRODUCT_OPTION
(
	OPTION_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	PRODUCT_ID bigint(19) NOT NULL,
	OPTION_NAME varchar(128),
	OPTION_PRICE bigint(19),
	PRIMARY KEY (OPTION_ID)
);


CREATE TABLE USER_OPTION
(
	USER_OPTION_ID bigint(19) NOT NULL UNIQUE AUTO_INCREMENT,
	APPLICATION_ID bigint(19) NOT NULL,
	OPTION_ID bigint(19) NOT NULL,
	QUANTITY int,
	PRIMARY KEY (USER_OPTION_ID)
);



/* Create Foreign Keys */

ALTER TABLE APPLICATION
	ADD FOREIGN KEY (MEMBER_NO)
	REFERENCES MEMBER (MEMBER_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESERVE_FUND_HISTORY
	ADD FOREIGN KEY (MEMBER_NO)
	REFERENCES MEMBER (MEMBER_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE INQUIRY
	ADD FOREIGN KEY (MEMBER_NO)
	REFERENCES MEMBER (MEMBER_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ADDRESS
	ADD FOREIGN KEY (MEMBER_NO)
	REFERENCES MEMBER (MEMBER_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (MEMBER_NO)
	REFERENCES MEMBER (MEMBER_NO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE IMAGE
	ADD FOREIGN KEY (REVIEW_ID)
	REFERENCES REVIEW (REVIEW_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE FRIEND_PROFILE
	ADD FOREIGN KEY (APPLICATION_ID)
	REFERENCES APPLICATION (APPLICATION_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USER_OPTION
	ADD FOREIGN KEY (APPLICATION_ID)
	REFERENCES APPLICATION (APPLICATION_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE APPLICATION
	ADD FOREIGN KEY (PRODUCT_ID)
	REFERENCES PRODUCT (PRODUCT_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE PRODUCT_OPTION
	ADD FOREIGN KEY (PRODUCT_ID)
	REFERENCES PRODUCT (PRODUCT_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USER_OPTION
	ADD FOREIGN KEY (OPTION_ID)
	REFERENCES PRODUCT_OPTION (OPTION_ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



