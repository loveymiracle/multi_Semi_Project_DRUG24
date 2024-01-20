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
	phPICURL 	text NULL,
	phOP1 		VARCHAR(100),
	phOP2 		VARCHAR(100),
	phOP3 		VARCHAR(100),
	phOP4 		VARCHAR(100),
	phOP5 		VARCHAR(100),
	phOP6 		VARCHAR(100),
	phLATI 		VARCHAR(30) DEFAULT '37.49864',
	phLONG 		VARCHAR(30) DEFAULT '127.02811',
	REVIEWCOUNT	INT DEFAULT '0',
	FAVCOUNT 	INT DEFAULT '0',
	RATING 		INT DEFAULT '0',
	STATUS		VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS, phPICURL,
	phOP1, phOP2, phOP3, phOP4, phOP5,
    phOP6, phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '이즈타워약국', '02-501-9489', '서울 강남구 테헤란로', NULL, 
    '월 10:00~15:00', '화 10:00~15:00', '수 10:00~15:00', '목 10:00~15:00', '금 10:00~15:00',
    '토 10:00~18:00', '37.49864', '127.02811', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS, phPICURL,
	phOP1, phOP2, phOP3, phOP4, phOP5,
    phOP6, phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '미진약국', '02-566-1954', '서울 강남구 강남대로', NULL, 
    '월 09:30~21:00', '화 09:30~21:00', '수 09:30~21:00', '목 09:00~21:00', '금 09:00~21:00',
    '토 09:00~18:00', '37.49795', '127.02855', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS, phPICURL,
	phOP1, phOP2, phOP3, phOP4, phOP5,
    phOP6, phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '강남역2번출구약국', '02-565-5490', '서울 강남구 강남대로', 'https://www.google.com/maps/place/%EA%B0%95%EB%82%A8%EC%97%AD+2%EB%B2%88%EC%B6%9C%EA%B5%AC+%EC%95%BD%EA%B5%AD/@37.4973576,127.0283168,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipPdh1rhxrq1jXj0r4mkjdZKXNNeXOnrhmypXp-u!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPdh1rhxrq1jXj0r4mkjdZKXNNeXOnrhmypXp-u%3Dw114-h86-k-no!7i4032!8i3024!4m10!1m2!2m1!1z64m07JqV7JW96rWt!3m6!1s0x357ca16bc8f58189:0x5b342f9a8055b1a6!8m2!3d37.4973576!4d127.0283168!10e5!16s%2Fg%2F11pyc1t_zv?hl=ko&entry=ttu#', 
    '월 09:30~19:30', '화 09:30~19:30', '수 08:30~14:00', '목 09:30~19:30', '금 09:30~20:00',
    '토일 08:50~12:00', '37.49750', '127.02872', DEFAULT, DEFAULT,
    DEFAULT, DEFAULT
);

INSERT INTO PHARMACY (
	phNO, phNAME, phTEL, phADDRESS, phPICURL,
	phOP1, phOP2, phOP3, phOP4, phOP5,
    phOP6, phLATI, phLONG, REVIEWCOUNT, FAVCOUNT,
    RATING, STATUS
) VALUES(
	0, '뉴욕약국', '070-4147-3039', '서울 강남구 테헤란로', 'https://www.google.com/maps/place/%EB%89%B4%EC%9A%95%EC%95%BD%EA%B5%AD/@37.4987204,127.0286696,3a,75y,90t/data=!3m8!1e2!3m6!1s5i_rZG4lmLXMPq9OGt6TPGUpKBlZVygxF6ZxeeUEkIcqPln_LUb7fPCVrNo1VJX-!2e9!3e27!6s%2F%2Flh6.googleusercontent.com%2F5i_rZG4lmLXMPq9OGt6TPGUpKBlZVygxF6ZxeeUEkIcqPln_LUb7fPCVrNo1VJX-%3Dw86-h86-k-no!7i2448!8i2448!4m11!1m2!2m1!1z64m07JqV7JW96rWt!3m7!1s0x357ca159db47d5fd:0x7ce8d0aa4d79956c!8m2!3d37.4987204!4d127.0286696!10e5!15sCgzribTsmpXslb3qta1aDyIN64m07JqVIOyVveq1rZIBCWRydWdzdG9yZeABAA!16s%2Fg%2F11h67qs4gl?hl=ko&entry=ttu#', 
    '월 09:00~21:30', '화 09:00~21:30', '수 09:00~21:30', '목 09:00~21:30', '금 09:00~21:30',
    '토 09:00~18:30', '37.50179', '127.04018', DEFAULT, DEFAULT,
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

---------------------------------------------------
--------------- Board 카테고리 테이블 ------------------
---------------------------------------------------

CREATE TABLE BOARD_CATEGORY (
	TYPE VARCHAR(20),
	NAME VARCHAR(100),
    LEVEL INT,
	ORDERNO	INT,
    CONSTRAINT PK_BOARD_CATEGORY PRIMARY KEY(TYPE)
);

INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NOTICE', '공지', 0, 1);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('PLAIN', '일반', 3, 2);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('QUESTION', '질문', 3, 3);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('SLETTER', '안전성서한', 3, 4);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NBOARD', '공지사항', 3, 5);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NEWS', '뉴스', 3, 6);

