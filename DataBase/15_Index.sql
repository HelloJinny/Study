-- * 오라클 : 인덱스 (index)

-- [1] 인덱스 정보 조회

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP', 'DEPT');

-- [2] 조회 속도 비교히기

--- 사원테이블 복사하기

drop table emp01 purge;

create table emp01
as
select * from emp;

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP', 'EMP01');

-- 주의) 데이터 복사시 테이블 구조와 내용만 복사될 뿐 제약 조건은 복사되지 않는다.

-- 데이터 삽입

insert into emp01 select * from emp01; -- emp01에 담겨 있는 데이터 전체를 읽어와서 emp01 안에 추가해준다.

insert into emp01(empno, ename) values(8010, 'ANGEL');

set timing on

select distinct empno, ename
from emp01
where ename = 'ANGEL'; -- 6.088 (index 연결 X)

-- [3] 인덱스 생성
--      : 기본키나 유일키가 아닌 컬럼에 대해서 인덱스를 지정하려면 create index 명령어를 사용

create index idx_emp01_ename 
on emp01(ename);

select distinct empno, ename
from emp01
where ename = 'ANGEL'; -- 0.002sec (index 연결 O)

-- [4] 인덱스 제거

drop index idx_emp01_ename;

select index_name, table_name, column_name
from user_ind_columns
where table_name in ('EMP01');

drop table emp01 purge; -- 저장소 공간을 쓸데없이 낭비할 필요가 없으므로 삭제를 해준다.
