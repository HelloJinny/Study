-- * ������ ���Ἲ ���� ���� (Data Integrity Constraint Rule)

desc dept;
desc user_constraints; -- ���� ���ǿ� ���� ������ �˷� �� �� [command] â���� Ȯ�� �� ��

-- owner : ���� ������ ������ ����ڸ��� �����ϴ� �÷�
-- constraint_name : ���� ���Ǹ��� �����ϴ� �÷�
-- constraint_type : ���� ���� ������ �����ϴ� �÷� (P(primary key), R(foreign key), U(unique), C(check, not null))
-- table_name : �� ���� ���ǵ��� ���� ���̺��� �̸�
-- search_condition : � ������ �������� ���Ǿ����� ����
-- r_constraint_name : ���� ������ foreignkey �� ��� � primary key �� �����ߴ����� ���� ������ ����

-- SQL>column constraint_name format a15
-- SQL>column constraint_type format a4
-- SQL>column table_name format a10

select owner, constraint_name, constraint_type
from user_constraints;

-- �÷� ���� ���� ���� ����

-- �� [1] not null ���� ������ ���� �ʰ� ���̺� ����

drop table emp01 purge;

create table emp01 (
        empno number(4),
        ename varchar2(20),
        job      varchar2(20),
        deptno number(2)
);

--  [null ������ �Է� ����]

insert into emp01
values (null, null, 'salesman', 40);

select * from emp01;

-- [2] not null ���� ������ �ɰ� ���̺� ���� : null�� ������� �ʴ´�.

create table emp02 (
        empno number(4) not null , -- ������ �� �ִ� ���� ������, null �� ���� X
        ename varchar2(20) not null,  -- ������ �� �ִ� ���� ������, null �� ���� X
        job      varchar2(20),
        deptno number(2)
);

--  [null ������ �Է� ����]

insert into emp02
values (null, null, 'salesman', 40); -- error

insert into emp02
values (null, 'ȫ�浿', 'salesman', 40); -- error

insert into emp02
values (1234, 'ȫ�浿', 'salesman', 40);

insert into emp02
values (1234, 'ȫ�漭', '������', 10);

select * from emp02;

-- �� [3] Unique ���� ������ �����Ͽ� ���̺� ���� : �ߺ��� ���� ������� �ʴ´�. �׻� ������ ����  ������ �Ѵ�.

create table emp03 (
        empno number(4) unique ,
        ename varchar2(20) not null,
        job      varchar2(20),
        deptno number(2)
);

insert into emp03
values (1234, 'ȫ�浿', 'salesman', 40);

insert into emp03
values (1234, 'ȫ�漭', '������', 10); -- error "ORA-00001: unique constraint (SCOTT.SYS_C007003) violated"

-- [4] �÷� ������ ���Ǹ� ���

create table emp04 (
        empno number(4) constraint emp04_empno_uk unique, -- ���̺��_�÷���_����
        ename varchar2(20) constraint emp04_ename_nn not null,
        job      varchar2(20),
        deptno number(2)
);

insert into emp04
values (1234, 'ȫ�浿', 'salesman', 40);

insert into emp04
values (1234, 'ȫ�漭', '������', 10); -- error "ORA-00001: unique constraint (SCOTT.EMP04_EMPNO_UK) violated"

-- �� [5] Primary Key (�⺻Ű) ���� ���� �����ϱ� : not null + unique

create table emp05 (
        empno number(4) constraint emp05_empno_pk primary key,
        ename varchar2(20) constraint emp05_ename_nn not null,
        job      varchar2(20),
        deptno number(2)
);

insert into emp05
values (null, 'ȫ�浿', 'salesman', 40); -- error

insert into emp05
values (1234, 'ȫ�漭', '������', 10);

insert into emp05
values (1234, 'ȫ�浿', 'salesman', 40); -- error

-- �� [6] ���� ���Ἲ�� ���� Foreign Key (�ܷ�Ű) ���� ���� : �ٸ� ���̺��� �÷��� ����ִ� ���� ������ ����ϴ� ����

