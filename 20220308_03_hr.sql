SELECT USER
FROM DUAL;
--==>> HR

SELECT *
FROM EMPLOYEES;

DESC EMPLOYEES;
--==>>
/*
            :
EMPLOYEE_ID    NOT NULL NUMBER(6)    
            :
*/


DESC EMPLOYEES;
/*
FIRST_NAME              VARCHAR2(20)
PHONE_NUMBER            VARCHAR2(20)
EMAIL          NOT NULL VARCHAR2(25) 
*/



SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES
WHERE EMPLOYEE_ID=206;
/*
100	Steven	515.123.4567	SKING
101	Neena	515.123.4568	NKOCHHAR
102	Lex	515.123.4569	LDEHAAN

            :
            
206	William	515.123.8181	WGIETZ
*/
