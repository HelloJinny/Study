-- * ����Ŭ - ���� ���ν���(procedure)
-- 	   ������ ������(insert/update/delete)���� �ʿ��� �� ���� �ٽ� �Է��� �ʿ� ���� �����ϰ� ȣ�⸸ �ؼ� ������ �������� ���� ����� ���� �� �ִ�.

drop table emp01 purge;		-- ���̺��� ������ error, ������ ����

create table emp01				-- ���̺� ���� (������ ����)
as
select * from emp;

select * from emp01;				-- Ȯ��

-- SQL > cd C:\workspaces\01_DB\database\src\database\src (�۾��ϴ� �ҽ������� �ִ� ���� ���)
-- SQL > sqlplus scott/tiger

SQL > ed proc01						-- ���ν��� ���� �ڵ� �۾� > ���� > src ���ΰ�ħ
SQL > @proc01						-- ���ν��� ����

SQL > execute del_all				-- ���ν��� ���� ~ begin�� end ���̿� �־��� �ڵ尡 ����ȴ�.

SQL > select * from emp01;	-- Ȯ��

-- [1] ���� ���ν��� ��ȸ�ϱ�
SQL > desc user_source;

SQL > select name, text from user_source;

-- [2] ���� ���ν����� �Ű�����
SQL > insert into emp01 select * from emp;

SQL > ed proc02
SQL > @proc02

SQL > execute del_ename('SCOTT')

SQL > select * from emp01;

-- [3] IN, OUT, INOUT �Ű�����
SQL > ed proc03
SQL > @proc03

SQL > variable var_ename varchar2(20);
SQL > variable var_sal      number;
SQL > variable var_job      varchar2(10);

SQL > execute sel_empno(7788, :var_ename, :var_sal, :var_job);

SQL > print var_ename;
SQL > print var_sal;
SQL > print var_job;

-- [4] ���� �Լ�
SQL > ed proc04
SQL > @proc04

SQL > variable var_result number;
SQL > execute :var_result := cal_bonus(7788);
SQL > print var_result;

-- [5] Cursor (Ŀ��)
SQL > select * from dept;
SQL > ed proc05
SQL > @proc05

SQL > execute cursor_sample01;

