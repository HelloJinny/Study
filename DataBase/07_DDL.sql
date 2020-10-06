-- * ����Ŭ SQL�� : ���̺� ����/ ���� /����

-- [1] ���̺� ���� : create table��

create table exam01(
    exno        number(4),
    exname    varchar2(20),
    exsal        number(7,2)
);

select * from tab;
select * from exam01;

-- [2] ���� ���̺�� �����ϰ� ���̺� �����

create table exam02
as
select * from emp;

select * from exam02;

-- [3] ���� ���̺��� ���ο� �÷� �߰� : alter �� (�ʵ��߰�)

alter table exam01
add (
    exjob varchar2(10)
);

desc exam01;

-- [4] ���̺� ���� ���� : �ʵ� ����

alter table exam01
modify (
    exjob varchar2(20)
);

-- [5] ���̺� ���� ���� : �ʵ� ����

alter table exam01
drop column exjob;

-- [6] ���̺� ���� : �̸� ����

alter table exam01 rename to test01; -- ��� ��

rename test01 to exam01; -- ��� ��

select * from tab;

-- [7] ���̺� ����

drop table exam01;

select * from tab;

-- cf) - ����Ŭ 10g ���ʹ� ���̺��� �����ϸ� 'BIN$6WZ3U92/RDOy+6LKaVKjCw==$0'�� ���� �ӽ� ���̺�� ��ü�ȴ�.
--      - �ӽ� ���̺��� �����ϰ� �ʹٸ�

purge recyclebin;

--      - ó������ ���̺��� ���� �����ϰ� �ʹ�
 
drop table exam01 purge;

select * from tab;

-- 

create table exam10  -- ����
as
select * from dept;

select * from exam10; -- �˻�

drop table exam10;  -- ����

-- ����

select object_name, original_name, type, createtime
from recyclebin   
order by createtime;

flashback table exam10 to before drop; -- ��� ��
flashback table exam10 to before drop rename to exam20; -- ��� �� �ٸ� �̸����� ���� (�����ϰ� �����ϸ� X)


-- [8] ���̺� ���� ��� ������ (���ڵ� ) ����

select * from exam02;
truncate table exam02;