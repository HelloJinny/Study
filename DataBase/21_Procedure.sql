-- * 오라클 - 저장 프로시저(procedure)
-- 	   복잡한 쿼리문(insert/update/delete)들을 필요할 때 마다 다시 입력할 필요 없이 간단하게 호출만 해서 복잡한 쿼리문의 실행 결과를 얻어올 수 있다.

drop table emp01 purge;		-- 테이블이 없으면 error, 있으면 삭제

create table emp01				-- 테이블 생성 (복사의 개념)
as
select * from emp;

select * from emp01;				-- 확인

-- SQL > cd C:\workspaces\01_DB\database\src\database\src (작업하는 소스파일이 있는 파일 경로)
-- SQL > sqlplus scott/tiger

SQL > ed proc01						-- 프로시저 생성 코드 작업 > 저장 > src 새로고침
SQL > @proc01						-- 프로시저 생성

SQL > execute del_all				-- 프로시저 실행 ~ begin과 end 사이에 넣어준 코드가 실행된다.

SQL > select * from emp01;	-- 확인

-- [1] 저장 프로시저 조회하기
SQL > desc user_source;

SQL > select name, text from user_source;

-- [2] 저장 프로시저의 매개변수
SQL > insert into emp01 select * from emp;

SQL > ed proc02
SQL > @proc02

SQL > execute del_ename('SCOTT')

SQL > select * from emp01;

-- [3] IN, OUT, INOUT 매개변수
SQL > ed proc03
SQL > @proc03

SQL > variable var_ename varchar2(20);
SQL > variable var_sal      number;
SQL > variable var_job      varchar2(10);

SQL > execute sel_empno(7788, :var_ename, :var_sal, :var_job);

SQL > print var_ename;
SQL > print var_sal;
SQL > print var_job;

-- [4] 저장 함수
SQL > ed proc04
SQL > @proc04

SQL > variable var_result number;
SQL > execute :var_result := cal_bonus(7788);
SQL > print var_result;

-- [5] Cursor (커서)
SQL > select * from dept;
SQL > ed proc05
SQL > @proc05

SQL > execute cursor_sample01;

