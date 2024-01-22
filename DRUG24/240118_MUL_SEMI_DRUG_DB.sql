DROP SCHEMA DRUG;
CREATE SCHEMA DRUG;
USE DRUG;

SHOW DATABASES LIKE 'DRUG';
------------------------------------------------
--------------- MEMBER 관련 테이블 ----------------
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
	HOBBY 	 	VARCHAR(100),
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
	0, 'test2', '1212', 'DEFAULT', '남자',
    '010-4321-8765', 'test2@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test3', '1212', 'DEFAULT', '여자',
    '010-4321-8765', 'test3@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test4', '1212', 'DEFAULT', '주부',
    '010-4321-8765', 'test4@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test5', '1212', 'DEFAULT', '학생',
    '010-4321-8765', 'test5@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test6', '1212', 'DEFAULT', '개발자',
    '010-4321-8765', 'test6@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test7', '1212', 'DEFAULT', '직장인',
    '010-4321-8765', 'test7@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test8', '1212', 'DEFAULT', '취준생',
    '010-4321-8765', 'test8@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test9', '1212', 'DEFAULT', 'MZ',
    '010-4321-8765', 'test9@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);


INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'test10', '1212', 'DEFAULT', '이젠잘파세대',
    '010-4321-8765', 'test10@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'PH1', '4321', 'ROLE_PH', '서울약국약사',
    '010-1111-2222', 'phar1@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO MEMBER (
	mNO, ID, PASSWORD, ROLE, NAME,
    PHONE, EMAIL, ADDRESS, KAKAOTOKEN, STATUS,
    ENROLL_DATE, MODIFY_DATE
) VALUES(
	0, 'PH2', '4321', 'ROLE_PH', '강남약국약사',
    '010-1111-2222', 'phar2@test.com', '서울시 강남구 역삼동', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

COMMIT;

SELECT * FROM MEMBER;

---------------------------------------------------
------------------- 약국 테이블 ----------------------
---------------------------------------------------

CREATE TABLE PHARMACY (
	phNO 		INT PRIMARY KEY AUTO_INCREMENT,
    phNAME 		VARCHAR(100),
    phTEL 		VARCHAR(13),
	phADDRESS 	VARCHAR(1000),
	phOP1 		VARCHAR(100),
	phOP2 		VARCHAR(100),
	phOP3 		VARCHAR(100),
	phOP4 		VARCHAR(100),
	phOP5 		VARCHAR(100),
	phOP6 		VARCHAR(100),
    phOP7 		VARCHAR(100),
    phOP8 		VARCHAR(100),
	phLATI 		VARCHAR(30) DEFAULT '37.49864',
	phLONG 		VARCHAR(30) DEFAULT '127.02811',
	REVIEWCOUNT	INT DEFAULT '0',
	FAVCOUNT 	INT DEFAULT '0',
	RATING 		INT DEFAULT '0',
	STATUS		VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS,
	phOP1, phOP2, phOP3, phOP4, phOP5,
    phOP6, phOP7, phOP8, phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '그린약국', '041-545-2071', '충청남도 아산시 온천대로 1480, 1층 (온천동)',
    '월 10:00~15:00', '화 10:00~15:00', '수 10:00~15:00', '목 10:00~15:00', '금 10:00~15:00',
    '토 10:00~18:00', '일 10:00~20:00', '공휴일 10:00~20:00', '36.78154', '127.00216', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS,
	phOP1, phOP2, phOP3, phOP4, phOP5,
    phOP6, phOP7, phOP8, phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '희망약국', '02-308-8038', '서울특별시 서대문구 증가로 122',
    '월 09:00~18:30', '화 09:00~18:30', '수 09:00~18:30', '목 09:00~18:30', '금 09:00~18:30',
    '토 09:00~16:00', '일 09:00~18:00', NULL, '37.57736', '126.92427', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS,
	phOP1, phOP2, phOP3, phOP4, phOP5,
    phOP6, phOP7, phOP8, phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '효제약국', '02-391-7615', '서울특별시 서대문구 세검정로 32',
    '월 09:00~18:00', '화 09:00~18:00', '수 09:00~18:00', '목 09:00~18:00', '금 09:00~18:00',
    '토 09:00~13:00', NULL, NULL, '37.59155', '126.94499', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS,
	phOP1, phOP2, phOP3, phOP4, phOP5,
    phOP6, phOP7, phOP8, phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '도담약국', '043-218-9295', '충청북도 청주시 청원구 충청대로 179, 1층 (주중동)',
    '월 09:00~21:00', '화 09:00~21:00', '수 09:00~21:00', '목 09:00~21:00', '금 09:00~21:00',
    '토 09:00~21:00', '일 09:00~19:00', '공휴일 09:00~19:00', '36.67207', '127.49577', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

COMMIT;

SELECT * FROM PHARMACY;


-- DROP TABLE PHARMACY;

---------------------------------------------------
------------------- 약 테이블 ----------------------
---------------------------------------------------

CREATE TABLE MEDICINE (
	dNO	INT	PRIMARY KEY,
	dNAME VARCHAR(100),
	dEFFECT	VARCHAR(500),
	dUSAGE VARCHAR(500),
	dWARNC	VARCHAR(500),
	dWARN VARCHAR(500),
	dNEGATIVE VARCHAR(500),
	dSAVE VARCHAR(500),
	dIMGURL	TEXT NULL,
    dTYPE VARCHAR(10) COMMENT 'DUR',
	dPROHBT	VARCHAR(500) COMMENT 'DUR',
	dPROHBTNAME VARCHAR(500) COMMENT 'DUR',
	CREATE_DATE	DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

INSERT INTO MEDICINE (
	dNO, dNAME, dEFFECT, dUSAGE, dWARNC,
    dWARN, dNEGATIVE, dSAVE,
    dIMGURL, dTYPE, dPROHBT, dPROHBTNAME,
    CREATE_DATE, MODIFY_DATE, STATUS
) VALUES(
	195700020, '활명수', '이 약은 식욕감퇴(식욕부진), 위부팽만감, 소화불량, 과식, 체함, 구역, 구토에 사용합니다.', '만 15세 이상 및 성인은 1회 1병(75 mL), 만 11세이상~만 15세미만은 1회 2/3병(50 mL), 만 8세 이상~만 11세 미만은 1회 1/2병(37.5 mL), 만 5세 이상~만 8세 미만은 1회 1/3병(25 mL), 만 3세 이상~만 5세 미만은 1회 1/4병(18.75 mL), 만 1세 이상~만 3세 미만은 1회 1/5병(15 mL), 1일 3회 식후에 복용합니다. 복용간격은 4시간 이상으로 합니다.', NULL,
    '만 3개월 미만의 젖먹이는 이 약을 복용하지 마십시오.', NULL, '습기와 빛을 피해 실온에서 보관하십시오.',
    NULL, NULL, NULL, NULL,
    DEFAULT, DEFAULT, DEFAULT
);

INSERT INTO MEDICINE (
	dNO, dNAME, dEFFECT, dUSAGE, dWARNC,
    dWARN, dNEGATIVE, dSAVE,
    dIMGURL, dTYPE, dPROHBT, dPROHBTNAME,
    CREATE_DATE, MODIFY_DATE, STATUS
) VALUES(
	201307928, '에이스린장용정(아스피린)', '이 약은 심근경색, 뇌경색, 불안정형 협심증에서 혈전 생성 억제와 관상동맥 우회술(CABG) 또는 경피경관 관상동맥 성형술(PTCA) 후 혈전 생성 억제와 고위험군환자(허혈성 심장질환의 가족력, 고혈압, 고콜레스테롤혈증, 비만, 당뇨 등 복합적 위험인자를 가진 환자)에서 심혈관계 위험성 감소에 사용합니다.', '성인은 1회 1정, 1일 1회 복용합니다.', '임신 1기와 2기에는 반드시 필요한 경우가 아니라면 이 약을 복용하지 마십시오.',
    '다른 비스테로이드성 소염진통제 및 살리실산 제제, 일주일 동안 메토트렉세이트 15밀리그람(15mg/주) 이상의 용량은 이 약과 병용 투여 시 출혈이 증가되거나 신기능이 감소될 수 있으므로 함께 사용하지 않습니다.', '식욕부진, 가슴쓰림, 위통, 구역, 구토 등이 나타날 수 있습니다.', '습기와 빛을 피해 실온에서 보관하십시오.',
    NULL, '노인주의', NULL, NULL,
    DEFAULT, DEFAULT, DEFAULT
);

COMMIT;

SELECT * FROM MEDICINE;

---------------------------------------------------
------------------- 건기식 테이블 ----------------------
---------------------------------------------------

CREATE TABLE Product (
	pNo int auto_increment primary key,
	title varchar(1000), 
	link varchar(1000),
	image varchar(1000),
	lprice int,
	hprice int,
	mallName varchar(1000),
	productId varchar(1000),
	productType varchar(1000),
	maker varchar(1000),
	brand varchar(1000),
	category1 varchar(1000),
	category2 varchar(1000),
	category3 varchar(1000),
	category4 varchar(1000),
	rating double
);

INSERT INTO Product (
	pNo, title, link, image, lprice,
    hprice, mallName, productId, productType, maker,
    brand, category1, category2, category3, category4
) 
values(
	0, '프로바이오틱스 1', null,  null, 21900,
    0, '건기식 전문샵', 'test1', '1', '덴프스',
    '덴프스', '건강식품/홍삼','건강기능식품','영양제','유산균'
);

INSERT INTO Product (
	pNo, title, link, image, lprice,
    hprice, mallName, productId, productType, maker,
    brand, category1, category2, category3, category4
) 
values(
	0, '프로바이오틱스 2', null,  null, 51990,
    0, '건기식 전문샵', 'test1', '1', '유한양행',
    '유한양행', '건강식품/홍삼','건강기능식품','영양제','유산균'
);

INSERT INTO Product (
	pNo, title, link, image, lprice,
    hprice, mallName, productId, productType, maker,
    brand, category1, category2, category3, category4
) 
values(
	0, '비타민 1', null,  null, 21990,
    0, '건기식 전문샵', 'test1', '1', '덴프스',
    '덴프스', '건강식품/홍삼','건강기능식품','영양제','비타민'
);

SELECT * FROM Product;

SELECT * FROM Product LIMIT 0, 10;

COMMIT;

DROP TABLE Product;

---------------------------------------------------
------------------- 주문 테이블 ---------------------
---------------------------------------------------

CREATE TABLE Orders (
	oNO INT PRIMARY KEY AUTO_INCREMENT,
	mNO INT,
	pNO INT,
	PAYMETHOD VARCHAR(20) DEFAULT 'KAKAOPAY',
	PRICE INT,
	REQUESTS VARCHAR(100) NULL,
	CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	STATUS VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    CONSTRAINT FOREIGN KEY (mNO) REFERENCES MEMBER (mNO),
    CONSTRAINT FOREIGN KEY (pNO) REFERENCES PRODUCT(pNO)
);

INSERT INTO Orders (oNO, mNO, pNO, PAYMETHOD, PRICE, REQUESTS) VALUES(0, 2, 1, DEFAULT, 150000, NULL);

COMMIT;

SELECT * FROM Orders;

DROP TABLE Orders;

---------------------------------------------------
------------------ 장바구니 테이블 ---------------------
---------------------------------------------------

CREATE TABLE Cart (
	mNO INT,
	pNO	INT,
	AMOUNT INT,
    PRICE INT,
    CONSTRAINT FOREIGN KEY (mNO) REFERENCES MEMBER (mNO),
    CONSTRAINT FOREIGN KEY (pNO) REFERENCES PRODUCT (pNO),
    PRIMARY KEY (mNO, pNO)
);

INSERT INTO Cart (mNO, pNO, AMOUNT, PRICE) VALUES(2, 1, 2, 43800);
UPDATE Cart set amount = 2 AND PRICE = 43800 where mNo = 2 and pNo = 1;
SELECT * FROM Cart;

COMMIT;

SELECT * FROM Cart;

DROP TABLE Cart;

------------------------------------------------------------------
---------------------------- 건기식 리뷰 ---------------------------
------------------------------------------------------------------

CREATE TABLE ProductReply (
	rNO INT PRIMARY KEY AUTO_INCREMENT,
	mNO INT,
	pNO INT,
    CONTENT VARCHAR(2000),
	RATING INT DEFAULT '0',
	CREATEDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(pNO) REFERENCES PRODUCT(pNO),
	FOREIGN KEY(mNO) REFERENCES MEMBER(mNO)
);

INSERT INTO ProductReply (rNO, mNO, pNO, CONTENT, RATING, CREATEDATE) VALUES(0, 3, 1, '선물용 으로 샀어요!', 5, DEFAULT);
INSERT INTO ProductReply (rNO, mNO, pNO, CONTENT, RATING, CREATEDATE) VALUES(0, 4, 1, '선물로도 딱이에요!', 5, DEFAULT);
INSERT INTO ProductReply (rNO, mNO, pNO, CONTENT, RATING, CREATEDATE) VALUES(0, 5, 1, '선물로도 좋아요!', 4, DEFAULT);

COMMIT;

SELECT * FROM ProductReply;

SELECT COUNT(*) FROM ProductReply WHERE pNO=1 and rating=5;

SELECT round(avg(RATING),1) FROM PRODUCTREPLY where pno=1;
UPDATE Product set rating = (SELECT round(avg(RATING),1) FROM ProductReply where pno = 1) where pno = 1;

-- DELETE FROM ProductReply WHERE pNO=331;

-- DROP TABLE ProductReply; 

-- 게시판 시작



---------------------------------------------------
--------------- Board 카테고리 테이블 ------------------
---------------------------------------------------

CREATE TABLE BOARD_CATEGORY (	
    TYPE VARCHAR(20),
    NAME VARCHAR(100),
    LEVEL INT,
    ORDERNO INT,
    CONSTRAINT PK_BOARD_CATEGORY PRIMARY KEY(TYPE)
);

-- 일반적으로 CODE는 약어를 사용하나 가독성을 위해 길게 표현함 NOTICE -> N,  CMM1 -> C1 
-- NOTICE, PLAIN, CMM1, CMM2, CMM3, QUESTION, TIP, BUY, SELL
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NOTICE', '공지', 0, 1);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('PLAIN', '일반글', 3, 2);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('QUESTION', '질문', 3, 3);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('TIP', 'TIP', 3, 4);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('BUY', '삽니다', 3, 5);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('SELL', '팝니다', 3, 6);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('CMM1', '커뮤니티A', 3, 7);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('CMM2', '커뮤니티B', 3, 8);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('CMM3', '커뮤니티C', 3, 9);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NBOARD', '공지사항', 3, 10);


COMMIT;
SELECT * FROM BOARD_CATEGORY ORDER BY ORDERNO;

-------------------------------------------------
--------------- Board 관련 테이블 ------------------
-------------------------------------------------


CREATE TABLE BOARD (	
    bNO INT AUTO_INCREMENT,
    mNO INT, 
    TYPE VARCHAR(20) DEFAULT 'PLAIN', 
	TITLE VARCHAR(1000), 
	CONTENT VARCHAR(2000), 
    ATTACHCOUNT INT DEFAULT 0, 
	READCOUNT INT DEFAULT 0, 
    STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    CREATE_DATE DATETIME  DEFAULT CURRENT_TIMESTAMP, 
    MODIFY_DATE DATETIME  DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_BOARD_NO PRIMARY KEY(bNO),
    CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(mNO) REFERENCES MEMBER(mNO) ON DELETE SET NULL,
    CONSTRAINT FK_BOARD_CATEGORY FOREIGN KEY(TYPE) REFERENCES BOARD_CATEGORY(TYPE) ON DELETE SET NULL
);
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NOTICE','[공지] 클린한 게시판 환경을 만들어주세요.','깨끗한 게시판 환경 유지에 협조 바랍니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'PLAIN','안녕하세요? 처음 가입한 개발자입니다.','잘 부탁드립니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'QUESTION','[질문] 질문 있습니다.','자바 어렵나요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'PLAIN','오늘 식사메뉴 추천드립니다.','돈까스 드세요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'PLAIN','내일 식사메뉴 추천드립니다.','냉면 어떠신가요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'PLAIN','모레 식사메뉴 추천드립니다.','스파게티 좋네요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'PLAIN','다음주 식사메뉴 추천드립니다.','아무거나 드세요');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.1','공지 내용입니다.1');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.2','공지 내용입니다.2');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.3','공지 내용입니다.3');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.4','공지 내용입니다.4');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.5','공지 내용입니다.5');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.6','공지 내용입니다.6');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.7','공지 내용입니다.7');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.8','공지 내용입니다.8');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.9','공지 내용입니다.9');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.10','공지 내용입니다.10');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.11','공지 내용입니다.11');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.12','공지 내용입니다.12');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.13','공지 내용입니다.13');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.14','공지 내용입니다.14');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','공지사항 게시글 입니다.15','공지 내용입니다.15');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM1','커뮤니티 A글입니다. 1','커뮤니티 A활동 글입니다. 1');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM1','커뮤니티 A글입니다. 2','커뮤니티 A활동 글입니다. 2');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM1','커뮤니티 A글입니다. 3','커뮤니티 A활동 글입니다. 3');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM1','커뮤니티 A글입니다. 4','커뮤니티 A활동 글입니다. 4');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'CMM1','커뮤니티 A글입니다. 5','커뮤니티 A활동 글입니다. 5');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'CMM2','커뮤니티 B글입니다. 1','커뮤니티 B활동 글입니다. 1');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'CMM2','커뮤니티 B글입니다. 2','커뮤니티 B활동 글입니다. 2');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'CMM2','커뮤니티 B글입니다. 3','커뮤니티 B활동 글입니다. 3');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'CMM2','커뮤니티 B글입니다. 4','커뮤니티 B활동 글입니다. 4');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'CMM2','커뮤니티 B글입니다. 5','커뮤니티 B활동 글입니다. 5');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM3','커뮤니티 C글입니다. 1','커뮤니티 C활동 글입니다. 1');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM3','커뮤니티 C글입니다. 2','커뮤니티 C활동 글입니다. 2');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM3','커뮤니티 C글입니다. 3','커뮤니티 C활동 글입니다. 3');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM3','커뮤니티 C글입니다. 4','커뮤니티 C활동 글입니다. 4');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'CMM3','커뮤니티 C글입니다. 5','커뮤니티 C활동 글입니다. 5');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'TIP','[팁] 팁글입니다.','java는 쉽습니다. 객체만 아세요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'TIP','[팁] 팁글입니다.','c언어는 어렵습니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'TIP','[팁] 팁글입니다.','프로그래밍은 생각보다 쉽습니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'TIP','[팁] 팁글입니다.','개발일은 어렵습니다. 코딩만 안합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'TIP','[팁] 팁글입니다.','문서작업은 귀찮습니다. 이게 개발일의 실체입니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 삼성 노트북 팔아요.','삼성 노트북 팝니다. 터치 됩니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 아이폰 팔아요.','아이폰15 팝니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 애플 맥북 노트북 팝니다.','M2 모델입니다. 맥북 게임용으로 잘써요');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'BUY','[구매] 애플 노트북 삽니다.','맥북 게임용으로 삽니다. 이거 게임 잘돌아가나요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 삼성 노트북 삽니다','게임용으로 삽니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 애플 아이폰 삽니다','아이폰14사요. 30만원에 네고합니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'BUY','[구매] 삼성 갤럭시 삽니다.','갤럭시 삽니다. 아무 기종이나 상관없어요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 애플 노트북 팔아요.','노트북 맥북 최신입니다. 게임하시면 안됩니다');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 삼성 신형 갤럭시북 노트북 팔아요','새로나온 삼성 갤럭시북입니다. 이거 가성비 괜찮습니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 삼성 노트북 팔아요.','삼성 노트북 팝니다. 터치 됩니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 아이폰 팔아요.','아이폰15 팝니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 애플 맥북 노트북 팝니다.','M2 모델입니다. 맥북 게임용으로 잘써요');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 애플 노트북 삽니다.','맥북 게임용으로 삽니다. 이거 게임 잘돌아가나요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'BUY','[구매] 삼성 노트북 삽니다','게임용으로 삽니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 애플 아이폰 삽니다','아이폰14사요. 30만원에 네고합니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 삼성 갤럭시 삽니다.','갤럭시 삽니다. 아무 기종이나 상관없어요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 애플 노트북 팔아요.','노트북 맥북 최신입니다. 게임하시면 안됩니다');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 삼성 신형 갤럭시북 노트북 팔아요','새로나온 삼성 갤럭시북입니다. 이거 가성비 괜찮습니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 삼성 노트북 팔아요.','삼성 노트북 팝니다. 터치 됩니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 아이폰 팔아요.','아이폰15 팝니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 애플 맥북 노트북 팝니다.','M2 모델입니다. 맥북 게임용으로 잘써요');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 애플 노트북 삽니다.','맥북 게임용으로 삽니다. 이거 게임 잘돌아가나요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'BUY','[구매] 삼성 노트북 삽니다','게임용으로 삽니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 애플 아이폰 삽니다','아이폰14사요. 30만원에 네고합니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'BUY','[구매] 삼성 갤럭시 삽니다.','갤럭시 삽니다. 아무 기종이나 상관없어요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 애플 노트북 팔아요.','노트북 맥북 최신입니다. 게임하시면 안됩니다');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 삼성 신형 갤럭시북 노트북 팔아요','새로나온 삼성 갤럭시북입니다. 이거 가성비 괜찮습니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 삼성 노트북 팔아요.','삼성 노트북 팝니다. 터치 됩니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'SELL','[판매] 아이폰 팔아요.','아이폰15 팝니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 애플 맥북 노트북 팝니다.','M2 모델입니다. 맥북 게임용으로 잘써요');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 애플 노트북 삽니다.','맥북 게임용으로 삽니다. 이거 게임 잘돌아가나요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'BUY','[구매] 삼성 노트북 삽니다','게임용으로 삽니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 애플 아이폰 삽니다','아이폰14사요. 30만원에 네고합니다. ');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'BUY','[구매] 삼성 갤럭시 삽니다.','갤럭시 삽니다. 아무 기종이나 상관없어요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 애플 노트북 팔아요.','노트북 맥북 최신입니다. 게임하시면 안됩니다');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'SELL','[판매] 삼성 신형 갤럭시북 노트북 팔아요','새로나온 삼성 갤럭시북입니다. 이거 가성비 괜찮습니다.');


