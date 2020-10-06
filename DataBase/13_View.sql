-- * 오라클 - 뷰 (View)

-- [1] 뷰의 테스트용 테이블 생성
--      (1) DEPT 테이블을 복사한 DEPT_COPY 테이블을 생성

create table dept_copy 
as
select * from dept;

--      (2) EMP 테이블을 복사한 EMP_COPY 테이블을 생성

create table emp_copy
as
select * from emp;

-- [2] 뷰 (View) 정의하기
--      · 뷰를 생성하기 위해서는 create view로 시작함.
--      · as 다음은 마치 서브쿼리문과 유사함
--      · 서브쿼리는 우리가 지금까지 사용하였던 select 문을 기술하면 됨

-- [예시] 만일 30번 부서에 소속된 사원들의 사번과 이름과 부서번호를 자주 검색한다고 하면 

select empno, ename, deptno
from emp_copy
where deptno = 30;

--      · 위와 같이 결과를 출력하기 위해서 매번 select 문을 입력하기란 여긴 번거로운 일이 아닐 수 없음.
--      · 뷰는 이와같이 번거로운 select  문을 매번 입력하는 대신 보다 쉽게 원하는  결과를 얻고자 하는 바램에서 출발한 개념.


-- [view를 생성할 수 있는 권한 부여]
--      · dos command 창에서 sqlplus로 연결

SQL>sqlplus system/admin1234
SQL>show user
SQL>grant create view to scott; -- scott 계정에게 권한을 부여


create view emp_view30
as
select empno, ename, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;
desc emp_view30; -- 데이터만 복사될 뿐 무결성 제약 조건까지는 복사가 되지 않는다.
desc emp; 

--  [문제] 기본 테이블은 emp_copy로 합니다.
--           20번 부서에 소속된 사원들의 사번과 이름, 부서번호, 상관의 사번을 출력하기 위한
--           select 문을 emp_view20 이라는 이름의 뷰로 정의해 보세요.
create or replace view emp_view20
as
select empno, ename, deptno, mgr
from emp_copy
where deptno = 20;

select * from emp_view20;

-- [3] 뷰의 내부 구조와 user_viesw 데이터 딕셔너리

desc user_views;
select view_name, text from user_views;

-- [4] 뷰의 동작 원리
--      1. 사용자가 뷰에 대해서 질의를 하면 user_views에서 뷰에 대한 정의를 조회한다.
--      2. 기본 테이블에 대한 뷰의 접근 권한을 살핀다.
--      3. 뷰에 대한 질의를 기본 테이블에 대한 질의로 변환
--      4. 기본 테이블에 대한 질의를 통해 데이터를 검색
--      5. 검색된 결과를 출력한다.

-- ★ 뷰의 생성 방법과 그 뷰가 어떤 의미를 가지고 있는지 ★

-- [5] 뷰와 기본 테이블 관계 파악
--      1) 뷰를 통한 데이터 저장이 가능?

insert into emp_view30
values (8000, 'ANGEL', 30);

select * from emp_view30;
select * from emp_copy;

-- [6] 뷰를 사용하는 이유? - PDF 참조
--      복잡하고 긴 쿼리문을 뷰로 정의하면 접근을 단순화 시킬 수 있다.
--      보안에 유리하다 : 사용자마다 특정 객체만 조회할 수 있도록 권한을 부여할 수 있기 때문.

-- [예시] 인사과 뷰

create view emp_view
as
select empno, ename, job, hiredate, deptno
from emp_copy;

-- [7] 뷰의 특징
--      1) 단순 뷰에 대한 데이터 조작

insert into emp_view30
values (8010, 'CHEOLSOO', 30);

select * from emp_view30;

select * from emp_copy;

--      2) 단순 뷰의 컬럼에 별칭 부여하기

create view emp_view_copy(사원번호, 사원명, 급여, 부서번호)
as
select empno, ename, sal, deptno
from emp_copy;

select * from emp_view_copy;

