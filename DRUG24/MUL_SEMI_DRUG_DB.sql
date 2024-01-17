DROP SCHEMA DRUG;
CREATE SCHEMA DRUG;
USE DRUG;

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
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('TIP', 'TIP', 3, 4);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NEWS', '뉴스', 3, 5);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('CMM1', '약 및 건기식 리뷰', 3, 6);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('CMM2', '약국리뷰', 3, 7);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('SLETTER', '안전성서한', 3, 8);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('NBOARD', '공지사항', 3, 9);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('LIFE', '일상정보', 3, 10);
INSERT INTO BOARD_CATEGORY (TYPE, NAME, LEVEL, ORDERNO) VALUES('HEALTH', '건강', 3, 11);

COMMIT;

SELECT * FROM BOARD_CATEGORY ORDER BY ORDERNO;

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
--------------------------- 게시판 첨부파일 --------------------------
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
--------------- 약 리뷰 게시판 ----------------------
-------------------------------------------------

CREATE TABLE MBOARD (
	mbNO INT AUTO_INCREMENT,
	mNO INT,
	ITEMNAME VARCHAR(1000),
    TYPE VARCHAR(20) DEFAULT 'CMM1',
    TITLE VARCHAR(1000),
    CONTENT VARCHAR(2000),
    ATTACHCOUNT INT DEFAULT '0',
    VIEWS INT DEFAULT '0',
	RATING INT DEFAULT '0',
	REVIEWPIC TEXT NULL,
    THUMBCOUNT INT DEFAULT '0',
    STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
	CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT PK_MBOARD_NO PRIMARY KEY(mbNO),
    CONSTRAINT FK_MBOARD_ITEM FOREIGN KEY(ITEMNAME) REFERENCES MEDICINE(ITEMNAME) ON DELETE SET NULL,
    CONSTRAINT FK_MBOARD_WRITER FOREIGN KEY(mNO) REFERENCES MEMBER(mNO) ON DELETE SET NULL,
    CONSTRAINT FK_MBOARD_CATEGORY FOREIGN KEY(TYPE) REFERENCES BOARD_CATEGORY(TYPE) ON DELETE SET NULL
);

INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 1, 'NOTICE', '[공지] 의약품 및 건강기능식품 리뷰 게시판입니다.',
'의약품 및 건강기능식품 평가 및 후기 작성 해주세요.');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 1, 'NOTICE', '[공지] 욕설, 도배 및 광고 금지 합니다.',
'욕설, 도배 및 광고글 게시시 불이익을 받을 수 있습니다.');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 10, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 11, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 10, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 11, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'CMM1', '[약 및 건기식 리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 10, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 11, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 10, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 11, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 2, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 3, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 4, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 5, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 6, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 7, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 8, 'CMM1', '[약리뷰] ,'
'');
INSERT INTO MBOARD (mbNO, mNO, TYPE, TITLE, CONTENT) VALUES(0, 9, 'CMM1', '[약리뷰] ,'
'');

COMMIT;

SELECT * FROM MBOARD;

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



CREATE TABLE `MyAidKit` (
	`id`	VARCHAR(30)	NOT NULL,
	`itemName`	VARCHAR(255)	NOT NULL,
	`quantity`	INT	NOT NULL,
	`experationDate`	DATE	NOT NULL,
	`createdDate`	timestamp	NOT NULL,
	`modifiedDate`	timestamp	NOT NULL,
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

CREATE TABLE `HEALTHFOOD` (
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

CREATE TABLE `PHARMACY_ATTACH_FILE` (
	`fNo`	INT	NOT NULL,
	`phreviewid`	INT	NOT NULL,
	`pharmNo`	INT	NOT NULL,
	`id`	VARCHAR(30)	NOT NULL,
	`origianl_filename`	VARCHAR(200)	NOT NULL,
	`renamed_filename`	VARCHAR(200)	NOT NULL,
	`createDate`	TIMESTAMP	NOT NULL
);


