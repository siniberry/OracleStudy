SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_SAWON;

--○ TBL_SAWON 테이블을 활용하여 
--   다음과 같은 항목들을 조회할 수 있도록 쿼리문을 구성한다.
--   사원번호, 사원명, 주민번호, 성별, 입사일
SELECT SANO"사원번호"
     , SANAME"사원명"
     , JUBUN"주민번호"
     , CASE WHEN 주민번호 7번째자리가 1개 '1' 또는 '3' THEN '남자'
            WHEN 주민번호 7번째자리가 1개 '2' 또는 '4' THEN '여자'
            ELSE '성별확인불가'
       END"성별"
     , HIREDATE"입사일"
FROM TBL_SAWON;

SELECT SANO"사원번호"
     , SANAME"사원명"
     , JUBUN"주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
            WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
            ELSE '성별확인불가'
       END"성별"
     , HIREDATE"입사일"
FROM TBL_SAWON;
--==>>
/*
1001	김민성	9707251234567	남자	2005-01-03
1002	서민지	9505152234567	여자	1999-11-23
1003	이지연	9905192234567	여자	2006-08-10
1004	이연주	9508162234567	여자	2007-10-10
1005	오이삭	9805161234567	남자	2007-10-10
1006	이현이	8005132234567	여자	1999-10-10
1007	박한이	0204053234567	남자	2010-10-10
1008	선동렬	6803171234567	남자	1998-10-10
1009	선우용녀	6912232234567	여자	1998-10-10
1010	선우선	0303044234567	여자	2010-10-10
1011	남주혁	0506073234567	남자	2012-10-10
1012	남궁민	0208073234567	남자	2012-10-10
1013	남진	6712121234567	남자	1998-10-10
1014	홍수민	0005044234567	여자	2015-10-10
1015	임소민	9711232234567	여자	2007-10-10
1016	이이경	0603194234567	여자	2015-01-20
*/


--○ TBL_SAWON 테이블을 활용하여
--   다음과 같은 항목들을 조회할 수 있도록 쿼리문을 구성한다.
--   『사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일
--   , 정년퇴직일, 근무일수, 남은일수, 급여, 보너스』
--    단, 현재 나이는 기본 한국나이 계산법에 따라 연산을 수행한다.
--    또한, 정년퇴직일은 해당 직원의 나이가 한국나이로 60세가 되는 해의
--    그 직원의 입사 월, 일로 연산을 수행한다.
--    그리고, 보너스는 1000일 이상 2000일 미만 근무한 사원은
--    그 사원의 원래 급여 기준 30% 지급, 2000일 이상 근무한 사원은
--    그 사원의 원래 급여 기준 50% 지급을 할 수 있도록 처리한다.

--ex) 1001 김민성 9707251234567 남성 26 2005-01-03 2056-01-03 212121 23232 30003 3000 4500

SELECT *
FROM TBL_SAWON;

SELECT SANO"사원번호"
     , SANAME"사원명"
     , JUBUN"주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
            WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
            ELSE '성별확인불가'
       END"성별"
     ,CASE WHEN SUBSTR(JUBUN, 1, 2)>50 
           THEN (EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2))-1900+1)
           WHEN SUBSTR(JUBUN, 1, 2)<50 
           THEN (EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2))-2000+1)
      END"나이"
     , HIREDATE"입사일"
     , CASE WHEN SUBSTR(JUBUN, 1, 2)>50 
            THEN HIREDATE + TO_YMINTERVAL(60 - (EXTRACT(YEAR FROM HIREDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2)) - 1900 + 1)|| '-00' )
            WHEN SUBSTR(JUBUN, 1, 2)<50 
            THEN HIREDATE + TO_YMINTERVAL(60 - (EXTRACT(YEAR FROM HIREDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2)) - 2000 + 1)|| '-00' )
       END"정년퇴직일"
     , TRUNC(SYSDATE-HIREDATE)"근무일수"
     ,  CASE WHEN SUBSTR(JUBUN, 1, 2)>50 
             THEN TRUNC(HIREDATE + TO_YMINTERVAL(60 - (EXTRACT(YEAR FROM HIREDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2)) - 1900 + 1)|| '-00' )-SYSDATE)
             WHEN SUBSTR(JUBUN, 1, 2)<50 
             THEN TRUNC(HIREDATE + TO_YMINTERVAL(60 - (EXTRACT(YEAR FROM HIREDATE) - TO_NUMBER(SUBSTR(JUBUN, 1, 2)) - 2000 + 1)|| '-00' )-SYSDATE)
        END"남은일수"
     , SAL "급여"
     , CASE WHEN (SYSDATE-HIREDATE)>=1000 OR (SYSDATE-HIREDATE)<2000 THEN SAL+(SAL*0.3)
            WHEN (SYSDATE-HIREDATE)>=2000  THEN SAL+(SAL*0.5)
        END "보너스"                      
