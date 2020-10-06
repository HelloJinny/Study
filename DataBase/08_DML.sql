-- * ����Ŭ SQL �� : ������ �Է�/���(select)/����/���� (DML)

-- [1] ���� ���̺� ����

drop table exam01 purge; -- ������ �ȵǾ� ���� �� ������ ���� ������ ���ش�. / ���� ���̺� �����Գ� ����

create table exam01(
        deptno  number(2),
        dname  varchar2(14),
        loc        varchar2(14)
);

-- [2] ������ �Է�(����) : insert into ~ values()

insert into exam01(deptno, dname, loc) values(10, 'ȸ���', '���α�');
insert into exam01(loc, deptno, dname) values('�߱�', '20', '������');

select * from exam01;

-- [3] ������ �Է� : �� ����

insert into exam01 values(30, '������', '��걸'); -- �����ڵ��� ��ȣ�ϴ� ���� ���

-- [4] null �� �Է�

insert into exam01 values(40, '������', null); -- �Է� �����Ͱ� �������� �ұ��ϰ�, error ������ ���� ����

-- [5] ������ ��� : select��
--          03. select.sql �ǽ� ����

-- [6] �ʵ��� �����͸� ���� : �μ���ȣ ����

update exam01 set deptno = 30;

-- [7] �޿� 10% �λ� �ݾ� �ݿ�

drop table exam02 purge; -- Ȥ�� �𸣴ϱ� ���� ����!

create table exam02
as
select * from emp;

select * from exam02;

update exam02 set sal = sal * 1.1

-- [8] �μ���ȣ�� 10�� ����� �μ���ȣ�� 20���� ����

update exam02 set deptno = 20
where deptno = 10;

-- [9] �޿��� 3000 �̻��� ����� �޿��� 10% �λ�

update exam02 set sal = sal * 1.1
where sal >= 3000;

-- [10] ��� �̸��� scott�� �ڷ��� �μ���ȣ�� 10, ������ MANAGER�� ����

update exam02 set deptno = 10, job = 'MANAGER'
where ename = 'SCOTT'

-- [11] 30�� �μ� ����� ����

delete from exam02
where deptno = 30;

-- [12] ����� ����

delete from exam02;