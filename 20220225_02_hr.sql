SELECT USER
FROM DUAL;
--==>> HR


--�� �� �� �̻��� ���̺� ����(JOIN)

-- ���� 1. (SQL 1992 CODE)
SELECT ���̺���1.�÷���, ���̺���2.�÷���, ���̺���3.�÷���
FROM ���̺���1, ���̺���2, ���̺���3
WHERE ���̺���1.�÷���1 = ���̺���2.�÷���1
  AND ���̺���2.�÷���2 = ���̺���3.�÷���2;


-- ���� 2. (SQL 1999 CODE)

SELECT ���̺���1.�÷���, ���̺���2.�÷���
FROM ���̺���1 JOIN ���̺���2
ON ���̺���1.�÷���1 = ���̺���2.�÷���1
              JOIN ���̺���3
                ON ���̺���2.�÷���2 = ���̺���3.�÷���2;
                
--�� HR ���� ������ ���̺� �Ǵ� �� ��� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
COUNTRIES	        TABLE	
DEPARTMENTS	        TABLE	
EMPLOYEES	        TABLE	
EMP_DETAILS_VIEW	VIEW	--
JOBS	            TABLE	
JOB_HISTORY	        TABLE	
LOCATIONS	        TABLE	
REGIONS	            TABLE	
*/

--�� HR.JOB, HR.EMPLOYEES, HR.DEPARTMENTS ���̺��� ������� �������� �����͸�
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME �׸����� ��ȸ�Ѵ�.
--   ----------  ---------  ---------  ----------------
--   EMPLOYEES   EMPLOYEES  JOBS       DEPARTMENTS
SELECT *
FROM DEPARTMENTS;
-- DEPARTMENT_ID        -- ���� �÷�
SELECT *
FROM EMPLOYEES;
-- JOB_ID               -- ���� �÷�
SELECT *
FROM JOBS;

SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT COUNT(*)
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--==>> 106

SELECT COUNT(*)
FROM EMPLOYEES;
--==>> 107

SELECT COUNT(*)
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
--==>> 107

SELECT E.FIRST_NAME, E.LAST_NAME, JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        JOIN JOBS J
        ON E.JOB_ID = J.JOB_ID;

SELECT COUNT(*)
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        JOIN JOBS J
        ON E.JOB_ID = J.JOB_ID;
--==>> 107

SELECT E.FIRST_NAME, E.LAST_NAME, JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        JOIN JOBS J
        ON E.JOB_ID = J.JOB_ID;


--�� EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES, REGIONS ���̺��� �������
--   �������� �����͸� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
--   FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME

-- ����1. SQL 1992 CODE
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
     , L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND E.JOB_ID = J.JOB_ID
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);

-- ����2. SQL 1999 CODE
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
     , L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
   JOIN JOBS J
   ON E.JOB_ID = J.JOB_ID
      JOIN LOCATIONS L
      ON L.LOCATION_ID = D.LOCATION_ID
         JOIN COUNTRIES C
         ON C.COUNTRY_ID = L.COUNTRY_ID
            JOIN REGIONS R
            ON R.REGION_ID = C.REGION_ID;