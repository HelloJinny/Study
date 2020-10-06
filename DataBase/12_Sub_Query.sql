-- * 오라클 SQL문 : 서브쿼리(Sub_Query)문

-- [ 단일행 서브쿼리 ]

-- [예제] scott이 근무하는 부서명, 지역 출력 (서로 다른 데이블에 데이터 존재)

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
                           
-- [예제] scott와 동일한 직급(job)을 가진 사원을 출력하는 sql문을 서브쿼리를 이용해서 작성해 보세요.

select ename, job
from emp
where job = ( select job
                     from emp
                     where ename = 'SCOTT');
                          
-- [예제] scott의 급여와 동일하거나 더 많이받는 사원 이름과 급여를 출력해보세요.

select ename, job, sal
from emp
where sal >= (select sal
                    from emp
                    where ename = 'SCOTT')
order by sal;

-- [예제] 전체 사원 평균 급여보다 더 많은 급여를 받는 사람을 출력하세요.

select ename 직원이름, sal 급여
from emp
where sal > (select avg(sal)
                    from emp);

-- [ 다중행 서브쿼리 ]

-- (1) [in 연산자] : 메인 쿼리의 비교조건('=' 연산자로 비교할 경우)이 서브쿼리의 결과 중에서 하나라도 일치하면 참이다.

-- [예제] 급여를 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력하세요.

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
                        
-- [문제] in 연산자를 이용하여 부서별로 가장 급여를 많이 받는 사원의 정보(사원번호, 사원명, 급여 ,부서번호)를 출력하세요.

select empno "사원번호", ename "사원명", sal "급여", deptno "부서번호"
from emp
where sal IN ( select max(sal)
                      from emp
                      group by deptno);
                      
-- (2) [all 연산자] : all은 '모든 비교 값 보다 크냐?' 고 묻는 것이 되므로 최대값보다 더 크면 참이 된다.

-- [예제] 30번(부서번호) 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 출력하세요.

--      [단일행 서브쿼리 & 그룹함수]

select ename, sal
from emp
where sal > (select max(sal)
                   from emp
                   where deptno = 30);
                     
--      [다중행 서브쿼리]

select ename, sal
from emp
where sal >all (select sal
                        from emp
                        where deptno = 30);
                        
-- [문제] 영업사원들보다 급여를 많이 받는 사원들의 이름과 급여를 출력하되 영업사원은 출력하지 않게 명령문을 작성해 보세요.

select empno, ename, sal ,deptno, job
from emp
where sal > ALL ( select sal
                            from emp
                            where job = 'SALESMAN')
          and job <> 'SALESMAN';
          
-- (3) [any 연산자] : 찾아진 값에 대해서 하나라도 크면 참이 된다. 찾아진 값에서 최소값 보다 크면 참이 된다.

-- [예제] 부서번호가 30번인 사원들의 급여 중에서 가장 낮은 급여보다 높은 급여를 받는 사원의 이름, 급여를 출력하는 명령문을 작성해 보세요.

--      [단일행 서브쿼리 & 그룹함수]

select ename 사원명, sal 급여
from emp
where sal > ( select min(sal)
                            from emp
                            where deptno = 30);
                                             
--      [다중행 서브쿼리]

select ename 사원명, sal 급여
from emp
where sal > ANY ( select sal
                            from emp
                            where deptno = 30);

--  ■■■■■ [문제] 영업 사원들의 최소 급여보다 많이 받는 사원들의 이름과 급여와 직급을 출력하되 영업 사원은 출력하지 않습니다.

select empno, ename, sal ,deptno, job
from emp
where sal > ANY  ( select sal
                            from emp
                            where job = 'SALESMAN')
          and job <> 'SALESMAN';