-- * ����Ŭ SQL�� : ��������(Sub_Query)��

-- [ ������ �������� ]

-- [����] scott�� �ٹ��ϴ� �μ���, ���� ��� (���� �ٸ� ���̺� ������ ����)

select  deptno
from emp
where ename ='SCOTT';

select dname, loc
from dept
where deptno = 20;

select dname, loc
from dept
where deptno = ( select  deptno
                           from emp
                           where ename ='SCOTT'); 
                           
-- [����] scott�� ������ ����(job)�� ���� ����� ����ϴ� sql���� ���������� �̿��ؼ� �ۼ��� ������.

select ename, job
from emp
where job = ( select job
                     from emp
                     where ename = 'SCOTT');
                          
-- [����] scott�� �޿��� �����ϰų� �� ���̹޴� ��� �̸��� �޿��� ����غ�����.

select ename, job, sal
from emp
where sal >= (select sal
                    from emp
                    where ename = 'SCOTT')
order by sal;

-- [����] ��ü ��� ��� �޿����� �� ���� �޿��� �޴� ����� ����ϼ���.

select ename �����̸�, sal �޿�
from emp
where sal > (select avg(sal)
                    from emp);

-- [ ������ �������� ]

-- (1) [in ������] : ���� ������ ������('=' �����ڷ� ���� ���)�� ���������� ��� �߿��� �ϳ��� ��ġ�ϸ� ���̴�.

-- [����] �޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ������ ����ϼ���.

select ename, sal, deptno
from emp
where deptno = (select deptno
                        from emp
                        where sal >= 3000); -- error

select ename, sal, deptno
from emp
where deptno in (select deptno
                        from emp
                        where sal >= 3000);
                        
-- [����] in �����ڸ� �̿��Ͽ� �μ����� ���� �޿��� ���� �޴� ����� ����(�����ȣ, �����, �޿� ,�μ���ȣ)�� ����ϼ���.

select empno "�����ȣ", ename "�����", sal "�޿�", deptno "�μ���ȣ"
from emp
where sal IN ( select max(sal)
                      from emp
                      group by deptno);
                      
-- (2) [all ������] : all�� '��� �� �� ���� ũ��?' �� ���� ���� �ǹǷ� �ִ밪���� �� ũ�� ���� �ȴ�.

-- [����] 30��(�μ���ȣ) �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ����ϼ���.

--      [������ �������� & �׷��Լ�]

select ename, sal
from emp
where sal > (select max(sal)
                   from emp
                   where deptno = 30);
                     
--      [������ ��������]

select ename, sal
from emp
where sal >all (select sal
                        from emp
                        where deptno = 30);
                        
-- [����] ��������麸�� �޿��� ���� �޴� ������� �̸��� �޿��� ����ϵ� ��������� ������� �ʰ� ��ɹ��� �ۼ��� ������.

select empno, ename, sal ,deptno, job
from emp
where sal > ALL ( select sal
                            from emp
                            where job = 'SALESMAN')
          and job <> 'SALESMAN';
          
-- (3) [any ������] : ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �ȴ�. ã���� ������ �ּҰ� ���� ũ�� ���� �ȴ�.

-- [����] �μ���ȣ�� 30���� ������� �޿� �߿��� ���� ���� �޿����� ���� �޿��� �޴� ����� �̸�, �޿��� ����ϴ� ��ɹ��� �ۼ��� ������.

--      [������ �������� & �׷��Լ�]

select ename �����, sal �޿�
from emp
where sal > ( select min(sal)
                            from emp
                            where deptno = 30);
                                             
--      [������ ��������]

select ename �����, sal �޿�
from emp
where sal > ANY ( select sal
                            from emp
                            where deptno = 30);

--  ������ [����] ���� ������� �ּ� �޿����� ���� �޴� ������� �̸��� �޿��� ������ ����ϵ� ���� ����� ������� �ʽ��ϴ�.

select empno, ename, sal ,deptno, job
from emp
where sal > ANY  ( select sal
                            from emp
                            where job = 'SALESMAN')
          and job <> 'SALESMAN';