FROM TBL_SAWON;


-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 급여  ... 먼저

SELECT SANO "사원번호", SANAME"사원명", JUBUN"주민번호"
     -- 성별
      , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
             WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
             ELSE '성별확인불가'
         END"성별"
     -- 현재나이 = 현재나이 - 태어난년도 + 1 (1900년대 / 2000년대)
      , CASE WHEN 주민번호 7번째자리 1개가 '1' 또는 '2' 
             THEN 현재년도 - (주민번호앞두자리 + 1899) 
             WHEN 주민번호 7번째자리 1개가 '3' 또는 '4' 
             THEN 현재년도 - (주민번호앞두자리 + 1999)
             ELSE -1
         END "현재나이"        
FROM TBL_SAWON;

SELECT SANO "사원번호", SANAME"사원명", JUBUN"주민번호"
     -- 성별
      , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
             WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
             ELSE '성별확인불가'
         END"성별"
     -- 현재나이 = 현재나이 - 태어난년도 + 1 (1900년대 / 2000년대)
      , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
             THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (주민번호앞두자리 + 1899) 
             WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
             THEN EXTRACT(YEAR FROM SYSDATE) - (주민번호앞두자리 + 1999)
             ELSE -1
         END "현재나이"
         
FROM TBL_SAWON;

SELECT SANO "사원번호", SANAME"사원명", JUBUN"주민번호"
     -- 성별
      , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
             WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
             ELSE '성별확인불가'
         END"성별"
     -- 현재나이 = 현재나이 - 태어난년도 + 1 (1900년대 / 2000년대)
      , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
             THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
             WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
             THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
             ELSE -1
         END "현재나이"
     -- 입사일
      , HIREDATE"입사일"
     -- 급여
      , SAL"급여"             
FROM TBL_SAWON;


SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0)"연봉"
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0)"연봉", 연봉*2"두배연봉"
FROM EMP;
--==>> 에러 발생
--     (ORA-00904: "연봉": invalid identifier)

SELECT T.EMPNO, T.ENAME, T.SAL, T.COMM, T.연봉, T.연봉*2"두배연봉"
FROM
(
        SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0)"연봉"
        FROM EMP
) T;

SELECT T.*
FROM
(
        SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0)"연봉"
        FROM EMP
) T;

-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일
-- , 정년퇴직일, 근무일수, 남은일수, 급여, 보너스

SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    -- 정년퇴직일
    -- 정년퇴직년도 → 해당 직원의 나이가 한국나이로 60세가 되는 해
    -- 현재 나이가...  57세...  3년 후     2022 → 2025
    -- 현재 나이가...  28세... 32년 후     2022 → 2054
    -- ADD_MONTHS(SYSDATE, 남은년수*12)
    --                     --------
    --                      60 - 현재나이
    -- ADD_MONTHS(SYSDATE, (60 - 현재나이) * 12) → 특정날짜
    -- TO_CHAR('특정날짜', 'YYYY')      → 정년퇴직 년도만 문자타입으로 추출
    -- TO_CHAR(입사일, 'MM-DD')         → 입사 월일만 문자타입으로 추출
    -- TO_CHAR('특정날짜', 'YYYY') || '-' || TO_CHAR(입사일, 'MM-DD') "정년퇴직일"
    -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - 현재나이) * 12), 'YYYY') || '-' || TO_CHAR(입사일, 'MM-DD') "정년퇴직일"
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
     
    -- 근무일수
    -- 근무일수 = 현재일 - 입사일
     , TRUNC(SYSDATE - T.입사일) "근무일수"
    
    -- 남은일수
    -- 남은일수 = 정년퇴직일 - 현재일
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    
    -- 급여
     , T.급여
     
    -- 보너스
    -- 근무일수가 1000일 이상 2000일 미만 → 원래 급여의 30% 지급
    -- 근무일수가 2000일 이상             → 원래 급여의 50% 지급
    -- 나머지                             → 0
    --------------------------------------------------------------
    -- 근무일수 2000일 이상               → T.급여 * 0.5
    -- 근무일수 1000일 이상               → T.급여 * 0.3
    -- 나머지                             → 0
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >=2000 THEN T.급여 * 0.5 
            WHEN TRUNC(SYSDATE - T.입사일) >=1000 THEN T.급여 * 0.3 
            ELSE 0
        END "보너스"  
FROM
(
    SELECT SANO "사원번호", SANAME"사원명", JUBUN"주민번호"
         -- 성별
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                 WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
                 ELSE '성별확인불가'
             END"성별"
         -- 현재나이 = 현재나이 - 태어난년도 + 1 (1900년대 / 2000년대)
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                 THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                 WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                 THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                 ELSE -1
             END "현재나이"
         -- 입사일
          , HIREDATE"입사일"
         -- 급여
          , SAL"급여"    
    FROM TBL_SAWON  -- ← 시은아~ 여기 세미콜론 없어야 해~
) T;                -- ← 세미콜론은 여기 맨 마지막에 하나~!!!
--==>>
/*
1001	김민성	    9707251234567	남자	26	2005-01-03	2056-01-03	6260	12366	3000	1500
1002	서민지	    9505152234567	여자	28	1999-11-23	2054-11-23	8128	11960	4000	2000
1003	이지연	    9905192234567	여자	24	2006-08-10	2058-08-10	5676	13316	3000	1500
1004	이연주	    9508162234567	여자	28	2007-10-10	2054-10-10	5250	11916	4000	2000
1005	오이삭	    9805161234567	남자	25	2007-10-10	2057-10-10	5250	13012	4000	2000
1006	이현이	    8005132234567	여자	43	1999-10-10	2039-10-10	8172	 6437	1000	 500
1007	박한이	    0204053234567	남자	21	2010-10-10	2061-10-10	4154	14473	1000	 500
1008	선동렬	    6803171234567	남자	55	1998-10-10	2027-10-10	8537	 2054	1500	 750
1009	선우용녀	6912232234567	여자	54	1998-10-10	2028-10-10	8537	 2420	1300	 650
1010	선우선	    0303044234567	여자	20	2010-10-10	2062-10-10	4154	14838	1600	 800
1011	남주혁	    0506073234567	남자	18	2012-10-10	2064-10-10	3423	15569	2600	1300
1012	남궁민	    0208073234567	남자	21	2012-10-10	2061-10-10	3423	14473	2600	1300
1013	남진	    6712121234567	남자	56	1998-10-10	2026-10-10	8537	 1689	2200	1100
1014	홍수민	    0005044234567	여자	23	2015-10-10	2059-10-10	2328	13742	5200	2600
1015	임소민	    9711232234567	여자	26	2007-10-10	2056-10-10	5250	12647	5500	2750
1016	이이경	    0603194234567	여자	17	2015-01-20	2065-01-20	2591	15671	1500	 750
*/


--○ TBL_SAWON 테이블에 추가 데이터 입력
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1017, '이호석', '9611121234567', SYSDATE, 5000);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 커밋실행
COMMIT;
--> 커밋 완료


SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
     , TRUNC(SYSDATE - T.입사일) "근무일수"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
     , T.급여
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >=2000 THEN T.급여 * 0.5 
            WHEN TRUNC(SYSDATE - T.입사일) >=1000 THEN T.급여 * 0.3 
            ELSE 0
        END "보너스"  
