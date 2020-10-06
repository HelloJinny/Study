-- * ����Ŭ ��ɾ� : select�� (�˻�)

-- [1] scott ����ڰ� �����ϴ� ���̺� ���

SELECT * FROM TAB;

-- [2] Ư�� ���̺��� ���� (�ʵ� ����Ʈ / ������ ���� / �������� )

DESC DEPT;

-- [3] Ư�� ���̺��� data ǥ��

SELECT * FROM DEPT;

SELECT * FROM EMP;

-- [4] ��� �÷� (�ʵ��)�� �ƴ� , �ʿ��� �÷� (�ʵ��) ���븸 ���

SELECT DNAME, LOC
FROM DEPT;

-- [5] ������ �ʵ�� ��Ī�� �־ ��� : as ���� ����

SELECT DEPTNO as �μ���ȣ, DNAME as �μ���, LOC as ��ġ -- �� 
FROM DEPT;

-- cf)
SELECT DEPTNO as �μ� ��ȣ, DNAME as �μ���, LOC as �� ġ -- error : ���� X ("as �μ�" ������ �ν�)
FROM DEPT; 
SELECT DEPTNO as "�μ� ��ȣ", DNAME as "�μ���", LOC as "�� ġ" -- �� ū ����ǥ O
FROM DEPT;
SELECT DEPTNO as '�μ� ��ȣ', DNAME as '�μ���', LOC as '�� ġ' -- error : ���� ����ǥ X
FROM DEPT;
SELECT DEPTNO  "�μ� ��ȣ", DNAME "�μ���", LOC "�� ġ" -- �� AS ���� O
FROM DEPT;

SELECT EMPNO "��� ��ȣ", ENAME "��� �̸�", JOB "��� ����", MGR "��� ��ȣ", HIREDATE "�Ի���", SAL "�޿�", COMM "Ŀ�̼�", DEPTNO "�μ� ��ȣ"  -- MGR "�ش� ����� ��� ��� ��ȣ" : �̸��� �ʹ� ��� error
FROM EMP;

-- [6] ������� �������� �ߺ� ���� �� ���

SELECT * FROM EMP;

SELECT JOB 
FROM EMP;

SELECT DISTINCT JOB -- �ߺ� ����
FROM EMP;

-- [7] �޿��� 3000 �̻��� ��� ���� ���

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >=3000;

-- [8] �̸��� scott ����� ���� ���

SELECT * FROM EMP
WHERE ENAME='scott'; -- X : DATA�� ���� ��/�ҹ��ڸ� �����ؾ� ��

SELECT * FROM EMP
WHERE ENAME='SCOTT';

-- [9] 1985 �⵵ ���ķ� �Ի��� ��� ����

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= '1985/01/01';

-- [10] �μ���ȣ�� 10�̰�, �׸��� ������ 'MANAGER'�� ��� ���

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO=10 AND JOB='MANAGER';

-- [11] �μ���ȣ�� 10�̰ų�, ������ 'MANAGER'�� ��� ���

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO=10 OR JOB='MANAGER';

-- [12] �μ���ȣ�� 10�� �ƴ� ��� (�켱���� : ��� ������ / �� ������ > �� ������)

SELECT ENAME, DEPTNO
FROM EMP
WHERE NOT (DEPTNO=10); -- �� �� ������

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO <> 10; -- �� �� ������

-- [13] �޿��� 1000 ~ 3000 ������ ����� ���

SELECT ENAME, SAL
FROM EMP
WHERE SAL >= 1000 AND SAL <= 3000; -- �� �� ������

-- [14] �޿��� 1300 �Ǵ� 1500 �Ǵ� 1600�� ��� ���� ���

SELECT ENAME, SAL
FROM EMP
WHERE SAL=1300 OR SAL=1500 OR SAL=1600; -- �� �� ������

SELECT ENAME, SAL
FROM EMP
WHERE SAL IN (1300, 1500, 1600); -- ��

-- [15] �̸��� 'K'�� �����ϴ� ��� ���

SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE 'K%';

-- [16] �̸��� 'K'�� ������ ��� ���

SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '%K';

-- [17] �̸��� 'K'�� ���ԵǾ� �ִ� ��� ���

SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '%K%';

-- [18] 2��° �ڸ��� 'A'�� �� �ִ� ��� ���

SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '_A%';

-- [19] Ŀ�̼��� ���� �ʴ� ��� ���

SELECT * FROM EMP
WHERE COMM = NULL OR COMM = 0; -- ���ϴ� ��� X (���/��/�� ������ X)

SELECT * FROM EMP
WHERE COMM IS NULL OR COMM=0 ;

-- [20] Ŀ�̼��� �޴� ��� ���

SELECT * FROM EMP
WHERE COMM <> NULL AND COMM <> 0;  -- ���ϴ� ��� X (���/��/�� ������ X)

SELECT * FROM EMP
WHERE COMM IS NOT NULL AND COMM <> 0;

-- [21] ����� ����(��������)���� ���

SELECT * FROM EMP
ORDER BY EMPNO ASC; -- ASC ���� ���� (default)

-- [22] ����� ����(��������)���� ���

SELECT * FROM EMP
ORDER BY EMPNO DESC;

-- [23] ����� ���� ���

SELECT ENAME "��� �̸�", SAL "�޿�", (SAL * 12) "����"
FROM EMP;

SELECT ENAME "��� �̸�", SAL "�޿�", (SAL * 12) "����"
FROM EMP
ORDER BY (SAL * 12) DESC; -- �� �������� : ����� ������ ����� �������� ��Ī�� ���� ���� ��Ī���� ���ֱ�!!! 

SELECT ENAME "��� �̸�", SAL "�޿�", (SAL * 12) "����"
FROM EMP
ORDER BY "����" DESC; -- �� �������� O

SELECT ENAME "��� �̸�", SAL "�޿�", (SAL * 12) "����"
FROM EMP
ORDER BY (SAL * 12) "����" DESC; -- �� error

-- [24] Ŀ�̼��� ������ ���� ���� ���

SELECT ENAME "��� �̸�", SAL "�޿�", COMM "Ŀ�̼�", (SAL * 12 + COMM) "���� ����"
FROM EMP;

-- [25] [24]�� ���� �ذ��

SELECT ENAME "��� �̸�", SAL "�޿�", COMM "Ŀ�̼�", (SAL * 12 + COMM) "���� ����", NVL(COMM, 0), SAL * 12 + NVL(COMM, 0) "����"
-- NVL(COMM, 0) : COMM�� NULL ���� ã�Ƽ� 0���� ä���� �����ش�. �����͸� �������ִ� ����� �ƴ�
FROM EMP;

