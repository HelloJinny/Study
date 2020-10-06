-- * 오라클 SQL문 : 테이블 생성/ 수정 /삭제

-- [1] 테이블 생성 : create table문

create table exam01(
    exno        number(4),
    exname    varchar2(20),
    exsal        number(7,2)
);

select * from tab;
select * from exam01;

-- [2] 기존 테이블과 동일하게 테이블 만들기

create table exam02
as
select * from emp;

select * from exam02;

-- [3] 기존 테이블에서 새로운 컬럼 추가 : alter 문 (필드추가)

alter table exam01
add (
    exjob varchar2(10)
);

desc exam01;

-- [4] 테이블 구조 수정 : 필드 수정

alter table exam01
modify (
    exjob varchar2(20)
);

-- [5] 테이블 구조 수정 : 필드 삭제

alter table exam01
drop column exjob;

-- [6] 테이블 수정 : 이름 변경

alter table exam01 rename to test01; -- 방법 ①

rename test01 to exam01; -- 방법 ②

select * from tab;

-- [7] 테이블 삭제

drop table exam01;

select * from tab;

-- cf) - 오라클 10g 부터는 테이블을 삭제하면 'BIN$6WZ3U92/RDOy+6LKaVKjCw==$0'와 같은 임시 테이블로 교체된다.
--      - 임시 테이블을 삭제하고 싶다면

purge recyclebin;

--      - 처음부터 테이블을 완전 삭제하고 싶다
 
drop table exam01 purge;

select * from tab;

-- 

create table exam10  -- 생성
as
select * from dept;

select * from exam10; -- 검색

drop table exam10;  -- 삭제

-- 복원

select object_name, original_name, type, createtime
from recyclebin   
order by createtime;

flashback table exam10 to before drop; -- 방법 ①
flashback table exam10 to before drop rename to exam20; -- 방법 ② 다른 이름으로 변경 (복원하고 실행하면 X)


-- [8] 테이블 내의 모든 데이터 (레코드 ) 삭제

select * from exam02;
truncate table exam02;