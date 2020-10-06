-- * 오라클 명령어 : Group 함수

-- [1] sum() : 합계

SELECT SUM(SAL) "총급여"
FROM EMP;

-- [2]  count() : 카운트

SELECT COUNT(*)
FROM EMP;

SELECT COUNT(*)
FROM DEPT;

-- [3] avg() : 평균

SELECT AVG(SAL) "평균 급여"
FROM EMP;

-- [4] max() : 최대값

SELECT MAX(SAL) "최고 급여 수령자"
FROM EMP;

-- [5] min() : 최소값

SELECT MIN(SAL) "최저 급여 수령자"
FROM EMP;

-- [6] Group by 절 : 직업별 급여 평균

SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB;

-- [7] Having 절 : 직업별 급여 평균 (단, 급여 평균 2000 이상 직업 )

SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) >= 2000;