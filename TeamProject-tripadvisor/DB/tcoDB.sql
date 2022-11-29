SELECT * FROM "MEMBER";

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
/*
BEGIN
	FOR I IN 1..10 LOOP
		INSERT INTO REVIEW
		VALUES(SEQ_REVIEW_NO.NEXTVAL,
		DEFAULT, SEQ_REVIEW_NO.CURRVAL || '번째 리뷰',
		SEQ_REVIEW_NO.CURRVAL || '번 리뷰 내용 입니다. 음식이 맛있고 음식이 맛없고 구경거리가 많고 구경거리가 적고',
		DEFAULT, 1, 12, NULL, DEFAULT
		);
	END LOOP;
END;
/

COMMIT;

*/

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
AND MEMBER_NO = 1)
+
(SELECT COUNT(*)
FROM TRAVEL
WHERE PRIVATE_FL = 'N'
AND MEMBER_NO = 1)
+
(SELECT COUNT(*)
FROM QUESTION
WHERE BLIND_FL = 'N'
AND MEMBER_NO = 1) TOTAL_POSTING,
(SELECT COUNT(*)
FROM FOLLOW
WHERE MEMBER_NO = 1) TOTAL_FOLLOWER,
(SELECT COUNT(*)
FROM FOLLOW
WHERE FOLLOW_MEMBER_NO = 1) TOTAL_FOLLOWING
FROM MEMBER
WHERE MEMBER_NO = 1

FROM sc