COMMIT;

SELECT * FROM BOARD_CATEGORY ORDER BY ORDERNO;

-- DROP TABLE BOARD_CATEGORY;

-------------------------------------------------
--------------- 게시판 ----------------------------
-------------------------------------------------

CREATE TABLE BOARD (
	bNO INT AUTO_INCREMENT,
	mNo	INT,
	TYPE VARCHAR(20) DEFAULT 'QUESTION',
    TITLE VARCHAR(1000),
	CONTENT VARCHAR(2000),
    ATTACHCOUNT INT DEFAULT 0,
    VIEWS INT DEFAULT 0,
    STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
	CREATE_DATE	DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT PK_BOARD_NO PRIMARY KEY(bNO),
    CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(mNO) REFERENCES MEMBER(mNO) ON DELETE SET NULL,
    CONSTRAINT FK_BOARD_CATEGORY FOREIGN KEY(TYPE) REFERENCES BOARD_CATEGORY(TYPE) ON DELETE SET NULL
);

INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 1, 'NOTICE', '[공지] 질문 및 일반글 게시판입니다.', '질문 및 글 작성 가능합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 1, 'NOTICE', '[공지] 욕설 및 도배 금지입니다.', '욕설 및 도배를 금지합니다.');
INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'QUESTION', '[질문] 목시타신안약과 참훌루 안약 사용 문의',
 '두 가지를 다 눈에 넣고 있습니다. 잘못된 방법인가요 ? 아니라면 어떤 것부터 넣고 하루 사용량 궁금합니다.');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'QUESTION', '[질문] 에소메졸 자기전에 먹어도 될까요?',
 '자기전에 먹어도 될까요? 아니면 취침전에 먹어도 괜찮을까요 ?');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'PLAIN','[일반] 약사, 운영자 여러분 감사합니다.',
 '이런 사이트 만들어 주셔서 감사합니다. 답변 잘해주시는 약사님들도 감사합니다.');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'QUESTION', '[질문] 40대 남성 영양제 관련 문의',
 '40대 초반이고, 피로감을 자주 느낍니다. 복용 중인 약은 메가트루파워, 밀크씨슬, 소팔메토 입니다. 오메가3, 코큐텐, 콘트로이친 더 먹으려고 하는데 너무 많은 것 같아서 문의 드립니다.');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'QUESTION', '[질문] 겔비스톤과 순아리정 병용 문의',
 '같이 먹어도 효과 있나요?');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'QUESTION', '[질문] 영양제 질문드립니다.',
 '잠을 많이 못자는 30대 중반 남자가 꼭 먹어야 할 영양제 추천 부탁드립니다.');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'QUESTION', '[질문] 보충제와 항생제 병용 문의',
 '감기로 인해 세프바정 과 알레르기 약을 먹고 있는데 보충제 같이 먹어도 될까요?');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'QUESTION', '[질문] 탈모약 질문.. 심각합니다.',
 '탈모약은 외부 코팅이 되어있다는데 입안에 잔류 할 수 있나요 ?');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 10, 'QUESTION', '[질문] 피부과, 외과 처방받은 같이 복용?',
 '피부과에서 4정 외과에서 8정 받은 약이 있는데 같이 먹어도 괜찮은걸까요?');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 11, 'QUESTION', '[질문] 알약을 가루로 셀프제조',
 '알약 삼키기 힘들어서 가루로 만들어 먹으려는데 괜찮을까요?');
 INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'PLAIN', '[일반] 관리자님 문의 드립니다.',
 '해외 약품 판매 문의 드립니다.');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'QUESTION', '[질문] 모낭염 항생제 감기약 병용 질문',
 '미노씬캡슐, 뮤코라민정 먹고 있는데 감기 걸려서 타이레놀, 에르도캡슐 처방 받았는데 어떻게 먹어야 할까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'QUESTION', '[질문] 알레르기 비염이 심해요',
 '외용제 안약만 넣었는데 알약은 보관했다 나중에 먹어도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'QUESTION', '[질문] 외이도염 약 부작용 문의',
 '이 약들 중 부작용으로 폐렴이나 심혈관 질환 일으키는 약이 있을까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'QUESTION', '[질문] 약 보관케이스에 약이..',
 '언제 였는지 모르는 약이 있는데 먹어도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'QUESTION', '[질문] 집에 약이 있는데 먹어도 될까요?',
 '성분이 배농산급탕, 브로멜라인, 결정트립신 인데 진통효과 있을까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'QUESTION', '[질문] 디쿠알론 비슷한 약 문의',
 '재처방을 못받아서 비슷한 약을 찾습니다.');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'PLAIN', '[일반] 약사가 되고 싶어요',
 '약사님들 약사가 되고 싶어요');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 10, 'QUESTION', '[질문] 지사제 보관 문의',
 '냉동보관 해도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 11, 'QUESTION', '[질문] 소화불량과 역류성식도염',
 '케이캡 어떤가요? 거담제도 같이 먹어보려구요');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'QUESTION', '[질문] 성인 해열 진통제 동시 복용 문의',
 '열이 39.7도여서 콜대원, 콜드큐시럽, 타이레놀 1정 먹었는데 동시복용 안된다고 들었는데 괜찮은가요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'QUESTION', '[질문] 아목시실린 2주이상 복용 문의',
 '6일째 먹었고 증상이 남아 있어 1주치 더 받아 먹으려고 합니다. 괜찮을까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'QUESTION', '[질문] 피임약 복용 질문드립니다.',
 '에이리스 복용 중인데 시간을 놓쳐서 17시간 후에 먹었어요 어찌해야 할까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'QUESTION', '[질문] 영양제 문의',
 '자기 전에 유산균이랑 마그네슘 같이 먹으려구요 어떤가요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'QUESTION', '[질문] 프로몬크림 성분 문의',
 '스테로이드 성분 있나요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'QUESTION', '[질문] 처방약과 판콜에이 병용 문의',
 '이비인후과 처방약이 부족해서 판콜에이도 같이 먹으려고 합니다. 괜찮을까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'QUESTION', '[질문] 복용 문의',
 '에어탈정, 베스티딘정, 울트라셋세미정 복용 중인데 두통이 자주 와서 이지엔6나 타이레놀 먹어도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'QUESTION', '[질문] 약 먹고 술도 같이 마셧어요..',
 '펠루비정, 뮤코라민정 먹구 술마셨어요 부작용 있을까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 10, 'QUESTION', '[질문] 스테아린마그네슘',
 '이 성분 들어간 약 먹으면 알러지 반응이 와요 이럴수가 있나요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 11, 'QUESTION', '[질문] 피부과 항생제 오래먹어도 괜찮나요?',
 '피부과에서 여드름 치료 받아서 약을 받았는데 3주 먹었는데 2주 치 더 주네요 괜찮나요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'QUESTION', '[질문] 관절영양제 복용 문의',
 '보스웰리아, 홍화씨환 같이 먹어도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'QUESTION', '[질문] 추간판탈출 약 질문',
 '여러 약을 먹어봤는데 점점 통증이 오는 주기가 짧아집니다. 다른 약 있나요 ?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'QUESTION', '[질문] 미라벡서방정50mg 복용',
 '트루패스구강붕해정 드시는 86세 환자가 있는데 약국에서 미라벡서방정 사왔는데 먹어도 될까요 ?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'QUESTION', '[질문] 레바미피드, 트리메부틴말레산염 질문',
 '레바미피드 트리메부틴말레산염 위 두 성분 같이 먹어도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'QUESTION', '[질문] 제네릭 약으로 바꿔도 머리 안빠지나요?',
 '마이페시아 6년 넘게 먹고 있는데 피나세트 정으로 바꾸려고 하는데 이 제약회사 괜찮은가요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'QUESTION', '[질문] 우황청심원',
 '위랑 십이지장 궤양으로 약 복용 중인데 이거 먹어도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'QUESTION', '[질문] 소화제 종류 구분 문의',
 '소화 효소제, 위장 운동 촉진제, 위 건강 개선제 이거 하나로 합치면 안되는건가요? 왜 따로 약이 나오죠?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'QUESTION', '[질문] 항히스타민 질문',
 '두드러기 와서 코데날정 먹었는데 이게 히스타민 성분이 있대요 알레그라도 같이 먹었는데 괜찮을까요? 저녁에 씨잘정도 또 먹으려구여');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 10, 'QUESTION', '[질문] 기침약 추가 복용',
 '아모크라듀오정, 타스멘정, 레보투스정, 슈다페드정, 무코스타정을 처방 받았는데 콧물나서 코푸에스시럽 추가로 먹어도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 11, 'QUESTION', '[질문] 피디정 복용 주기',
 '하루 2알 정도 먹는데 스테로이드제 장기 복용 주의 하라고 해서 문의 드립니다.');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'QUESTION', '[질문] 부정맥 환자 코로나 약',
 '풀카드정, 이솝틴정 복용 중인데 코로나 약 록펜정, 코대원정, 페니라민정 기존약이랑 같이 먹어도 될까요');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'QUESTION', '[질문] 코대원에스 시럽이랑 술',
 '코대원에스 시럽만 먹었는데 술 마셔도 될까요 감기약이랑 술은 간손상 심하다고 들어서요');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'QUESTION', '[질문] 병용 질문',
 '바이모틴정, 펙수클루정, 대원디아제팜정 같이 복용해도 문제 없나요 ?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'QUESTION', '[질문] 듀라티얼즈 안연고 부정맥',
 '부정맥 환자 인데 이 연고 같이 사용해도 될까요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'QUESTION', '[질문] 키목신캡슐 엘도팩트캡슐 같이 복용 문의',
 '기침이 심해서 새로 받아 왔는데 이전 약이랑 같이 먹었는데 괜찮나요?');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'QUESTION', '[질문] 야근하는게 너무 피곤한데 영양제 추천',
 '약국에서 파는 영양제 추천 해주세요');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'QUESTION', '[질문] 약이 쓰네요',
 '약이 문제인가요 제가 문제인가요');
  INSERT INTO BOARD (bNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'QUESTION', '[질문] 마그네슘 들어간 약국 약 추천',
 '편두통이 있어서 마그네슘 먹으려구요');
 
 COMMIT;
 
 SELECT * FROM BOARD;
