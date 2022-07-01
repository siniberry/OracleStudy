SELECT USER
FROM DUAL;
--==>>SCOTT


--○ ROUND() 반올림을 처리해 주는 함수
SELECT 48.678"COL1"                 -- 48.678
     , ROUND(48.678, 2)"COL2"       -- 48.68        -- 소수점 이하 둘째자리까지 표현 → 두 번째 파라미터
     , ROUND(48.674, 2)"COL3"       -- 48.67
     , ROUND(48.674, 1)"COL4"       -- 48.7
     , ROUND(48.674, 0)"COL5"       -- 49
     , ROUND(48.674)"COL6"          -- 49
     , ROUND(48.674, -1)"COL7"      -- 50
     , ROUND(48.674, -2)"COL8"      -- 0
     , ROUND(48.674, -3)"COL9"      -- 0
FROM DUAL;


--○ TRUNC() 절삭을 처리해 주는 함수
SELECT 48.678"COL1"                 -- 48.678
     , TRUNC(48.678, 2)"COL2"       -- 48.67        -- 소수점 이하 둘째자리까지 표현 → 두 번째 파라미터
     , TRUNC(48.674, 2)"COL3"       -- 48.67
     , TRUNC(48.674, 1)"COL4"       -- 48.6
     , TRUNC(48.674, 0)"COL5"       -- 48
     , TRUNC(48.674)"COL6"          -- 48           -- 두 번째 파라미터 값이 0일 경우 생략 가능
     , TRUNC(48.674, -1)"COL7"      -- 40
     , TRUNC(48.674, -2)"COL8"      -- 0
     , TRUNC(68.674, -2)"COL9"      -- 0
     , TRUNC(48.674, -3)"COL10"      -- 0
FROM DUAL;


--○ MOD() 나머지를 반환하는 함수
SELECT MOD(5, 2)"RESULT"
FROM DUAL;
--==>> 1 
--> 5를 2로 나눈 나머지 결과값 반환


--○ POWER() 제곱의 결과를 반환하는 함수
SELECT POWER(5, 3)"RESULT"
FROM DUAL;
--==>> 125
--> 5의 3승을 결과값으로 반환


--○ SQRT() 루트 결과값을 반환하는 함수
SELECT SQRT(2) "RESULT"
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> 루트 2에 대한 결과값 반환


--○ LOG() 로그 함수
--   (오라클은 상용로그만 지원하는 반면, MSSQL 은 상용로그·자연로그 모두 지원한다.)
SELECT LOG(10, 100)"COL1"
    ,  LOG(10, 20)"COL2"
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677


--○ 삼각함수
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>> 0.8414709848078965066525023216302989996233	
--     0.5403023058681397174009366074429766037354	
--     1.55740772465490223050697480745836017308
--> 각각 싸인, 코싸인, 탄젠트 결과값을 반환한다.


--○ 삼각함수의 역함수(범위 : -1 ~1)
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>> 0.52359877559829887307710723054658381405	
--     1.04719755119659774615421446109316762805	
--     0.4636476090008061162142562314612144020295
--> 각각 어싸인, 어코싸인, 어탄젠트 결과값을 반환한다.


--○ SIGN() 서명 부호 특징
--> 연산 결과값이 양수이면 1, 0이면 0, 음수이면 -1을 반환한다.
SELECT SIGN(5-2)"COL1", SIGN(5-5)"COL2", SIGN(5-8)"COL3"
FROM DUAL;
--==>> 1	0	-1
--> 매출이나 수지와 관련하여 적자 및 흑자의 개념을 나타낼 때 사용된다.


--○ ASCII(), CHR() → 서로 대응(상응)하는 함수
SELECT ASCII('A')"COL1"
    ,  CHR(65)"COL2"