create table dept06 (
        deptno number(2) constraint dept06_deptno_pk primary key,
        dname varchar2(20),
        loc varchar2(20)
);

insert into dept06 values(10, 'ȸ���', '���α�');
insert into dept06 values(20, '������', '���빮��');
insert into dept06 values(30, '������', '��������');

select * from dept06;

create table emp06 (
        empno number(4) constraint emp06_empno_pk primary key,
        ename varchar2(20) constraint emp06_ename_nn not null,
        job      varchar2(20),
        deptno number(2) constraint emp06_deptno_fk references dept06(deptno)
);

insert into emp06 values(1234, 'ȫ�浿', '�������', 30);
insert into emp06 values(1235, 'ȫ�泲', '����', 40); -- error : ORA-02291: integrity constraint (SCOTT.EMP06_DEPTNO_FK) violated - parent key not found

-- �� [7] Check ���� ���� �����ϱ� : ���� ������ ������ ���� ������ ������ �����Ͽ� ������ ������ ����Ѵ�.
--          �޿� �÷��� �����ϵ� ���� 500 ~ 5000 ������ ���� ���� ����
--          ���� ���� �÷����� gender�� �����ϰ�, 'M' / 'F' �� �� �ϳ��� ���� ���� ����

create table emp07 (
        empno number(4) constraint emp07_empno_pk primary key,
        ename varchar2(20) constraint emp07_ename_nn not null,
        sal      number(7, 2) constraint emp07_sal_ck check(sal between 500 and 5000),
        gender varchar2(1) constraint emp07_gender_ck check(gender in ('M', 'F'))
);

insert into emp07 values(1234, 'ȫ�浿', 6000, 'M'); -- error : ORA-02290: check constraint (SCOTT.EMP07_SAL_CK) violated
insert into emp07 values(1234, 'ȫ�浿', 3500, 'M');
insert into emp07 values(1235, 'ȫ���', 3000, '��'); -- error : ORA-12899: value too large for column "SCOTT"."EMP07"."GENDER" (actual: 3, maximum: 1)
insert into emp07 values(1235, 'ȫ���', 3000, 'm'); -- error : ORA-02290: check constraint (SCOTT.EMP07_GENDER_CK) violated

-- �� [8] Default ���� ���� �����ϱ� : �⺻������ Ư�� ���� ����ǵ��� �����ϴ� ����
--          ������(loc) �÷��� �ƹ� ���� �Է����� ���� ��, ����Ʈ ���� 'SEOUL'�� �Էµǵ��� default ���� ���� ����

create table dept08 (
        deptno number(2) constraint dept08_deptno_pk primary key,
        dname varchar2(20) constraint dept08_dname_nn not null,
        loc varchar2(20) default 'SEOUL'
);

insert into dept08 values(10, 'ȸ���'); -- error : SQL ����: ORA-00947: not enough values
insert into dept08(deptno, dname) values(10, 'ȸ���');
insert into dept08 values(20, '������', '���α�');

select * from dept08;

--  [9] ���� ���� ��� ���
--      1) �÷� ������ ���� ���Ǹ��� ����ؼ� ���� ���� ���� (>>> ����)

create table dept09 (
        deptno number(2) constraint dept09_deptno_pk primary key,
        dname varchar2(20) constraint dept09_dname_nn not null,
        loc varchar2(20) default 'SEOUL'
);

--      2) ���̺� ���� ������� ���� ���� ���� (>>> �߰��ϰ� ���� �� �̰� ����ϸ� ����)
--          ����) not null ������ ���̺� ���� ������� ���� ������ ������ �� ����.

create table emp09(
        empno number(4),
        ename varchar2(20) constraint emp09_ename_nn not null,
        job varchar2(20),
        deptno number(2),
        
        constraint emp09_empno_pk primary key(empno),
        constraint emp09_job_uk unique(job),
        constraint emp09_deptno_fk foreign key(deptno) references dept06(deptno) -- dept06�� ������ �������
);

