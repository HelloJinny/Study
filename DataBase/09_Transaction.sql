-- * 트랜잭션

-- [1] 테이블 생성

create table dept01
as
select * from dept;

select * from dept01;

-- [2] command 창에서 실습 진행 할 것

delete  from dept01;

commit; -- 명령문을 실행하면 최종 반영

-- [3] 되돌리기

drop table dept01 purge;

rollback;