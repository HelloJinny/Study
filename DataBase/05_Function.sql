-- * 오라클 명령어 : 내장 함수


-- [1] 임시 데이터 출력

SELECT 1234*1234
FROM DUAL; -- 뻥튀기 테이블

-- [2] 샘플 테이블인 dual 테이블

SELECT * FROM DUAL;

---- *** 문자열 처리 관련 함수 ***

-- ★ [3] lower() : 모든 문자를 소문자로 변환

SELECT LOWER('Hong Kil Dong') as "소문자"
FROM DUAL;

-- [4] upper() : 모든 문자를 대문자로 변환

SELECT UPPER('Hong Kil Dong') as "대문자"
FROM DUAL;

-- [5] initcap() : 첫글자만 대문자로 변환

SELECT INITCAP('hong kil dong') as "첫글자만 대문자"
FROM DUAL;

-- [6] concat() : 문자열 연결

SELECT CONCAT('더조은', '컴퓨터 학원')
FROM DUAL;

-- [7] length() : 문자열의 길이

SELECT LENGTH('더조은 컴퓨터 학원'), LENGTH('THe Joeun Computer')
FROM DUAL;

-- [8] substr() : 문자열 추출(데이터, 인덱스(1), 카운트)

SELECT SUBSTR('홍길동 만세', 2, 4) -- 2번째부터 4번째까지 (스페이스 포함)
FROM DUAL;

-- [9] instr() : 문자열 시작 위치

SELECT INSTR('홍길동 만세', '동')
FROM DUAL;

SELECT INSTR('seven', 'e') -- 처음 'e' (처음에 찾으면 동작을 멈춘다)
FROM DUAL;

-- [10] lpad(), rpad() : 자리 채우기

SELECT LPAD('Oracle', 20, '#') 
FROM DUAL;

SELECT RPAD('Oracle', 20, '*')
FROM DUAL;

-- ★ [11] trim() : 컬럼이나 대상 문자열에서 특정 문자가 첫번째 글자이거나 마지막 글자이면 잘라내고 남은 문자열만 반환.

SELECT TRIM('a' from 'aaaOracleaaaaaaa')
FROM DUAL;

SELECT TRIM(' ' from '   Oracle     ') -- 여백이 있는 경우 多
FROM DUAL;

---- *** 수식 처리 관련 함수 ***

-- [12] round() : 반올림(음수 : 소숫점 이상 자리)

SELECT ROUND(12.34567, 3)
FROM DUAL;

SELECT DEPTNO, SAL, ROUND(SAL, -3) -- ROUND 함수는 음수, 실수, 정수 전부 OK
FROM EMP
WHERE DEPTNO=30;

-- [13] abs() : 절대값

SELECT ABS(10)
FROM DUAL;

SELECT ABS(-10)
FROM DUAL;

-- [14] floor() : 소수자리 버리기

SELECT FLOOR(12.34567)
FROM DUAL;

SELECT FLOOR(-12.34567)
FROM DUAL;

-- [15] trunc() : 특정 자리 자르기

SELECT TRUNC(12.34567, 3)
FROM DUAL;

-- [16] mod() : 나머지

SELECT MOD(8, 5)
FROM DUAL;

---- *** 날짜 처리 관련 함수 ***

-- [17] sysdate : 날짜

SELECT SYSDATE
FROM DUAL;

-- [18] months_between() : 개월 수 구하기

select ename, hiredate, months_between(sysdate, hiredate) "근무 개월 수 ", deptno
from emp
where deptno = 10;

-- [19] add_months() : 개월 수 더하기

select add_months(sysdate, 200)
from dual;

select add_months(sysdate, -200) -- 200개월 전의 날짜
from dual;

-- [20] next_day() : 다가올 요일에 해당하는 날짜

select next_day(sysdate, '일요일')
from dual;

-- [21] last_day() : 해당 달의 마지막 일 수

select last_day(sysdate)
from dual;

-- ★ [22] to_char() : 문자열로 반환

select to_char(sysdate, 'yyyy/mm/dd')
from dual;

-- ★ [23] to_date() : 날짜형(date)으로 변환

select to_date('2009/12/31', 'yyyy/mm/dd')
from dual;

---- ***기타 ***

-- [24] nvl() : null인 데이터를 다른 데이터로 변경

select ename, comm, nvl(comm, 0)
from emp;

-- [25] decode() : switch문과 같은 기능

select ename, deptno, decode(deptno, 10, 'ACCOUNT',
                                                            20, 'RESEARCH',
                                                            30, 'SALES',
                                                            40, 'OPERATIONS') as "부서 약자"
from emp;

-- [26] case ~ end~ : if ~ else if ~

select ename, deptno, case
                                            when deptno = 10 then 'ACCOUNT'
                                            when deptno = 20 then 'RESEARCH'
                                            when deptno = 30 then 'SALES'
                                            when deptno = 40 then 'OPERATIONS'
                                    end as "부서명"
from emp;

