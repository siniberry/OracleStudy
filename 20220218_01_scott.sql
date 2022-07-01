--○ EMP 테이블에서 부서번호가 20번과 30번 직원들의 데이터들 중
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.
--   단, 별칭(ALIAS)을 사용한다.
/*
EMP 테이블에서                            →   FROM EMP
부서번호가 20번과 30번                    →   조건
사원번호, 사원명, 직종명, 급여, 부서번호  → SELECT 컬럼명
*/

SELECT EMPNO AS "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE DEPTNO=20 OR DEPTNO=30;
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST	    3000	20
*/

--※ 위의 구문은 IN 연산자를 활용하여
--   다음과 같이 처리할 수 있으며
--   위 구문의 처리결과와 같은 결과를 반환한다.
SELECT EMPNO AS "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE DEPTNO IN(20, 30);
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	    2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950	    30
7902	FORD	ANALYST	    3000	20
*/

--○ EMP 테이블에서 직종이 CLERK 인 사원들의 데이터를 모두 조회한다.
SELECT *
FROM EMP
WHERE JOB="CLERK";
--==>> 에러 발생
--     (ORA-00904: "CLERK": invalid identifier)

SELECT *
FROM EMP
WHERE JOB='CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 12:00:00	800		20
7876	ADAMS	CLERK	7788	1987-07-13 12:00:00	1100		20
7900	JAMES	CLERK	7698	1981-12-03 12:00:00	950		30
7934	MILLER	CLERK	7782	1982-01-23 12:00:00	1300		10
*/

select *
from emp
where job='CLERK';
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17 12:00:00	800		20
7876	ADAMS	CLERK	7788	1987-07-13 12:00:00	1100	20
7900	JAMES	CLERK	7698	1981-12-03 12:00:00	950		30
7934	MILLER	CLERK	7782	1982-01-23 12:00:00	1300	10
*/

--※ 오라클에서.. 입력된 데이터의 값 만큼은...
--   반.드.시. 대소문자 구분을 한다.★★


--○ EMP 테이블에서 직종이 CLERK 인 사원들 중
--   20번 부서에 근무하는 사원들의
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.
SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
FROM EMP
WHERE 직종이 CLERK  부서번호 20;

SELECT EMPNO "사원번호", ENAME"사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE 직종이 CLERK  부서번호 20;

SELECT EMPNO "사원번호", ENAME"사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP
WHERE (JOB='CLERK' AND DEPTNO=20);
--==>>
/*
7369	SMITH	CLERK	800	    20
7876	ADAMS	CLERK	1100	20
*/


--○ EMP 테이블 구조와 데이터를 확인하여
--   이와 똑같은 데이터가 들어있는 테이블의 구조를 생성한다. (TBL_EMP)

DESCRIBE EMP;
DESC EMP;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
*/
/*
CREATE TABLE TBL_EMP
( EMPNO     NUMBER(4)
, ENAME     VARCHAR2(10)
, JOB       VARCHAR2(9)
, MGR       NUMBER(4)    
, HIREDATE  DATE    
, SAL       NUMBER(7,2)  
, COMM      NUMBER(7,2)  
, DEPTNO    NUMBER(2)
);

SELECT *
FROM EMP;

INSERT INTO...* 14
*/

CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==> Table TBL_EMP이(가) 생성되었습니다.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;


--○ 테이블 복사(DEPT → TBL_DEPT)
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT이(가) 생성되었습니다.

--○ 복사한 테이블 확인
SELECT *
FROM TBL_DEPT;

DESC TBL_DEPT;

--○ 테이블의 커멘트 정보 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
DEPT	        TABLE	
EMP	            TABLE	
BONUS	        TABLE	
SALGRADE	    TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
TBL_DEPT	    TABLE	
TBL_EMP	        TABLE	
*/

--○ 테이블 레벨의 커멘트 정보 입력
COMMENT ON TABLE TBL_EMP IS '사원 정보';
--==>> Comment이(가) 생성되었습니다.

--○ 커멘트 정보 입력 후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE	사원 정보
TBL_DEPT	    TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--○ TBL_DEPT 테이블을 대상으로 테이블 레벨의 커멘트 데이터 입력
--   → 부서 정보

--==>> Comment이(가) 생성되었습니다.

