-- * 데이터 무결성 제약 조건 (Data Integrity Constraint Rule)

desc dept;
desc user_constraints; -- 제약 조건에 관한 정보를 알려 줌 ★ [command] 창에서 확인 할 것

-- owner : 제약 조건을 소유한 사용자명을 저장하는 컬럼
-- constraint_name : 제약 조건명을 저장하는 컬럼
-- constraint_type : 제약 조건 유형을 저장하는 컬럼 (P(primary key), R(foreign key), U(unique), C(check, not null))
-- table_name : 각 제약 조건들이 속한 테이블의 이름
-- search_condition : 어떤 내용이 조건으로 사용되었는지 설명
-- r_constraint_name : 제약 조건이 foreignkey 인 경우 어떤 primary key 를 참조했는지를 대한 정보를 가짐

-- SQL>column constraint_name format a15
-- SQL>column constraint_type format a4
-- SQL>column table_name format a10

select owner, constraint_name, constraint_type
from user_constraints;

-- 컬럼 레벨 제약 조건 지정

-- ※ [1] not null 제약 조건을 걸지 않고 테이블 생성

drop table emp01 purge;

create table emp01 (
        empno number(4),
        ename varchar2(20),
        job      varchar2(20),
        deptno number(2)
);

--  [null 데이터 입력 연습]

insert into emp01
values (null, null, 'salesman', 40);

select * from emp01;

-- [2] not null 제약 조건을 걸고 테이블 생성 : null을 허용하지 않는다.

create table emp02 (
        empno number(4) not null , -- 구별할 수 있는 고유 데이터, null 값 삽입 X
        ename varchar2(20) not null,  -- 구별할 수 있는 고유 데이터, null 값 삽입 X
        job      varchar2(20),
        deptno number(2)
);

--  [null 데이터 입력 연습]

insert into emp02
values (null, null, 'salesman', 40); -- error

insert into emp02
values (null, '홍길동', 'salesman', 40); -- error

insert into emp02
values (1234, '홍길동', 'salesman', 40);

insert into emp02
values (1234, '홍길서', '관리부', 10);

select * from emp02;

-- ※ [3] Unique 제약 조건을 설정하여 테이블 생성 : 중복된 값을 허용하지 않는다. 항상 유일한 값을  갖도록 한다.

create table emp03 (
        empno number(4) unique ,
        ename varchar2(20) not null,
        job      varchar2(20),
        deptno number(2)
);

insert into emp03
values (1234, '홍길동', 'salesman', 40);

insert into emp03
values (1234, '홍길서', '관리부', 10); -- error "ORA-00001: unique constraint (SCOTT.SYS_C007003) violated"

-- [4] 컬럼 레벨로 조건명 명시

create table emp04 (
        empno number(4) constraint emp04_empno_uk unique, -- 테이블명_컬럼명_약자
        ename varchar2(20) constraint emp04_ename_nn not null,
        job      varchar2(20),
        deptno number(2)
);

insert into emp04
values (1234, '홍길동', 'salesman', 40);

insert into emp04
values (1234, '홍길서', '관리부', 10); -- error "ORA-00001: unique constraint (SCOTT.EMP04_EMPNO_UK) violated"

-- ※ [5] Primary Key (기본키) 제약 조건 설정하기 : not null + unique

create table emp05 (
        empno number(4) constraint emp05_empno_pk primary key,
        ename varchar2(20) constraint emp05_ename_nn not null,
        job      varchar2(20),
        deptno number(2)
);

insert into emp05
values (null, '홍길동', 'salesman', 40); -- error

insert into emp05
values (1234, '홍길서', '관리부', 10);

insert into emp05
values (1234, '홍길동', 'salesman', 40); -- error

-- ※ [6] 참조 무결성을 위한 Foreign Key (외래키) 제약 조건 : 다른 테이블의 컬럼에 들어있는 값만 저장을 허용하는 조건

create table dept06 (
        deptno number(2) constraint dept06_deptno_pk primary key,
        dname varchar2(20),
        loc varchar2(20)
);

insert into dept06 values(10, '회계부', '종로구');
insert into dept06 values(20, '연구소', '서대문구');
insert into dept06 values(30, '영업부', '영등포구');

select * from dept06;

create table emp06 (
        empno number(4) constraint emp06_empno_pk primary key,
        ename varchar2(20) constraint emp06_ename_nn not null,
        job      varchar2(20),
        deptno number(2) constraint emp06_deptno_fk references dept06(deptno)
);

insert into emp06 values(1234, '홍길동', '세일즈맨', 30);
insert into emp06 values(1235, '홍길남', '점원', 40); -- error : ORA-02291: integrity constraint (SCOTT.EMP06_DEPTNO_FK) violated - parent key not found

-- ※ [7] Check 제약 조건 설정하기 : 저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값만을 허용한다.
--          급여 컬럼을 생성하되 값은 500 ~ 5000 사이의 값만 저장 가능
--          성별 저장 컬럼으로 gender를 정의하고, 'M' / 'F' 둘 중 하나의 값만 저장 가능

create table emp07 (
        empno number(4) constraint emp07_empno_pk primary key,
        ename varchar2(20) constraint emp07_ename_nn not null,
        sal      number(7, 2) constraint emp07_sal_ck check(sal between 500 and 5000),
        gender varchar2(1) constraint emp07_gender_ck check(gender in ('M', 'F'))
);

