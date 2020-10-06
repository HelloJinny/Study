-- * ����Ŭ - �� (View)

-- [1] ���� �׽�Ʈ�� ���̺� ����
--      (1) DEPT ���̺��� ������ DEPT_COPY ���̺��� ����

create table dept_copy 
as
select * from dept;

--      (2) EMP ���̺��� ������ EMP_COPY ���̺��� ����

create table emp_copy
as
select * from emp;

-- [2] �� (View) �����ϱ�
--      �� �並 �����ϱ� ���ؼ��� create view�� ������.
--      �� as ������ ��ġ ������������ ������
--      �� ���������� �츮�� ���ݱ��� ����Ͽ��� select ���� ����ϸ� ��

-- [����] ���� 30�� �μ��� �Ҽӵ� ������� ����� �̸��� �μ���ȣ�� ���� �˻��Ѵٰ� �ϸ� 

select empno, ename, deptno
from emp_copy
where deptno = 30;

--      �� ���� ���� ����� ����ϱ� ���ؼ� �Ź� select ���� �Է��ϱ�� ���� ���ŷο� ���� �ƴ� �� ����.
--      �� ��� �̿Ͱ��� ���ŷο� select  ���� �Ź� �Է��ϴ� ��� ���� ���� ���ϴ�  ����� ����� �ϴ� �ٷ����� ����� ����.


-- [view�� ������ �� �ִ� ���� �ο�]
--      �� dos command â���� sqlplus�� ����

SQL>sqlplus system/admin1234
SQL>show user
SQL>grant create view to scott; -- scott �������� ������ �ο�


create view emp_view30
as
select empno, ename, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;
desc emp_view30; -- �����͸� ����� �� ���Ἲ ���� ���Ǳ����� ���簡 ���� �ʴ´�.
desc emp; 

--  [����] �⺻ ���̺��� emp_copy�� �մϴ�.
--           20�� �μ��� �Ҽӵ� ������� ����� �̸�, �μ���ȣ, ����� ����� ����ϱ� ����
--           select ���� emp_view20 �̶�� �̸��� ��� ������ ������.
create or replace view emp_view20
as
select empno, ename, deptno, mgr
from emp_copy
where deptno = 20;

select * from emp_view20;

-- [3] ���� ���� ������ user_viesw ������ ��ųʸ�

desc user_views;
select view_name, text from user_views;

-- [4] ���� ���� ����
--      1. ����ڰ� �信 ���ؼ� ���Ǹ� �ϸ� user_views���� �信 ���� ���Ǹ� ��ȸ�Ѵ�.
--      2. �⺻ ���̺� ���� ���� ���� ������ ���ɴ�.
--      3. �信 ���� ���Ǹ� �⺻ ���̺� ���� ���Ƿ� ��ȯ
--      4. �⺻ ���̺� ���� ���Ǹ� ���� �����͸� �˻�
--      5. �˻��� ����� ����Ѵ�.

-- �� ���� ���� ����� �� �䰡 � �ǹ̸� ������ �ִ��� ��

-- [5] ��� �⺻ ���̺� ���� �ľ�
--      1) �並 ���� ������ ������ ����?

insert into emp_view30
values (8000, 'ANGEL', 30);

select * from emp_view30;
select * from emp_copy;

-- [6] �並 ����ϴ� ����? - PDF ����
--      �����ϰ� �� �������� ��� �����ϸ� ������ �ܼ�ȭ ��ų �� �ִ�.
--      ���ȿ� �����ϴ� : ����ڸ��� Ư�� ��ü�� ��ȸ�� �� �ֵ��� ������ �ο��� �� �ֱ� ����.

-- [����] �λ�� ��

create view emp_view
as
select empno, ename, job, hiredate, deptno
from emp_copy;

-- [7] ���� Ư¡
--      1) �ܼ� �信 ���� ������ ����

insert into emp_view30
values (8010, 'CHEOLSOO', 30);

select * from emp_view30;

select * from emp_copy;

--      2) �ܼ� ���� �÷��� ��Ī �ο��ϱ�

create view emp_view_copy(�����ȣ, �����, �޿�, �μ���ȣ)
as
select empno, ename, sal, deptno
from emp_copy;

select * from emp_view_copy;

select * from emp_view_copy;
where deptno = 30; -- error 

select * from emp_view_copy;
where �μ���ȣ = 30; -- ��Ī�� ���������� ��Ī���� ����

--      3) �׷� �Լ��� ����� �ܼ���

create view  view_sal
as
select deptno, sum(sal), avg(sal)
from emp_copy
group by deptno; -- error : deptno �÷� O, sum(sal)�̶� avgsal)�� �÷� X

