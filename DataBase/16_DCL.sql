-- * 오라클 SQL : 사용자(User) 권한(Role)
--                                  (DCL : Data Control Language)
--  master 계정으로 실행

-- [1] thomas 계정 생성

create user thomas identified by tiger; -- 접속 error

-- [2] 데이터베이스 접속 원한 부여

grant create session to thomas;

-- 주의 ) master 권한에서 함부로 실행하지 말 것 (SQL 은 command 창에서 실행할 것)
SQL > sqlplus thomas/tiger

SQL > create table emp01 (
                    empno number(2),
                    ename varchar2(10),
                    job varchar2(10),
                    deptno number(2)
            );  -- error

-- [3] 테이블 생성 권한

grant create table to thomas;

-- [4] 테이블 스페이스 확인
--      :  테이블 스페이스 (table space)는 디스크 공간을 소비하는 데이블과 뷰 그리고 그 밖의 다른 데이터베이스 객체들이 저장되는 장소
--        cf) 오라클 xe 버전의 경우 메모리 영역은 system으로 할당
--             오라클 full 버전의 경우 메모리 영역은 users으로 할당

alter user thomas quota 2m on system;

SQL > sqlplus thomas/tiger

SQL > create table emp01 (
                    empno number(2),
                    ename varchar2(10),
                    job varchar2(10),
                    deptno number(2)
            );
            
-- * 계정 생성 및 테이블 생성까지의 권한 부여 정리

SQL > sqlplus system/admin1234

create user thomas identified by tiger
grant create session to thomas;
grant create table to thomas;
alter user thomas quota 2m on system

-- [5] with admin option : (시스템이 가지고있는 옵션에 속성까지 부여 받는 것)

-- tester1 계정 및 권한 부여

create user tester1 identified by tiger;
grant create session to tester1;
grant create table to tester1;
alter user tester1 quota 2m on system;

SQL > sqlplus tester1/tiger
SQL > grant create session to thomas; -- error (tester1 권한 부여 속성 X)

-- tester2 계정 및 권한 부여

create user tester2 identified by tiger;
grant create session to tester2;
grant create table to tester2;
alter user tester2 quota 2m on system;

-- tester3 계정 및 권한 부여

create user tester3 identified by tiger;
grant create session to tester3 with admin option;
grant create table to tester3;
alter user tester3 quota 2m on system;

SQL > sqlplus tester3/tiger
SQL > grant create session to thomas; -- OK

-- [6] 테이블 객체에 대한 select 권한 부여

SQL > sqlplus scott/tiger
SQL > grant select on emp to thomas;
SQL > conn thomas/tiger
SQL > select * from emp; -- error

-- [7] 스키마(SCHEMA) : 객체를 소유한 사용자명을 의미

SQL > select * from scott.emp;

-- [8] 사용자에게 부여된 권한 조회
--      · user_tab_privs_made : 현재 사용자가 다른 사용자에게 부여해준 권한 정보를 알려줌
--      · user_tab_privs_recd : 자신에게 부여된 사용자 권한을 알고 싶을 때

SQL > conn thomas/tiger
SQL > select * from user_tab_privs_made;
SQL > select * from user_tab_privs_recd;

-- [9] 비밀번호 변경시

alter user thomas identified by thomas;

-- [10] 객체 권한 제거하기

SQL > sqlplus scott/tiger
SQL > revoke select on emp from thomas;

-- [11] with grant option : (계정이 가지고 있는 옵션을 함께 부여받는 것)

SQL > sqlplus scott/tiger
SQL > grant select on emp to tester1 with grant option;

SQL > conn tester1 /tiger
SQL > select * from scott.emp;
SQL > grant select on scott.emp to tester2; -- ★ 스키마로 접근하기

SQL > conn tester2/tiger
SQL > select * from scott.emp;

-- [12] 사용자 계정 제거

drop user tester3;
drop user tester2;

-- [13] 권한 (Role)
 
 create user tester3 identified by tiger;
 grant connect resource to tester3;

SQL > conn tester3/tiger
SQL > select * from dict
            where table_name like '%ROLE%';