select * from emp09;

-- [10] ���� ���� �߰��ϱ�

create table emp10 (
        empno number(4),
        ename varchar2(20),
        job varchar2(20),
        deptno number(2)
);

alter table emp10
add constraint emp10_empno_pk primary key(empno);

alter table emp10
add constraint emp10_deptno_fk
foreign key(deptno) references dept06(deptno); -- -- dept06�� ������ �������

select * from emp10;

-- [11] not null ���� ���� �߰��ϱ�

alter table emp10
add constraint emp10_ename_nn not null(ename); -- error : ORA-00904: : invalid identifier

alter table emp10
modify ename constraint emp10_ename_nn not null; -- default�� null�� �Ǿ��־ not null�� ����

-- [12] ���� ���� �����ϱ�

alter table emp10
drop primary key;

--  [13] ���� ���� (�ܷ�Ű) �÷� ����
-- > �ڽ� ���̺��� ������̺�(emp06)�� �θ� ���̺�(dept06)�� �⺻Ű�� �μ���ȣ�� �����ϰ� �ִ�.
-- > �μ� ���̺��� 30�� �μ��� ��� ���̺� �ٹ��ϴ� 30�� ����� �����ϱ� ������ ������ �� ����.
-- > �θ� ���̺��� �μ���ȣ 30���� �����Ǹ� �ڽ� ���̺��� �ڽ��� �����ϴ� �θ� �Ҿ������ �ǹǷ� ������ �� ����.

-- > �μ� ���̺��� 30�� �μ����� �ٹ��ϴ� ����� ������ �� �μ� ���̺��� 30�� �μ��� ����
-- > ���� ���Ἲ ������ ������ �Ұ����ϹǷ� emp06���� ���� ������ ������ �Ŀ� 30�� �μ��� ����

delete from dept06 -- [6]���� ��������
where deptno = 30; -- error : (PDF 7p) �θ����̺��� �μ���ȣ 30���� �����Ǹ� �ڽ����̺��� �ڽ��� �����ϴ� �θ� �Ҿ������ �ǹǷ� ������ �� ���� ���̴�.

-- > ���̺��� ���� ������ �������� �ʰ� �Ͻ������� ���� ������ ������� �ʵ��� �ϴ� ������� ���� ������ ��Ȱ��ȭ �ϴ� ���

alter table emp06
disable constraint emp06_deptno_fk; -- �� ���� ������ �Ͻ� ��Ȱ��ȭ (�ڽ� ���̺�)

delete from dept06 -- �� ����
where deptno = 30;

insert into dept06 -- �� ����
values (30, '�ѹ���', '�߱�');

alter table emp06
enable constraint emp06_deptno_fk; -- �� ��Ȱ��ȭ�� ���� ������ �����Ͽ� �ٽ� Ȱ��ȭ

select * from dept06;

--      * cascade �ɼ�
-- > �θ� ���̺�(dept06)�� �ڽ� ���̺�(emp06)���� ���� ����(�ܷ�Ű)�� �Ǿ� ���� ��
--    �θ� ���̺��� ���� ������ ��Ȱ��ȭ�ϸ� �̸� �����ϰ� �ִ� �ڽ� ���̺��� ���� ���Ǳ��� ���� ��Ȱ��ȭ ���� �ִ� �ɼ�
-- > �θ� ���̺��� ���� ������ �����ϸ� �̸� �����ϰ� �ִ� �ڽ� ���̺��� �������ǵ� ���� �����ȴ�.
alter table dept06 -- ��Ȱ��ȭ (�θ�)
disable primary key cascade; -- �ڽı��� ���� ��Ȱ��ȭ

select constraint_name, constraint_type, table_name, r_constraint_name, status
from user_constraints
where table_name in ('DEPT06', 'EMP06');

alter table dept06
drop primary key; -- error : ORA-02273: this unique/primary key is referenced by some foreign keys

alter table dept06
drop primary key cascade;
                                                     
alter table dept06
add constraint dept06_deptno_pk primary key(deptno);