--○ 커멘트 데이터 입력 후 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP	        TABLE	사원 정보 ★ COMMENTS 주석 채워넣어서 일의 효율성 높이기
TBL_DEPT	    TABLE	부서 정보
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--○ 컬럼 레벨의 커멘트 데이터 확인
SELECT *
FROM USER_COL_COMMENTS;
--==>>
/*
TBL_EXAMPLE2	NO	
DEPT	        DNAME	
BONUS	        SAL	
BONUS	        COMM	
SALGRADE	    LOSAL	
TBL_EMP	        COMM	
EMP	EMPNO	
BONUS	ENAME	
TBL_EXAMPLE2	NAME	
EMP	ENAME	
EMP	SAL	
TBL_EMP	MGR	
TBL_EMP	EMPNO	
EMP	DEPTNO	
TBL_EMP	DEPTNO	
TBL_DEPT	DEPTNO	
TBL_EMP	JOB	
TBL_EMP	ENAME	
BONUS	JOB	
SALGRADE	GRADE	
TBL_EXAMPLE1	ADDR	
TBL_EXAMPLE2	ADDR	
TBL_EMP	SAL	
DEPT	LOC	
TBL_EMP	HIREDATE	
TBL_DEPT	LOC	
DEPT	DEPTNO	
EMP	HIREDATE	
EMP	JOB	
TBL_EXAMPLE1	NAME	
SALGRADE	HISAL	
EMP	COMM	
TBL_EXAMPLE1	NO	
TBL_DEPT	DNAME	
EMP	MGR	
*/

--○ 컬럼 레벨의 커멘트 데이터 확인(TBL_DEPT 테이블 소속의 컬럼들만 확인)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';        -- 조건 추가
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

-- Arrays.num : .은 안에 소속되어 있는~ 이라는 뜻

--○ 테이블에 소속된(포함된) 칼럼에 대한 커멘트 데이터 설정
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '부서 번호';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_DEPT.DNAME IS '부서명';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_DEPT.LOC IS '부서 위치';
--==>> Comment이(가) 생성되었습니다.


--○ 커멘트 데이터가 입력된 테이블의 컬럼 레벨 커멘트 데이터 확인
--   (TBL_DEPT 테이블 소속의 컬럼들만 조회)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	부서 번호
TBL_DEPT	DNAME	부서명
TBL_DEPT	LOC	    부서 위치
*/

-- ★ 테이블의 이름이나 컬럼명에 한글X, 영문을 사용하기.
--    못 쓰는 것은 아니나, 에러발생 가능성이 있음.

--○ TBL_EMP 테이블을 대상으로
--   테이블에 소속된(포함된) 컬럼에 대한 커멘트 데이터 설정
DESC TBL_EMP;

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	
TBL_EMP	ENAME	
TBL_EMP	JOB	
TBL_EMP	MGR	
TBL_EMP	HIREDATE	
TBL_EMP	SAL	
TBL_EMP	COMM	
TBL_EMP	DEPTNO	
*/

COMMENT ON COLUMN TBL_EMP.EMPNO IS '사원 번호';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_EMP.ENAME IS '사원명';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_EMP.JOB IS '직종명';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_EMP.MGR IS '관리자 사원번호';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_EMP.HIREDATE IS '입사일';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_EMP.SAL IS '급여';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_EMP.COMM IS '수당';
--==>> Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_EMP.DEPTNO IS '부서 번호';
--==>> Comment이(가) 생성되었습니다.

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	    사원 번호
TBL_EMP	ENAME	    사원명
TBL_EMP	JOB	        직종명
TBL_EMP	MGR	        관리자 사원번호
TBL_EMP	HIREDATE	입사일
TBL_EMP	SAL	        급여
TBL_EMP	COMM	    수당
TBL_EMP	DEPTNO	    부서 번호	
*/


--■■■ 컬럼 구조의 추가 및 제거 ■■■--

SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17 12:00:00	800		20
7499	ALLEN	SALESMAN	7698	1981-02-20 12:00:00	1600	300	    30
7521	WARD	SALESMAN	7698	1981-02-22 12:00:00	1250	500	    30
7566	JONES	MANAGER	    7839	1981-04-02 12:00:00	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28 12:00:00	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01 12:00:00	2850		    30
7782	CLARK	MANAGER	    7839	1981-06-09 12:00:00	2450		    10
7788	SCOTT	ANALYST	    7566	1987-07-13 12:00:00	3000		    20
7839	KING	PRESIDENT		    1981-11-17 12:00:00	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08 12:00:00	1500	0	    30
7876	ADAMS	CLERK	    7788	1987-07-13 12:00:00	1100		    20
7900	JAMES	CLERK	    7698	1981-12-03 12:00:00	950		        30
7902	FORD	ANALYST	    7566	1981-12-03 12:00:00	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23 12:00:00	1300		    10
*/
    

--○ TBL_EMP 테이블에 주민등록번호 "데이터"를 담을 수 있는 컬럼 "추가" 
--   → SSN      문자열     CHAR(13)
--   → EMP 테이블이 8층이 있다면, 1층을 늘려 9층을 만드므로 
--   → ALTER
/* cf.----------------------------------------------------------------------
(맨앞에 숫자 0이 들어가는 것은 문자열 처리★ 숫자처리X)
01012341234 → 1012341234 (위험성 발생)
CHAR(13)     : 고정형(안에 내용물이 얼마이던간에 13 크기)
VARCHAR2(13) : 가변형(안에 내용물이 13을 넘어갈 수 없지만, 10-8-9 다양함. 
               그래서 안에 들어온 데이터를 헤더에서 모니터링해야함.
               그래서 CHAR보다 VARCHAR의 헤더가 더 큼.
               그렇기 때문에 둘다 똑같이 13이 들어간다면
               VARCHAR 보다 CHAR이 바람직함.
---------------------------------------------------------------------------*/
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP이(가) 변경되었습니다.

SELECT 01012341234
FROM DUAL;
--==>> 1012341234

SELECT '01012341234'
FROM DUAL;
--==>> 01012341234

--○ 확인
SELECT *
FROM TBL_EMP;

SELECT EMPNO, SSN
FROM TBL_EMP;

DESC TBL_EMP;


SELECT EMPNO, ENAME, SSN, JOB
FROM TBL_EMP;

--> SSN(주민등록번호) 컬럼이 정상적으로 포함(추가)된 사항을 확인

--※ 테이블 내에서 컬럼의 순서는 구조적으로 의미가 없음.
--   데이터 조회할 때 내가 원하는대로 골라서 조회할 수 있기 때문.

--○ TBL_EMP 테이블에 추가한 SSN(주민등록번호) 컬럼 구조적으로 제거 (ALTER O, DROP X)
ALTER TABLE TBL_EMP
DROP COLUMN SSN;    -- 없앨거니까 구태여 데이터 언급X
--==>> Table TBL_EMP이(가) 변경되었습니다.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(주민등록번호) 컬럼이 정상적으로 삭제되었음을 확인.

--DELETE -- 데이터 제거할 때 사용
DELETE TBL_EMP;
--==>> 14개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--> 에러 발생 안함
--  데이터 없음.
--  테이블의 구조(뼈대, 틀)는 그대로 남아있는 상태에서
--  데이터만 모두 소실(삭제)된 상황임을 확인.

DESC TBL_EMP;

DROP TABLE TBL_EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--==>>  에러 발생
--      (ORA-00942: table or view does not exist)

DESC TBL_EMP;
--==>>  에러 발생
--      (ORA-04043: TBL_EMP 객체가 존재하지 않습니다.)


--○ 테이블 다시 복사(생성)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.




--○ NULL 의 처리

SELECT 2, 10+2, 10-2, 10/2
FROM DUAL;
--==>> 2	12	8	5

SELECT NULL, NULL+2, 10-NULL, NULL*2, 2/NULL
FROM DUAL;
--==>> (null) (null) (null) (null) (null)

--※ 관찰의 결과
--   NULL 은 상태의 값을 의미하며, 물리적으로는 실제 존재하지 않는 값이기 때문에
--   이 NULL 이 연산에 포함될 경우...
--   그 결과는 무조건 NULL 이다.

--○ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL 인 직원의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.

SELECT *
FROM TBL_EMP;