FROM
(
    SELECT SANO "사원번호", SANAME"사원명", JUBUN"주민번호"
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                 WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
                 ELSE '성별확인불가'
             END"성별"
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                 THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                 WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                 THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                 ELSE -1
             END "현재나이"
          , HIREDATE"입사일"
          , SAL"급여"    
    FROM TBL_SAWON 
) T; 
--==>>
/*
1017	이호석	    9611121234567	남자	27	2022-02-23	2055-02-23	0	12052	5000	0
1001	김민성	    9707251234567	남자	26	2005-01-03	2056-01-03	6260	12366	3000	1500
1002	서민지	    9505152234567	여자	28	1999-11-23	2054-11-23	8128	11960	4000	2000
1003	이지연	    9905192234567	여자	24	2006-08-10	2058-08-10	5676	13316	3000	1500
1004	이연주	    9508162234567	여자	28	2007-10-10	2054-10-10	5250	11916	4000	2000
1005	오이삭	    9805161234567	남자	25	2007-10-10	2057-10-10	5250	13012	4000	2000
1006	이현이	    8005132234567	여자	43	1999-10-10	2039-10-10	8172	6437	1000	500
1007	박한이	    0204053234567	남자	21	2010-10-10	2061-10-10	4154	14473	1000	500
1008	선동렬	    6803171234567	남자	55	1998-10-10	2027-10-10	8537	2054	1500	750
1009	선우용녀	6912232234567	여자	54	1998-10-10	2028-10-10	8537	2420	1300	650
1010	선우선	    0303044234567	여자	20	2010-10-10	2062-10-10	4154	14838	1600	800
1011	남주혁	    0506073234567	남자	18	2012-10-10	2064-10-10	3423	15569	2600	1300
1012	남궁민	    0208073234567	남자	21	2012-10-10	2061-10-10	3423	14473	2600	1300
1013	남진	    6712121234567	남자	56	1998-10-10	2026-10-10	8537	1689	2200	1100
1014	홍수민	    0005044234567	여자	23	2015-10-10	2059-10-10	2328	13742	5200	2600
1015	임소민	    9711232234567	여자	26	2007-10-10	2056-10-10	5250	12647	5500	2750
1016	이이경	    0603194234567	여자	17	2015-01-20	2065-01-20	2591	15671	1500	750
*/

-- 위에서 처리한 내용을 기반으로
-- 특정 근무일수의 사원을 확인해야 한다거나...
-- 특정 보너스 금액을 받는 사원을 확인해야 할 경우가 발생할 수 있다.
-- 이와 같은 경우... 해당 쿼리문을 다시 구성해야 하는 번거로움을 줄일 수 있도록
-- 뷰(VIEW)를 만들어 저장해 둘 수 있다.

CREATE TABLE TBL_TEST
( COL1 NUMBER
, COL2 VARCHAR2(30)
);
--> 만드는 것과 같이 VIEW 완성

CREATE TABLE TBL_SAWON --> 기존에 있는 테이블 명으로 덮어쓰면 문제가 생겨,오라클이 에러를 띄우게 되어 있음
( COL1 NUMBER
);

CREATE OR REPLACE VIEW VIEW_SAWON --> 기존 뷰가 있더라도 내가 새롭게 구성한 뷰로 덮어쓰기 된다.
AS
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
     , TRUNC(SYSDATE - T.입사일) "근무일수"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이) * 12), 'YYYY') || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
     , T.급여
     , CASE WHEN TRUNC(SYSDATE - T.입사일) >=2000 THEN T.급여 * 0.5 
            WHEN TRUNC(SYSDATE - T.입사일) >=1000 THEN T.급여 * 0.3 
            ELSE 0
        END "보너스"  
FROM
(
    SELECT SANO "사원번호", SANAME"사원명", JUBUN"주민번호"
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                 WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
                 ELSE '성별확인불가'
             END"성별"
          , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                 THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                 WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                 THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                 ELSE -1
             END "현재나이"
          , HIREDATE"입사일"
          , SAL"급여"    
    FROM TBL_SAWON 
) T;
--==>> 에러발생 → 권한 부족


