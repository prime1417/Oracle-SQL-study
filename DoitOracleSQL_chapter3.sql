desc emp;

--emp 테이블 출력 질의
select * from emp;

--chapter 2
--실습용 테이블 살펴보기

DESC EMP;
----emp 테이블 메타 데이터 
--EMPNO / 사원 번호 / EMP 테이블 기본키
--ENAME / 사원 이름 / SCOTT, JONES 등
--JOB / 사원 직책 / MANAGER, CLERK 등
--MGR / 직속상관의 사원 번호 / MANAGER 준말, 현재 레코드에 해당하는 사원의 상급자 네 자리 사원 번호
--HIREDATE / 입사일 / 입사 날짜 데이터
--SAL / 급여 / 소수 둘쨰 자리 포함 일곱 자리 숫자
--SCOMM / 급여 외 추가 수당 / COMMISSION 준말, 소수 둘째 자리 포함 일곱 자리 숫자
--DEPTNO / 사원이 속한 부서 번호 / DEPARTMENT NUMBER 준말, 사원의 부서 고유 번호 두자리 숫자
---- DEPTNO는 EMP 테이블이  DEPT 테이블 참조를 위한 외래키

DESC DEPT;
----dept 테이블 메타 데이터
--DEPTNO / 부서번호 / 두 자리 숫자, 기본키
--DNAME / 부서이름 / 14바이트 크기 가변형 문자열
--LOC / 부서가 위치한 지역 / 13바이트 크기의 가변형 문자열

DESC SALGRADE;
----SALGERADE 테이블 메타 데이터
--GRADE / 급여 등급 / 수자
--LOSAL / 급여 등급의 최소 급여액 / 숫자
--HISAL / 급여 등급의 최대 급여액 / 숫자

---- chapter 3
-- #04-2. 데이터를 조회하는 3가지 방법 
-- ##셀렉션, 프로젝션, 조인
--- 1) 셀렉션(SELECTION) : 행(가로, row, 레코드 등) 단위 조회

--- 2) 프로젝션(PROJECTION) : 열(세로, column, 특징, 속성, 변수) 단위 조회

--- 3) 조인(JOIN) : 두 개 이상의 테이블을 사용해 조회하는 조인

-- #04-3. SQL의 기본 뼈대, SELECT절과 FROM절
--------------------------------------------------------------------------------
-- ** SQL은 대소문자를 구분하지 않는다.
-- ** 단, 계정 비밀번호와 데이터베이스로 관리하는 '데이터' 자체는 대소문자 구분
--------------------------------------------------------------------------------
-- ## SELECT : 열 이름, 출력할 데이터를 하나 이상 지정, 또는 *(모든 열)
-- ## FROM : 조회할 테이블 이름 지정
---- 1) 전체 열 선택하기
SELECT * FROM DEPT;

---- 2) 부분 열 선택하기(사원 번호, 이름, 사원 부서번호 출력하기)
SELECT EMPNO, ENAME, DEPTNO  FROM EMP;
--------------------------------------------------------------------------------
-- ** SELECT는 기본적으로 출력 데이터의 정렬 순서를 보장하지 않는다.
--------------------------------------------------------------------------------

---- 2-1) 사원 번호와 사원 이름, 급여만 출력해보기
SELECT EMPNO, ENAME, SAL
    FROM EMP;
--------------------------------------------------------------------------------
-- ** 데이터를 제외한 SQL 구문의 띄어쓰기와 줄 바꿈은 명령 수행에 영향을 주지 않는다.
-- ** 가독성을 위해 띄어쓰기와 줄 바꿈을 적극 활용할 것
--------------------------------------------------------------------------------

-- #04-4. 중복 데이터를 삭제하는 DISTINCT
-- ## DISTINCT :  SELECT 절에 열 이름 지정 전에 사용, 데이터를 조회한 후 중복을 제거
SELECT DEPTNO FROM EMP;
    -- DEPTNO에는 몇 종류인지 모르나 같은 데이터가 여럿 있음을 알수있음.

---- 1) 열이 한 개일 때 DISTINCT로 열 중복 제거하기
SELECT DISTINCT DEPTNO
    FROM EMP;
    -- DEPTNO 컬럼의 고유 값 종류만 출력
    
---- 2) 열이 여러 개일 때 DISTINCT로 열 중복 제거하기
SELECT DISTINCT DEPTNO, JOB
    FROM EMP;
    -- JOB과 DEPTNO가 모두 중복되는 데이터는 한 번만 출력
    
---- 3) ALL로 중복되는 열 제거하지 않고 그대로 출력하기
SELECT ALL DEPTNO, JOB
    FROM EMP;
    -- ALL 생략해도 같은 결과(디폴트)
    
-- #04-5. 보기좋게 별칭 설정하기
-- ##SQL 구문으로 출력할 열 이름을 임의로 지정 가능
-- ##임의의 열 이름 = 별칭(alias)

---- 1) 열과 연산식
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;
    -- SAL*12+COMM : SAL 열의 값에 12를 곱하고, COMM 열의 값을 더한 값 출력 = "연간 총 수입"
    -- 출력 결과의 컬럼 이름을 보면 'SAL*12+COMM' 이 그대로 들어있는 것이 보임

---- 2) 곱하기(*)를 사용하지 않고 사원의 연간 총수입 출력해보기
SELECT ENAME, SAL, SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+COMM, COMM
    FROM EMP;
    
