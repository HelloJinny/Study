-- * ����Ŭ : PL/SQL

-- [1] 'Hello World' ���
SQL > set serveroutput on  								  	-- default ���� off�� �Ǿ��ִ�.
SQL > begin													  	-- ���α׷� ����
		  DBMS_OUTPUT.PUT_LINE('Hello World!');  	-- ������ִ� ����� �Լ�
		  end;  													  	-- ����� ���Դϴ�.
		  / 														  	-- ��� ����� ���Դϴ�. 
		  
-- [2-1] ���� ����ϱ�
SQL >
declare																-- ���� ���� Ʋ
	vempno number(4);											-- ��Į�� ���� ���� : ���� �ڷ����� �������ش�.
	vename varchar2(20);
begin  																-- ���α׷� ���� (��������� �ۼ�)
	vempno := 7788;								 			-- = �¿� �찡 ����. / := ������ ���� ����ش�.
	vename := 'SCOTT';
	DBMS_OUTPUT.PUT_LINE('��� / �̸�');
	DBMS_OUTPUT.PUT_LINE('-------------------------');
	DBMS_OUTPUT.PUT_LINE(vempno || ' / ' || vename);  						-- ||�� +�� ���Ұ� ����.
end;																	-- ����� ���Դϴ�.
/																		-- ��� ����� ���Դϴ�.
		  
-- [2-2] ���� ����ϱ�
SQL >
declare
	vempno emp.empno%type;								-- ���۷��� ���� ���� : Ư�� ���̺� Ư�� �÷��� �ڷ����� ��ġ��Ű�� ���� �ڷ��� ������ �����ϴ�.
	vename emp.ename%type;	
begin
	DBMS_OUTPUT.PUT_LINE('��� / �̸�');
	DBMS_OUTPUT.PUT_LINE('-------------------------');
	
	select empno, ename into vempno, vename
	from emp
	where ename = 'SCOTT';
	
	DBMS_OUTPUT.PUT_LINE(vempno || ' / ' || vename);
end;
/

-- [3] �����ͺ��̽����� ������ Ư¡ record type ���
--		 . emp ���̺��� scott ����� ������ ���
SQL >
declare
	type emp_record_type																				-- ���ڵ� Ÿ���� ����
	is record(
		v_empno  emp.empno%type,
		v_ename  emp.ename%type,
		v_job       emp.job%type,
		v_deptno  emp.deptno%type
	);
	emp_record  emp_record_type;																	-- ���ڵ� Ÿ���� ���� ����												
begin
	select empno, ename, job, deptno into emp_record									-- into ������ �����ϰ� �ִ� ������ ���� ����ּ���.
	from emp
	where ename = 'SCOTT';
	
	DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || TO_CHAR(emp_record.v_empno));		-- �ڹ��� ���������� ���ؼ� ������ �����ϴ� ��İ� �����ϴ�.
	DBMS_OUTPUT.PUT_LINE('����̸� : ' || TO_CHAR(emp_record.v_ename));
	DBMS_OUTPUT.PUT_LINE('������ : ' || TO_CHAR(emp_record.v_job));
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || TO_CHAR(emp_record.v_deptno));
end;
/

-- [4] ���ǹ�
--		 . �����ȣ�� 7788�� ����� �μ� ��ȣ�� ���ͼ� �μ� ��ȣ�� ���� �μ����� ���ϼ���.
SQL > 
declare
	vempno number(4);
	vename varchar2(20);
	vdeptno emp.deptno%type;
	vdname varchar2(20) := null;
begin
	select empno, ename, deptno
	into vempno, vename, vdeptno
	from emp
	where empno = 7788;
	
	if(vdeptno = 10) then vdname := 'ACCOUNTING';
	-- if ��ȣ �ȿ��� true�� false���� �;������� ���������� ���� ���� �幰��.
	-- �� �����ڵ��� �̿��ؼ� ���� ����� true�� false�� ��ȯ���ش�.
	-- if�� then�� �� ������ �������� ��������Ѵ�.
	elsif(vdeptno = 20) then vdname := 'RESEARCH';
	elsif(vdeptno = 30) then vdname := 'SALES';
	elsif(vdeptno = 40) then vdname := 'OPERATIONS';
	-- else�� ó���ص� ������ 50, 60�� ���� �� �� �ֱ� ������ elsif�� ó���Ѵ�.
	end if;
	-- if���� ���� �� �̷��� �����ش�.
	
	DBMS_OUTPUT.PUT_LINE('��� / �̸� / �μ���');
	DBMS_OUTPUT.PUT_LINE('-------------------------');
	DBMS_OUTPUT.PUT_LINE(vempno || ' / '  || vename || ' / ' || vdname);
end;
/

-- [5] �ݺ���
--		1) basic loop ��
declare
	n number := 1;
begin
	LOOP													-- ���� ������ �� �� �ִ�. but �ݺ����� ���� ������ ���� �ȵȴ�. �ݵ�� Ż�� ������ �پ�� �Ѵ�.
		DBMS_OUTPUT.PUT_LINE(n);
		n := n + 1;									-- ���� ���ּ���.
		
		if(5 < n) then exit;
		end if;
		
	END LOOP;
end;
/

--		2) for loop ��
SQL >
declare
begin
	for n in 1..5 LOOP								-- 1���� 5���� ���������� ���� �ϳ��� �����ϸ鼭 �ݺ��Ѵ�.
		DBMS_OUTPUT.PUT_LINE(n);
	END LOOP;
end;
/

--		3) while loop ��
declare
	n number := 1;
begin
	while(n <= 5) LOOP
		DBMS_OUTPUT.PUT_LINE(n);
		n := n + 1;
	END LOOP;
end;
/
