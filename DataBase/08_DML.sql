-- * 오라클 SQL 문 : 데이터 입력/출력(select)/수정/삭제 (DML)

-- [1] 샘플 테이블 생성

drop table exam01 purge; -- 삭제가 안되어 있을 수 있으니 먼저 삭제를 해준다. / 없는 테이블 삭제함녀 에러

create table exam01(
        deptno  number(2),
        dname  varchar2(14),
        loc        varchar2(14)
);

-- [2] 데이터 입력(저장) : insert into ~ values()

insert into exam01(deptno, dname, loc) values(10, '회계부', '종로구');
insert into exam01(loc, deptno, dname) values('중구', '20', '연구소');

select * from exam01;

-- [3] 데이터 입력 : 행 생략

insert into exam01 values(30, '영업부', '용산구'); -- 개발자들이 선호하는 삽입 방법

-- [4] null 값 입력

insert into exam01 values(40, '관리부', null); -- 입력 데이터가 없음에도 불구하고, error 방지를 위해 삽입

-- [5] 데이터 출력 : select문
--          03. select.sql 실습 참조

-- [6] 필드의 데이터를 변경 : 부서번호 변경

update exam01 set deptno = 30;

-- [7] 급여 10% 인상 금액 반영

drop table exam02 purge; -- 혹시 모르니까 삭제 먼저!

create table exam02
as
select * from emp;

select * from exam02;

update exam02 set sal = sal * 1.1

-- [8] 부서번호가 10인 사원의 부서번호를 20으로 변경

update exam02 set deptno = 20
where deptno = 10;

-- [9] 급여가 3000 이상인 사원만 급여를 10% 인상

update exam02 set sal = sal * 1.1
where sal >= 3000;

-- [10] 사원 이름이 scott인 자료의 부서번호를 10, 직급을 MANAGER로 변경

update exam02 set deptno = 10, job = 'MANAGER'
where ename = 'SCOTT'

-- [11] 30번 부서 사원을 삭제

delete from exam02
where deptno = 30;

-- [12] 사원을 삭제

delete from exam02;