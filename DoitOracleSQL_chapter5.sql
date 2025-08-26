desc emp;
SELECT * FROM EMP ;
---- chapter 5
-- #05-3. 연산자 종류와 활용 방법 알아보기
--------------------------------------------------------------------------------   
-- ** 산술 : +(덧셈), -(뺄셈), *(곱셈), /(나눗셈) 연산자
-- ** 대소비교 : > , >= , < , <= 연산자, 연산자 앞뒤 데이터의 대소 비교
--- 등가비교 : = , != , <> , ^= 연산자, 연산자 앞뒤 항목이 같은 값인지 검사
-- ** 논리 부정 : NOT 연산자
-- ** IN 연산자 : 특정 열에 해당하는 조건을 여러개 지정 가능
-- ** BETWEEN A AND B : 특정 열에서 A와 B 사이의 데이터 조회
-- ** LIKE : 일부 문자열을 포함하는 데이터 조회 (와일드 카드(%, _ 기호)와 자주 사용)
-- ** IS NULL : 특정 열 또는 연산의 결과값이 NULL인지 확인
-- ** 집합연산자 : 두 SELECT문의 결과값을 연결할 때 사용
--------------------------------------------------------------------------------
-- 1) 산술 연산자
-- 1-1) 곰셈 살술 연산자 사용 예시
SELECT * FROM EMP
    WHERE  SAL * 12 = 36000;
    --- WHERE절 조건 기준 열에 산술 연산자를 직접 사용하는 경우는 드물다. 적용이 가능하다는 점만 인지
 
-- 2) 비교연산자(대소비교, 등가비교)
---- 대소비교 : 
-- 2-1) 대소 비교 연산자를 사용하여 출력하기
SELECT * FROM EMP
    WHERE SAL >= 3000;

-- 2-2) 고용날짜가 81년 5월 19일 이후인 사원 정보 출력
SELECT * FROM EMP
    WHERE  HIREDATE >= '81/5/20' ;
    
-- 2-3) 고용날짜가 81년 5월 20일 이전 사원의 이름, 사번, 직책, 부서번호 정보 출력
SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP
    WHERE  HIREDATE < '81/5/20' ;
    
-- 2-4) 급여가 2500 이상이고 직업이 ANALYST인 사원 정보 출력
SELECT * FROM EMP
    WHERE SAL >= 2500
    AND JOB = 'ANALYST';
    
-- 2-5) 문자를 대소 비교 연산자로 비교하기(비교 문자열이 문자 하나일 때)
SELECT * FROM EMP
    WHERE ENAME >= 'F';
    -- 사원의 이름 첫 문자가 F와 같거나 F보다 뒤에 있는 것만 검색
    
-- 2-6) 문자를 대소 비교 연산자로 비교하기(비교 문자열이 여러 문자일 때)
SELECT * FROM EMP
    WHERE ENAME <= 'FORZ';
    -- 순차적으로 F 비교, O비교, R비교, Z비교해서 모두 만족하는 것만 출력
    
-- 2-7) 등가 비교 연산자(!=)를 사용해 출력하기
SELECT * FROM EMP
    WHERE SAL != 3000;
    
-- 2-8) 등가 비교 연산자(<>)를 사용해 출력하기
SELECT * FROM EMP
    WHERE SAL <> 3000;

-- 2-8) 등가 비교 연산자(^=)를 사용해 출력하기
SELECT * FROM EMP
    WHERE SAL ^= 3000;
    
-- 3) 논리 부정 연산자(NOT)
---- IN, VETWEEN, IS NULL과 같이 자주 사용됨
SELECT * FROM EMP
    WHERE NOT SAL = 3000;


-- 4) IN 연산자
--------------------------------------------------------------------------------   
-- ** 기본 형식
-- ** SELECT [열 이름] , [열 이름]...
-- ** FROM [테이블 이름]
-- ** WHERE 열 이름 IN (데이터1, 데이터2, ..., 데이터 N);

-- ** 키워드 : IN 
-- ** 필수요소 : 열 이름 및 조회할 열의 데이터 목록
--------------------------------------------------------------------------------
-- 4-1) IN 연산자 사용해 출력하기
SELECT * FROM EMP
    WHERE JOB IN ('MANAGER', 'SALESMAN');
    
