-- * ����Ŭ ��ɾ� : Group �Լ�

-- [1] sum() : �հ�

SELECT SUM(SAL) "�ѱ޿�"
FROM EMP;

-- [2]  count() : ī��Ʈ

SELECT COUNT(*)
FROM EMP;

SELECT COUNT(*)
FROM DEPT;

-- [3] avg() : ���

SELECT AVG(SAL) "��� �޿�"
FROM EMP;

-- [4] max() : �ִ밪

SELECT MAX(SAL) "�ְ� �޿� ������"
FROM EMP;

-- [5] min() : �ּҰ�

SELECT MIN(SAL) "���� �޿� ������"
FROM EMP;

-- [6] Group by �� : ������ �޿� ���

SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB;

-- [7] Having �� : ������ �޿� ��� (��, �޿� ��� 2000 �̻� ���� )

SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) >= 2000;