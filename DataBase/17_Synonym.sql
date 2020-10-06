-- * ����Ŭ : ���Ǿ�(Synonym)
--  master �������� ����

-- [1] ���̺� ���� �� ��ü ���� �ο��ϱ�

SQL > sqlplus system/admin1234
SQL > create table table_systbl (
                ename varchar2(20)
           );
SQL > insert into table_systbl values ('�̼���');
           insert into table_systbl values ('������');
           
-- scott �����(����)���� table_systbl �̶� ���̺� select�� ������ �ο��մϴ�.

SQL > grant select on table_systbl to scott;

SQL > conn scott/tiger
SQL > select * from table_systbl; -- X
SQL > select * from system.table_systbl; -- O

-- [2] ���Ǿ� ���� �� �ǹ� �ľ��ϱ� : ��Ű�� (������ �̸�)�� ���ؼ� ���̺� ����

SQL > conn system/admin1234
SQL > grant create synonym to scott;
SQL > conn scott/tiger
SQL > create synonym systab for system.table_systbl;

SQL > select * from systab;

-- [3] ����� ���Ǿ� ���� �� �ǹ� �ľ��ϱ�
--          ����� ���Ƿ��� ������ �Ŀ� ����� ���� �ѿ� connect, resource role�� create synonym ���Ѱ� scott �������� 
--          emp ���̺�� dept ���̺� ���� select ��ü ������ role�� �ο�

SQL > conn system/admin1234
SQL > create role test_role;
SQL > grant connect, resource, create synonym to test_role;
SQL > grant select on scott.dept to test_role;

-- ����� ����

SQL > create user tester10 identified by tiger;
SQL > create user tester11 identified by tiger;

-- ����ڿ��� �� �ο�

SQL > grant test_role to tester10;
SQL > grant test_role to tester11;

SQL > conn scott/tiger
SQL > grant select on dept to tester10;

SQL > conn tester10/tiger
SQL > select * from dept; - error
SQL > select * from scott.dept;

-- ����� tester10 ����� ���Ǿ� ����

SQL > conn tester10/tiger
SQL > create synonym dept for scott.dept;
SQL > select * from dept;

SQL > conn tester11/tiger
SQL > select * from dept; -- error

-- [4] ���� ���Ǿ� �����ϱ�

SQL > conn system/admin1234
SQL > create public synonym PubDept for scott.dept;

-- ����� ����

SQL > create user tester12 identified by tiger;  -- test12......

-- ����ڿ��� �� �ο�

SQL > grant test_role to tester12;

SQL > conn tester12/tiger
SQL > select * from PubDept; -- ���� ���Ǿ�

--                   dual > ���� ���Ǿ�� �Ǿ��־ system�� ���� ������ �ʾƵ� �ƴ�.

-- [5] ����� ���Ǿ� �����ϱ�
--          : ����� ���Ǿ��� dept�� ���Ǿ ������ ����ڷ� ������ �� �����ؾ� ��

SQL > conn tester10/tiger
SQL > drop synonym dept;
SQL > select * from dept; -- Ȯ��

-- [6] ���� ���Ǿ� �����ϱ�

SQL > conn system/admin1234
SQL > drop synonym PubDept; - error
SQL > drop public synonym PubDept;

