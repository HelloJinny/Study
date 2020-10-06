-- * ����Ŭ : �ε��� (index)

-- [1] �ε��� ���� ��ȸ

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP', 'DEPT');

-- [2] ��ȸ �ӵ� ������

--- ������̺� �����ϱ�

drop table emp01 purge;

create table emp01
as
select * from emp;

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP', 'EMP01');

-- ����) ������ ����� ���̺� ������ ���븸 ����� �� ���� ������ ������� �ʴ´�.

-- ������ ����

insert into emp01 select * from emp01; -- emp01�� ��� �ִ� ������ ��ü�� �о�ͼ� emp01 �ȿ� �߰����ش�.

insert into emp01(empno, ename) values(8010, 'ANGEL');

set timing on

select distinct empno, ename
from emp01
where ename = 'ANGEL'; -- 6.088 (index ���� X)

-- [3] �ε��� ����
--      : �⺻Ű�� ����Ű�� �ƴ� �÷��� ���ؼ� �ε����� �����Ϸ��� create index ��ɾ ���

create index idx_emp01_ename 
on emp01(ename);

select distinct empno, ename
from emp01
where ename = 'ANGEL'; -- 0.002sec (index ���� O)

-- [4] �ε��� ����

drop index idx_emp01_ename;

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP01');

drop table emp01 purge; -- ����� ������ �������� ������ �ʿ䰡 �����Ƿ� ������ ���ش�.
