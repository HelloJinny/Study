-- * 오라클 : 시퀀스(Sequence)
-- 시퀀스 통해 일련번호 관리하는거 선호 안함 (그룹함수 max 이용 선호 )

--[1] 샘플 테이블 생성

create table memos(
        num         number(4)  constraint memos_num_pk primary key,
        name       varchar2(20)  constraint memos_name_nn  not null,
        postDate   Date   default(sysdate)
);
        
--[2] 해당 테이블의 시퀀스 생성

create sequence memos_seq
start with 1 increment by 1; -- 1부터 시작, 하나씩 증가

--[3] 데이터 입력 : 일련번호 포함
-- ·nextVal : 다음 값을 반환

insert into memos(num, name)
values(memos_seq.nextVal, '홍길동');

insert into memos(num, name)
values(memos_seq.nextVal, '이순신');

insert into memos(num, name)
values(memos_seq.nextVal, '강감찬');

select * from memos;

--[4] 현재 시퀀스가 어디까지 증가되어져 있는지 확인
-- · currVal : 현재 값을 반환
-- · NextVal로 새로운 값을 생성한 다음에 이 값을 currval에 대체하게 된다.
-- · nextVal, currVal  사용할 수 있는 경우 
--      서브 쿼리가 아닌 select 문
--      insert 문의 select 절, value 절
--      update 문의 set 절

select memos_seq.currVal from dual;

--[5] 시퀀스 수정 : 최대 증가값을 4까지로 제한

alter sequence memos_seq maxvalue 4;

insert into memos(num, name)
values(memos_seq.nextVal, '안중근');

insert into memos(num, name)
values(memos_seq.nextVal, '안창호'); -- 최대값 4로 설정했기 때문에 error

alter sequence memos_seq maxvalue 100;

--[6] 시퀀스 삭제

drop sequence memos_seq;

--[7] 시퀀스 없는 상태에서 자동 증가값 구현?

select max(num) from memos;

insert into memos(num, name) 
values((select max(num)+1 from memos), '세종대왕');

select * from memos;
