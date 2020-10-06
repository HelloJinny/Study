create or replace trigger trg_01
after insert
on emp02
begin
	DBMS_OUTPUT.PUT_LINE('데이터가 추가되었습니다.');
end;
/