--  DROP TABLE BOARD; 
 
 
------------------------------------------------------------------
--------------------------- 게시판 첨부파일 -------------------------
------------------------------------------------------------------

 CREATE TABLE BOARD_ATTACH_FILE (
	fNO	INT	AUTO_INCREMENT,
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
------------------------- 게시판 REPLY  ----------------------------
------------------------------------------------------------------

CREATE TABLE REPLY_BOARD (
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

INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 2, '안녕하세요.');
INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 3, '댓글 테스트 입니다. 1');
INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 3, '댓글 테스트 입니다. 2');
INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 3, '댓글 테스트 입니다. 3');
INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 1, 3, '댓글 테스트 입니다. 4');
INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 2, 2, '안녕하세요.');
INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 2, 3, '반갑습니다.');
INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 3, 3, '안녕하세요.');
INSERT INTO REPLY_BOARD (rNO, bNO, mNO, CONTENT) VALUES(0, 3, 2, '반갑습니다.');

COMMIT;

SELECT * FROM REPLY_BOARD;

-- DROP TABLE REPLY_BOARD; 

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

COMMIT;

SELECT * FROM ProductReply;

DROP TABLE ProductReply; 

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
    TYPE VARCHAR(20) DEFAULT 'NEWS',
	TITLE VARCHAR(100),
	CONTENT	VARCHAR(500),
	newsIMG VARCHAR(100),
	VIEWS INT DEFAULT '0',
	CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
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