COMMIT;
SELECT * FROM BOARD;


------------------------------------------------------------------
--------------------------- 첨부파일 관련 ----------------------------
------------------------------------------------------------------

CREATE TABLE BOARD_ATTACH_FILE (
	fNO INT AUTO_INCREMENT, 
    bNO INT,
    ORIGINAL_FILENAME VARCHAR(200), 
	RENAMED_FILENAME VARCHAR(200), 
    CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT PK_BOARD_ATTACH_FILE PRIMARY KEY(fNO),
    CONSTRAINT FK_BOARD_BO FOREIGN KEY(bNO) REFERENCES BOARD(bNO) ON DELETE CASCADE
);

INSERT INTO BOARD_ATTACH_FILE (fNO, bNO, ORIGINAL_FILENAME, RENAMED_FILENAME, CREATE_DATE) VALUES(0, 1, '첨부파일2','TEST_FILE2', DEFAULT);
UPDATE BOARD SET ATTACHCOUNT =(SELECT COUNT(*) FROM BOARD_ATTACH_FILE WHERE BNO=1) WHERE BNO=1;
INSERT INTO BOARD_ATTACH_FILE (fNO, bNO, ORIGINAL_FILENAME, RENAMED_FILENAME, CREATE_DATE) VALUES(0, 2, '첨부파일','TEST_FILE', DEFAULT);
INSERT INTO BOARD_ATTACH_FILE (fNO, bNO, ORIGINAL_FILENAME, RENAMED_FILENAME, CREATE_DATE) VALUES(0, 2, '첨부파일','TEST_FILE', DEFAULT);
UPDATE BOARD SET ATTACHCOUNT =(SELECT COUNT(*) FROM BOARD_ATTACH_FILE WHERE BNO=2) WHERE BNO=2;
INSERT INTO BOARD_ATTACH_FILE (fNO, bNO, ORIGINAL_FILENAME, RENAMED_FILENAME, CREATE_DATE) VALUES(0, 3, '첨부파일','TEST_FILE', DEFAULT);
INSERT INTO BOARD_ATTACH_FILE (fNO, bNO, ORIGINAL_FILENAME, RENAMED_FILENAME, CREATE_DATE) VALUES(0, 3, '첨부파일','TEST_FILE', DEFAULT);
INSERT INTO BOARD_ATTACH_FILE (fNO, bNO, ORIGINAL_FILENAME, RENAMED_FILENAME, CREATE_DATE) VALUES(0, 3, '첨부파일','TEST_FILE', DEFAULT);
UPDATE BOARD SET ATTACHCOUNT =(SELECT COUNT(*) FROM BOARD_ATTACH_FILE WHERE BNO=3) WHERE BNO=3;

