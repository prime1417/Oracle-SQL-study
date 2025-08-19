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
