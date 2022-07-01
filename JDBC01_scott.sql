SELECT USER
FROM DUAL;
--==>> SCOTT

--�� �ǽ� ���̺� ����
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR(30)
, TEL   VARCHAR(60)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.

--�� ���õ����� �Է�
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(1, 'ȫ�浿', '010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_MEMBER;
--==>> 1	ȫ�浿	010-1111-1111


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