COMMIT;
SELECT * FROM BOARD_ATTACH_FILE;
SELECT * FROM BOARD;

------------------------------------------------------------------
------------------------- REPLY 관련 테이블 -------------------------
------------------------------------------------------------------

CREATE TABLE REPLY(
  rNO INT PRIMARY KEY AUTO_INCREMENT,
  bNO INT,
  mNO INT,
  CONTENT VARCHAR(1000),
  STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
  MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (bNO) REFERENCES BOARD(bNO) ON DELETE CASCADE,
  FOREIGN KEY (mNO) REFERENCES MEMBER(mNO) ON DELETE SET NULL 
);


INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 2, '안녕하세요.');
INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 3, '댓글 테스트 입니다. 1');
INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 3, '댓글 테스트 입니다. 2');
INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 3, '댓글 테스트 입니다. 3');
INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 3, '댓글 테스트 입니다. 4');
INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 2, 2, '안녕하세요.');
INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 2, 3, '반갑습니다.');
INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 3, 3, '안녕하세요.');
INSERT INTO REPLY (rNO, bNO, mNO, CONTENT) VALUES(0, 3, 2, '반갑습니다.');


COMMIT;

SELECT * FROM REPLY;



-- 게시판 끝

-------------------------------------------------
------------------ 약 리뷰  ------------------------
-------------------------------------------------