SELECT 사원명, 직종명, 급여, 커미션
FROM TBL_EMP
WHERE 커미션이 NULL;

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM=NULL;
--==>>  에러 발생하지 않음
--      조회 결과 없음

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM='NULL';
--==>>  에러 발생
--      (ORA-01722: invalid number) -- 보통 숫자 들어가는데 왜 문자를 찾고 있니?

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM=(NULL);
--==>>  에러 발생하지 않음
--      조회 결과 없음

-- NULL 은 물리적으로 존재하지 않기 때문에 산술연산이 불가능함
-- 따라서 논리적으로 표현해야 함.

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL;
--==>>
/*
SMITH	CLERK	    800	    (null)
JONES	MANAGER 	2975    (null)
BLAKE	MANAGER	    2850	(null)
CLARK	MANAGER	    2450	(null)
SCOTT	ANALYST	    3000	(null)
KING	PRESIDENT	5000	(null)
ADAMS	CLERK	    1100	(null)
JAMES	CLERK	    950	    (null)
FORD	ANALYST	    3000	(null)
MILLER	CLERK	    1300	(null)
*/

--※ NULL 은 실제 존재하는 값이 아니기 때문에
--   일반적인 연산자를 활용하여 비교할 수 없다.
--   NULL 을 대상으로 사용할 수 없는 연산자들...
--   >=, <=, =, >, <, !=, ^=, <>
--                    !=, ^=, <> : 같지 않다


--○ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 직원들의
--   사원명, 직종명, 부서번호 항목을 조회한다.
SELECT 사원명, 직종명, 부서번호
FROM TBL_EMP
WHERE 20번 부서에 근무하지 않는;

SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"
FROM TBL_EMP
WHERE 20번 부서에 근무하지 않는;

SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"
FROM TBL_EMP
WHERE DEPNO가 20이 아니다;

SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"
FROM TBL_EMP
WHERE DEPTNO <> 20;
-- WHERE DEPTNO != 20;
-- WHERE DEPTNO ^= 20;
--> 결과값 모두 동일 (같지 않다)
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/


--○ TBL_EMP 테이블에서 커미션이 NULL 이 아닌 직원들의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.

SELECT 사원명, 직종명, 급여, 커미션
FROM TBL_EMP
WHERE 커미션이 NULL 이 아닌;

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM 이 NULL 이 아닌;

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
-- WHERE COMM != NULL;
-- WHERE COMM ^= NULL;
-- WHERE COMM <> NULL;

/*----------------------방법 ①---------------------------------
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM IS NOT NULL;     -- NOT
----------------------------------------------------------------*/

------------------------방법 ②-------------------------------------
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/


--○ TBL_EMP 테이블에서 모든 사원들의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--   단, 급여(SAL)은 매월 지급한다.
--   또한, 수당(COMM)은 연 1회 지급하며(매년 지급), 연봉 내역에 포함된다.
SELECT 사원번호, 사원명, 급여, 커미션, 연봉
FROM TBL_EMP;

-------CF. 모든 사원이기 때문에 조건절은 없다.---------------

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
       , SAL*12 "연봉"
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
       , SAL*12 + COMM "연봉"
FROM TBL_EMP;

/*------cf. 첫 번째로 본 오라클 함수----------
SYSDATE 괄호를 쓰지 않아서 함수처럼 보이지 않지만,
SYSDATE는 함수이다. **220217 파일 참조**
----------------------------------------------*/

--○ NVL()
SELECT NULL "COL1", NVL(NULL, 10)"COL2", NVL(5, 10)"COL3"
FROM DUAL;
--==>> (null)   10	    5
-- 첫 번째 파라미터 값이 NULL 이면, 두 번째 파라미터 값을 반환한다.
-- 첫 번째 파라미터 값이 NULL 이 아니면, 그 값을 그대로 반환한다.

SELECT ENAME "사원명", COMM "수당"
FROM TBL_EMP;

SELECT ENAME "사원명", NVL(COMM, 1234)"수당"  -- 수당이 NULL인 직원들은 100으로 지정
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
       , SAL * 12 + NVL(COMM, 0) "연봉"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800		9600
7499	ALLEN	1600	300	19500
7521	WARD	1250	500	15500
7566	JONES	2975		35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		34200
7782	CLARK	2450		29400
7788	SCOTT	3000		36000
7839	KING	5000		60000
7844	TURNER	1500	0	18000
7876	ADAMS	1100		13200
7900	JAMES	950		11400
7902	FORD	3000		36000
7934	MILLER	1300		15600
*/