-- 4-1) '4-1)'과 반대 정보 출력하기
SELECT * FROM EMP
    WHERE JOB NOT IN ('MANAGER', 'SALESMAN');
    
-- 4-3) IN 연산자를 사용해 부서 번호가 10, 20번인 사원정보를 출력하는 SQL 구문
SELECT * FROM EMP
    WHERE DEPTNO IN (20, 10);
    
-- 5) BETWEEN A AND B 연산자
--------------------------------------------------------------------------------   
-- ** 기본 형식
-- ** SELECT [열 이름] , [열 이름]...
-- ** FROM [테이블 이름]
-- ** WHERE 열 이름 BETWEEN 최솟값 AND 최댓값;

-- ** 키워드 : BETWEEN A AND B
-- ** 필수요소 : 열 이름, 최솟값, 최댓값
--------------------------------------------------------------------------------
--5-1) BETWEEN A AND B 연산자 사용해 출력하기
SELECT * FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;
    
--5-2) BETWEEN A AND B, NOT 연산자 사용해 출력하기
SELECT * FROM EMP
    WHERE SAL NOT BETWEEN 2000 AND 3000;

-- 6) LIKE  연산자와 와일드카드(%, _ 기호)
--------------------------------------------------------------------------------
-- ** " % " : 길이와 상관없이(문자가 없는 경우도 포함) 모든 문자열 데이터를 의미
-- ** " _ " : 어떤 값이든 상관없이 한 개의 문자열 데이터를 의미
-- ** '%, _' 기호가 문자열에 포함되어 있을 때 조회하는 방법 ==> ESCAPE 절 사용
-- SELECT *
--    FROM SOME_TABLE
--        WHERE SOME_COLUMN LIKE 'A\_A%' ESCAPE '\';      
--------------------------------------------------------------------------------

-- 6-1) LIKE 연산자 사용해 출력하기
SELECT * FROM EMP
    WHERE ENAME LIKE 'S%';
    -- S 문자로 시작하는 ENAME열 조회
    
-- 6-2) 사원 이름의 두 번째 글자가 L인 데이터만 출력하기
SELECT * FROM EMP
    WHERE ENAME LIKE '_L%';

-- 6-3) 사원 이름에 AM이 포함되는 사원 데이터만 출력하기
SELECT * FROM EMP
    WHERE ENAME LIKE '%AM%';
    
-- 6-4) 사원 이름에 AM을 포함하지 않은 사원 데이터 출력하기
SELECT * FROM EMP
    WHERE ENAME NOT LIKE '%AM%';
    
-- 7) IS NULL 연산자
SELECT * FROM EMP
    WHERE COMM = NULL;
    -- 언뜻 COMM 열이 NULL인 행이 나와야 할 것 같지만 출력 데이터는 없음
    -- NULL은 산술 연산자와 비교 연산자로 비교해도 결과값이 NULL 임
   
SELECT * FROM EMP
    WHERE COMM IS NULL; 

SELECT * FROM EMP
    WHERE COMM IS NOT NULL;
    -- IS 없이 NOT NULL로 연산 불가
    
-- 7-1) AND 연산자와 IS NULL 연산자 사용
SELECT * FROM EMP
    WHERE SAL > NULL
    AND COMM IS NULL;
    -- SAL > NULL ==> NULL
    -- COMM IS NULL ==> 결과값 출력 
    -- 결과값 데이터 AND NULL ==> NULL

-- 7-2) OR 연산자와 IS NULL 연산자 사용
SELECT * FROM EMP
    WHERE SAL > NULL
    OR COMM IS NULL;
    -- SAL > NULL ==> NULL
    -- COMM IS NULL ==> 결과값 출력
    -- 결과값 데이터 OR NULL ==> 결과값 데이터
--------------------------------------------------------------------------------
-- ** 핵심(여기서 A, B = TURE, FALSE, NULL)
-- ** A AND B 연산 :
-- NULL AND NULL == NULL
-- NULL AND TRUE == NULL
-- NULL AND FALSE == FALSE

-- ** A OR B 연산 :
-- NULL OR NULL == NULL
-- NULL OR TRUE == TRUE
-- NULL OR FALSE == NULL
--------------------------------------------------------------------------------