---- 3) 별칭 지정하는 방식
---- 3-1) 연산식과 별칭 사이 공백 이용 : SAL*12+COMM ANNSAL
---- 3-2) 연산식과 별칭 사이 공백과 별칭을 (" ")로 묶기 : SAL*12+COMM "ANNSAL"
---- 3-3) 연산식 공백 AS 공백 별칭 : SAL*12+COMM AS ANNSAL
---- 3-4) 연산식 공백 AS 공백 "별칭" : SAL*12+COMM AS "ANNSAL"
---- 3-5) '2)'의 SQL 구문을 '3-3)' 형식으로 바꿔 보기
SELECT ENAME, SAL, (SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+COMM) AS ANNSAL, COMM
    FROM EMP;
    -- 가독성을 위해 ()로 묶을 수 있음
    -- 출력 결과 3번째 열 이름 = ANNSAL로 출력된 것 확인
--------------------------------------------------------------------------------
-- ** 보안이나 데이터 노출을 방지하기 위해 별칭을 사용하기도 함
-- ** 출력 데이터가 나오기까지 진행 과정을 숨겨야 할 때 사용하기도 함
-- ** 실무에서는 '3-3)' 형식을 가장 많이 사용
--------------------------------------------------------------------------------    

-- #04-6. 원하는 순서로 출력 데이터를 정렬하는 ORDER BY절
-- ## ORDER BY 절 : SELECT문 가장 마지막에 작성
--------------------------------------------------------------------------------   
-- ** SELECT [열이름1], [열이름2], [열이름3],...
-- ** FROM  [테이블 이름]
-- ** (그 밖의 절)
-- ** ORDER BY [정렬하려는 열 이름(여러 열 지정 가능)][정렬 옵션];
-------------------------------------------------------------------------------- 
-- 키워드 : ORDER BY
-- 필수요소 : 정렬 할 열 이름(하나 이상 지정)
-- 선택요소 : "ASC" = 오름차순, "DESC" = 내림차순

---- 1) 오름차순과 내림차순 사용하기
SELECT * 
    FROM EMP 
        ORDER BY SAL ASC;
        -- EMP 테이블의 모든 열을 급여 기준으로 오름차순 정렬해 출력
        
---- 1-1) EMP 테이블의 모든 열이 사원 번호 기준으로 오름차순이 되도록 SQL 구문 작성
SELECT *
    FROM EMP
ORDER BY EMPNO ASC;

---- 1-2) EMP 테이블의 [사원 번호, 이름, 급여]가 사원 번호, 이름 기준으로 내림차순이 되도록 SQL 구문 작성
SELECT EMPNO, ENAME, SAL
    FROM EMP
        ORDER BY ENAME DESC;

---- 1-3) EMP 테이블의 [사원 번호, 이름, 급여]가 급여 기준으로 내림차순이 되도록 SQL 구문 작성
SELECT EMPNO, ENAME, SAL
    FROM EMP
        ORDER BY SAL DESC;
        
---- 2) 각각의 열에 내림차순과 오름차순 동시에 사용하기
SELECT *
    FROM EMP
            ORDER BY DEPTNO ASC, SAL DESC;
            
---- 2-1) EMP 테이블의 [사원 번호, 이름, 급여]를 [급여와 이름 기준] 내림차순, [사원번호 기준] 오름차순 출력하기
SELECT EMPNO, ENAME, SAL
    FROM EMP
        ORDER BY SAL DESC, ENAME DESC, EMPNO ASC;
        -- ORDER BY 구문의 순서 기준으로 컬럼에 오름/내림차순이 적용
--------------------------------------------------------------------------------   
-- ** ORDER BY 절은 꼭 필요한 경우 아니면 사용 지양 --> 서비스 응답 시간이 느려지므로
-------------------------------------------------------------------------------- 

---- 연습문제
-- SELECT문의 조회할 열 또는 여러 열의 조합, 연산식을 지정하는 절은? = SELECT
-- SELECT문의조회할 데이터가 저장된 테이블 이름을 지정하는 절은? = FROM
-- 지정할 열 이름이 너무 길 때, 별도 이름을 지정하는 방법은? = 별칭(alias)
-- 별칭 사용 형식 중 실무에서 가장 많이 쓰이는 형식은? = [연산식 등 열 이름]공백[AS]공백[별칭]
-- EMP 테이블의 JOB열을 데이터 중복 없이 출력하는 SQL문은?
SELECT DISTINCT JOB FROM EMP;
-- 조건을 만족하는 SQL 구문은?
-- ##조건1. 조회할 테이블은 EMP, 모든 열을 출력
-- ##조건2. 출력되는 열의 별칭은 다음과 같다
-- ## EMPNO -> EMPLOYEE_NO
-- ## ENAME -> EMPLOYEE_NAME
-- ## MGR -> MANAGER
-- ## SAL -> SALARY
-- ## COMM -> COMMISIION
-- ## DEPTNO -> DEPARTMENT_TO
-- ## 조건3. 부서 번호를 기준 내림차순 정렬, 사원 이름 기준 오름차순 정렬
SELECT HIREDATE, JOB, EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, 
    MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISIION, DEPTNO AS DEPARTMENT_TO
    FROM EMP
        ORDER BY DEPARTMENT_TO DESC, EMPLOYEE_NAME ASC;




