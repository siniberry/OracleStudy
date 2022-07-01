SELECT *
FROM DUAL;
--==>> SCOTT

--※ 20220310_01_scott(plsql).sql 파일에서
--   FN_PAY() 함수 생성 후 테스트
SELECT NUM, NAME, BASICPAY, SUDANG, FN_pAY(BASICPAY, SUDANG)"급여"
FROM TBL_INSA;
--==>>
/*
1001	홍길동	2610000	200000	31520000
1002	이순신	1320000	200000	16040000
1003	이순애	2550000	160000	30760000
1004	김정훈	1954200	170000	23620400
1005	한석봉	1420000	160000	17200000
1006	이기자	2265000	150000	27330000
1007	장인철	1250000	150000	15150000
1008	김영년	950000	145000	11545000
1009	나윤균	840000	220400	10300400
1010	김종서	2540000	130000	30610000
1011	유관순	1020000	140000	12380000
1012	정한국	880000	114000	10674000
1013	조미숙	1601000	103000	19315000
1014	황진이	1100000	130000	13330000
1015	이현숙	1050000	104000	12704000
1016	이상헌	2350000	150000	28350000
1017	엄용수	950000	210000	11610000
1018	이성길	880000	123000	10683000
1019	박문수	2300000	165000	27765000
1020	유영희	880000	140000	10700000
1021	홍길남	875000	120000	10620000
1022	이영숙	1960000	180000	23700000
1023	김인수	2500000	170000	30170000
1024	김말자	1900000	170000	22970000
1025	우재옥	1100000	160000	13360000
1026	김숙남	1050000	150000	12750000
1027	김영길	2340000	170000	28250000
1028	이남신	892000	110000	10814000
1029	김말숙	920000	124000	11164000
1030	정정해	2304000	124000	27772000
1031	지재환	2450000	160000	29560000
1032	심심해	880000	108000	10668000
1033	김미나	1020000	104000	12344000
1034	이정석	1100000	160000	13360000
1035	정영희	1050000	140000	12740000
1036	이재영	960400	190000	11714800
1037	최석규	2350000	187000	28387000
1038	손인수	2000000	150000	24150000
1039	고순정	2010000	160000	24280000
1040	박세열	2100000	130000	25330000
1041	문길수	2300000	150000	27750000
1042	채정희	1020000	200000	12440000
1043	양미옥	1100000	210000	13410000
1044	지수환	1060000	220000	12940000
1045	홍원신	960000	152000	11672000
1046	허경운	2650000	150000	31950000
1047	산마루	2100000	112000	25312000
1048	이기상	2050000	106000	24706000
1049	이미성	1300000	130000	15730000
1050	이미인	1950000	103000	23503000
1051	권영미	2260000	104000	27224000
1052	권옥경	1020000	105000	12345000
1053	김싱식	960000	108000	11628000
1054	정상호	980000	114000	11874000
1055	정한나	1000000	104000	12104000
1056	전용재	1950000	200000	23600000
1057	이미경	2520000	160000	30400000
1058	김신제	1950000	180000	23580000
1059	임수봉	890000	102000	10782000
1060	김신애	900000	102000	10902000
*/