--○ SYS로 부터 CREATE VIEW 권한을 부여받은 이후 다시 실행
--==>> View VIEW_SAWON이(가) 생성되었습니다.

SELECT *
FROM VIEW_SAWON;

SELECT *
FROM VIEW_SAWON
WHERE 근무일수 >= 6000;

SELECT *
FROM VIEW_SAWON
WHERE 남은일수 >= 1000;

SELECT *
FROM VIEW_SAWON
WHERE 보너스 >= 2000;

--○ TBL_SAWON 테이블에 추가 데이터 입력
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1018, '신시은', '9910312234567', SYSDATE, 5000);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM VIEW_SAWON;
--==>>
/*
1017	이호석	    9611121234567	남자	27	2022-02-23	2055-02-23	   0	12052	5000	   0    ← CHECK~!!!
1018	신시은	    9910312234567	여자	24	2022-02-23	2058-02-23	   0	13148	5000	   0    ← CHECK~!!!
1001	김민성	    9707251234567	남자	26	2005-01-03	2056-01-03	6260	12366	3000	1500
1002	서민지	    9505152234567	여자	28	1999-11-23	2054-11-23	8128	11960	4000	2000
1003	이지연	    9905192234567	여자	24	2006-08-10	2058-08-10	5676	13316	3000	1500
1004	이연주	    9508162234567	여자	28	2007-10-10	2054-10-10	5250	11916	4000	2000
1005	오이삭	    9805161234567	남자	25	2007-10-10	2057-10-10	5250	13012	4000	2000
1006	이현이	    8005132234567	여자	43	1999-10-10	2039-10-10	8172	6437	1000	500
1007	박한이	    0204053234567	남자	21	2010-10-10	2061-10-10	4154	14473	1000	500
1008	선동렬	    6803171234567	남자	55	1998-10-10	2027-10-10	8537	2054	1500	750
1009	선우용녀	6912232234567	여자	54	1998-10-10	2028-10-10	8537	2420	1300	650
1010	선우선	    0303044234567	여자	20	2010-10-10	2062-10-10	4154	14838	1600	800
1011	남주혁	    0506073234567	남자	18	2012-10-10	2064-10-10	3423	15569	2600	1300
1012	남궁민	    0208073234567	남자	21	2012-10-10	2061-10-10	3423	14473	2600	1300
1013	남진	    6712121234567	남자	56	1998-10-10	2026-10-10	8537	1689	2200	1100
1014	홍수민	    0005044234567	여자	23	2015-10-10	2059-10-10	2328	13742	5200	2600
1015	임소민	    9711232234567	여자	26	2007-10-10	2056-10-10	5250	12647	5500	2750
1016	이이경	    0603194234567	여자	17	2015-01-20	2065-01-20	2591	15671	1500	750
*/



-○ 서브쿼리를 활용하여
--  TBL_SAWON 테이블을 다음과 같이 조회할 수 있도록 한다.
/*
--------------------------------------------
사원명  성별  현재나이  급여  나이보너스
--------------------------------------------

단, 나이 보너스는 현재 나이가 50세 이상이면 급여의 70%
    40세 이상 50세 미만이면 급여의 50%
    20세 이상 40세 미만이면 급여의 30%
    
또한, 완선된 조회 구문을 통해
VIEW_SAWON2 라는 이름의 뷰(VIEW) 를 생성한다.
*/

SELECT *
FROM TBL_SAWON;

SELECT T.사원명, T.성별, T.현재나이, T.급여
     , CASE WHEN T.현재나이>=50 THEN T.급여 * 0.7
            WHEN T.현재나이>=40 THEN T.급여 * 0.5
            WHEN T.현재나이>=20 THEN T.급여 * 0.3
            ELSE 0
        END"나이보너스"
