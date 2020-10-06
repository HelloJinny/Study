-- * ����Ŭ ��ɾ� : ���� �Լ�


-- [1] �ӽ� ������ ���

SELECT 1234*1234
FROM DUAL; -- ��Ƣ�� ���̺�

-- [2] ���� ���̺��� dual ���̺�

SELECT * FROM DUAL;

---- *** ���ڿ� ó�� ���� �Լ� ***

-- �� [3] lower() : ��� ���ڸ� �ҹ��ڷ� ��ȯ

SELECT LOWER('Hong Kil Dong') as "�ҹ���"
FROM DUAL;

-- [4] upper() : ��� ���ڸ� �빮�ڷ� ��ȯ

SELECT UPPER('Hong Kil Dong') as "�빮��"
FROM DUAL;

-- [5] initcap() : ù���ڸ� �빮�ڷ� ��ȯ

SELECT INITCAP('hong kil dong') as "ù���ڸ� �빮��"
FROM DUAL;

-- [6] concat() : ���ڿ� ����

SELECT CONCAT('������', '��ǻ�� �п�')
FROM DUAL;

-- [7] length() : ���ڿ��� ����

SELECT LENGTH('������ ��ǻ�� �п�'), LENGTH('THe Joeun Computer')
FROM DUAL;

-- [8] substr() : ���ڿ� ����(������, �ε���(1), ī��Ʈ)

SELECT SUBSTR('ȫ�浿 ����', 2, 4) -- 2��°���� 4��°���� (�����̽� ����)
FROM DUAL;

-- [9] instr() : ���ڿ� ���� ��ġ

SELECT INSTR('ȫ�浿 ����', '��')
FROM DUAL;

SELECT INSTR('seven', 'e') -- ó�� 'e' (ó���� ã���� ������ �����)
FROM DUAL;

-- [10] lpad(), rpad() : �ڸ� ä���

SELECT LPAD('Oracle', 20, '#') 
FROM DUAL;

SELECT RPAD('Oracle', 20, '*')
FROM DUAL;

-- �� [11] trim() : �÷��̳� ��� ���ڿ����� Ư�� ���ڰ� ù��° �����̰ų� ������ �����̸� �߶󳻰� ���� ���ڿ��� ��ȯ.

SELECT TRIM('a' from 'aaaOracleaaaaaaa')
FROM DUAL;

SELECT TRIM(' ' from '   Oracle     ') -- ������ �ִ� ��� ��
FROM DUAL;

---- *** ���� ó�� ���� �Լ� ***

-- [12] round() : �ݿø�(���� : �Ҽ��� �̻� �ڸ�)

SELECT ROUND(12.34567, 3)
FROM DUAL;

SELECT DEPTNO, SAL, ROUND(SAL, -3) -- ROUND �Լ��� ����, �Ǽ�, ���� ���� OK
FROM EMP
WHERE DEPTNO=30;

-- [13] abs() : ���밪

SELECT ABS(10)
FROM DUAL;

SELECT ABS(-10)
FROM DUAL;

-- [14] floor() : �Ҽ��ڸ� ������

SELECT FLOOR(12.34567)
FROM DUAL;

SELECT FLOOR(-12.34567)
FROM DUAL;

-- [15] trunc() : Ư�� �ڸ� �ڸ���

SELECT TRUNC(12.34567, 3)
FROM DUAL;

-- [16] mod() : ������

SELECT MOD(8, 5)
FROM DUAL;

---- *** ��¥ ó�� ���� �Լ� ***

-- [17] sysdate : ��¥

SELECT SYSDATE
FROM DUAL;

-- [18] months_between() : ���� �� ���ϱ�

select ename, hiredate, months_between(sysdate, hiredate) "�ٹ� ���� �� ", deptno
from emp
where deptno = 10;

-- [19] add_months() : ���� �� ���ϱ�

select add_months(sysdate, 200)
from dual;

select add_months(sysdate, -200) -- 200���� ���� ��¥
from dual;

-- [20] next_day() : �ٰ��� ���Ͽ� �ش��ϴ� ��¥

select next_day(sysdate, '�Ͽ���')
from dual;

-- [21] last_day() : �ش� ���� ������ �� ��

select last_day(sysdate)
from dual;

-- �� [22] to_char() : ���ڿ��� ��ȯ

select to_char(sysdate, 'yyyy/mm/dd')
from dual;

-- �� [23] to_date() : ��¥��(date)���� ��ȯ

select to_date('2009/12/31', 'yyyy/mm/dd')
from dual;

---- ***��Ÿ ***

-- [24] nvl() : null�� �����͸� �ٸ� �����ͷ� ����

select ename, comm, nvl(comm, 0)
from emp;

-- [25] decode() : switch���� ���� ���

select ename, deptno, decode(deptno, 10, 'ACCOUNT',
                                                            20, 'RESEARCH',
                                                            30, 'SALES',
                                                            40, 'OPERATIONS') as "�μ� ����"
from emp;

-- [26] case ~ end~ : if ~ else if ~

select ename, deptno, case
                                            when deptno = 10 then 'ACCOUNT'
                                            when deptno = 20 then 'RESEARCH'
                                            when deptno = 30 then 'SALES'
                                            when deptno = 40 then 'OPERATIONS'
                                    end as "�μ���"
from emp;

