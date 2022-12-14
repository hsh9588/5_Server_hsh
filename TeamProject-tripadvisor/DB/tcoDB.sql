SELECT * FROM "MEMBER";

SELECT * FROM FOLLOW;

SELECT * FROM REVIEW;

SELECT COUNT(*)
FROM REVIEW
WHERE REVIEW_FL = 'N'

SELECT REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE, CONTENT_ID,
	FIRST_IMAGE, MEMBER_NO, PROFILE_IMAGE, MEMBER_NICKNAME, REVIEW_IMAGE_PATH
FROM REVIEW
LEFT JOIN "MEMBER" USING(MEMBER_NO)
LEFT JOIN REVIEW_IMAGE USING(REVIEW_NO)
WHERE REVIEW_FL = 'N'
ORDER BY REVIEW_NO;

SELECT * FROM REVIEW_IMAGE;

BEGIN
	FOR I IN 1..5 LOOP
		INSERT INTO REVIEW
		VALUES(SEQ_REVIEW_NO.NEXTVAL,
		3, SEQ_REVIEW_NO.CURRVAL || '번째 리뷰',
		SEQ_REVIEW_NO.CURRVAL || '번 리뷰 내용 입니다. 음식이 맛있고 음식이 맛없고 구경거리가 많고 구경거리가 적고 정말 너무 친절하면서 너무 불친절 했습니다.
		다음에 또 오고 싶고 오고 싶지 않더라구요. 추천 합니다. 추천 안합니다.',
		DEFAULT, 2, 250263, NULL, DEFAULT, 12
		);
	END LOOP;
END;
/

COMMIT;



-- 리뷰 리스트 조회시 필요한 컬럼
-- 리뷰 제목, 리뷰 내용, 작성 날짜, 도움이됨 수, 위치 정보 제목, 
-- 장소 섬네일 이미지 주소, 장소 평점, 위치 정보 리뷰 수, 위치 정보 

SELECT REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, TO_CHAR(REVIEW_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
	CONTENT_ID,	FIRST_IMAGE, MEMBER_NO, PROFILE_IMAGE, MEMBER_NICKNAME
FROM REVIEW
LEFT JOIN "MEMBER" USING(MEMBER_NO)
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = 1
ORDER BY REVIEW_NO;

SELECT * FROM REVIEW_IMAGE;

SELECT * FROM REVIEW_IMAGE
WHERE REVIEW_NO = 1
ORDER BY REVIEW_IMAGE_NO;

SELECT * FROM FOLLOW;

SELECT * FROM "MEMBER";

SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NICKNAME, MEMBER_NAME, PROFILE_IMAGE, 
SUBSTR(MEMBER_ADDRESS, 8, 6) MEMBER_ADDRESS, TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월"') REVIEW_DATE
FROM "MEMBER"

SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NICKNAME, MEMBER_NAME, PROFILE_IMAGE, 
SUBSTR(MEMBER_ADDRESS, 8, 6) MEMBER_ADDRESS, TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
(SELECT COUNT(*)
FROM REVIEW
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = 2)
+
(SELECT COUNT(*)
FROM TRAVEL
WHERE PRIVATE_FL = 'N'
AND MEMBER_NO = 2)
+
(SELECT COUNT(*)
FROM QUESTION
WHERE BLIND_FL = 'N'
AND MEMBER_NO = 2) TOTAL_POSTING,
(SELECT COUNT(*)
FROM FOLLOW
WHERE MEMBER_NO = 2) TOTAL_FOLLOWER,
(SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 2) TOTAL_FOLLOWING
FROM MEMBER
WHERE MEMBER_NO = 2

-- 참고용
--INSERT INTO BOARD_IMG
--VALUES(SEQ_IMG_NO.NEXTVAL, '/resources/images/board/',
--'20221116105843_00004.gif', '4.gif', 3 , 1000);

SELECT * FROM REVIEW
WHERE MEMBER_NO = 1;

SELECT * FROM REVIEW_IMAGE;

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 8, '/resources/images/profile/', DEFAULT, 0, 'hills123.jpg', 'hills.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 8, '/resources/images/profile/', DEFAULT, 1, 'alberta123.jpg', 'alberta.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 8, '/resources/images/profile/', DEFAULT, 2, 'avenue123.jpg', 'avenue.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 8, '/resources/images/profile/', DEFAULT, 3, 'tree123.jpg', 'tree.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 8, '/resources/images/profile/', DEFAULT, 4, 'thunderstorm123.jpg', 'thunderstorm.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 8, '/resources/images/profile/', DEFAULT, 5, 'road123.jpg', 'road.jpg');


SELECT * FROM REVIEW_IMAGE
WHERE REVIEW_NO = 3
ORDER BY REVIEW_IMAGE_ORDER;
	
ROLLBACK;
		
COMMIT;


INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 10, '/resources/images/profile/', DEFAULT, 0, 'tree123.jpg', 'tree.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 10, '/resources/images/profile/', DEFAULT, 1, 'thunderstorm123.jpg', 'thunderstorm.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 10, '/resources/images/profile/', DEFAULT, 2, 'road123.jpg', 'road.jpg');


INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 12, '/resources/images/profile/', DEFAULT, 0, 'mountains-beach123.jpg', 'mountains-beach.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 12, '/resources/images/profile/', DEFAULT, 1, 'mountain-landscape123.jpg', 'mountain-landscape.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 12, '/resources/images/profile/', DEFAULT, 2, 'nature.jpg', 'nature.jpg');



INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 14, '/resources/images/profile/', DEFAULT, 0, 'canyon123.jpg', 'canyon.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 14, '/resources/images/profile/', DEFAULT, 1, 'hd-wallpaper123.jpg', 'hd-wallpaper.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 14, '/resources/images/profile/', DEFAULT, 2, 'lak123.jpg', 'lak.jpg');

INSERT INTO REVIEW_IMAGE
VALUES
(SEQ_REVIEW_IMAGE_NO.NEXTVAL, 14, '/resources/images/profile/', DEFAULT, 3, 'flower-field123.jpg', 'flower-field.jpg');

-- 팔로워


--(SELECT COUNT(*)
--FROM FOLLOW
--WHERE MEMBER_NO = 2) TOTAL_FOLLOWER,


--(SELECT COUNT(*)
--FROM FOLLOW
--WHERE FOLLOW_MEMBER_NO = 2) TOTAL_FOLLOWING


SELECT *
FROM "MEMBER";

SELECT *
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 2;