-- 8)집합 연산자
--------------------------------------------------------------------------------
--** 종류
-- UNION : SELECT문의 결과값을 합집합 / 중복 제거
-- UNION ALL : SELECT문의 결과값을 합집합 / 중복 허용
-- MINUS : 먼저 작성한 SELECT문 결과값에서 다음 SELECT문 결과값의 차집합 
-- INTERSECT 먼저 작성한 SELECT문 결과값과 다음 SELECT문 결과값의 교집합

-- ** 집합 연산자의 피연산자(두 테이블)의 열 개수, 열의 자료형이 같아야 함
-- ** 열 개수와 열의 자료형이 같다면 열의 이름이 달라도 가능(결과의 효용성은 사용자 의도에 따라 다름)
--------------------------------------------------------------------------------
-- 8-1) 집합 연산자(UNION)를 사용해 출력해보기
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;
    
-- 8-2) 집합 연산자(UNION)를 사용해 출력할 열 개수와 자료형이 같을 때 출력
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
    FROM EMP
    WHERE DEPTNO = 20;
    -- 출력 결과는 UNION 연산자 앞쪽에 사용한 열 이름을 사용
    
-- 8-3) 집합 연산자(UNION)를 사용해 출력하기(출력 결과 데이터가 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
-- 8-4) 집합 연산자(MINUS)를 사용해 출력하기(출력 결과 데이터가 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    -- 아무 출력이 없음
    
-- 8-5) 집합 연산자(UNION ALL)를 사용해 출력하기(출력 결과 데이터가 같을 때)
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    -- 중복 허용해서 두번씩 출력
    
-- 8-6) 집합 연산자(INTERSECT)를 사용해 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN (10, 20);
    -- '8-3)' 결과와 동일
--------------------------------------------------------------------------------
-- WHERE 절 조건식에 사용한 연산자에는 우선순위(PRIORITY)가 존재함
-- 책 PAGE. 129쪽 참고
-- 산술연산자 > 비교연산자 > [IS (NOT) NULL, (NOT) LIKE, (NOT) IN] > BETWEEN A AND B > 논리 부정 > 논리 연산자
--------------------------------------------------------------------------------



-- 연습문제

-- 1) EMP 테이블에서 사원 이름이 S로 끝나는 사원 데이터 출력 SQL 구문작성
SELECT * FROM EMP
    WHERE ENAME LIKE '%S';
    
-- 2) EMP 테이블에서 30번 부서(DEPTNO)에서 근무하는 사원 중 직책(JOB)이 SALESMAN인 사원의
-- 사원 번호, 이름, 직책, 급여, 부서 번호 출력 SQL
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
-- 3) EMP 테이블에서 20번, 30번 부서에 근무하는 사원 중 급여(SAL)가 2000 초과인 사원을 
-- 다음 두 방식의 SELECT문을 사용해 사원 번호, 이름, 직책, 급여, 부서 번호를 출력하는 SQL
--- * 집합 연산자를 사용하지 않는 방식
--- * 집합 연산자를 사용한 방식

-- 3-1) 집합 연산자 미사용
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN (20, 30)
    AND SAL > 2000; 

-- 3-1) 집합 연산자 사용
-- 방법 1. UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20 AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30 AND SAL > 2000;

-- 방법 2. INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN (20, 30)
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE SAL > 2000;
    
-- 4) NOT BETWEEN A AND B 연산자를 사용하지 않고 급여(SAL) 열이 2000 이상 3000이하
-- 범위 이외의 값을 갖니 데이터만 출력하는 SQL
SELECT * FROM EMP
    WHERE NOT (SAL >= 2000 AND SAL <= 3000) ;
    -- 연산자의 우선순위 고려해야 함
    
-- 5) 사원 이름에 E가 포함된 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가 아닌
-- 사원 이름, 사원 번호, 급여, 부서 번호를 출력하는 SQL
SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
    WHERE ENAME LIKE '%E%'
    AND DEPTNO = 30
    AND SAL NOT BETWEEN 1000 AND 2000;
    
-- 6) 추가 수당이 없고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중 사원 이름의 두 번째
-- 글자가 L이 아닌 사원의 정보를 출력하는 SQL
SELECT * FROM EMP
    WHERE COMM IS NULL
    AND MGR IS NOT NULL
    AND JOB IN ('MANAGER', 'CLERK')
    AND ENAME NOT LIKE '_L%';