insert into emp07 values(1234, '홍길동', 6000, 'M'); -- error : ORA-02290: check constraint (SCOTT.EMP07_SAL_CK) violated
insert into emp07 values(1234, '홍길동', 3500, 'M');
insert into emp07 values(1235, '홍길북', 3000, '남'); -- error : ORA-12899: value too large for column "SCOTT"."EMP07"."GENDER" (actual: 3, maximum: 1)
insert into emp07 values(1235, '홍길북', 3000, 'm'); -- error : ORA-02290: check constraint (SCOTT.EMP07_GENDER_CK) violated

-- ※ [8] Default 제약 조건 설정하기 : 기본값으로 특정 값이 저장되도록 설정하는 조건
--          지역명(loc) 컬럼에 아무 값도 입력하지 않을 때, 디폴트 값인 'SEOUL'이 입력되도록 default 제약 조건 지정

create table dept08 (
        deptno number(2) constraint dept08_deptno_pk primary key,
        dname varchar2(20) constraint dept08_dname_nn not null,
        loc varchar2(20) default 'SEOUL'
);

insert into dept08 values(10, '회계부'); -- error : SQL 오류: ORA-00947: not enough values
insert into dept08(deptno, dname) values(10, '회계부');
insert into dept08 values(20, '연구소', '종로구');

select * from dept08;

--  [9] 제약 조건 명시 방법
--      1) 컬럼 레벨로 제약 조건명을 명시해서 제약 조건 설정 (>>> 편함)

create table dept09 (
        deptno number(2) constraint dept09_deptno_pk primary key,
        dname varchar2(20) constraint dept09_dname_nn not null,
        loc varchar2(20) default 'SEOUL'
);

--      2) 테이블 레벨 방식으로 제약 조건 설정 (>>> 추가하고 싶을 때 이거 사용하면 편함)
--          주의) not null 조건은 테이블 레벨 방식으로 제약 조건을 지정할 수 없다.

create table emp09(
        empno number(4),
        ename varchar2(20) constraint emp09_ename_nn not null,
        job varchar2(20),
        deptno number(2),
        
        constraint emp09_empno_pk primary key(empno),
        constraint emp09_job_uk unique(job),
        constraint emp09_deptno_fk foreign key(deptno) references dept06(deptno) -- dept06은 위에서 만들었음
);

select * from emp09;

-- [10] 제약 조건 추가하기

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
foreign key(deptno) references dept06(deptno); -- -- dept06은 위에서 만들었음

select * from emp10;

-- [11] not null 제약 조건 추가하기

alter table emp10
add constraint emp10_ename_nn not null(ename); -- error : ORA-00904: : invalid identifier

alter table emp10
modify ename constraint emp10_ename_nn not null; -- default가 null로 되어있어서 not null로 수정

-- [12] 제약 조건 제거하기

alter table emp10
drop primary key;

--  [13] 제약 조건 (외래키) 컬럼 삭제
-- > 자식 테이블인 사원테이블(emp06)은 부모 테이블(dept06)에 기본키인 부서번호를 참조하고 있다.
-- > 부서 테이블의 30번 부서는 사원 테이블에 근무하는 30번 사원이 존재하기 때문에 삭제할 수 없다.
-- > 부모 테이블의 부서번호 30번이 삭제되면 자식 테이블에서 자신이 참조하는 부모를 잃어버리게 되므로 삭제할 수 없다.

-- > 부서 테이블의 30번 부서에서 근무하는 사원을 삭제한 후 부서 테이블에서 30번 부서를 삭제
-- > 참조 무결성 때문에 삭제가 불가능하므로 emp06에서 제약 조건을 제거한 후에 30번 부서를 삭제

delete from dept06 -- [6]에서 생성했음
where deptno = 30; -- error : (PDF 7p) 부모테이블의 부서번호 30번이 삭제되면 자식테이블에서 자신이 참조하는 부모를 잃어버리게 되므로 삭제할 수 없는 것이다.

-- > 테이블에서 제약 조건을 삭제하지 않고 일시적으로 제약 조건이 적용되지 않도록 하는 방법으로 제약 조건을 비활성화 하는 방법

alter table emp06
disable constraint emp06_deptno_fk; -- ① 제약 조건의 일시 비활성화 (자식 테이블)

delete from dept06 -- ② 삭제
where deptno = 30;

insert into dept06 -- ③ 삽입
values (30, '총무부', '중구');

alter table emp06
enable constraint emp06_deptno_fk; -- ④ 비활성화된 제약 조건을 해제하여 다시 활성화

select * from dept06;

--      * cascade 옵션
-- > 부모 테이블(dept06)과 자식 테이블(emp06)간의 참조 설정(외래키)이 되어 있을 때
--    부모 테이블의 제약 조건을 비활성화하면 이를 참조하고 있는 자식 테이블의 제약 조건까지 같이 비활성화 시켜 주는 옵션
-- > 부모 테이블의 제약 조건을 삭제하면 이를 참조하고 있는 자식 테이블의 제약조건도 같이 삭제된다.
alter table dept06 -- 비활성화 (부모)
disable primary key cascade; -- 자식까지 같이 비활성화

select constraint_name, constraint_type, table_name, r_constraint_name, status
from user_constraints
where table_name in ('DEPT06', 'EMP06');

alter table dept06
drop primary key; -- error : ORA-02273: this unique/primary key is referenced by some foreign keys

alter table dept06
drop primary key cascade;
                                                     
alter table dept06
add constraint dept06_deptno_pk primary key(deptno);