select * from emp_view_copy;
where deptno = 30; -- error 

select * from emp_view_copy;
where 부서번호 = 30; -- 별칭을 지정했으먄 별칭으로 접근

--      3) 그룹 함수를 사용한 단순뷰

create view  view_sal
as
select deptno, sum(sal), avg(sal)
from emp_copy
group by deptno; -- error : deptno 컬럼 O, sum(sal)이랑 avgsal)는 컬럼 X

create view  view_sal
as
select deptno, sum(sal) as "급여 합", avg(sal)  as "급여 평균" -- 별칭을 지정해준다.
from emp_copy
group by deptno;

select * from view_sal;

-- 주의)

create view view_sal_year
as
select ename, sal * 12 "연봉"
from emp_copy;
`
select * from view_sal_year;

insert into view_sal_year
values('male', 1200); -- error : 기본 테이블에 저장되어야 하는데, 기본 테이블에는 연봉이라는 컬럼이 없다.

--      4) 복합뷰

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

-- [8] 뷰 삭제

drop view emp_view_dept;

-- [9] 뷰 생성에 사용되는 다양한 옵션 (or replace) : 뷰 생성시 붙여서 하는게 일반 적이다.

create or replace view emp_view30 
as
select empno, ename, comm, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;

-- [10] 뷰 생성에 사용되는 다양한 옵션 (force / noforce)

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
values(8020, '이순신', 30);

-- [11] 뷰 생성에 사용되는 다양한 옵션 (with check option)

create or replace view emp_view30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30;

-- [예시]  30번 부서에 소속된 사원 중에 급여가 1200 이상인 사원은 20번 부서로 이동 시켜 보세요.

update emp_view30
set deptno = 20
where sal >= 1200; -- 여러 사람이 공유하는 경우에는 문제 발생

create or replace view view_chk30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30  with check option;

select * from view_chk30;

update view_chk20
set deptno = 20
where sal >= 900; -- error


-- with read only 차이점 : 뷰를 설정할 때 조건으로 설정한 컬럼이 아닌 컬럼에 대해서는 변경이 가능

update view_chk30 -- with check option
set comm = 1000 ;


-- [12] 뷰 생성에 사용되는 다양한 옵션 (with read only) 

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

-- [13] Top 쿼리

-- [rownum] 컬럼 값 출력           

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

--      [1] rownum을 이용

select rownum, empno, ename, hiredate
from view_hire
where rownum <= 5;

-- [문제] 입사일 기준으로 3번째  ~ 7번째 사이에 입사한 사원을 출력해보세요.

select rnum, empno, ename, hiredate -- 여기다가  rownum을 사용하고싶어서 별칭을 쓰는 거다.
from    (select rownum rnum, empno, ename, hiredate -- 별칭으로 밖에서 접근할 수 있다.
            from view_hire) -- ① 인라인 뷰 
where (rnum >= 3) and ( rnum <= 7 ); 

select rnum, empno, ename, hiredate 
from    (select rownum rnum, empno, ename, hiredate 
            from (select empno, ename, hiredate
                      from emp
                      order by hiredate)) -- ② 인라인 뷰
where (rnum >= 3) and ( rnum <= 7 );

--      [2] inline view (인라인 뷰)를 이용

select rownum, empno, ename, hiredate
from (select empno, ename, hiredate 
          from emp
          order by hiredate)
where rownum <= 5;

-- ■■■■■ [문제] 사원 중에서 급여를 가장 많이 받는 사원 7명만을 출력하는 명령문을 인라인 뷰를 이용해서 구현해 보세요.

select rnum, empno, ename, sal
from    (select rownum rnum, empno, ename, sal
            from view_hire)
where rnum <= 7; 

-- ■■■■■ [문제] 입사일을 기준으로 내림차순으로 정렬을 해서 5와 10 사이의 존재하는 사원을 출력을 해보세요.

select rownum, empno, ename, hiredate
from view_hiredate
where rownum 5 between 10
order by hiredeate desc;