--※ 20220310_01_scott(plsql).sql 파일에서
--   FN_WORKYEAR() 함수 생성 후 테스트
SELECT NAME, IBSADATE, FN_WORKYEAR(IBSADATE)"근무기간"
FROM TBL_INSA;
--==>>
/*
홍길동	1998-10-11	23년4개월
이순신	2000-11-29	21년3개월
이순애	1999-02-25	23년0개월
김정훈	2000-10-01	21년5개월
한석봉	2004-08-13	17년6개월
이기자	2002-02-11	20년0개월
장인철	1998-03-16	23년11개월
김영년	2002-04-30	19년10개월
나윤균	2003-10-10	18년5개월
김종서	1997-08-08	24년7개월
유관순	2000-07-07	21년8개월
정한국	1999-10-16	22년4개월
조미숙	1998-06-07	23년9개월
황진이	2002-02-15	20년0개월
이현숙	1999-07-26	22년7개월
이상헌	2001-11-29	20년3개월
엄용수	2000-08-28	21년6개월
이성길	2004-08-08	17년7개월
박문수	1999-12-10	22년3개월
유영희	2003-10-10	18년5개월
홍길남	2001-09-07	20년6개월
이영숙	2003-02-25	19년0개월
김인수	1995-02-23	27년0개월
김말자	1999-08-28	22년6개월
우재옥	2000-10-01	21년5개월
김숙남	2002-08-28	19년6개월
김영길	2000-10-18	21년4개월
이남신	2001-09-07	20년6개월
김말숙	2000-09-08	21년6개월
정정해	1999-10-17	22년4개월
지재환	2001-01-21	21년1개월
심심해	2000-05-05	21년10개월
김미나	1998-06-07	23년9개월
이정석	2005-09-26	16년5개월
정영희	2002-05-16	19년9개월
이재영	2003-08-10	18년7개월
최석규	1998-10-15	23년4개월
손인수	1999-11-15	22년3개월
고순정	2003-12-28	18년2개월
박세열	2000-09-10	21년6개월
문길수	2001-12-10	20년3개월
채정희	2003-10-17	18년4개월
양미옥	2003-09-24	18년5개월
지수환	2004-01-21	18년1개월
홍원신	2003-03-16	18년11개월
허경운	1999-05-04	22년10개월
산마루	2001-07-15	20년7개월
이기상	2001-06-07	20년9개월
이미성	2000-04-07	21년11개월
이미인	2003-06-07	18년9개월
권영미	2000-06-04	21년9개월
권옥경	2000-10-10	21년5개월
김싱식	1999-12-12	22년2개월
정상호	1999-10-16	22년4개월
정한나	2004-06-07	17년9개월
전용재	2004-08-13	17년6개월
이미경	1998-02-11	24년0개월
김신제	2003-08-08	18년7개월
임수봉	2001-10-10	20년5개월
김신애	2001-10-10	20년5개월
*/


--※ 20220310_01_scott(plsql).sql 파일에서
--   FN_WORKYEAR() 함수 생성 후 테스트
SELECT NAME, IBSADATE, FN_WORKYEAR(IBSADATE)"근무기간"
FROM TBL_INSA;
--==>>
/*
홍길동	1998-10-11	23.4
이순신	2000-11-29	21.2
이순애	1999-02-25	23
김정훈	2000-10-01	21.4
한석봉	2004-08-13	17.5
이기자	2002-02-11	20
장인철	1998-03-16	23.9
김영년	2002-04-30	19.8
나윤균	2003-10-10	18.4
김종서	1997-08-08	24.5
유관순	2000-07-07	21.6
정한국	1999-10-16	22.4
조미숙	1998-06-07	23.7
황진이	2002-02-15	20
이현숙	1999-07-26	22.6
이상헌	2001-11-29	20.2
엄용수	2000-08-28	21.5
이성길	2004-08-08	17.5
박문수	1999-12-10	22.2
유영희	2003-10-10	18.4
홍길남	2001-09-07	20.5
이영숙	2003-02-25	19
김인수	1995-02-23	27
김말자	1999-08-28	22.5
우재옥	2000-10-01	21.4
김숙남	2002-08-28	19.5
김영길	2000-10-18	21.3
이남신	2001-09-07	20.5
김말숙	2000-09-08	21.5
정정해	1999-10-17	22.3
지재환	2001-01-21	21.1
심심해	2000-05-05	21.8
김미나	1998-06-07	23.7
이정석	2005-09-26	16.4
정영희	2002-05-16	19.8
이재영	2003-08-10	18.5
최석규	1998-10-15	23.4
손인수	1999-11-15	22.3
고순정	2003-12-28	18.2
박세열	2000-09-10	21.5
문길수	2001-12-10	20.2
채정희	2003-10-17	18.3
양미옥	2003-09-24	18.4
지수환	2004-01-21	18.1
홍원신	2003-03-16	18.9
허경운	1999-05-04	22.8
산마루	2001-07-15	20.6
이기상	2001-06-07	20.7
이미성	2000-04-07	21.9
이미인	2003-06-07	18.7
권영미	2000-06-04	21.7
권옥경	2000-10-10	21.4
김싱식	1999-12-12	22.2
정상호	1999-10-16	22.4
정한나	2004-06-07	17.7
전용재	2004-08-13	17.5
이미경	1998-02-11	24
김신제	2003-08-08	18.5
임수봉	2001-10-10	20.4
김신애	2001-10-10	20.4
*/


--------------------------------------------------------------------------------

--※ 프로시저 관련 실습을 위한 준비

