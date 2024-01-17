DROP SCHEMA DRUG;
CREATE SCHEMA DRUG;
USE DRUG;

------------------------------------------------
--------------- MEMBER 관련 테이블 ------------------
------------------------------------------------

CREATE TABLE MEMBER (
	mNO			INT PRIMARY KEY AUTO_INCREMENT,
	ID 			VARCHAR(30)	NOT NULL UNIQUE,
	PASSWORD 	VARCHAR(100) NOT NULL,
    ROLE 		VARCHAR(10) DEFAULT 'ROLE_USER',
	NAME 		VARCHAR(15) NOT NULL,
    PHONE 		VARCHAR(13),
	EMAIL 		VARCHAR(100),
	ADDRESS		VARCHAR(100),
	KAKAOTOKEN 	VARCHAR(1000),
	STATUS 		VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	ENROLL_DATE	DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE	DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'admin', '1234', 'ROLE_ADMIN', '관리자',
    '010-1234-5678', 'admin@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test1', '1212', 'DEFAULT', '일반인',
    '010-4321-8765', 'test@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test2', '1234', 'ROLE_PH', '약사',
    '010-1111-2222', 'phar@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

COMMIT;

SELECT * FROM MEMBER;

---------------------------------------------------
--------------- Board 카테고리 테이블 ------------------
---------------------------------------------------

CREATE TABLE `PHARMACY` (
	`pharmNo`	INT	NOT NULL,
	`pharmaddr`	VARCHAR(100)	NOT NULL,
	`pharmName`	VARCHAR(30)	NOT NULL,
	`pharmTel`	VARCHAR(30)	NOT NULL,
	`pharmPictureUrl`	text	NULL,
	`pharmOp1`	VARCHAR(30)	NOT NULL,
	`pharmOp2`	VARCHAR(30)	NOT NULL,
	`pharmOp3`	VARCHAR(30)	NOT NULL,
	`pharmOp4`	VARCHAR(30)	NOT NULL,
	`pharmOp5`	VARCHAR(30)	NOT NULL,
	`pharmOp6`	VARCHAR(30)	NOT NULL,
	`pharmLati`	VARCHAR(30)	NOT NULL,
	`pharmLong`	VARCHAR(30)	NOT NULL,
	`reviewCount`	INT(11)	NOT NULL,
	`favCount`	INT(11)	NOT NULL,
	`pharmRating`	DECIMAL(2, 1)	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL	COMMENT '일반'
);

CREATE TABLE `ORDERS` (
	`oNo`	BIGINT(20)	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`pNo`	INT	NOT NULL,
	`pName`	VARCHAR(100)	NOT NULL,
	`payMethod`	VARCHAR(50)	NOT NULL,
	`totalPrice`	INT(10)	NOT NULL,
	`requests`	VARCHAR(100)	NULL,
	`createdDate`	TIMESTAMP	NOT NULL,
	`modifiedDate`	TIMESTAMP	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `CARTS` (
	`cartNo`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`pNo`	INT	NOT NULL,
	`pName`	VARCHAR(100)	NOT NULL,
	`Quantity`	INT	NOT NULL,
	`totalPrice`	INT	NOT NULL,
	`createdDate`	timestamp	NOT NULL,
	`modifiedDate`	timestamp	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `MEDICINE_REVIEWS` (
	`mereviewid`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`itemName`	VARCHAR(500)	NOT NULL,
	`rating`	INT	NOT NULL,
	`content`	VARCHAR(1000)	NULL,
	`reviewPicture`	text	NULL	COMMENT '영수증, 제품사진',
	`readcount`	int	NOT NULL,
	`attachcount`	VARCHAR(255)	NOT NULL,
	`createdDate`	timestamp	NOT NULL,
	`modifyDate`	timestamp	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL,
	`thumbcount`	INT	NOT NULL
);

CREATE TABLE `MyAidKit` (
	`id`	VARCHAR(30)	NOT NULL,
	`itemName`	VARCHAR(255)	NOT NULL,
	`quantity`	INT	NOT NULL,
	`experationDate`	DATE	NOT NULL,
	`createdDate`	timestamp	NOT NULL,
	`modifiedDate`	timestamp	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `QANDA` (
	`boardNo`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`title`	VARCHAR(100)	NOT NULL,
	`content`	VARCHAR(500)	NOT NULL,
	`views`	INT	NOT NULL,
	`createdDate`	TIMESTAMP	NOT NULL,
	`modifiedDate`	TIMESTAMP	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `REPLY_QANDA` (
	`rq_id`	INT	NOT NULL,
	`boardNo`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`content`	VARCHAR(500)	NOT NULL,
	`createdDate`	TIMESTAMP	NOT NULL,
	`modifiedDate`	TIMESTAMP	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `NEWS` (
	`newsNo`	INT	NOT NULL,
	`title`	VARCHAR(100)	NOT NULL,
	`content`	VARCHAR(500)	NOT NULL,
	`newsImgUrl`	text	NOT NULL,
	`mnewsImgUrl`	text	NOT NULL,
	`views`	INT	NOT NULL,
	`createdDate`	TIMESTAMP	NOT NULL,
	`modifiedDate`	TIMESTAMP	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `MEDICINE` (
	`itemSeq`	INT	NOT NULL,
	`itemName`	VARCHAR(500)	NOT NULL,
	`efcyQesitm`	VARCHAR(500)	NOT NULL,
	`useMethodQesitm`	VARCHAR(500)	NOT NULL,
	`atpnWarnQesitm`	VARCHAR(500)	NOT NULL,
	`atpnQesitm`	VARCHAR(255)	NOT NULL,
	`intrcQesitm`	VARCHAR(500)	NOT NULL,
	`seQesitm`	VARCHAR(500)	NOT NULL,
	`depositMethodQesitm`	VARCHAR(500)	NOT NULL,
	`itemImage`	text	NOT NULL,
	`PROHBT_CONTENT`	VARCHAR(500)	NOT NULL	COMMENT 'DUR',
	`TYPE_NAME`	VARCHAR(10)	NOT NULL	COMMENT 'DUR',
	`PBANC_CONT`	VARCHAR(500)	NOT NULL	COMMENT 'DUR',
	`PBNAC_DIVS_NM`	VARCHAR(255)	NOT NULL	COMMENT 'Safe',
	`CHRG_DEP`	VARCHAR(100)	NOT NULL	COMMENT 'Safe',
	`createdDate`	TIMESTAMP	NOT NULL,
	`modifiedDate`	TIMESTAMP	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `PHARMACY_REVIEWS` (
	`phreviewid`	INT	NOT NULL,
	`pharmNo`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`rating`	VARCHAR(255)	NOT NULL,
	`content`	VARCHAR(1000)	NULL,
	`reviewPicture`	text	NULL,
	`readcount`	int	NOT NULL,
	`attachcount`	int	NOT NULL,
	`thumbcount`	INT	NOT NULL,
	`createdDate`	timestamp	NOT NULL,
	`modifiedDate`	timestamp	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `REPLY_PHREVIEWS` (
	`rq_id`	INT	NOT NULL,
	`phreviewid`	INT	NOT NULL,
	`pharmNo`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`content`	VARCHAR(500)	NOT NULL,
	`createdDate`	TIMESTAMP	NOT NULL,
	`modifiedDate`	TIMESTAMP	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `REPLY_MEREVIEWS` (
	`rq_id`	INT	NOT NULL,
	`mereviewid`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`itemName`	VARCHAR(500)	NOT NULL,
	`content`	VARCHAR(500)	NOT NULL,
	`createdDate`	TIMESTAMP	NOT NULL,
	`modifiedDate`	TIMESTAMP	NOT NULL,
	`status`	VARCHAR(1)	NOT NULL
);

CREATE TABLE `HEALTH_FUNCTIONAL_FOOD` (
	`pNo`	INT	NOT NULL,
	`pName`	VARCHAR(100)	NOT NULL,
	`pPrice`	INT	NOT NULL,
	`pImgURL`	text	NOT NULL,
	`pMaker`	VARCHAR(1000)	NOT NULL,
	`pType`	VARCHAR(1000)	NOT NULL,
	`pInfo`	VARCHAR(1000)	NOT NULL,
	`category1`	VARCHAR(1000)	NOT NULL,
	`category2`	VARCHAR(1000)	NOT NULL,
	`category3`	VARCHAR(1000)	NULL,
	`category4`	VARCHAR(1000)	NULL
);

CREATE TABLE `MEDICINE_ATTACH_FILE` (
	`fNo`	INT	NOT NULL,
	`mereviewid`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`itemName`	VARCHAR(500)	NOT NULL,
	`origianl_filename`	VARCHAR(200)	NOT NULL,
	`renamed_filename`	VARCHAR(200)	NOT NULL,
	`createDate`	TIMESTAMP	NOT NULL
);

CREATE TABLE `PHARMACY_ATTACH_FILE` (
	`fNo`	INT	NOT NULL,
	`phreviewid`	INT	NOT NULL,
	`pharmNo`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`origianl_filename`	VARCHAR(200)	NOT NULL,
	`renamed_filename`	VARCHAR(200)	NOT NULL,
	`createDate`	TIMESTAMP	NOT NULL
);

CREATE TABLE `BOARD_ATTACH_FILE` (
	`fNo`	INT	NOT NULL,
	`boardNo`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`origianl_filename`	VARCHAR(200)	NOT NULL,
	`renamed_filename`	VARCHAR(200)	NOT NULL,
	`createDate`	TIMESTAMP	NOT NULL
);

CREATE TABLE `BOARD_CATEGORY` (
	`TYPE`	VARCHAR(20)	NOT NULL,
	`NAME`	VARCHAR(100)	NOT NULL,
	`ORDERNO`	INT	NOT NULL
);
