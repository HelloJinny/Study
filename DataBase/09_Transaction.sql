-- * Ʈ�����

-- [1] ���̺� ����

create table dept01
as
select * from dept;

select * from dept01;

-- [2] command â���� �ǽ� ���� �� ��

delete  from dept01;

commit; -- ��ɹ��� �����ϸ� ���� �ݿ�

-- [3] �ǵ�����

drop table dept01 purge;

rollback;