CREATE TABLE MEDICINEREVIEW (
	rNO INT AUTO_INCREMENT,
	mNO INT,
	dNO INT,
    CONTENT VARCHAR(2000),
    NAME VARCHAR(100),
	RATING INT DEFAULT '0',
	CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT PK_MEDICINEREVIEW_NO PRIMARY KEY(rNO),
    CONSTRAINT FK_MEDICINEREVIEW_ITEM FOREIGN KEY(dNO) REFERENCES MEDICINE(dNO) ON DELETE SET NULL,
    CONSTRAINT FK_MEDICINEREVIEW_WRITER FOREIGN KEY(mNO) REFERENCES MEMBER(mNO) ON DELETE SET NULL
);

INSERT INTO MEDICINEREVIEW (rNO, mNO, dNO, CONTENT, NAME, RATING) VALUES(0, 2, 195700020, '소화 불량엔 역시', '사람', 5);
INSERT INTO MEDICINEREVIEW (rNO, mNO, dNO, CONTENT, NAME, RATING) VALUES(0, 2, 195700020, '날마다 복용잘하고 있습니다! 고맙습니다!', '사람', 5);

COMMIT;

SELECT * FROM MEDICINEREVIEW;

-- DROP TABLE MEDICINEREVIEW;



-------------------------------------------------
------------------ 약국 리뷰  ---------------------
-------------------------------------------------

