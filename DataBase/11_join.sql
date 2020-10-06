-- * ����Ŭ SQL�� : ����(join)

-- [1] 'SCOTT'�� �ٹ��ϴ� �μ���, ���� ���.
--       ���ϴ� ������ �� �� �̻��� ���̺� �������� ���� �� ��� ���

select deptno
from emp
where ename = 'SCOTT';

select dname, loc
from dept
where deptno = 20;

-- [2] join

--      (1) cross join : ���̺� �� ����

select * from emp, dept;

--      (2) equi join : ���� �ٸ� ���̺��� �ǹ̸� ã�ڴ� (����� �÷� O)

select * from emp, dept
where emp.deptno = dept.deptno;

--      (2-1) 'SCOTT'�� �ٹ��ϴ� �μ���, ���� ���

select ename �����̸�, dname �μ���, loc ��ġ, emp.deptno �μ���ȣ
from emp, dept
where emp.deptno =  dept.deptno and ename = 'SCOTT';

--      (2-2) �÷��� �տ� ���̺���� ����Ͽ� �÷� �Ҽ��� ��Ȯ�� ���� �� �ִ�.

select emp.ename �����̸�, dept.dname �μ���, dept.loc ��ġ, emp.deptno �μ���ȣ
from emp, dept
where emp.deptno =  dept.deptno and emp.ename = 'SCOTT';

--      (2-3) ���̺�� ��Ī�� �� �� �÷� ���� �Ҽ� ���̺��� �����ϰ��� �� ���� �ݵ�� ���̺���� �ƴ� ��Ī���� �ٿ��� ��

select e.ename �����̸�, d.dname �μ���, d.loc ��ġ, e.deptno �μ���ȣ
from emp e, dept d
where e.deptno =  d.deptno and e.ename = 'SCOTT';

--      (3) non - equi join : ���� �ٸ� ���̺��� �ǹ̸� ã�ڴ� (����� �÷� X)

select * from tab;
select * from emp;
select * from salgrade;

select ename, sal, grade
from emp, salgrade
where sal >= losal and sal <= hisal; -- ��� ��

select ename, sal, grade
from emp, salgrade
where sal between losal and hisal; -- ��� ��

--      emp, dept, salgrade 3���� ���̺� join

select ename, sal, grade, dname
from emp, dept, salgrade
where emp.deptno = dept.deptno and  sal between losal and hisal;

--      (4) self join : �����ؾ� �� ����� �� ���̺� ���� �� �ϳ��� ���̺������� ��ġ �ΰ��� ��ó�� ���

select employee.ename, employee.mgr, manager.ename, manager.mgr
from emp employee, emp manager
where employee.mgr = manager.empno;
                                                                                                                                                                                    
--      (5) outer join : �����Ͱ� ��� �ǵ�� �ް� ���� ��

select employee.ename, employee.mgr, manager.ename, manager.mgr
from emp employee, emp manager
where employee.mgr = manager.empno(+);

-- [3] ANSI join

--      (1) Ansi Cross join 

select * from emp 
cross join dept;

--      (2) Ansi Inner join

select ename, dept.deptno, dname
from emp inner join dept
on emp.deptno = dept.deptno;

select ename, deptno, dname
from emp inner join dept
using (deptno);

select ename, dept.deptno, dname
from emp inner join dept
on emp.deptno = dept.deptno
where ename = 'SCOTT';

--      natural join

select ename, dname
from emp natural join dept;

--      (3) Ansi Outer join

create table dept10(
        deptno number(2),
        dname varchar2(14)
);

insert into dept10 values(10, 'ȸ���');
insert into dept10 values(20, '������');

select * from dept10;

create table dept11(
        deptno number(2),
        dname varchar2(14) 
);

insert into dept11 values(10, 'ȸ���');
insert into dept11 values(30, '������');

select * from dept11;

-- ���� ����Ŭ ���

select * from dept10, dept11
where dept10.deptno = dept11.deptno; -- ���� �����͸� �����ش�.

select * from dept10, dept11
where dept10.deptno = dept11.deptno(+);
                                    -- dept11.deptno(+)�� dept10.deptno�� �߰� (dept11���� 20�̾�� dept10�� �߰�)
                                    
select * from dept10, dept11
where dept10.deptno(+) = dept11.deptno; -- dept11.deptno�� �߰� (dept10���� 30�� ��� dept11�� �߰�)

select * from dept10, dept11
where dept10.deptno(+) = dept11.deptno(+); -- error

-- Ansi : ����Ŭ�� �ݴ�

select * from dept10 left outer join dept11
on dept10.deptno = dept11.deptno;

select * from dept10 right outer join dept11
on dept10.deptno = dept11.deptno;

select * from dept10 full outer join dept11
on dept10.deptno = dept11.deptno;