FROM DUAL;
--==>> 65   A
-->> 『ASCII()』 : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
--   『CHR(』    : 매개변수로 넘겨받은 아스키코드 값으로 해당 문자를 반환한다.


--------------------------------------------------------------------------------

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.


--※ 날짜 연산의 기본 단위는 DAY(일수) 이다~!!!
SELECT SYSDATE "COL1"       -- 2022-02-22 09:44:24
    ,  SYSDATE + 1 "COL2"   -- 2022-02-23 09:44:24 → 하루 뒤
    ,  SYSDATE - 2 "COL3"   -- 2022-02-20 09:44:24 → 이틀 전
    ,  SYSDATE - 30 "COL4"  -- 2022-01-23 09:44:24 → 30일 전
FROM DUAL;


--○ 시간 단위 연산
SELECT SYSDATE "COL1"        -- 2022-02-22 09:46:32
     , SYSDATE + 1/24 "COL2" -- 2022-02-22 10:46:32 → 한 시간 뒤
     , SYSDATE - 2/24 "COL3" -- 2022-02-22 07:46:32 → 두 시간 전
FROM DUAL;


--○ 현재 시간과.. 현재 시간 기준 1일 2시간 3분 4초 후를 조회하는 쿼리문을 구성한다.
/*
----------------------- -----------------------
 현재 시간                연산 후 시간
----------------------- -----------------------
2022-02-22 10:03:21      2022-02-23 12:05:27
*/

-- 방법 1.
SELECT SYSDATE "현재시간" 
    ,  SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "연산 후 시간"
FROM DUAL;
--==>> 2022-02-22 10:18:32	
--     2022-02-23 12:21:36


-- 방법 2.
SELECT SYSDATE "현재시간" 
    ,  SYSDATE + ((1*24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60) "연산 후 시간"
FROM DUAL;
--==>> 2022-02-22 10:19:54	
--     2022-02-23 12:22:58

-- 방법 3. (내가 푼 방법)
SELECT SYSDATE "현재시간" 
    ,  SYSDATE + 1 + 2/24 + 3/24/60 + 4/24/60/60 "연산 후 시간"
FROM DUAL;
--==>> 2022-02-22 10:21:11	
--     2022-02-23 12:24:15


--○ 날짜 - 날짜 = 일수
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD')- TO_DATE('2022-02-22', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 118

--○ 데이터 타입의 변환
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 2022-06-20 00:00:00

SELECT TO_DATE('2022-06-35', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 에러 발생
--    (ORA-01847: day of month must be between 1 and last day of month)

SELECT TO_DATE('2022-02-29', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 에러 발생
--     (ORA-01839: date not valid for month specified)

SELECT TO_DATE('2022-13-29', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 에러 발생
--     (ORA-01843: not a valid month)

--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 수행하는 과정에서
--   내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다.


--○ ADD_MONTHS() 개월 수를 더해주는 함수
SELECT SYSDATE"COL1"
     , ADD_MONTHS(SYSDATE, 2)"COL2"
     , ADD_MONTHS(SYSDATE, 3)"COL3"
     , ADD_MONTHS(SYSDATE, -2)"COL4"
     , ADD_MONTHS(SYSDATE, -3)"COL5"
FROM DUAL;
--==>>
/*
2022-02-22 10:30:06	
2022-04-22 10:30:06	
2022-05-22 10:30:06	
2021-12-22 10:30:06	
2021-11-22 10:30:06
*/
--> 월을 더하고 빼기


--○ MONTHS_BETWEEN()
--   첫 번째 인자값에서 두 번째 인자값을 뺀 개월 수를 반환한다.
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD'))"RESULT"
FROM DUAL;
--==>> 236.723865367383512544802867383512544803

--> 개월 수의 차이가 반환하는 함수
--  결과값의 부호가 『-』로 반환되었을 경우에는
--  첫 번째 인자값에 해당하는 날짜보다
--  두 번째 인자값에 해당하는 날짜가 『미래』라는 의미로 확인할 수 있다.

--○ NEXT_DAY()
SELECT NEXT_DAY(SYSDATE, '토')"COL1"
     , NEXT_DAY(SYSDATE, '월')"COL2"
FROM DUAL;
--==>> 2022-02-26 10:38:29	
--     2022-02-28 10:38:29

--※ 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session이(가) 변경되었습니다.

SELECT NEXT_DAY(SYSDATE, '토')"COL1"
     , NEXT_DAY(SYSDATE, '월')"COL2"
FROM DUAL;
--==>> 에러 발생
--     (ORA-01846: not a valid day of the week)

SELECT NEXT_DAY(SYSDATE, 'SAT')"COL1"
     , NEXT_DAY(SYSDATE, 'MON')"COL2"
FROM DUAL;
--==>> 2022-02-26 10:40:27	
--     2022-02-28 10:40:27

--※ 세션 설정 다시 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.

SELECT NEXT_DAY(SYSDATE, 'SAT')"COL1"
     , NEXT_DAY(SYSDATE, 'MON')"COL2"
FROM DUAL;
--==>> 에러 발생
--     (ORA-01846: not a valid day of the week)

SELECT NEXT_DAY(SYSDATE, '토')"COL1"
     , NEXT_DAY(SYSDATE, '월')"COL2"
FROM DUAL;
--==>> 2022-02-26 10:42:43	
--     2022-02-28 10:42:43


--○ LAST_DAY()
--> 해당 날짜가 포함되어 있는 그 달의 마지막 날을 반환한다.
SELECT LAST_DAY(SYSDATE)"COL1"
     , LAST_DAY(TO_DATE('2020-02-10', 'YYYY-MM-DD'))"COL2"
     , LAST_DAY(TO_DATE('2019-02-10', 'YYYY-MM-DD'))"COL3"
FROM DUAL;
--==>>
/*
2022-02-28 10:44:58	
2020-02-29 00:00:00	
2019-02-28 00:00:00
*/

--※ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ 오늘부로... 상기가 군대에 다시 끌려(?)간다...
--   복무기간은 22개월로 한다.

-- 1. 전역 일자를 구한다.
SELECT ADD_MONTHS(SYSDATE, 22)"전역 일자"
FROM DUAL;
--==>> 2023-12-22

-- 2. 하루 꼬박꼬박 3끼 식사를 한다고 가정하면
--    상기가 몇 끼를 먹어야 집에 보내줄까...

--    복무기간 * 3
--    --------
--    (전역일자 - 현재일자)

--    (전역일자 - 현재일자) * 3

SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3 "식사 횟수" 
FROM DUAL;
--==>> 2004


--○ 현재 날짜 및 시각으로부터...
--   수료일(2022-06-20 18:00:00)까지
--   남은 기간을... 다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.
/*
--------------------------------------------------------------------------------
현재 시각            | 수료일                 | 일  | 시간 | 분 | 초 
--------------------------------------------------------------------------------
2022-02-22 11:34:35  | 2022-06-20 18:00:00   | 117 |  7   | 15 | 15 
--------------------------------------------------------------------------------
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE "현재시각"
     , 1 "수료일"
     , 2 "일"
     , 3 "분"
     , 4 "초"
FROM DUAL;



-- 『1일 2시간 3분 4초』를... 『초』로 환산하면...
SELECT (1일) + (2시간) + (3분) + (4초)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) +(4)
FROM DUAL;
--==>> 93784

--『93784초』를... 다시 『일 시간 분 초』로 환산하면...
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)"일"
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)"시간"
     , MOD(TRUNC(93784/60), 60) "분"
     , MOD(93784, 60)"초"
FROM DUAL;



-- 수료일까지 남은 기간 확인(단위: 일수)
SELECT 수료일자 - 현재일자
FROM DUAL;

SELECT TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 118.132141203703703703703703703703703704


-- 수료일까지 남은 기간 확인 (단위 : 초)
SELECT (TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 10205699.00000000000000000000000000000003




SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)"일"
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)"시간"
     , MOD(TRUNC(93784/60), 60) "분"
     , MOD(93784, 60)"초"
FROM DUAL;


SELECT SYSDATE "현재시각"
     , TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')"수료일"
     , TRUNC(TRUNC(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24)"일"
     , MOD(TRUNC(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24)"시간"
     , MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "분"
     ,TRUNC(MOD((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60))"초"
FROM DUAL;
--==>> 2022-02-22 15:08:20	2022-06-20 18:00:00	118	2	51	40



-- ○ 각자 태어난 날짜 및 시각으로부터... 현재까지
--    얼마만큼 시간을 살고 있는지...
--    다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.
/*
--------------------------------------------------------------------------------
현재 시각            | 생년월일                 | 일  | 시간 | 분 | 초 
--------------------------------------------------------------------------------
2022-02-22 11:34:35  | 1999-10-31 12:00:00   | 117 |  7   | 15 | 15 
--------------------------------------------------------------------------------
*/

SELECT SYSDATE "현재시각"
     , TO_DATE('1999-10-31 00:15:00', 'YYYY-MM-DD HH24:MI:SS')"생년월일"
     , TRUNC(TRUNC(TRUNC(( SYSDATE - TO_DATE('1999-10-31 00:15:00', 'YYYY-MM-DD HH24:MI:SS') ) * (24*60*60)/60)/60)/24)"일"
     , MOD(TRUNC(TRUNC((SYSDATE - TO_DATE('1999-10-31 00:15:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60)/60), 24)"시간"
     , MOD(TRUNC((SYSDATE - TO_DATE('1999-10-31 00:15:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)/60), 60) "분"
     ,TRUNC(MOD((SYSDATE - TO_DATE('1999-10-31 00:15:00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60), 60))"초"
FROM DUAL;


--○ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

--※ 날짜 데이터를 대상으로 반올림, 절삭 등의 연산을 수행할 수 있다.

--○ 날짜 반올림
SELECT SYSDATE"COL1"                    -- 2022-02-22	→ 기본 현재 날짜
     , ROUND(SYSDATE, 'YEAR')"COL2"     -- 2022-01-01   → 년도까지 유효한 데이터 (상반기/하반기 기준)
     , ROUND(SYSDATE, 'MONTH')"COL3"    -- 2022-03-01	→ 월까지 유효한 데이터 (15일 기준)
     , ROUND(SYSDATE, 'DD')"COL4"       -- 2022-02-23	→ 일까지 유효한 데이터 (정오 기준)
     , ROUND(SYSDATE, 'DAY')"COL5"      -- 2022-02-20   → 일까지 유효한 데이터 (수요일 정오 기준)
FROM DUAL;



--○ 날짜 절삭
SELECT SYSDATE"COL1"                    -- 2022-02-22	→ 기본 현재 날짜
     , TRUNC(SYSDATE, 'YEAR')"COL2"     -- 2022-01-01   → 년도까지 유효한 데이터 
     , TRUNC(SYSDATE, 'MONTH')"COL3"    -- 2022-02-01	→ 월까지 유효한 데이터 
     , TRUNC(SYSDATE, 'DD')"COL4"       -- 2022-02-22	→ 일까지 유효한 데이터 
     , TRUNC(SYSDATE, 'DAY')"COL5"      -- 2022-02-20   → 그 전 주에 해당하는 일요일
FROM DUAL;

--------------------------------------------------------------------------------

--■■■ 변환 함수 ■■■--

-- TO_CHAR()     : 숫자나 날짜 데이터를 문자 타입으로 변환시켜주는 함수
-- TO_DATE()     : 문자 데이터를 날짜 타입으로 변환시켜주는 함수
-- TO_NUMBER()   : 문자 데이터를 숫자 타입으로 변환시켜주는 함수

--※ 날짜나 통화 형식이 맞지 않을 경우...
--   설정값을 통해 세션을 설정하여 사용할 수 있다.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_CURRENCY = '\'
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


--○ 날짜형 → 문자형
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"        -- 2022-02-22	
     , TO_CHAR(SYSDATE, 'YYYY') "COL2"              -- 2022	
     , TO_CHAR(SYSDATE, 'YEAR') "COL3"              -- TWENTY TWENTY-TWO
     , TO_CHAR(SYSDATE, 'MM') "COL4"                -- 02	
     , TO_CHAR(SYSDATE, 'MONTH') "COL5"             -- 2월
     , TO_CHAR(SYSDATE, 'MON') "COL6"               -- 2월
     , TO_CHAR(SYSDATE, 'DD') "COL7"                -- 22
     , TO_CHAR(SYSDATE, 'MM-DD') "COL8"             -- 02-22
     , TO_CHAR(SYSDATE, 'DAY') "COL9"               -- 화요일
     , TO_CHAR(SYSDATE, 'DY') "COL10"               -- 화
     , TO_CHAR(SYSDATE, 'HH24') "COL11"             -- 16
     , TO_CHAR(SYSDATE, 'HH') "COL12"               -- 04
     , TO_CHAR(SYSDATE, 'HH AM') "COL13"            -- 04 오후
     , TO_CHAR(SYSDATE, 'HH PM') "COL14"            -- 04 오후
     , TO_CHAR(SYSDATE, 'MI') "COL15"               -- 19	
     , TO_CHAR(SYSDATE, 'SS') "COL16"               -- 09		
     , TO_CHAR(SYSDATE, 'SSSSS') "COL17"            -- 58749
     , TO_CHAR(SYSDATE, 'Q') "COL18"                -- 1
FROM DUAL;

SELECT 7 "COL1"
     , '7' "COL2"
     , TO_CHAR(7)"COL3"
FROM DUAL;
--> 조회 결과가 좌측 정렬인지 우측 정렬인지 확인~!!!

SELECT '4' "COL1"
     , TO_NUMBER('4')"COL2"
     , 4 "COL3"
     , TO_NUMBER('04')"COL4"
FROM DUAL;
--==>> 4	4	4	4


SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))"RESULT"
FROM DUAL;
--==>> 2022


--○ EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY')"COL1"       -- 2022(문자형)    → 연도를 추출하여 문자 타입으로 반환
     , TO_CHAR(SYSDATE, 'MM')"COL2"         -- 02 (문자형)     → 월을 추출하여 문자 타입으로 반환
     , TO_CHAR(SYSDATE, 'DD')"COL3"         -- 22(문자형)      → 일을 추출하여 문자 타입으로 반환
     , EXTRACT(YEAR FROM SYSDATE)"COL4"     -- 2022(숫자형)    → 연도를 추출하여 숫자 타입으로 반환
     , EXTRACT(MONTH FROM SYSDATE)"COL5"    -- 2(숫자형)       → 월을 추출하여 숫자 타입으로 반환
     ,  EXTRACT(DAY FROM SYSDATE)"COL6"     -- 22(숫자형)      → 일을 추출하여 숫자 타입으로 반환
FROM DUAL;
--> 연, 월, 일 이외의 다른 항목은 불가~!!!


--○ TO_CHAR()활용 → 형식 맞춤 표기 결과값 반환
SELECT 60000"COL1"
     , TO_CHAR(60000, '99,999')"COL2"
     , TO_CHAR(60000, '$99,999')"COL3"
     , TO_CHAR(60000, 'L99,999')"COL4"
     , LTRIM(TO_CHAR(60000, 'L99,999'))"RESULT"
FROM DUAL;


--※ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>Session이(가) 변경되었습니다.


--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.
SELECT SYSDATE"현재 시간"
     , SYSDATE + 1 + (2/24) +(3/(24*60)) + (4/(24*60*60))"1일2시간3분4초후"
FROM DUAL;
--==>> 2022-02-22 16:48:06	
--     2022-02-23 18:51:10


--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초 후를 조회한다.
--   TO_YMINTERVAL(), TO_DINTERVAL()
SELECT SYSDATE"현재 시간"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06')"연산 시간"
FROM DUAL;
--==>>
/*
2022-02-22 17:06:36	
2023-04-25 21:11:42
*/


--------------------------------------------------------------------------------


--○ CASE 구문(조건문, 분기문)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2는몰라요' END
FROM DUAL;
--==>> 5+2는몰라요


SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2=6' END
FROM DUAL;
--==>> 5+2=7


SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '난산수싫어'
        END "RESULT"
FROM DUAL;
--==>> 1+1=2


SELECT CASE WHEN 5+2=4 THEN '5+2=4'
            WHEN 6-3=2 THEN '6-3=2'
            WHEN 7*1=8 THEN '7*1=8'
            WHEN 6/2=3 THEN '6/2=3'
            ELSE '모르겠네'
        END
FROM DUAL;
--==>> WHEN 6-3=2 THEN '6-3=2'


--○ DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2는 몰라요') "RESULT"
FROM DUAL;
--==>> 5-2=3


--○ CASE WHEN THEN ELSE END (조건문, 분기문) 활용
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5와 2는 비교불가'
        END "RESULT"
FROM DUAL;
--==>> 5>2


SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '은혜만세'
            WHEN 5>2 OR 2=3 THEN '문정만세'
            ELSE '호석만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN F OR 3>1 AND 2=2 THEN '은혜만세'
            WHEN 5>2 OR 2=3 THEN '문정만세'
            ELSE '호석만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN T AND 2=2 THEN '은혜만세'
            WHEN 5>2 OR 2=3 THEN '문정만세'
            ELSE '호석만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN T AND T THEN '은혜만세'
            WHEN 5>2 OR 2=3 THEN '문정만세'
            ELSE '호석만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN T THEN '은혜만세'
            WHEN 5>2 OR 2=3 THEN '문정만세'
            ELSE '호석만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '은혜만세'
            WHEN 5>2 OR 2=3 THEN '문정만세'
            ELSE '호석만세'
        END "RESULT"
FROM DUAL;
--==>> 은혜만세


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '현수만세'
            WHEN 5<2 AND 2=3 THEN '이삭만세'
            ELSE '태형만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN T THEN '현수만세'
            WHEN 5<2 AND 2=3 THEN '이삭만세'
            ELSE '태형만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '현수만세'
            WHEN 5<2 AND 2=3 THEN '이삭만세'
            ELSE '태형만세'
        END "RESULT"
FROM DUAL;
--==>> 현수만세


SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '현수만세'
            WHEN 5<2 AND 2=3 THEN '이삭만세'
            ELSE '태형만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN F THEN '현수만세'
            WHEN F THEN '이삭만세'
            ELSE '태형만세'
        END "RESULT"
FROM DUAL;

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '현수만세'
            WHEN 5<2 AND 2=3 THEN '이삭만세'
            ELSE '태형만세'
        END "RESULT"
FROM DUAL;
--==>> 태형만세


--------------------------------------------------------------------------------
SELECT *
FROM TBL_SAWON;

--○ TBL_SAWON 테이블을 활용하여 
--   다음과 같은 항목들을 조회할 수 있도록 쿼리문을 구성한다.
--   사원번호, 사원명, 주민번호, 성별, 입사일
SELECT SANO"사원번호"
     , SANAME"사원명"
     , JUBUN"주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) = '1' OR  WHEN SUBSTR(JUBUN, 7, 1) = '3' THEN '남자'
            WHEN SUBSTR(JUBUN, 7, 1) = '2' OR  WHEN SUBSTR(JUBUN, 7, 1) = '4' THEN '여자'
            ELSE '나도몰라'
       END"성별"
     , HIREDATE"입사일
FROM TBL_SAWON;