CREATE TABLE PHARMACYREVIEW (
	rNO INT AUTO_INCREMENT,
	mNO INT,
    phNO INT,
    CONTENT VARCHAR(2000),
    NAME VARCHAR(100),
	RATING INT DEFAULT '0',
	CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT PK_PHARMACYREVIEW_NO PRIMARY KEY(rNO),
    CONSTRAINT FK_PHARMACYREVIEW_WRITER FOREIGN KEY(mNO) REFERENCES MEMBER(mNO) ON DELETE SET NULL,
    CONSTRAINT FK_PHARMACYREVIEW_NAME FOREIGN KEY(phNO) REFERENCES PHARMACY(phNO) ON DELETE SET NULL
);

INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 2, 1, '약국 리뷰 입니다.', '사람', 5);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 3, 2, '역이랑 가까움 집에가는길에 이용 가능', '사람',5);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 4, 3, '역이랑 가까움 집에가는길에 이용 가능', '사람',4);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 5, 4, '역이랑 가까움 집에가는길에 이용 가능', '사람',4);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 6, 1, '역이랑 가까움 집에가는길에 이용 가능', '사람',5);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 7, 2, '서비스 별로', '사람',1);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 8, 3, '약봉지 안챙겨줌', '사람',2);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 9, 4, '설명 상세하게 잘해주심', '사람',5);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 10, 1, '복잡하다', '사람',3);
INSERT INTO PHARMACYREVIEW (rNO, mNO, phNO, CONTENT, NAME, RATING) VALUES(0, 11, 2, '후기가 별로 없네', '사람',3);

