-- * ����Ŭ SQL : �����(User) ����(Role)
--                                  (DCL : Data Control Language)
--  master �������� ����

-- [1] thomas ���� ����

create user thomas identified by tiger; -- ���� error

-- [2] �����ͺ��̽� ���� ���� �ο�

grant create session to thomas;

-- ���� ) master ���ѿ��� �Ժη� �������� �� �� (SQL �� command â���� ������ ��)
SQL > sqlplus thomas/tiger

SQL > create table emp01 (
                    empno number(2),
                    ename varchar2(10),
                    job varchar2(10),
                    deptno number(2)
            );  -- error

-- [3] ���̺� ���� ����

grant create table to thomas;

-- [4] ���̺� �����̽� Ȯ��
--      :  ���̺� �����̽� (table space)�� ��ũ ������ �Һ��ϴ� ���̺�� �� �׸��� �� ���� �ٸ� �����ͺ��̽� ��ü���� ����Ǵ� ���
--        cf) ����Ŭ xe ������ ��� �޸� ������ system���� �Ҵ�
--             ����Ŭ full ������ ��� �޸� ������ users���� �Ҵ�

alter user thomas quota 2m on system;

SQL > sqlplus thomas/tiger

SQL > create table emp01 (
                    empno number(2),
                    ename varchar2(10),
                    job varchar2(10),
                    deptno number(2)
            );
            
-- * ���� ���� �� ���̺� ���������� ���� �ο� ����

SQL > sqlplus system/admin1234

create user thomas identified by tiger
grant create session to thomas;
grant create table to thomas;
alter user thomas quota 2m on system

-- [5] with admin option : (�ý����� �������ִ� �ɼǿ� �Ӽ����� �ο� �޴� ��)

-- tester1 ���� �� ���� �ο�

create user tester1 identified by tiger;
grant create session to tester1;
grant create table to tester1;
alter user tester1 quota 2m on system;

SQL > sqlplus tester1/tiger
SQL > grant create session to thomas; -- error (tester1 ���� �ο� �Ӽ� X)

-- tester2 ���� �� ���� �ο�

create user tester2 identified by tiger;
grant create session to tester2;
grant create table to tester2;
alter user tester2 quota 2m on system;

-- tester3 ���� �� ���� �ο�

create user tester3 identified by tiger;
grant create session to tester3 with admin option;
grant create table to tester3;
alter user tester3 quota 2m on system;

SQL > sqlplus tester3/tiger
SQL > grant create session to thomas; -- OK

-- [6] ���̺� ��ü�� ���� select ���� �ο�

SQL > sqlplus scott/tiger
SQL > grant select on emp to thomas;
SQL > conn thomas/tiger
SQL > select * from emp; -- error

-- [7] ��Ű��(SCHEMA) : ��ü�� ������ ����ڸ��� �ǹ�

SQL > select * from scott.emp;

-- [8] ����ڿ��� �ο��� ���� ��ȸ
--      �� user_tab_privs_made : ���� ����ڰ� �ٸ� ����ڿ��� �ο����� ���� ������ �˷���
--      �� user_tab_privs_recd : �ڽſ��� �ο��� ����� ������ �˰� ���� ��

SQL > conn thomas/tiger
SQL > select * from user_tab_privs_made;
SQL > select * from user_tab_privs_recd;

-- [9] ��й�ȣ �����

alter user thomas identified by thomas;

-- [10] ��ü ���� �����ϱ�

SQL > sqlplus scott/tiger
SQL > revoke select on emp from thomas;

-- [11] with grant option : (������ ������ �ִ� �ɼ��� �Բ� �ο��޴� ��)

SQL > sqlplus scott/tiger
SQL > grant select on emp to tester1 with grant option;

SQL > conn tester1 /tiger
SQL > select * from scott.emp;
SQL > grant select on scott.emp to tester2; -- �� ��Ű���� �����ϱ�

SQL > conn tester2/tiger
SQL > select * from scott.emp;

-- [12] ����� ���� ����

drop user tester3;
drop user tester2;

-- [13] ���� (Role)
 
 create user tester3 identified by tiger;
 grant connect resource to tester3;

SQL > conn tester3/tiger
SQL > select * from dict
            where table_name like '%ROLE%';



