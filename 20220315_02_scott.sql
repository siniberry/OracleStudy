SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 패키지 활용 실습
SELECT INSA_PACK.FN_GENDER('751212-1234567')"함수호출결과"
FROM DUAL;
--==>> 남자

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN)"함수호출"
FROM TBL_INSA;
--==>>
/*

*/







