COMMIT;

SELECT * FROM PHARMACYREVIEW;

-- DROP TABLE PHARMACYREVIEW;

-------------------------------------------------
--------------- 나의 구급함(=즐겨찾기) ----------------
-------------------------------------------------

CREATE TABLE MYAIDKIT (
	kNO INT PRIMARY KEY AUTO_INCREMENT,
	mNO INT,
    dNO INT,
	QUANTITY INT,
	kIMG VARCHAR(100),
	CREATE_DATE	DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    CONSTRAINT FK_MYAIDKIT_WRITER FOREIGN KEY (mNO) REFERENCES MEMBER(mNO) ON DELETE SET NULL,
    CONSTRAINT FK_MYAIDKIT_ITEM FOREIGN KEY (dNO) REFERENCES MEDICINE(dNO) ON DELETE CASCADE
);

INSERT INTO MYAIDKIT (kNO, mNO, dNO, QUANTITY, kIMG) VALUES(0, 2, 195700020, 12, NULL);

COMMIT;

SELECT * FROM MYAIDKIT;

-- DROP TABLE MYAIDKIT;

-------------------------------------------------
--------------------- 뉴스 ----------------------
-------------------------------------------------

CREATE TABLE NEWS (
	newsNO	INT	PRIMARY KEY AUTO_INCREMENT,
    mNO INT,
    TYPE VARCHAR(20) DEFAULT 'NEWS',
	TITLE VARCHAR(100),
	CONTENT	VARCHAR(500),
	newsIMG VARCHAR(100),
	VIEWS INT DEFAULT '0',
	CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    FOREIGN KEY(mNO) REFERENCES MEMBER,
    CONSTRAINT FK_NEWS_CATEGORY FOREIGN KEY(TYPE) REFERENCES BOARD_CATEGORY(TYPE) ON DELETE SET NULL
);

INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[카드뉴스]어르신을 위한 안전한 약물 사용 안내서', '어르신을 위한 안전한 약물 사용 안내', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[일상정보] 생활 속 중금속 섭취 줄이려면', '11', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[건강]유해물질 바로알기 - 시안화합물편', '11', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[일상정보]채소, 과일샐러드 안전하게 섭취하기', '11', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[건강]연속 혈당 측정기 안전사용방법', '11', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[건강]유해물질 바로알기 - 프탈레이트편', '11', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[일상정보]감기 예방을 위한 식생활 요령', '11', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[일상정보]조리법 개선으로 식품 내 중금속 줄일 수 있어요!', '11', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[카드뉴스]여드름약, 이소트레티노인 안전사용! 엄마와 아기를 지켜주세요!', '11', NULL, DEFAULT);
INSERT INTO NEWS (newsNO, TYPE, TITLE, CONTENT, newsIMG, VIEWS) VALUES(0, 'NEWS', '[카드뉴스]나의 부작용 정보 나누면 안전해집니다.', '11', NULL, DEFAULT);

COMMIT;

SELECT * FROM NEWS;
-- DROP TABLE NEWS;
------------------------------------ DDL 끝 -------------------------------------------

------------------------------------ DML 시작-------------------------------------------

---------------------------- 약국 DML  -----------------------------------------------
 
