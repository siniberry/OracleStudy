SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 실습 테이블 생성
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR(30)
, TEL   VARCHAR(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.

--○ 샘플데이터 입력
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1, '홍길동', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT *
FROM TBL_MEMBER;
--==>> 1	홍길동	010-1111-1111


--○ 커밋
COMMIT;
--==>> 커밋 완료.