--○ NVL2()
--> 첫 번째 파라미터 값이 NULL 이 아닌 경우, 두 번째 파라미터 값을 반환하고
--  첫 번째 파라미터 값이 NULL 인 경우, 세 번째 파라미터 값을 반환한다.

SELECT ENAME "사원명", NVL2(COMM, '청기올려', '백기올려') "수당확인"
FROM TBL_EMP;                   --  NULLX          NULL
--==>>
/*
SMITH	백기올려
ALLEN	청기올려
WARD	청기올려
JONES	백기올려
MARTIN	청기올려
BLAKE	백기올려
CLARK	백기올려
SCOTT	백기올려
KING	백기올려
TURNER	청기올려
ADAMS	백기올려
JAMES	백기올려
FORD	백기올려
MILLER	백기올려
*/

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
       , SAL * 12 + NVL2(COMM, COMM, 0) "연봉"
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
       , SAL * 12 + NVL2(COMM, SAL*12+COMM, SAL*12) "연봉"
FROM TBL_EMP;


--○ COLAESCE()
--> 매개변수 제한이 없는 형태로 인지하고 활용한다.
--  맨 앞에 있는 매개변수부터 차례로 NULL 인지 아닌지 확인하여
--  NULL 이 아닐 경우 반환하고
--  NULL인 경우에는 그 다음 매개변수의 값을 반환한다.
--  NVL() 이나 NVL2()와 비교하여
--  모~~든 경우의 수를 고려할 수 있다는 특징을 갖는다.

SELECT NULL "COL1"
        , COALESCE(NULL, NULL, NULL, 30) "COL2"
        , COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100) "COL3"
        , COALESCE(10, NULL, NULL, NULL, NULL, NULL, NULL) "COL4"
        , COALESCE(NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 100) "COL5"
FROM DUAL;
--==>> 	30	100	10	50


--○ 실습을 위한 데이터 추가 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '호석이', 'SALESMAN', 7369, SYSDATE, 10);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8001, '문정이', 'SALESMAN', 7369, SYSDATE, 10, 10);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_EMP;

COMMIT;
--==>> 커밋 완료.

--○ 데이터가 추가된 현재 상태의 TBL_EMP 테이블에서 모든 사원의
--   사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--   연봉 산출 기준은 위와 같다.
SELECT 사원번호, 사원명, 급여, 커미션, 연봉
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
       , COALESCE(SAL * 12 + COMM, 0) "연봉"      -- 급여 OR 커미션이 NULL이면 연봉 0
FROM TBL_EMP;

---****** 22.02.18 오후 **********
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
       , COALESCE(SAL * 12 + COMM, SAL*12, COMM, 0) "연봉"      -- 급여 OR 커미션이 NULL이면 연봉 0
FROM TBL_EMP;


--○ 컬럼과 컬럼의 연결(결합)
SELECT 1, 2
FROM DUAL;
--==>> 1	2

SELECT 1+2
FROM DUAL; -- 컬럼과 컬럼의 결합이라기 보다 그냥 산술연산되어 결과 나온 것
--==>> 3

SELECT '민지', '정용이'
FROM DUAL;
--==>> 민지	정용이

SELECT '민지' + '정용이'
FROM DUAL;
--==>> 에러 발생
--     (ORA-01722: invalid number)

--『||』
SELECT '민지' || '정용이'
FROM DUAL;
--==>> 민지정용이

SELECT ENAME || JOB
FROM TBL_EMP;
--==>>
/*
SMITHCLERK
ALLENSALESMAN
WARDSALESMAN
JONESMANAGER
MARTINSALESMAN
BLAKEMANAGER
CLARKMANAGER
SCOTTANALYST
KINGPRESIDENT
TURNERSALESMAN
ADAMSCLERK
JAMESCLERK
FORDANALYST
MILLERCLERK
호석이SALESMAN
문정이SALESMAN
*/

SELECT '수정이는', SYSDATE, '에 연봉', 500, '억을 원한다.'
FROM DUAL;
--==>> 수정이는	2022-02-18 02:40:30	에 연봉	500	억을 원한다.
--     ------- ------------------- ------- ---- ------------
--      문자타입    날짜타입     문자타입 숫자타입  문자타입