FROM
(
    SELECT SANAME"사원명"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                 WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
                 ELSE '성별확인불가'
             END"성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
            END "현재나이"
         , SAL"급여"
    FROM TBL_SAWON
)T;
--==>> 
/*
이호석	    남자	27	5000	1500
신시은	    여자	24	5000	1500
김민성	    남자	26	3000	 900
서민지	    여자	28	4000	1200
이지연	    여자	24	3000	 900
이연주	    여자	28	4000	1200
오이삭	    남자	25	4000	1200
이현이	    여자	43	1000	 500
박한이	    남자	21	1000	 300
선동렬	    남자	55	1500	1050
선우용녀	여자	54	1300	 910
선우선	    여자	20	1600	 480
남주혁	    남자	18	2600	   0
남궁민	    남자	21	2600	 780
남진	    남자	56	2200	1540
홍수민	    여자	23	5200	1560
임소민	    여자	26	5500	1650
이이경	    여자	17	1500	   0
*/


CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.사원명, T.성별, T.현재나이, T.급여
     , CASE WHEN T.현재나이>=50 THEN T.급여 * 0.7
            WHEN T.현재나이>=40 THEN T.급여 * 0.5
            WHEN T.현재나이>=20 THEN T.급여 * 0.3
            ELSE 0
        END"나이보너스"
FROM
(
    SELECT SANAME"사원명"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                 WHEN SUBSTR(JUBUN, 7, 1) IN('2', '4') THEN '여자'
                 ELSE '성별확인불가'
             END"성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899) 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE -1
            END "현재나이"
         , SAL"급여"
    FROM TBL_SAWON
)T;
--==>> View VIEW_SAWON2이(가) 생성되었습니다.

SELECT *
FROM VIEW_SAWON2;



--------------------------------------------------------------------------------

--○ RANK() → 등수(순위)를 반환하는 함수

SELECT EMPNO "사원번호", ENAME"사원명", DEPTNO"부서번호", SAL"급여"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP;
--==>> 
/*
7839	KING	10	5000	1
7902	FORD	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	4
7698	BLAKE	30	2850	5
7782	CLARK	10	2450	6
7499	ALLEN	30	1600	7
7844	TURNER	30	1500	8
7934	MILLER	10	1300	9
7521	WARD	30	1250	10
7654	MARTIN	30	1250	10
7876	ADAMS	20	1100	12
7900	JAMES	30	 950	13
7369	SMITH	20	 800	14
*/

SELECT EMPNO "사원번호", ENAME"사원명", DEPTNO"부서번호", SAL"급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC)"부서별급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1	1
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7698	BLAKE	30	2850	1	5
7782	CLARK	10	2450	2	6
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7934	MILLER	10	1300	3	9
7521	WARD	30	1250	4	10
7654	MARTIN	30	1250	4	10
7876	ADAMS	20	1100	4	12
7900	JAMES	30	950	6	13
7369	SMITH	20	800	5	14
*/

SELECT EMPNO "사원번호", ENAME"사원명", DEPTNO"부서번호", SAL"급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC)"부서별급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP;
--==>>
/*
7839	KING	1	10	5000	1
7902	FORD	1	20	3000	2
7788	SCOTT	1	20	3000	2
7566	JONES	3	20	2975	4
7698	BLAKE	1	30	2850	5
7782	CLARK	2	10	2450	6
7499	ALLEN	2	30	1600	7
7844	TURNER	3	30	1500	8
7934	MILLER	3	10	1300	9
7521	WARD	4	30	1250	10
7654	MARTIN	4	30	1250	10
7876	ADAMS	4	20	1100	12
7900	JAMES	6	30	950	13
*/


--○ DENSE_RANK() → 서열을 반환하는 함수

SELECT EMPNO "사원번호", ENAME"사원명", DEPTNO"부서번호", SAL"급여"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC)"부서별급여순위"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "전체급여순위"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1	1
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	2	3
7698	BLAKE	30	2850	1	4
7782	CLARK	10	2450	2	5
7499	ALLEN	30	1600	2	6
7844	TURNER	30	1500	3	7
7934	MILLER	10	1300	3	8
7521	WARD	30	1250	4	9
7654	MARTIN	30	1250	4	9
7876	ADAMS	20	1100	3	10
7900	JAMES	30	950	5	11
7369	SMITH	20	800	4	12
*/

