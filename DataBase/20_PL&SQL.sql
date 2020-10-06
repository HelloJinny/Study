-- * 오라클 : PL/SQL

-- [1] 'Hello World' 출력
SQL > set serveroutput on  								  	-- default 값은 off로 되어있다.
SQL > begin													  	-- 프로그램 시작
		  DBMS_OUTPUT.PUT_LINE('Hello World!');  	-- 출력해주는 기능의 함수
		  end;  													  	-- 명령이 끝입니다.
		  / 														  	-- 모든 명령의 끝입니다. 
		  
-- [2-1] 변수 사용하기
SQL >
declare																-- 변수 선언 틀
	vempno number(4);											-- 스칼라 변수 선언 : 직접 자료형을 지정해준다.
	vename varchar2(20);
begin  																-- 프로그램 시작 (절차적언어 작성)
	vempno := 7788;								 			-- = 좌와 우가 같다. / := 변수에 값을 담아준다.
	vename := 'SCOTT';
	DBMS_OUTPUT.PUT_LINE('사번 / 이름');
	DBMS_OUTPUT.PUT_LINE('-------------------------');
	DBMS_OUTPUT.PUT_LINE(vempno || ' / ' || vename);  						-- ||는 +의 역할과 같다.
end;																	-- 명령이 끝입니다.
/																		-- 모든 명령의 끝입니다.
		  
-- [2-2] 변수 사용하기
SQL >
declare
	vempno emp.empno%type;								-- 레퍼런스 변수 선언 : 특정 테이블에 특정 컬럼의 자료형과 일치시키는 변수 자료형 선언이 가능하다.
	vename emp.ename%type;	
begin
	DBMS_OUTPUT.PUT_LINE('사번 / 이름');
	DBMS_OUTPUT.PUT_LINE('-------------------------');
	
	select empno, ename into vempno, vename
	from emp
	where ename = 'SCOTT';
	
	DBMS_OUTPUT.PUT_LINE(vempno || ' / ' || vename);
end;
/

-- [3] 데이터베이스만이 가지는 특징 record type 사용
--		 . emp 테이블에서 scott 사원의 정보를 출력
SQL >
declare
	type emp_record_type																				-- 레코드 타입을 정의
	is record(
		v_empno  emp.empno%type,
		v_ename  emp.ename%type,
		v_job       emp.job%type,
		v_deptno  emp.deptno%type
	);
	emp_record  emp_record_type;																	-- 레코드 타입의 변수 선언												
begin
	select empno, ename, job, deptno into emp_record									-- into 위에서 선언하고 있는 변수의 값을 담아주세요.
	from emp
	where ename = 'SCOTT';
	
	DBMS_OUTPUT.PUT_LINE('사원번호 : ' || TO_CHAR(emp_record.v_empno));		-- 자바의 참조변수를 통해서 변수에 접근하는 방식과 유사하다.
	DBMS_OUTPUT.PUT_LINE('사원이름 : ' || TO_CHAR(emp_record.v_ename));
	DBMS_OUTPUT.PUT_LINE('담당업무 : ' || TO_CHAR(emp_record.v_job));
	DBMS_OUTPUT.PUT_LINE('부서번호 : ' || TO_CHAR(emp_record.v_deptno));
end;
/

-- [4] 조건문
--		 . 사원번호가 7788인 사원의 부서 번호를 얻어와서 부서 번호에 따른 부서명을 구하세요.
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
	-- if 괄호 안에는 true나 false값이 와야하지만 직접적으로 오는 경우는 드물다.
	-- 비교 연산자들을 이용해서 최종 결과가 true나 false를 반환해준다.
	-- if는 then과 한 쌍으로 마무리를 지어줘야한다.
	elsif(vdeptno = 20) then vdname := 'RESEARCH';
	elsif(vdeptno = 30) then vdname := 'SALES';
	elsif(vdeptno = 40) then vdname := 'OPERATIONS';
	-- else로 처리해도 되지만 50, 60도 동작 될 수 있기 때문에 elsif로 처리한다.
	end if;
	-- if문이 끝날 때 이렇게 끝내준다.
	
	DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서명');
	DBMS_OUTPUT.PUT_LINE('-------------------------');
	DBMS_OUTPUT.PUT_LINE(vempno || ' / '  || vename || ' / ' || vdname);
end;
/

-- [5] 반복문
--		1) basic loop 문
declare
	n number := 1;
begin
	LOOP													-- 무한 루프를 돌 수 있다. but 반복문은 무한 루프를 돌면 안된다. 반드시 탈출 조건이 붙어야 한다.
		DBMS_OUTPUT.PUT_LINE(n);
		n := n + 1;									-- 누적 해주세요.
		
		if(5 < n) then exit;
		end if;
		
	END LOOP;
end;
/

--		2) for loop 문
SQL >
declare
begin
	for n in 1..5 LOOP								-- 1부터 5까지 순차적으로 값을 하나씩 증가하면서 반복한다.
		DBMS_OUTPUT.PUT_LINE(n);
	END LOOP;
end;
/

--		3) while loop 문
declare
	n number := 1;
begin
	while(n <= 5) LOOP
		DBMS_OUTPUT.PUT_LINE(n);
		n := n + 1;
	END LOOP;
end;
/