SELECT '수정이는' || SYSDATE || '에 연봉' || 500 || '억을 원한다.'
FROM DUAL;
--==>> 수정이는2022-02-18 02:42:12에 연봉500억을 원한다.

--※ 오라클에서는 문자 타입의 형태로 형 변환하는 별도의 과정없이
--   『||』만 삽입해주면 간단히 컬럼과 컬럼(서로 다른 종류의 데이터)을
--   결합하는 것이 가능하다.
--   cf) MSSQL 에서는 모든 데이터를 문자열로 CONVERT 해야 한다.

SELECT *
FROM TBL_EMP;

/*-----------------------★ 정리 ★---------------------------------
① NVL(A, 0) 
- 첫번째 인자값이 NULL이 아니면 첫번째 인자값을 반환하고,
NULL이라면 0을 반환하는 함수

② NVL2(A, 0, 1)
- 첫번재 인자값이 NULL이 아니면 두번째 인자값을 반환하고, 
NULL이면 세번째 인자값을 반환하는 함수

③ COALESCE(A,B,C,D,E,5) 
- 첫번째 인자값이 NULL이면 두번째 값을 보아서, 두번째 값이 NULL이면, 
세번째 값을 보고...NULL이 아닐때 멈추거나, 주어진 인자끝까지 가거나 
함수, 매개변수 개수의 제한이 없어 NVL함수에 비해 
모든 경우의 수를 고려할 수 있다는 특징이 있다.
---------------------------------------------------------------------*/

--○ TBL_EMP 테이블의 데이터를 활용하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
--   『SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다.』
--     ALLEN의 현재 연봉은 19500인데 희망 연봉은 39000이다.
--                              :
--     문정이의 현재 연봉은 10인데 희망 연봉은 20이다.
--     단, 레코드마다 위의 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다.

SELECT ENAME || '의 현재 연봉은 ' || COALESCE((SAL*12+COMM), (SAL*12), COMM, 0) 
|| '인데 ' || '희망 연봉은 ' || (COALESCE((SAL*12+COMM), (SAL*12), COMM, 0))*2 || '이다.'
FROM TBL_EMP;
--==>>
/*
SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다.
ALLEN의 현재 연봉은 19500인데 희망 연봉은 39000이다.
WARD의 현재 연봉은 15500인데 희망 연봉은 31000이다.
JONES의 현재 연봉은 35700인데 희망 연봉은 71400이다.
MARTIN의 현재 연봉은 16400인데 희망 연봉은 32800이다.
BLAKE의 현재 연봉은 34200인데 희망 연봉은 68400이다.
CLARK의 현재 연봉은 29400인데 희망 연봉은 58800이다.
SCOTT의 현재 연봉은 36000인데 희망 연봉은 72000이다.
KING의 현재 연봉은 60000인데 희망 연봉은 120000이다.
TURNER의 현재 연봉은 18000인데 희망 연봉은 36000이다.
ADAMS의 현재 연봉은 13200인데 희망 연봉은 26400이다.
JAMES의 현재 연봉은 11400인데 희망 연봉은 22800이다.
FORD의 현재 연봉은 36000인데 희망 연봉은 72000이다.
MILLER의 현재 연봉은 15600인데 희망 연봉은 31200이다.
호석이의 현재 연봉은 0인데 희망 연봉은 0이다.
문정이의 현재 연봉은 10인데 희망 연봉은 20이다.
*/

SELECT *
FROM TBL_EMP;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE
FROM DUAL;
--==>> 2022-02-18 15:36:08

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE
FROM DUAL;
--==>> 2022-02-18

--○ TBL_EMP 테이블의 데이터를 활용하여
--   다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
--   『SMITH's 입사일은 1980-12-17이다. 그리고 급여는 800이다.』
--     SMITH's 입사일은 1981-02-20이다. 그리고 급여는 1600이다.
--                              :
--     문정's 입사일은 2022-02-18이다. 그리고 급여는 0이다.
--     단, 레코드마다 위의 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다.