-- 실습 테이블 생성
CREATE TABLE TBL_STUDENTS
( ID   VARCHAR2(10)
, NAME VARCHAR2(40)
, TEL  VARCHAR2(30)
, ADDR VARCHAR2(100)
, CONSTRAINT STUDENTS_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_STUDENTS이(가) 생성되었습니다.

-- 실습 테이블 생성
CREATE TABLE TBL_IDPW
( ID    VARCHAR2(10)
, PW    VARCHAR2(20)
, CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_IDPW이(가) 생성되었습니다.


-- 두 테이블에 데이터 입력
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('happy', '이시우', '010-1111-1111', '제주도 서귀포시');
INSERT INTO TBL_IDPW(ID, PW)
VALUES('happy', 'java006$');
--==>> 1 행 이(가) 삽입되었습니다. * 2


-- 확인
SELECT *
FROM TBL_STUDENTS;
--==>> happy	이시우	010-1111-1111	제주도 서귀포시

SELECT *
FROM TBL_IDPW;
--==>> happy	java006$


-- 커밋
COMMIT;
--==>> 커밋 완료.


-- 위의 업무를 수행하는 프로시저(INSERT 프로시저, 입력 프로시저)를 생성하게 되면
-- 『EXEC PRC_STUDENT_INSERT('happy', 'java006$', '이시우', '010-1111-1111', '제주 서귀포시');』
-- 이와 같은 구문 한 줄로 양쪽 테이블 모두 제대로 데이터를 입력할 수 있다.

--※ 프로시저를 생성하는 구문은
--  『20220310_01_scott(plsql).sql』 파일 참조~!!!



--○ 프로시저 생성 후 실행
EXEC PRC_STUDENT_INSERT('rainbow', 'java006$', '김정용', '010-2222-2222', '서울 강남구');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 프로시저 호출 이후 확인
SELECT *
FROM TBL_IDPW;
--==>>
/*
happy	java006$
rainbow	java006$
*/

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
happy	이시우	010-1111-1111	제주도 서귀포시
rainbow	김정용	010-2222-2222	서울 강남구
*/


--○ 실습 테이블 생성(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER          -- CHECK~!!! 원래는 넘버로 만들면 안대~
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK이(가) 생성되었습니다.


--※ 생성된 테이블 구조 변경 → 컬럼 추가
--   (총점 → TOT, 평균 → AVG, 등급 → GRADE)
ALTER TABLE TBL_SUNGJUK
ADD ( TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR );
--==>> Table TBL_SUNGJUK이(가) 변경되었습니다.


--※ 여기서 추가한 컬럼에 대한 항목은
--   프로시저 실습을 위한 추가항목일 뿐
--   실습 테이블 구조에 적합하지도, 바람직하지도 않은 내용이다~!!! CHECK~!!!

--==>> 기존 테이블의 데이터를 활용하여 얻을 수 있는 데이터는
--     즉, 쿼리문을 통해 얻어낼 수 있는 데이터는
--     절대 테이블에 추가로 구성하지 않는다.


--○ 변경된 테이블 구조 확인
DESC TBL_SUNGJUK;
--==>>
/*
이름     널?       유형           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)
*/



--○ 프로시저 생성 후 실행
EXEC PRC_SUNGJUK_INSERT(1, '최선하', 90, 80, 70);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 프로시저 호출 이후 테이블 조회
SELECT *
FROM TBL_SUNGJUK;
--==>> 1	최선하	90	80	70	240	80	B


--○ 프로시저 생성 후 실행
EXEC PRC_SUNGJUK_INSERT(2, '박현수', 87, 97, 67);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 프로시저 호출 이후 테이블 조회
SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	최선하	90	80	70	240	80	B
2	박현수	87	97	67	251	83.7	B
*/



-- 프로시저 생성 후 실행
EXEC PRC_SUNGJUK_UPDATE(2, 50, 50, 50);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 프로시저 호출(실행) 이후 테이블 조회
SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	최선하	90	80	70	240	80	B
2	박현수	50	50	50	150	50	F
*/


--○ TBL_STUDENTS 테이블 조회
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
happy	이시우	010-1111-1111	제주도 서귀포시
rainbow	김정용	010-2222-2222	서울 강남구
*/

--○ TBL_IDPW 테이블 조회
SELECT *
FROM TBL_IDPW;
--==>>
/*
happy	java006$
rainbow	java006$
*/

--○ 프로시저 생성 후 실행
EXEC PRC_STUDENTS_UPDATE('happy', 'java006', '010-9999-9999', '강원도 횡성');


--○ 프로시저 호출(실행) 이후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
happy	이시우	010-1111-1111	제주도 서귀포시
rainbow	김정용	010-2222-2222	서울 강남구
*/


--○ 프로시저 생성 후 실행
EXEC PRC_STUDENTS_UPDATE('happy', 'java006$', '010-9999-9999', '강원도 횡성');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 프로시저 호출(실행) 이후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
happy	이시우	010-9999-9999	강원도 횡성
rainbow	김정용	010-2222-2222	서울 강남구
*/