-- 약국 전체 조회 
SELECT * FROM PHARMACY;

-- 총 게시글 갯수
SELECT COUNT(*) FROM PHARMACY WHERE STATUS='Y';

-- 글 상세 조회
SELECT phNO, phNAME, phTEL, phADDRESS, phOP1, phOP2, phOP3, phOP4,
		 		phOP5, phOP6, phOP7, phOP8, phLATI, phLONG,
		 		REVIEWCOUNT, FAVCOUNT, RATING 
FROM PHARMACY P
WHERE P.STATUS = 'Y' AND P.phNO = 1;

-- 검색용 쿼리 2 종 세트
-- 게시판 리스트 용 쿼리 완성  1/20
SELECT  phNO, phNAME, phTEL, phADDRESS, phOP1, phOP2, phOP3, phOP4,
		 		phOP5, phOP6, phOP7, phOP8, phLATI, phLONG,
		 		REVIEWCOUNT, FAVCOUNT, RATING
FROM PHARMACY P
WHERE 
	P.STATUS = 'Y'
    AND (@holidayck IS NULL OR P.phOP8 IS NOT NULL) 
	AND (@nightck IS NULL OR (P.phOP1 > '22:00' OR P.phOP2 > '22:00' OR P.phOP3 > '22:00' OR P.phOP4 > '22:00' OR P.phOP5 > '22:00' OR P.phOP6 > '22:00' OR P.phOP7 > '22:00')) 
    AND P.phNAME LIKE '%그린약국%' 
    AND P.phADDRESS LIKE '%충청남도 아산시%' 
ORDER BY P.phNO DESC LIMIT 8 OFFSET 0;


SELECT COUNT(*)
FROM PHARMACY P
WHERE 
	P.STATUS = 'Y'
    AND (@holidayck IS NULL OR P.phOP8 IS NOT NULL) 
	AND (@nightck IS NULL OR (P.phOP1 > '22:00' OR P.phOP2 > '22:00' OR P.phOP3 > '22:00' OR P.phOP4 > '22:00' OR P.phOP5 > '22:00' OR P.phOP6 > '22:00' OR P.phOP7 > '22:00')) 
    AND P.phNAME LIKE '%그린약국%' 
    AND P.phADDRESS LIKE '%충청남도 아산시%'; 
SELECT * FROM Cart
INNER JOIN Product ON Cart.pNo = Product.pNo
INNER JOIN Member ON Cart.mNo = Member.mNo;

INSERT INTO ProductReply (rNo, mNo, pNo, content, scoreAVG, createDate) values (0,1,1, '좋은 제품입니다.', 5, default);
SELECT * FROM PRODUCTREPLY;

SELECT * FROM ProductReply 
INNER JOIN Member ON Reply.mNo = Member.mNo
WHERE pNo = 1;

commit;


SELECT AVG(rating) FROM ProductReply where pno = 1;
UPDATE product set rating = (SELECT AVG(rating) FROM ProductReply where pno = 1) where pNo = 1;
select * from product where pno = 1;

SELECT  
	*
FROM Product 
left outer JOIN Cart  ON Cart.pno = Product.pno
left outer JOIN Member ON Cart.mNo = Member.mNo
where Cart.mNo = 1;


SELECT * FROM Cart 
INNER JOIN Product ON Cart.pNo = Product.pNo
INNER JOIN Member ON Cart.mNo = Member.mNo
where Member.mno = 1;