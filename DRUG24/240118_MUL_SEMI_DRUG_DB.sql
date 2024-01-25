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
	phOP1S 		VARCHAR(100),
	phOP2S 		VARCHAR(100),
	phOP3S 		VARCHAR(100),
	phOP4S 		VARCHAR(100),
	phOP5S 		VARCHAR(100),
	phOP6S 		VARCHAR(100),
    phOP7S 		VARCHAR(100),
    phOP8S 		VARCHAR(100),
	phOP1E 		VARCHAR(100),
	phOP2E 		VARCHAR(100),
	phOP3E 		VARCHAR(100),
	phOP4E 		VARCHAR(100),
	phOP5E 		VARCHAR(100),
	phOP6E 		VARCHAR(100),
    phOP7E		VARCHAR(100),
    phOP8E 		VARCHAR(100),
	phLATI 		VARCHAR(30) DEFAULT '37.49864',
	phLONG 		VARCHAR(30) DEFAULT '127.02811',
	REVIEWCOUNT	INT DEFAULT '0',
	FAVCOUNT 	INT DEFAULT '0',
	RATING 		INT DEFAULT '0',
	STATUS		VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS,
	phOP1S, phOP2S, phOP3S, phOP4S, phOP5S, phOP6S, phOP7S, phOP8S, 
    phOP1E, phOP2E, phOP3E, phOP4E, phOP5E, phOP6E, phOP7E, phOP8E,
    phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '성남약국', '042-672-2957', '대전광역시 동구 계족로 362, 성남약국 1층 (성남동)',
    '0900',  '0900',  '0900',  '0900', '0900', '0900', NULL, NULL, '1900', '1900', '1900', '1900', '1900',
    '1300',  NULL, NULL, '36.34442', '127.43406', DEFAULT, DEFAULT,
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

-- DROP TABLE Product;

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

-- DROP TABLE Orders;

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
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NEWS', '뉴스', 3, 7);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('CMM2', '커뮤니티B', 3, 8);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('CMM3', '커뮤니티C', 3, 9);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NBOARD', '공지사항', 3, 10);

SELECT * FROM BOARD_CATEGORY ORDER BY ORDERNO;

COMMIT;

-- DROP TABLE BOARD_CATEGORY;
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

INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','DRUG24 웹사이트 오픈','올바른 의약정보를 알리고자 DRUG24 웹사이트 오픈합니다. 많은 이용 관심 부탁드립니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','상세검색, 약국찾기 검색 기능이 추가 되었습니다.','의약품 상세 조회 및 심야, 공휴일 운영중인 약국 찾기 기능이 추가 되었습니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','서버 증설 작업','트래픽 과부하로 서버 증설 작업 진행합니다. 2023-03-08 22:00 ~ 24:00 까지 이용 불가합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','서버 연장 점검 안내','서버 증설 작업 연장 되었습니다. 이용에 불편을 드려 죄송합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','서버 정상화 안내','서버 정상화 안내 드립니다. 2023-03-09 08:00 부로 이용 가능합니다. 감사합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','안정성 서한 속보 게시 알림','의약품 안정성 소식을 발빠르게 전달해드립니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','쇼핑몰 오픈 안내','건강기능식품을 DRUG24 쇼핑몰을 통해 판매하게 되었습니다. 많은 이용 부탁드립니다. 감사합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','서버 이전 작업 안내','원활한 쇼핑몰 운영을 위해 서버 작업을 실시합니다. 해당 기간 동안 쇼핑몰 이용 불가합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','서버 연장 점검','쇼핑몰 서버 연장 점검 입니다. 이용에 불편을 드려 죄송합니다. 다른 기능은 정상 사용 가능합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','서버 정상화 안내','쇼핑몰 이용 가능합니다. 감사합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','쇼핑몰 철수 안내','운영상 어려움으로 인해 더 이상 사업을 이어나가기 어렵다고 판단하여 쇼핑몰을 철수하기로 하였습니다. 그동안 성원에 감사드립니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NBOARD','사이트 폐쇄 안내','DRUG24 사이트를 폐쇄 합니다. 운영상 어려움으로 인해 사이트를 폐쇄합니다. 감사합니다.');

INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'QUESTION','[질문] 목시타산안약과 참훌루 안약 사용 문의',
'두 가지를 다 눈에 넣고 있습니다. 잘못된 방법인가요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'QUESTION','[질문] 에소메졸 자기전에 먹어도 될까요?',
'자기전에 먹어도 될까요? 아니면 일어나서 먹어도 괜찮을까요 ?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,4,'QUESTION','[질문] 40대 남성 영양제 관련 문의',
'40대 초반이고, 피로감을 자주 느낍니다. 복용 중인 약은 메가트루파워, 밀크씨슬, 소팔메토 입니다. 오메가3, 코큐텐, 콘트로이친 더 먹으려고 하는데 너무 많은 것 같아서 문의 드립니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,5,'QUESTION','[질문] 겔비스톤과 순아리정 병용 문의',
'maven 어렵나요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,6,'QUESTION','[질문] 영양제 질문드립니다',
'잠을 많이 못자는 30대 중반 남자가 꼭 먹어야 할 영양제 추천 부탁드립니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,7,'QUESTION','[질문] 보충제와 항생제 병용 문의',
'감기로 인해 세프바정 과 알레르기 약을 먹고 있는데 보충제 같이 먹어도 될까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,8,'QUESTION','[질문] 탈모약 질문.. 심각합니다.',
'탈모약은 외부 코팅이 되어있다는데 입안에 잔류 할 수 있나요 ?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,9,'QUESTION','[질문] 피부과, 외과 처방받은 같이 복용?',
'피부과에서 4정 외과에서 8정 받은 약이 있는데 같이 먹어도 괜찮은걸까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,10,'QUESTION','[질문] 알약을 가루로 셀프제조',
'알약 삼키기 힘들어서 가루로 만들어 먹으려는데 괜찮을까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,11,'QUESTION','[질문] 관리자님 문의 드립니다.',
'해외 약품 판매 문의 드립니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,2,'QUESTION','[질문] 모낭염 항생제 감기약 병용 질문',
'미노씬캡슐, 뮤코라민정 먹고 있는데 감기 걸려서 타이레놀, 에르도캡슐 처방 받았는데 어떻게 먹어야 할까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,3,'QUESTION','[질문] 알레르기 비염이 심해요',
'외용제 안약만 넣었는데 알약은 보관했다 나중에 먹어도 될까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,4,'QUESTION','[질문] 외이도염 약 부작용 문의',
'이 약들 중 부작용으로 폐렴이나 심혈관 질환 일으키는 약이 있을까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,5,'QUESTION','[질문] 약 보관케이스에 약이.',
'언제 였는지 모르는 약이 있는데 먹어도 될까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,6,'QUESTION','[질문] 디쿠알론 비슷한 약 문의',
'재처방을 못받아서 비슷한 약을 찾습니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,7,'QUESTION','[질문] 집에 약이 있는데 먹어도 될까요?',
'성분이 배농산급탕, 브로멜라인, 결정트립신 인데 진통효과 있을까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,8,'QUESTION','[질문] 지사제 보관 문의',
'냉동보관 해도 될까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,9,'QUESTION','[질문] 소화불량과 역류성식도염',
'케이캡 어떤가요? 거담제도 같이 먹어보려구요');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,10,'QUESTION','[질문] 성인 해열 진통제 동시 복용 문의',
'6일째 먹었고 증상이 남아 있어 1주치 더 받아 먹으려고 합니다. 괜찮을까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,11,'QUESTION','[질문] 프로몬크림 성분 문의',
'스테로이드 성분 있나요?');

INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 생활속 중금속 섭취 줄이려면',
'식품에 들어있는 중금속은 주로 물, 토양 등 환경으로부터 오염돼요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 유해물질 바로알기 - 시안화합물편',
'시안화합물은 매실, 살구, 사과, 복숭아 등의 씨앗에 자연적으로 존재하며, 미생물에 의한 부패를 막아주는 역할을 해요');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 채소, 과일샐러드 안전하게 섭취하기',
'오늘의 키포인트는 냉장보관입니다. 채소샐러드,커팅과일 제품은 가급적 구입 후 바로 드시고 만약 나중에 먹을 거라면 반드시 냉장 보관하세요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 연속혈당 측정기 안전사용방법',
'연속혈당측정기는? 의료기기이며, 의료기기법에서는 개인용체내연속혈당측정시스템이라는 이름으로 관리 합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 유해물질 바로알기 - 프탈레이트편',
'프탈레이트는 딱딱한 플라스틱에 유연성을 주기 위해 첨가하는 물질이에요. 프탈레이트 노출을 줄이는 방법을 알아볼까요?');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 감기 예방을 위한 식생활 요령',
'환절기 감기예방은 작은 습관에서 시작돼요. 앞서말씀드린 내용을 모두 숙지하시고 오늘도 건강한 하루 보내세요!');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 감기 예방을 위한 식생활 요령',
'환절기 감기예방은 작은 습관에서 시작돼요. 앞서말씀드린 내용을 모두 숙지하시고 오늘도 건강한 하루 보내세요!');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 조리법 개선으로 식품 중 중금속 줄일 수 있어요!',
'중금속 섭취를 줄일 수 있는 조리법을 활용하여 건강하고 안전하게 식품을 섭취하세요!');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 내 몸에 이식한 의료기기 정보 이렇게 확인하세요',
'1. 내 몸에 이식한 의료기기에 부작용 등 새로운 안전성 정보가 생겼다면? 2.환자 안전성 정보 시스템에 등록한 환자라면 누구나 확인 할 수 있습니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 일교차 큰 가을철 나들이, 식중독 주의하세요!',
'식중독 예방 6대 수칙 : 손씻기, 세척소독하기, 익혀먹기, 구분 사용하기, 끓여먹기, 보관온도 지키기 명심하세요!');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 뷔페음식 안심하고 먹어도 될까?위생 가이드라인 알아보기',
'진열 제공 되었던 음식물은 다시 사용하거나 조리 또는 보관하는 등 재사용할 수 없어요 , 뷔페 음식을 안심하고 즐길 수 있도록 위생 가이드라인을 꼭 준수하세요!');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 영양 결핍에 의한 질병, 식품으로 예방하기',
'식품을 통한 충분한 영양소 섭취로 영양결핍에 의한 질병을 예방하고 건강을 지키세요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보]여름 대표과일 수박의 비밀',
'수박씨의 효능 : 성장발달 , 성인병 예방, 노폐물 배출 및 방광염 완화, 피부미용 및 변비 예방');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 몸에 좋다고? 농산물 제대로 확인하고 구매하세요',
'우리나라는 사용할 수 있는 식품원료를 목록화하고, 목록에 없는 것은 판매, 사용할 수 없어요.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보]겨울에도 발생하는 노로바이러스 식중독 예방법',
'비누를사용하여 30초 손씻기, 채소 과일은 깨끗한 물로 세척하기, 생식 하지 않기');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 독감치료제 타미플루 안전하게 사용하려면',
'의사의 처방전이 필요하며 , 해열진통제와 함께 복용 가능합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 달콤한 꿀! 1세 미만 어린아이에게는 먹이지 마세요!',
'벌꿀에는 피롤리지딘 알칼로이드, 보툴리누스균 등 아기에게 해로운 물질이 함유되어 있을 수 있어 각별한 주의가 필요합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 톡 쏘는 물 탄산수를 아시나요?',
'탄산수란 천연적으로 탄산가스를 함유한 물이거나 물에 인위적으로 탄산가스를 첨가한 물입니다. 톡 쏘는 탄산수 제대로 알고 마셔요!');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[일상 정보] 수산물 먹을 떄 알아야 할 기생충 정보',
'회, 굴 등 자연산 수산물을 섭취하기 전 꼭 알아두어야 할 상식, 그대로 먹게 되면 복통, 설사 등을 일으킬 수 있으니 주의하세요');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0,1,'NEWS','[건강] 매실주 안전하게 담그세요',
'매실주 에틸카바메이트 줄이기 방안 -> 더 자세한 정보는 www.주류안전.kr 을 참고하여 주세요.');

COMMIT;

SELECT * FROM BOARD;

-- DROP TABLE BOARD;
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

-- DROP TABLE BOARD_ATTACH_FILE;
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

-- DROP TABLE REPLY;

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

CREATE TABLE PharmacyReply (
	rNO INT PRIMARY KEY AUTO_INCREMENT,
	mNO INT,
    phNO INT,
    CONTENT VARCHAR(2000),
    RATING INT DEFAULT '0',
	CREATEDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(mNO) REFERENCES MEMBER(mNO),
    FOREIGN KEY(phNO) REFERENCES PHARMACY(phNO)
);

INSERT INTO PharmacyReply (rNO, mNO, phNO, CONTENT, RATING, CREATEDATE) VALUES(0, 2, 1, '약국 리뷰 입니다.', 5, DEFAULT);

COMMIT;

SELECT * FROM PharmacyReply;

-- DROP TABLE PharmacyReply;

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