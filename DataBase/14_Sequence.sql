-- * ����Ŭ : ������(Sequence)
-- ������ ���� �Ϸù�ȣ �����ϴ°� ��ȣ ���� (�׷��Լ� max �̿� ��ȣ )

--[1] ���� ���̺� ����

create table memos(
        num         number(4)  constraint memos_num_pk primary key,
        name       varchar2(20)  constraint memos_name_nn  not null,
        postDate   Date   default(sysdate)
);
        
--[2] �ش� ���̺��� ������ ����

create sequence memos_seq
start with 1 increment by 1; -- 1���� ����, �ϳ��� ����

--[3] ������ �Է� : �Ϸù�ȣ ����
-- ��nextVal : ���� ���� ��ȯ

insert into memos(num, name)
values(memos_seq.nextVal, 'ȫ�浿');

insert into memos(num, name)
values(memos_seq.nextVal, '�̼���');

insert into memos(num, name)
values(memos_seq.nextVal, '������');

select * from memos;

--[4] ���� �������� ������ �����Ǿ��� �ִ��� Ȯ��
-- �� currVal : ���� ���� ��ȯ
-- �� NextVal�� ���ο� ���� ������ ������ �� ���� currval�� ��ü�ϰ� �ȴ�.
-- �� nextVal, currVal  ����� �� �ִ� ��� 
--      ���� ������ �ƴ� select ��
--      insert ���� select ��, value ��
--      update ���� set ��

select memos_seq.currVal from dual;

--[5] ������ ���� : �ִ� �������� 4������ ����

alter sequence memos_seq maxvalue 4;

insert into memos(num, name)
values(memos_seq.nextVal, '���߱�');

insert into memos(num, name)
values(memos_seq.nextVal, '��âȣ'); -- �ִ밪 4�� �����߱� ������ error

alter sequence memos_seq maxvalue 100;

--[6] ������ ����

drop sequence memos_seq;

--[7] ������ ���� ���¿��� �ڵ� ������ ����?

select max(num) from memos;

insert into memos(num, name) 
values((select max(num)+1 from memos), '�������');

select * from memos;