SELECT ENAME || '''s 입사일은 ' || HIREDATE || '이다.'    
             || ' 그리고' || ' 급여는 ' || SAL || '이다.'
FROM TBL_EMP;
--==>>
/*
SMITH's 입사일은 1980-12-17이다. 그리고 급여는 800이다.
ALLEN's 입사일은 1981-02-20이다. 그리고 급여는 1600이다.
WARD's 입사일은 1981-02-22이다. 그리고 급여는 1250이다.
JONES's 입사일은 1981-04-02이다. 그리고 급여는 2975이다.
MARTIN's 입사일은 1981-09-28이다. 그리고 급여는 1250이다.
BLAKE's 입사일은 1981-05-01이다. 그리고 급여는 2850이다.
CLARK's 입사일은 1981-06-09이다. 그리고 급여는 2450이다.
SCOTT's 입사일은 1987-07-13이다. 그리고 급여는 3000이다.
KING's 입사일은 1981-11-17이다. 그리고 급여는 5000이다.
TURNER's 입사일은 1981-09-08이다. 그리고 급여는 1500이다.
ADAMS's 입사일은 1987-07-13이다. 그리고 급여는 1100이다.
JAMES's 입사일은 1981-12-03이다. 그리고 급여는 950이다.
FORD's 입사일은 1981-12-03이다. 그리고 급여는 3000이다.
MILLER's 입사일은 1982-01-23이다. 그리고 급여는 1300이다.
호석이's 입사일은 2022-02-18이다. 그리고 급여는 이다.
문정이's 입사일은 2022-02-18이다. 그리고 급여는 이다.
*/

--※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)
--   홑따옴표 두 개가 홑따움표 하나(어퍼스트로피)를 의미한다.
--   홑따옴표 『'』하나는 문자열의 영역이 시작된다는 것을 나타내고
--   이 문자열 영역 안에서 홑따옴표 『''』 두 개는 어퍼스트로피를 나타내며
--   다시 등장하는 홑따옴표 『'』 하나가
--   문자열 영역의 종료를 의미하게 되는 것이다.

SELECT *
FROM TBL_EMP
WHERE JOB = 'SALESMAN';

--○ UPPER(), LOWER(), INITCAP()
SELECT 'oRaClE' "COL1"
       , UPPER('oRaClE') "COL2"
       , LOWER('oRaClE') "COL3"
       , INITCAP('oRaClE') "COL4"
FROM DUAL;
--==>> oRaClE	ORACLE	oracle	Oracle
--> UPPER() 는 모두 대문자로 변환
--  LOWER() 는 모두 소문자로 변환
--  INITCAP() 은 첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 반환



------------* 수정 (복습 시 생략) *---------------------------------------------------
DELETE FROM TBL_EMP WHERE ENAME='문정이';

SELECT *
FROM TBL_EMP;

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8001, '문정이', 'SALESMAN', 7369, SYSDATE, 10, 10);
---------------------------------------------------------------------



--○ TBL_EMP 테이블을 대상으로 검색값이 'sAleSmAN' 인 조건으로
--   해당 직종 사원의 사원번호, 사원명, 직종명을 조회한다.
SELECT 사원번호, 사원명, 직종명
FROM TBL_EMP
WHERE 직종이 'sAleSmAN';

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명"
FROM TBL_EMP
WHERE JOB이 'sAleSmAN';

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명"
FROM TBL_EMP
WHERE JOB='sAleSmAN';
--==>> 조회 결과 없음

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명"
FROM TBL_EMP
WHERE JOB=UPPER('sAleSmAN');
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	호석이	SALESMAN
8001	문정이	SALESMAN
*/

-- 모두 대문자가 들어있다는 전제여야 위 식을 사용할 수 있음.

--○ 실습을 위한 추가 데이터 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '태형이', 'salesman', 7369, SYSDATE, 20, 100);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_EMP;

COMMIT;
--==>> 커밋 완료.

--○ TBL_EMP 테이블에서 직종이 영업사원(세일즈맨)인 사원들의
--   사원번호, 사원명, 직종명을 조회한다.

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB)=UPPER('SALESMAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE LOWER(JOB)=LOWER('SALESMAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE INITCAP(JOB)=INITCAP('SALESMAN');
-- 왜냐하면 이미 찾을 때부터 JOB에 UPPER, LOWER, INITCAP화 시켰으므로..!
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	호석이	SALESMAN
8001	문정이	SALESMAN
8002	태형이	salesman
*/


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의
--   사원명, 직종명, 입사일 항목을 조회한다.
SELECT 사원명, 직종명, 입사일
FROM TBL_EMP
WHERE 입사일이 1981년 9월 28일;

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE가 1981년 9월 28일;

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE='1981-09-28';    
--==>> MARTIN	SALESMAN	1981-09-28
-- 사실상 틀린 쿼리문.
-- 오라클이 자동형변환해줬는데 나중에는 에러 생길 수 있어.
-- (숫자-(빼기)숫자의 형태임)


DESC TBL_EMP;
--==>>
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         -- CHECK ★
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)   
*/


--○ TO_DATE()
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>> MARTIN	SALESMAN	1981-09-28

--TO_DATE를 쓰는 이유는 날짜의 유효성 검사를 해주기 때문이다 


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 이후(해당일 포함)
--   입사한 직원들의 사원명, 직종명, 입사일 항목을 조회한다.
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD') 이후;

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	1981-09-28
SCOTT	ANALYST	    1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
호석이	SALESMAN	2022-02-18
문정이	SALESMAN	2022-02-18
태형이	salesman	2022-02-18
*/

--※ 오라클에서는 날짜 데이터에 대한 크기 비교가 가능하다.
--   오라클에서는 날짜 데이터에 대한 크기 비교 시
--   과거보다 미래를 더 큰 값으로 간주한다.

--○ TBL_EMP 테이블에서 입사일이 1981년 4월 2일 부터
--   1981년 9월 28일 입사한 직원들의
--   사원명, 직종명, 입사일 항목을 조회한다. (해당일 포함)

SELECT 사원명, 직종명, 입사일
FROM TBL_EMP;
WHERE 입사일이 1981년 4월 2일 부터 1981년 9월 28일 사이;

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE 입사일이 1981년 4월 2일 부터 1981년 9월 28일 사이;

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE 1981년 4월 2일 <= 입사일 <= 1981년 9월 28일;       -- (X)

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE 1981년 4월 2일 <= 입사일
      입사일 <= 1981년 9월 28일;
      
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD') AND   -- 이후(이상) → 해당일 포함(O)  cf. 초과(포함X)
      HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');      -- 이전(이하) → 해당일 포함(O)  cf. 초과(포함X)

-- AND 로 사용하면 ⑴과 ⑵의 겹친 부분,
-- OR  를 사용하면 ⑴이상과 ⑵이하 전체 기간 모두.

---------------------① 방법-----------------------------
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE TO_DATE('1981-04-02', 'YYYY-MM-DD') <= HIREDATE AND
      HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
----------------------------------------------------------

--○ BETWEEN ⓐ AND ⓑ : 날짜뿐 아니라 숫자, 문자 모두 가능.
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE 이 1981년 4월 2일과 1981년 9월 28일 사이;

---------------------② 방법-----------------------------
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD')
      AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
----------------------------------------------------------
--==>>
/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/


--○ TBL_EMP 테이블에서 급여(SAL)가 2450 에서 3000 사이의 직원들을 모두 조회한다.
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2450 AND 3000;
--==>>
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7902	FORD	ANALYST	7566	1981-12-03	3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';        -- 사전식
--==>>
/*
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7839	KING	PRESIDENT	(null)  1981-11-17	5000		    10
7900	JAMES	CLERK	    7698	1981-12-03	950		        30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
*/ 

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
-- W도 Z도 나오게 되는데 그건 대문자 모두와 소문자 s까지 나오겠다는 것이기 때문이다.
-- 아스키코드값 생각.


--※ BETWEEN ⓐ AND ⓑ 는 날짜형, 숫자형, 문자형 데이터 모두에 적용된다.
--   단, 문자형일 경우 아스키코드 순서를 따르기 때문에 (사전식 배열)
--   대문자가 앞쪽에 위치하고 소문자가 뒤쪽에 위치한다.
--   또한 BETWEEN ⓐ AND ⓑ 는 해당 구문이 수행되는 시점에서
--   오라클 내부적으로는 부등호 연산자의 형태로 바뀌어 연산 처리된다.

SELECT ASCII('A')"COL1", ASCII('B')"COL2", ASCII('a')"COL3", ASCII('b')"COL4"
FROM DUAL;
--==>> 65	66	97	98