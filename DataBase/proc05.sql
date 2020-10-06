create or replace procedure cursor_sample01
is
	vdept dept%rowtype;
	cursor c1
	is
	select * from dept;
begin
	DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
	DBMS_OUTPUT.PUT_LINE('------------------------');
	
	open c1;
	
	LOOP
		fetch c1 into vdept.deptno, vdept.dname, vdept.loc;  -- 현재 행을 read하여 변수에 전달
		exit when c1%notfound;
		
		DBMS_OUTPUT.PUT_LINE(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
	END LOOP;
	
	close c1;
end;
/
