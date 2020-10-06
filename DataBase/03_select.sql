-- * 오라클 명령어 : select문 (검색)

-- [1] scott 사용자가 관리하는 테이블 목록

SELECT * FROM TAB;

-- [2] 특정 테이블의 구조 (필드 리스트 / 데이터 형식 / 제약조건 )

DESC DEPT;

-- [3] 특정 테이블의 data 표시

SELECT * FROM DEPT;

SELECT * FROM EMP;

-- [4] 모든 컬럼 (필드명)이 아닌 , 필요한 컬럼 (필드명) 내용만 출력

SELECT DNAME, LOC
FROM DEPT;

-- [5] 각각의 필드명에 별칭을 주어서 출력 : as 생략 가능

SELECT DEPTNO as 부서번호, DNAME as 부서명, LOC as 위치 -- ① 
FROM DEPT;

-- cf)
SELECT DEPTNO as 부서 번호, DNAME as 부서명, LOC as 위 치 -- error : 띄어쓰기 X ("as 부서" 까지만 인식)
FROM DEPT; 
SELECT DEPTNO as "부서 번호", DNAME as "부서명", LOC as "위 치" -- ② 큰 따옴표 O
FROM DEPT;
SELECT DEPTNO as '부서 번호', DNAME as '부서명', LOC as '위 치' -- error : 작은 따옴표 X
FROM DEPT;
SELECT DEPTNO  "부서 번호", DNAME "부서명", LOC "위 치" -- ③ AS 생략 O
FROM DEPT;

SELECT EMPNO "사원 번호", ENAME "사원 이름", JOB "담당 업무", MGR "상사 번호", HIREDATE "입사일", SAL "급여", COMM "커미션", DEPTNO "부서 번호"  -- MGR "해당 사원의 상사 사원 번호" : 이름이 너무 길면 error
FROM EMP;

-- [6] 사원들의 직업명을 중복 제거 후 출력

SELECT * FROM EMP;

SELECT JOB 
FROM EMP;

SELECT DISTINCT JOB -- 중복 제거
FROM EMP;

-- [7] 급여가 3000 이상인 사원 정보 출력

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >=3000;

-- [8] 이름이 scott 사원의 정보 출력

SELECT * FROM EMP
WHERE ENAME='scott'; -- X : DATA의 경우는 대/소문자를 구별해야 함

SELECT * FROM EMP
WHERE ENAME='SCOTT';

-- [9] 1985 년도 이후로 입사한 사원 정보

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= '1985/01/01';

-- [10] 부서번호가 10이고, 그리고 직업이 'MANAGER'인 사원 출력

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO=10 AND JOB='MANAGER';

-- [11] 부서번호가 10이거나, 직업이 'MANAGER'인 사원 출력

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO=10 OR JOB='MANAGER';

-- [12] 부서번호가 10이 아닌 사원 (우선순위 : 산술 연산자 / 비교 연산자 > 논리 연산자)

SELECT ENAME, DEPTNO
FROM EMP
WHERE NOT (DEPTNO=10); -- ① 논리 연산자

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO <> 10; -- ② 비교 연산자

-- [13] 급여가 1000 ~ 3000 사이인 사원을 출력

SELECT ENAME, SAL
FROM EMP
WHERE SAL >= 1000 AND SAL <= 3000; -- ① 논리 연산자

-- [14] 급여가 1300 또는 1500 또는 1600인 사원 정보 출력

SELECT ENAME, SAL
FROM EMP
WHERE SAL=1300 OR SAL=1500 OR SAL=1600; -- ① 논리 연산자

SELECT ENAME, SAL
FROM EMP
WHERE SAL IN (1300, 1500, 1600); -- ②

-- [15] 이름이 'K'로 시작하는 사원 출력

SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE 'K%';

-- [16] 이름이 'K'로 끝나는 사원 출력

SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '%K';

-- [17] 이름에 'K'가 포함되어 있는 사원 출력

SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '%K%';

-- [18] 2번째 자리에 'A'가 들어가 있는 사원 출력

SELECT ENAME, EMPNO
FROM EMP
WHERE ENAME LIKE '_A%';

-- [19] 커미션을 받지 않는 사원 출력

SELECT * FROM EMP
WHERE COMM = NULL OR COMM = 0; -- 원하는 결과 X (산술/비교/논리 연산자 X)

SELECT * FROM EMP
WHERE COMM IS NULL OR COMM=0 ;

-- [20] 커미션을 받는 사원 출력

SELECT * FROM EMP
WHERE COMM <> NULL AND COMM <> 0;  -- 원하는 결과 X (산술/비교/논리 연산자 X)

SELECT * FROM EMP
WHERE COMM IS NOT NULL AND COMM <> 0;

-- [21] 사번의 정렬(오름차순)으로 출력

SELECT * FROM EMP
ORDER BY EMPNO ASC; -- ASC 생략 가능 (default)

-- [22] 사번의 정렬(내림차순)으로 출력

SELECT * FROM EMP
ORDER BY EMPNO DESC;

-- [23] 사원의 연봉 출력

SELECT ENAME "사원 이름", SAL "급여", (SAL * 12) "연봉"
FROM EMP;

SELECT ENAME "사원 이름", SAL "급여", (SAL * 12) "연봉"
FROM EMP
ORDER BY (SAL * 12) DESC; -- ① 내림차순 : ②번과 동일한 결과가 나오지만 별칭을 붙일 때는 별칭으로 해주기!!! 

SELECT ENAME "사원 이름", SAL "급여", (SAL * 12) "연봉"
FROM EMP
ORDER BY "연봉" DESC; -- ② 내림차순 O

SELECT ENAME "사원 이름", SAL "급여", (SAL * 12) "연봉"
FROM EMP
ORDER BY (SAL * 12) "연봉" DESC; -- ③ error

-- [24] 커미션을 포함한 최종 연봉 출력

SELECT ENAME "사원 이름", SAL "급여", COMM "커미션", (SAL * 12 + COMM) "최종 연봉"
FROM EMP;

-- [25] [24]의 오류 해결법

SELECT ENAME "사원 이름", SAL "급여", COMM "커미션", (SAL * 12 + COMM) "최종 연봉", NVL(COMM, 0), SAL * 12 + NVL(COMM, 0) "연봉"
-- NVL(COMM, 0) : COMM의 NULL 값을 찾아서 0으로 채워서 보여준다. 데이터를 변경해주는 기능은 아님
FROM EMP;