--○ EMP 테이블의 사원 데이터를
--   사원명, 부서번호, 연봉, 부서내연봉순위, 전체연봉순위 항목으로 조회한다.
--   단, 여기에서 연봉은 앞서 구성했던 연봉의 정책과 동일하다. 

SELECT ENAME"사원명", DEPTNO"부서번호",SAL*12+NVL(COMM, 0)"연봉"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM, 0)) DESC)"부서내연봉순위"
     , DENSE_RANK() OVER(ORDER BY (SAL*12+NVL(COMM, 0)) DESC) "전체연봉순위"
FROM EMP;
--==>>
/*
KING	10	60000	1	1
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	2	3
BLAKE	30	34200	1	4
CLARK	10	29400	2	5
ALLEN	30	19500	2	6
TURNER	30	18000	3	7
MARTIN	30	16400	4	8
MILLER	10	15600	3	9
WARD	30	15500	5	10
ADAMS	20	13200	3	11
JAMES	30	11400	6	12
SMITH	20	9600	4	13
*/

SELECT T.*
     , DENSE_RANK() OVER(PARTITION BY T.부서번호 ORDER BY T.연봉 DESC)"부서내연봉순위"
     , DENSE_RANK() OVER(ORDER BY T.연봉 DESC) "전체연봉순위"
FROM
(
SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM, 0)"연봉"
FROM EMP
)T;
--==>>
/*
KING	10	60000	1	1
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	2	3
BLAKE	30	34200	1	4
CLARK	10	29400	2	5
ALLEN	30	19500	2	6
TURNER	30	18000	3	7
MARTIN	30	16400	4	8
MILLER	10	15600	3	9
WARD	30	15500	5	10
ADAMS	20	13200	3	11
JAMES	30	11400	6	12
SMITH	20	9600	4	13
*/


--○ EMP 테이블에서 전체 연봉 등수(순위)가 1등부터 5등까지만...
--   사원명, 부서번호, 연봉, 전체연봉순위 항목으로 조회한다.
SELECT 사원명, 부서번호, 연봉, 전체연봉순위
FROM EMP
WHERE 전체 연봉 등수(순위)가 1등부터 5등;

SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM, 0)"연봉"
     , RANK() OVER(ORDER BY (연봉) DESC)"전체연봉순위"
FROM EMP
WHERE 전체 연봉 등수(순위)가 1등부터 5등;

SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM, 0)"연봉"
     , RANK() OVER(ORDER BY (SAL*12+NVL(COMM, 0)) DESC)"전체연봉순위"
FROM EMP
WHERE  RANK() OVER(ORDER BY (SAL*12+NVL(COMM, 0)) DESC) <= 5 ;
--==>> 에러발생
--     (ORA-30483: window  functions are not allowed here)

--※ 위의 내용은 RANK() OVER() 와 같은 분석 함수를 WHERE 절에서 사용한 경우이며...
--   이 함수는 WHERE 조건절에서 사용할 수 없기 때문에 발생하는 에러이다.
--   이 경우, 우리는 INLINE VIEW 를 활용해서 풀이해야 한다.

SELECT T.*
FROM
(
    SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM, 0)"연봉"
         , RANK() OVER(ORDER BY (SAL*12+NVL(COMM, 0)) DESC)"전체연봉순위"
    FROM EMP
)T
WHERE T.전체연봉순위 <= 5;
--==>>
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/

--○ EMP 테이블에서 각 부서별 연봉등수가 1등에서부터 2등까지만 조회한다.
--   사원명, 부서번호, 연봉, 부서내연봉등수, 전체연봉등수
--   항목을 조회할 수 있도록 쿼리문을 구성한다.
SELECT T.*
FROM
(
    SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM, 0)"연봉"
             , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM, 0)) DESC)"부서내연봉등수"
             , DENSE_RANK() OVER(ORDER BY (SAL*12+NVL(COMM, 0)) DESC)"전체연봉등수"
    FROM EMP
)T
   
WHERE T. 부서내연봉등수<=2;