create view  view_sal
as
select deptno, sum(sal) as "�޿� ��", avg(sal)  as "�޿� ���" -- ��Ī�� �������ش�.
from emp_copy
group by deptno;

select * from view_sal;

-- ����)

create view view_sal_year
as
select ename, sal * 12 "����"
from emp_copy;
`
select * from view_sal_year;

insert into view_sal_year
values('male', 1200); -- error : �⺻ ���̺� ����Ǿ�� �ϴµ�, �⺻ ���̺��� �����̶�� �÷��� ����.

--      4) ���պ�

select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where e.deptno = d.deptno
order by empno desc;

create view emp_view_dept
as
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where e.deptno = d.deptno
order by empno desc;

select * from emp_view_dept;

-- [8] �� ����

drop view emp_view_dept;

-- [9] �� ������ ���Ǵ� �پ��� �ɼ� (or replace) : �� ������ �ٿ��� �ϴ°� �Ϲ� ���̴�.

create or replace view emp_view30 
as
select empno, ename, comm, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;

-- [10] �� ������ ���Ǵ� �پ��� �ɼ� (force / noforce)

desc employees;
select * from employees;

create or replace view employees_view
as
select empno, ename, deptno
from employees
where deptno = 30; -- error

create or replace force view employees_view
as
select empno, ename, deptno
from employees
where deptno = 30;

select view_name, text
from user_views;

insert into employees_view
values(8020, '�̼���', 30);

-- [11] �� ������ ���Ǵ� �پ��� �ɼ� (with check option)

create or replace view emp_view30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30;

-- [����]  30�� �μ��� �Ҽӵ� ��� �߿� �޿��� 1200 �̻��� ����� 20�� �μ��� �̵� ���� ������.

update emp_view30
set deptno = 20
where sal >= 1200; -- ���� ����� �����ϴ� ��쿡�� ���� �߻�

create or replace view view_chk30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30  with check option;

select * from view_chk30;

update view_chk20
set deptno = 20
where sal >= 900; -- error


-- with read only ������ : �並 ������ �� �������� ������ �÷��� �ƴ� �÷��� ���ؼ��� ������ ����

update view_chk30 -- with check option
set comm = 1000 ;


-- [12] �� ������ ���Ǵ� �پ��� �ɼ� (with read only) 

create table emp_copy03
as
select * from emp;

create or replace view view_check30
as
select empno, ename, sal, comm, deptno
from emp_copy03
where deptno = 30;

update view_check30
set comm = 1000;

select * from view_check30;

select * from emp_copy03;

create or replace view view_read30
as
select empno, ename, sal, comm, deptno
from emp_copy03
where deptno = 30 with read only;

select * from view_read30;

update view_read30
set comm = 2000; -- error

-- [13] Top ����

-- [rownum] �÷� �� ���           

select rownum, empno, ename, hiredate
from emp;

select rownum, empno, ename, hiredate
from emp
order by hiredate;

create or replace view view_hire
as
select empno, ename, hiredate
from emp
order by hiredate;

select * from view_hire;

select rownum, empno, ename, hiredate
from view_hire;

--      [1] rownum�� �̿�

select rownum, empno, ename, hiredate
from view_hire
where rownum <= 5;

-- [����] �Ի��� �������� 3��°  ~ 7��° ���̿� �Ի��� ����� ����غ�����.

select rnum, empno, ename, hiredate -- ����ٰ�  rownum�� ����ϰ�; ��Ī�� ���� �Ŵ�.
from    (select rownum rnum, empno, ename, hiredate -- ��Ī���� �ۿ��� ������ �� �ִ�.
            from view_hire) -- �� �ζ��� �� 
where (rnum >= 3) and ( rnum <= 7 ); 

select rnum, empno, ename, hiredate 
from    (select rownum rnum, empno, ename, hiredate 
            from (select empno, ename, hiredate
                      from emp
                      order by hiredate)) -- �� �ζ��� ��
where (rnum >= 3) and ( rnum <= 7 );

--      [2] inline view (�ζ��� ��)�� �̿�

select rownum, empno, ename, hiredate
from (select empno, ename, hiredate 
          from emp
          order by hiredate)
where rownum <= 5;

-- ������ [����] ��� �߿��� �޿��� ���� ���� �޴� ��� 7���� ����ϴ� ��ɹ��� �ζ��� �並 �̿��ؼ� ������ ������.

select rnum, empno, ename, sal
from    (select rownum rnum, empno, ename, sal
            from view_hire)
where rnum <= 7; 

-- ������ [����] �Ի����� �������� ������������ ������ �ؼ� 5�� 10 ������ �����ϴ� ����� ����� �غ�����.

select rownum, empno, ename, hiredate
from view_hiredate
where rownum 5 between 10
order by hiredeate desc;