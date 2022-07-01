SELECT USER
FROM DUAL;
--==>> HR


--�� %TYPE

-- 1. Ư�� ���̺� ���ԵǾ� �ִ� �÷��� ������Ÿ��(�ڷ���)�� �����ϴ� ������Ÿ��

-- 2. ���� �� ����
-- ������ ���̺��.�÷���%TYPE [:= �ʱⰪ];

SET SERVEROUTPUT ON;

-- HR.EMPLOYEES ���̺��� Ư�� �����͸� ������ ����

DECLARE
    --V_NAME VARCHAR(20);
    V_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO V_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
--==>>
/*
Alexander


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� EMPLOYEES ���̺��� ������� 108�� ���(Nancy)��
--   SALARY �� ������ ��� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
DECLARE
    V_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT SALARY INTO V_SALARY
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 108;
    
    DBMS_OUTPUT.PUT_LINE(V_SALARY);
END;
--==>>
/*
12008


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� EMPLOYEES ���̺��� Ư�� ���ڵ� �׸� �������� ������ ����
--   103�� ����� FIRST_NAME, PHONE_NUMBER, EMAIL �׸��� ������ �����Ͽ� ���
-- Alexander, 590.423.4567, AHUNOLD
/*
FIRST_NAME              VARCHAR2(20)
PHONE_NUMBER            VARCHAR2(20)
EMAIL          NOT NULL VARCHAR2(25) 
*/

DECLARE   
    --FIRST_NAME              VARCHAR2(20)
    --PHONE_NUMBER            VARCHAR2(20)
    --EMAIL                   VARCHAR2(25) 
    
    V_FIRST_NAME        EMPLOYEES.FIRST_NAME%TYPE;
    V_PHONE_NUMBER      EMPLOYEES.PHONE_NUMBER%TYPE;
    V_EMAIL             EMPLOYEES.EMAIL%TYPE;
    
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL 
            INTO V_FIRST_NAME, V_PHONE_NUMBER, V_EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME || ', ' || V_PHONE_NUMBER || ', ' || V_EMAIL);

END;
--==>>
/*
Alexander, 590.423.4567, AHUNOLD


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/



--�� %ROWTYPE

-- 1. ���̺��� ���ڵ�� ���� ������ ����ü ������ ����(���� ���� �÷�)

-- 2. ���� �� ����
-- ������ ���̺��%ROWTYPE;

DECLARE     
    --V_FIRST_NAME        EMPLOYEES.FIRST_NAME%TYPE;
    --V_PHONE_NUMBER      EMPLOYEES.PHONE_NUMBER%TYPE;
    --V_EMAIL             EMPLOYEES.EMAIL%TYPE;
    
    V_EMP       EMPLOYEES%ROWTYPE;
    
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL 
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    --DBMS_OUTPUT.PUT_LINE(V_FIRST_NAME || ', ' || V_PHONE_NUMBER || ', ' || V_EMAIL);
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME || ', ' || V_EMP.PHONE_NUMBER || ', ' || V_EMP.EMAIL);
    
END;
--==>>
/*
Alexander, 590.423.4567, AHUNOLD


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� EMPLOYEES ���̺��� ��ü ���ڵ� �׸� �������� ������ ����
--   ��� ����� FIRST_NAME, PHONE_NUMBER, EMAIL �׸��� ������ �����Ͽ� ���
DECLARE       
    V_EMP       EMPLOYEES%ROWTYPE;    
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL 
            INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES;
    
     DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME || ', ' || V_EMP.PHONE_NUMBER || ', ' || V_EMP.EMAIL);
    
END;
--==>> ���� �߻�
--     (ORA-01422: exact fetch returns more than requested number of rows)

--> ���� ���� ��(ROWS) ������ ���� �������� �ϸ�
--  ������ �����ϴ� �� ��ü�� �Ұ���������.