--------------------------------------------------------------------------------

--■■■ 그룹 함수 ■■■--

-- SUM() 합, AVG() 평균, COUNT() 카운트, MAX() 최대값, MIN() 최소값
--  , VERIENCE() 분산, STDDEV() 표준편차

--※ 그룹 함수의 가장 큰 특징
--   처리해야 할 데이터들 중 NULL 이 존재한다면(포함되어 있다면)
--   이 NULL 은 제외한 상태로 연산을 수행한다는 것이다.
--   즉, 그룹 함수가 작동하는 과정에서 NULL 은 연산의 대상에서 제외한다.

--○ SUM() 합
-- EMP 테이블을 대상으로 전체 사원들의 급여 총합을 조회한다.

SELECT SAL
FROM EMP;
--==>>
/*
800
1600
1250
2975
1250
2850
2450
3000
5000
1500
1100
950
3000
1300
*/

SELECT SUM(SAL)
FROM EMP;
--==>> 29025

SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> 에러 발생
--    (ORA-00937: not a single-group group function)

SELECT SUM(SAL) -- 800 + 1600 + 1250 + ... + 1300
FROM EMP;
--==>> 29025

SELECT COMM
FROM EMP;
--==>>
/*
(null)
300
500
(null)
1400
(null)
(null)
(null)
(null)
0
(null)
(null)
(null)
(null)
*/

SELECT SUM(COMM)    -- (null) + 300 + 500 + (null) + ... + (null) 
FROM EMP;
--==>> 2200

--○ COUNT() 행(레코드)의 갯수 조회 → 데이터가 몇 건인지 확인...
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)      -- COMM 컬럼 행의 갯수 조회 → NULL 은 제외~!!!
FROM EMP;
--==>> 4

SELECT COUNT(*)
FROM EMP;
--==>> 14


--○ AVG() 평균 반환
SELECT SUM(SAL) / COUNT(SAL)"RESULT1"       -- 2073.214285714285714285714285714285714286
     , AVG(SAL) "RESULT"                    -- 2073.214285714285714285714285714285714286
FROM EMP;

SELECT SUM(COMM) / COUNT(COMM) "RESULT"     -- 550
     , AVG(COMM)"RESULT"                    -- 550
FROM EMP;

SELECT SUM(COMM) / COUNT(*) "RESULT"
FROM EMP;
--==>> 157.142857142857142857142857142857142857

--※ 데이터가 NULL인 컬럼의 레코드는 연산 대상에서 제외되기 때문에
--   주의하여 연산 처리해야 한다.


--○ VARIANCE(), STDDEV()
--   ※ 표준편차의 제곱이 분산, 분산의 제곱근이 표준편차

SELECT VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637	
1182.503223516271699458653359613061928508
*/

SELECT POWER(STDDEV(SAL), 2)"RESULT1"
     , VARIANCE(SAL)"RESULT2"
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL))"RESULT1"
     ,  STDDEV(SAL)"RESULT2"
FROM EMP;
--==>>
/*
1182.503223516271699458653359613061928508	
1182.503223516271699458653359613061928508
*/


--○ MAX() / MIN()
--   최대값  최소값
SELECT MAX(SAL)"RESULT1"
     , MIN(SAL)"RESULT2"
FROM EMP;
--==>> 5000 800


--※ 주의
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> 에러 발생
--     (ORA-00937: not a single-group group function)

SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> 에러 발생
--     (ORA-00937: not a single-group group function)

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>
/*
30	 9400
20	10875
10	 8750
*/

SELECT DEPTNO, SAL
FROM EMP
ORDER BY 1;
--==>>
/*
10	2450 ┓
10	5000 ┃ 8750
10	1300 ┛
20	2975 ┓
20	3000 ┃
20	1100 ┃ 10875
20	 800 ┃ 
20	3000 ┛
30	1250 ┓
30	1500 ┃
30	1600 ┃  9400
30	 950 ┃
30	2850 ┃
30	1250 ┛
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO 
ORDER BY 1;
--==>>
/*
10	 8750
20	10875
30	 9400
*/