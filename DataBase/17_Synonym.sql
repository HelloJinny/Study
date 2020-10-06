-- * 오라클 : 동의어(Synonym)
--  master 계정으로 실행

-- [1] 테이블 생성 후 객체 권한 부여하기

SQL > sqlplus system/admin1234
SQL > create table table_systbl (
                ename varchar2(20)
           );
SQL > insert into table_systbl values ('이순신');
           insert into table_systbl values ('강감찬');
           
-- scott 사용자(계정)에게 table_systbl 이란 테이블에 select할 권한을 부여합니다.

SQL > grant select on table_systbl to scott;

SQL > conn scott/tiger
SQL > select * from table_systbl; -- X
SQL > select * from system.table_systbl; -- O

-- [2] 동의어 생성 및 의미 파악하기 : 스키마 (계정의 이름)을 통해서 테이블에 접근

SQL > conn system/admin1234
SQL > grant create synonym to scott;
SQL > conn scott/tiger
SQL > create synonym systab for system.table_systbl;

SQL > select * from systab;

-- [3] 비공개 동의어 생성 및 의미 파악하기
--          사용자 정의롤을 생성한 후에 사용자 정의 롤에 connect, resource role과 create synonym 권한과 scott 소유자의 
--          emp 테이블과 dept 테이블에 대한 select 객체 권한을 role에 부여

SQL > conn system/admin1234
SQL > create role test_role;
SQL > grant connect, resource, create synonym to test_role;
SQL > grant select on scott.dept to test_role;

-- 사용자 생성

SQL > create user tester10 identified by tiger;
SQL > create user tester11 identified by tiger;

-- 사용자에게 롤 부여

SQL > grant test_role to tester10;
SQL > grant test_role to tester11;

SQL > conn scott/tiger
SQL > grant select on dept to tester10;

SQL > conn tester10/tiger
SQL > select * from dept; - error
SQL > select * from scott.dept;

-- 사용자 tester10 비공개 동의어 생성

SQL > conn tester10/tiger
SQL > create synonym dept for scott.dept;
SQL > select * from dept;

SQL > conn tester11/tiger
SQL > select * from dept; -- error

-- [4] 공개 동의어 정의하기

SQL > conn system/admin1234
SQL > create public synonym PubDept for scott.dept;

-- 사용자 생성

SQL > create user tester12 identified by tiger;  -- test12......

-- 사용자에게 롤 부여

SQL > grant test_role to tester12;

SQL > conn tester12/tiger
SQL > select * from PubDept; -- 공개 동의어

--                   dual > 공개 동의어로 되어있어서 system을 굳이 붙이지 않아도 됐다.

-- [5] 비공개 동의어 제거하기
--          : 비공개 동의어인 dept는 동의어를 소유한 사용자로 접속한 후 제거해야 됨

SQL > conn tester10/tiger
SQL > drop synonym dept;
SQL > select * from dept; -- 확인

-- [6] 공개 동의어 제거하기

SQL > conn system/admin1234
SQL > drop synonym PubDept; - error
SQL > drop public synonym PubDept;

