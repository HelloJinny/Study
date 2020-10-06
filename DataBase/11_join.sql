-- * 오라클 SQL문 : 조인(join)

-- [1] 'SCOTT'이 근무하는 부서명, 지역 출력.
--       원하는 정보가 두 개 이상의 테이블에 나뉘어져 있을 때 결과 출력

select deptno
from emp
where ename = 'SCOTT';

select dname, loc
from dept
where deptno = 20;

-- [2] join

--      (1) cross join : 테이블 간 결합

select * from emp, dept;

--      (2) equi join : 서로 다른 테이블에서 의미를 찾겠다 (공통된 컬럼 O)

select * from emp, dept
where emp.deptno = dept.deptno;

--      (2-1) 'SCOTT'이 근무하는 부서명, 지역 출력

select ename 직원이름, dname 부서명, loc 위치, emp.deptno 부서번호
from emp, dept
where emp.deptno =  dept.deptno and ename = 'SCOTT';

--      (2-2) 컬럼명 앞에 테이블명을 기술하여 컬럼 소속을 명확히 밝힐 수 있다.

select emp.ename 직원이름, dept.dname 부서명, dept.loc 위치, emp.deptno 부서번호
from emp, dept
where emp.deptno =  dept.deptno and emp.ename = 'SCOTT';

--      (2-3) 테이블명에 별칭을 준 후 컬럼 옆에 소속 테이블을 지정하고자 할 때는 반드시 테이블명이 아닌 별칭으로 붙여야 함

select e.ename 직원이름, d.dname 부서명, d.loc 위치, e.deptno 부서번호
from emp e, dept d
where e.deptno =  d.deptno and e.ename = 'SCOTT';

--      (3) non - equi join : 서로 다른 테이블에서 의미를 찾겠다 (공통된 컬럼 X)

select * from tab;
select * from emp;
select * from salgrade;

select ename, sal, grade
from emp, salgrade
where sal >= losal and sal <= hisal; -- 방법 ①

select ename, sal, grade
from emp, salgrade
where sal between losal and hisal; -- 방법 ②

--      emp, dept, salgrade 3개의 테이블 join

select ename, sal, grade, dname
from emp, dept, salgrade
where emp.deptno = dept.deptno and  sal between losal and hisal;

--      (4) self join : 참조해야 할 결과가 내 테이블에 있을 때 하나의 테이블이지만 마치 두개인 것처럼 사용

select employee.ename, employee.mgr, manager.ename, manager.mgr
from emp employee, emp manager
where employee.mgr = manager.empno;
                                                                                                                                                                                    
--      (5) outer join : 데이터가 없어도 피드백 받고 싶을 때

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

insert into dept10 values(10, '회계부');
insert into dept10 values(20, '연구소');

select * from dept10;

create table dept11(
        deptno number(2),
        dname varchar2(14) 
);

insert into dept11 values(10, '회계부');
insert into dept11 values(30, '영업부');

select * from dept11;

-- 기존 오라클 방법

select * from dept10, dept11
where dept10.deptno = dept11.deptno; -- 같은 데이터만 보여준다.

select * from dept10, dept11
where dept10.deptno = dept11.deptno(+);
                                    -- dept11.deptno(+)는 dept10.deptno에 추가 (dept11에는 20이없어서 dept10에 추가)
                                    
select * from dept10, dept11
where dept10.deptno(+) = dept11.deptno; -- dept11.deptno에 추가 (dept10에는 30이 없어서 dept11에 추가)

select * from dept10, dept11
where dept10.deptno(+) = dept11.deptno(+); -- error

-- Ansi : 오라클과 반대

select * from dept10 left outer join dept11
on dept10.deptno = dept11.deptno;

select * from dept10 right outer join dept11
on dept10.deptno = dept11.deptno;

select * from dept10 full outer join dept11
on dept10.deptno = dept11.deptno;