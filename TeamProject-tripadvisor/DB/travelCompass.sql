CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(20)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(200)		NOT NULL,
	"MEMBER_NICKNAME"	VARCHAR2(18)		NOT NULL,
	"MEMBER_NAME"	VARCHAR2(15)		NOT NULL,
	"MEMBER_RRN"	VARCHAR2(14)		NOT NULL,
	"MEMBER_TEL"	VARCHAR2(11)		NOT NULL,
	"MEMBER_ADDRESS"	VARCHAR2(100)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"SECESSION_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"SLEEP_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"LAST_LOGIN_DATE"	DATE		NULL,
	"PROFILE_IMAGE"	VARCHAR2(100)	DEFAULT '/resources/images/common/profile.png'	NOT NULL,
	"AUTHORITY"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호(SEQ_MEMBER_NO)';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 아이디';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호(암호화)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원 닉네임';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '회원 이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_RRN" IS '회원 주민등록번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '회원 전화번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDRESS" IS '회원 주소';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '회원 가입일';

COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '탈퇴여부(탈퇴 Y)';

COMMENT ON COLUMN "MEMBER"."SLEEP_FL" IS '휴면여부(휴면상태 Y)';

COMMENT ON COLUMN "MEMBER"."LAST_LOGIN_DATE" IS '마지막 로그인 날짜';

COMMENT ON COLUMN "MEMBER"."PROFILE_IMAGE" IS '프로필 이미지 경로';

COMMENT ON COLUMN "MEMBER"."AUTHORITY" IS '관리자 권한 여부(관리자 Y)';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);


-- 회원 번호 시퀀스
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

INSERT INTO "MEMBER" VALUES(SEQ_MEMBER_NO.NEXTVAL, 'kyh991023@gmail.com', '1234567890', '포병김영현', '김영현', '991023-1234123', '01012341234', '02060,,서울특별시 중랑구 망우동,,', DEFAULT, DEFAULT, DEFAULT, NULL, DEFAULT, DEFAULT);

COMMIT;

SELECT * FROM "MEMBER";