-- 팔로우 하기
INSERT INTO FOLLOW
VALUSE(#{loginMemberNo}, #{memeberNo}, DEFAULT);

-- 팔로우 취소 하기
DELETE FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 4
AND MEMBER_NO = 1;

-- 팔로워한 인원 리스트 조회
SELECT M.MEMBER_NO, MEMBER_EMAIL, MEMBER_NICKNAME, MEMBER_NAME, PROFILE_IMAGE, 
SUBSTR(MEMBER_ADDRESS, 8, 6) MEMBER_ADDRESS, TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
(SELECT COUNT(*)
FROM REVIEW
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO)
+
(SELECT COUNT(*)
FROM TRAVEL
WHERE PRIVATE_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO)
+
(SELECT COUNT(*)
FROM QUESTION
WHERE BLIND_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO) TOTAL_POSTING,
(SELECT COUNT(*)
FROM FOLLOW
WHERE MEMBER_NO = M.MEMBER_NO) TOTAL_FOLLOWER,
(SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = M.MEMBER_NO) TOTAL_FOLLOWING
FROM FOLLOW F
JOIN "MEMBER" M ON (F.FOLLOW_MEMBER_NO = M.MEMBER_NO)
WHERE F.MEMBER_NO = 1
AND SECESSION_FL = 'N';

-- 팔로잉한 인원 목록 조회
SELECT FOLLOW_MEMBER_NO, M.MEMBER_NO, MEMBER_EMAIL, MEMBER_NICKNAME, MEMBER_NAME, PROFILE_IMAGE, 
SUBSTR(MEMBER_ADDRESS, 8, 6) MEMBER_ADDRESS, TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
(SELECT COUNT(*)
FROM REVIEW
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO)
+
(SELECT COUNT(*)
FROM TRAVEL
WHERE PRIVATE_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO)
+
(SELECT COUNT(*)
FROM QUESTION
WHERE BLIND_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO) TOTAL_POSTING,
(SELECT COUNT(*)
FROM FOLLOW
WHERE MEMBER_NO = M.MEMBER_NO) TOTAL_FOLLOWER,
(SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = M.MEMBER_NO) TOTAL_FOLLOWING
FROM FOLLOW F
JOIN "MEMBER" M ON (F.MEMBER_NO = M.MEMBER_NO)
WHERE F.FOLLOW_MEMBER_NO = 2
AND SECESSION_FL = 'N';


SELECT * FROM PLACE_SCRAP

SELECT COUNT(*)
FROM REVIEW
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = 2

SELECT *
FROM REVIEW
WHERE MEMBER_NO = 2
ORDER BY REVIEW_NO;

SELECT FOLLOW_MEMBER_NO, MEMBER_NO
FROM FOLLOW;

SELECT FOLLOW_MEMBER_NO, M.MEMBER_NO, MEMBER_EMAIL, MEMBER_NICKNAME, MEMBER_NAME, PROFILE_IMAGE, 
SUBSTR(MEMBER_ADDRESS, 8, 6) MEMBER_ADDRESS, TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
(SELECT COUNT(*)
FROM REVIEW
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = 2)
+
(SELECT COUNT(*)
FROM TRAVEL
WHERE PRIVATE_FL = 'N'
AND MEMBER_NO = 2)
+
(SELECT COUNT(*)
FROM QUESTION
WHERE BLIND_FL = 'N'
AND MEMBER_NO = 2) TOTAL_POSTING,
(SELECT COUNT(*)
FROM FOLLOW
WHERE MEMBER_NO = 2) TOTAL_FOLLOWER,
(SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 2) TOTAL_FOLLOWING
FROM FOLLOW F
JOIN "MEMBER" M ON (F.FOLLOW_MEMBER_NO = M.MEMBER_NO)
WHERE F.MEMBER_NO = 2;

SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 2
AND MEMBER_NO = (
SELECT MEMBER_NO
FROM "MEMBER"
WHERE MEMBER_NICKNAME = '이이');

SELECT * FROM REVIEW;

SELECT REVIEW_NO, RATING, REVIEW_TITLE, REVIEW_CONTENT, TO_CHAR(REVIEW_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
	CONTENT_ID,	FIRST_IMAGE, MEMBER_NO, PROFILE_IMAGE, MEMBER_NICKNAME, CONTENT_TYPE_ID
FROM REVIEW
LEFT JOIN "MEMBER" USING(MEMBER_NO)
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = 2
ORDER BY REVIEW_NO

UPDATE "MEMBER" SET
PROFILE_IMAGE = #{profileImage}
WHERE MEMBER_NO = #{memberNo}

SELECT * 
FROM REVIEW
WHERE MEMBER_NO = 6;

SELECT *
FROM "MEMBER";


COMMIT;

SELECT FOLLOW_MEMBER_NO, MEMBER_NO
FROM FOLLOW;

SELECT *
FROM "MEMBER"




SELECT M.MEMBER_NO, MEMBER_NICKNAME, MEMBER_NAME, FOLLOW_MEMBER_NO, F.MEMBER_NO
FROM "MEMBER" M
LEFT JOIN FOLLOW F ON (M.MEMBER_NO = F.MEMBER_NO)
ORDER BY M.MEMBER_NO;

SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = #{친추한사람번호}
AND MEMBER_NO = (
SELECT MEMBER_NO
FROM "MEMBER"
WHERE MEMBER_NO = #{친추받은사람번호});

SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 1
AND MEMBER_NO = (
SELECT MEMBER_NO
FROM "MEMBER"
WHERE MEMBER_NO = 2
AND SECESSION_FL = 'N');

SELECT *
FROM FOLLOW;


SELECT *
FROM FOLLOW;

SELECT F.MEMBER_NO, M.MEMBER_NO, MEMBER_EMAIL, MEMBER_NICKNAME, MEMBER_NAME, PROFILE_IMAGE, 
SUBSTR(MEMBER_ADDRESS, 8, 6) MEMBER_ADDRESS, TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
(SELECT COUNT(*)
FROM REVIEW
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO)
+
(SELECT COUNT(*)
FROM TRAVEL
WHERE PRIVATE_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO)
+
(SELECT COUNT(*)
FROM QUESTION
WHERE BLIND_FL = 'N'
AND MEMBER_NO = M.MEMBER_NO) TOTAL_POSTING,
(SELECT COUNT(*)
FROM FOLLOW
WHERE MEMBER_NO = M.MEMBER_NO) TOTAL_FOLLOWER,
(SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = M.MEMBER_NO) TOTAL_FOLLOWING
FROM FOLLOW F
JOIN "MEMBER" M ON (F.FOLLOW_MEMBER_NO = M.MEMBER_NO)
WHERE F.MEMBER_NO = 1;

SELECT *
FROM FOLLOW;


SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 5
AND MEMBER_NO = 2


ROLLBACK;

SELECT * 
FROM REVIEW
WHERE MEMBER_NO = 2
ORDER BY REVIEW_NO DESC;

SELECT *
FROM REVIEW_IMAGE;

-- 널이 아닌 경우 1, 널인 경우 0
SELECT R.REVIEW_NO, RATING, REVIEW_TITLE, REVIEW_CONTENT, TO_CHAR(REVIEW_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
	CONTENT_ID,	FIRST_IMAGE, MEMBER_NO, PROFILE_IMAGE, MEMBER_NICKNAME, CONTENT_TYPE_ID 
FROM REVIEW R
LEFT JOIN "MEMBER" USING(MEMBER_NO)
LEFT JOIN REVIEW_IMAGE I ON (I.REVIEW_NO = R.REVIEW_NO)
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = 2
AND REVIEW_IMAGE_PATH IS NOT NULL
AND REVIEW_IMAGE_ORDER = 0
ORDER BY REVIEW_NO DESC;

SELECT R.REVIEW_NO, RATING, REVIEW_TITLE, REVIEW_CONTENT, TO_CHAR(REVIEW_DATE, 'YYYY"년" MM"월"') REVIEW_DATE, 
	CONTENT_ID,	FIRST_IMAGE, MEMBER_NO, PROFILE_IMAGE, MEMBER_NICKNAME, CONTENT_TYPE_ID 
FROM REVIEW R
LEFT JOIN "MEMBER" USING(MEMBER_NO)
LEFT JOIN REVIEW_IMAGE I ON (I.REVIEW_NO = R.REVIEW_NO)
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = 2
AND REVIEW_IMAGE_PATH IS NOT NULL
AND REVIEW_IMAGE_ORDER = 0
ORDER BY REVIEW_NO DESC;

SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NICKNAME, MEMBER_NAME, PROFILE_IMAGE, 
	SUBSTR(MEMBER_ADDRESS, 8, 6) MEMBER_ADDRESS, TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월"') ENROLL_DATE, 
(SELECT COUNT(*)
FROM REVIEW
WHERE REVIEW_FL = 'N'
AND MEMBER_NO = 2)
+
(SELECT COUNT(*)
FROM TRAVEL
WHERE PRIVATE_FL = 'N'
AND MEMBER_NO = 2)
+
(SELECT COUNT(*)
FROM QUESTION
WHERE BLIND_FL = 'N'
AND MEMBER_NO = 2) TOTAL_POSTING,
(SELECT COUNT(*)
FROM FOLLOW
WHERE MEMBER_NO = 2) TOTAL_FOLLOWER,
(SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 2) TOTAL_FOLLOWING
FROM MEMBER
WHERE MEMBER_NO = 2
AND SECESSION_FL = 'N'