SELECT sysdate FROM dual;
--전체 직원 조회
SELECT * FROM hr.employees;
SELECT * FROM DEPARTMENTS d ;
SELECT employee_id, first_name, LAST_name FROM employees;
SELECT e.Employee_id,
       e.first_name,
       e.last_name
FROM employees e;
SELECT first_name
FROM employees
WHERE department_id=10;
SELECT first_name||' '||last_name AS "이름",
       salary*12 "연봉"
FROM employees
WHERE salary>=15000;
SELECT e. first_name|| ' ' ||last_name AS "이름",
       e. hire_date AS "입사일"
FROM employees e
WHERE hire_date>= '2008/01/01';
--이름이 lex인 직원의 연봉을 출력
SELECT e.first_name||' '||last_name AS "이름",
       e.salary*12 as"연봉"
FROM employees e
WHERE first_name= 'Lex';
--연봉이 14000이하이거나 17000 이상인 사원의 연봉
SELECT first_name||' '||last_name AS "이름",
       salary "연봉"
from employees e
WHERE e.salary >='17000'
or e.salary <='14000';
--2004/01/01에서 2005/12/31 사이에 입사한 사원의 이름과 입사일
SELECT e.first_name,
       e.hire_date
FROM employees e
WHERE e.hire_date<='05/12/31'
AND e.hire_Date>='04/01/01';
--연봉이 14000이상이며 17000이하인 사원의 이름과 연봉을 구하시오.
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 14000 AND 17000;
--항상 이상이거나 이하인 값만 포함할 수 있다. 작은거 and 큰거
--초과나 미만을 쓰려면 나눠서 써야 한다.
--in 연산자로 여러 조건 검사하기
SELECT e.first_name,
       e.last_name,
       e.salary
FROM employees e
WHERE first_name IN ('Neena', 'Lex', 'John');
--급여가 2100,3100, 4100, 5100인 사원의 이름과 급여
SELECT e.first_name||' '||last_name AS "이름",
       e.salary "급여"
FROM employees e
WHERE e.SALARY  IN (2100,3100,4100,5100);
--이름에 'am'을 포함한 사원의 이름과 급여 출력
SELECT first_name, last_name, salary
FROM employees
WHERE first_name LIKE '%am%';
SELECT first_name, salary, commission_pct, salary*commission_pct
FROM employees
WHERE salary BETWEEN 13000 AND 15000;
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
SELECT e.first_name
FROM employees e
WHERE commission_pct IS NULL
AND  manager_ID IS NULL;
SELECT first_name, salary, hire_Date
FROM employees e
ORDER BY 2 DESC, 3 ;
SELECT department_Id, salary, first_name
FROM employees e
ORDER BY 1;
--급여가 5000이상인 직원의 이름, 급여를 급여가 큰 직원부터 출력하세요
SELECT first_name, salary
FROM employees e
WHERE salary>= 5000
ORDER BY 2 DESC;

-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호, 급여, 이름을 출력하세요
SELECT department_ID, salary, FIRST_name
FROM employees e
ORDER BY department_Id, salary DESC;
SELECT CHR(97)
FROM dual;
SELECT ascii('a')
FROM dual;
SELECT lower('apple') FROM dual;
--문자함수 실습 initcap lower upper substr lpad rpad replace
SELECT e.first_name, lower(first_name), upper(first_name), 
       e.email, initcap(email), e.department_id
FROM employees e
WHERE department_id=100;
SELECT first_name, substr(first_name, 1,3), substr(first_name, -3,2)
FROM employees
WHERE department_id=100;
SELECT first_name, 
       lpad(first_name, 10,'*'),
       rpad(first_name, 10, '*')
FROM employees;
SELECT FIRST_NAME,
       replace(FIRST_NAME, 'a', '*')
FROM employees
WHERE department_id=100;
SELECT FIRST_NAME,
       replace(first_name, substr(first_name, 2,3), '***')
FROM employees
WHERE department_id=100;
SELECT first_name,
       translate(first_name,'ae','김승')
FROM employees
WHERE department_id=100;
--숫자함수 실습
SELECT trunc(123.346,2) "r2",
       trunc(123.456,0) "r0",
       trunc(123.456, -2) "r-2"
FROM dual;
SELECT sysdate
FROM employees;
SELECT next_day('2025/09/01', '금요일')
FROM dual;
SELECT months_between(hire_date, sysdate)
FROM employees
WHERE department_id=110;
--윤년 체크 특정연도를 4로 나누었을때 나머지 0 
--100 으로 나누었을떄 0이고 4로 나눈 나머지도 0이면 평년
 --400으로 나누었을떄 0이고 100으로 나눈 나머지 0이면 윤년
--변환함수 실습 to_char 숫자형>문자형
SELECT first_name||' '|| last_name "이름", 
       to_char(salary*12*1364.58, '999,999,999,999.99')|| '원' "SAL"
FROM employees
WHERE department_id=110;
SELECT sysdate,
       to_char(sysdate, 'YY-MM-DD DAY mon HH24:MI:SS') "시간"
FROM dual;
SELECT FIRST_NAME ,commission_pct,
       nvl(commission_pct,0) "커미션 null 대체값", 
       nvl2(commission_pct,100,0) "전체 커미션 대체값"
FROM employees;
--실습문제 3번 담당 매니저가 배정되어있으나 커미션 비율이 없고,
-- 월급이 3000초과인 직원의 이름. 매니저 아이디, 커미션 비율, 월급을 출력하세요.(45명)
SELECT first_name, MANAGER_ID , COMMISSION_PCT , salary
FROM employees
WHERE commission_pct IS NULL
AND manager_Id IS NOT NULL
AND salary> 3000;
--실습 문제 4번 최고월급(max_salary)이 10000이상인 업무의 이름(job_title)과 
--최고 월급을 최고월급의 내림차순으로 정렬하여 출력하세요 (jobs- 10건)
SELECT j.job_title "업무명칭", j.max_salary "최고월급"
FROM jobs j
WHERE max_salary>=10000
ORDER by max_salary DESC;
--집계문제: 최고임금, 최저임금 두 임금의 차이
SELECT max_salary
FROM jobs j;
SELECT min_salary
FROM jobs j;
SELECT 40000-20080
FROM dual;
SELECT max(salary)-min(salary) "임금의 차이"
FROM employees e;
SELECT count(*)
FROM employees
WHERE salary > 16000;
SELECT count(employee_ID), sum(salary)
FROM employees;
SELECT department_id, avg(salary)
FROM employees e
GROUP BY department_id
ORDER BY department_id;
SELECT count(*),
       sum(salary),
       avg(nvl(salary,0)),
       avg(salary)
FROM employees e;
--부서별 최고 급여 는?
SELECT department_id, max(salary)
FROM employees e
GROUP BY department_id
ORDER BY department_id;
SELECT to_char(max(hire_date), 'YYYY"년" MM"월" DD"일"') AS "입사일"
FROM employees e;
--부서별로 평균임금, 최고임금, 최저임금을 부서(department_id)와 함꼐 출력하고 정렬 순서는 부서번호의 내림차순 입니다.
SELECT e. DEPARTMENT_ID "부서", 
       round(avg(salary),2)"부서별 평균임금",-- 소숫점 둘째자리까지 반올림
       max(salary)"부서별 최대임금",
       min(salary)"부서별 최소임금"
FROM employees e
GROUP BY department_id
ORDER BY department_id DESC;
--업무별로 평균 임금, 최고 임금, 최저임금을 업무와 함꼐 출력하고 정렬 순서는 업무 내림차순입니다.
SELECT e.job_id,
       avg(salary) avg,
       max(salary) max,
       min(salary) min
FROM employees e
GROUP BY job_id
ORDER BY 1 DESC;
--가장 오래 근속한 직원의 입사일은 언제 인가요? 그사람의 이름은 무엇인가요?(join)이 필요함 
--평균임금과 최저임금의 차이가 2000미만인 부서, 평균임금, 최저임금 그리고 (평균임금-최저임금)를 (평균임금-최저임금)의 내림차순으로 정렬해서 출력하세요
SELECT e.department_id,
       round(avg(e.salary),2) avg,
       max(e.salary) max,
       min(e.salary) min,
       round(avg(e.salary)-min(e.salary),2) "avg-min"
FROM employees e
GROUP BY department_id
HAVING avg(salary)-min(salary)<2000
ORDER BY avg(salary)-min(salary) DESC;
--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
--업무 별로 최고임금과 최저임금의 차이를 출력해보세요. 차이를 확인할 수 있도록 내림차순으로 정렬하세요.
SELECT job_id, max(salary)-min(salary) "max-min"
FROM employees e
GROUP BY e.JOB_ID 
ORDER BY 2 DESC;
SELECT employee_id,
       salary,
CASE WHEN job_id='AC_ACCOUNT' THEN salary+salary*0.1
     WHEN job_id='AC_MGR' THEN salary + salary*0.2
     ELSE salary
END "salary(인상)"
FROM employees e;
SELECT e.first_name||' '||last_name name, 
       e.department_id,
       CASE WHEN department_id between 10 AND 50 THEN 'A-TEAM'
            WHEN department_id between 60 AND 100 THEN 'B-TEAM'
            WHEN department_id between 110 AND 150 THEN 'C-TEAM'
            ELSE '팀없음'
       END team
FROM employees e;
--join 함수 실습
SELECT e.FIRST_name, d.department_name
FROM employees e, departments d;
SELECT first_name, department_name
FROM employees em, departments de
WHERE em.department_id = de.department_id;
--직원의 이름, 직급아이디, 직급 명칭을 출력하세요
SELECT first_name||' '||last_name name, 
       em.job_id, 
       j.job_title
FROM employees em, jobs j
WHERE em. job_id = j. job_id;
--모든 직원이름, 부서이름, 업무명을 출력하세요
SELECT em.first_name||' '||last_name name,
       de.DEPARTMENT_NAME,
       j.job_title
FROM employees em, departments de, jobs j
WHERE em.job_id = j.job_id
AND em. department_id = de.department_id;
SELECT emp.first_name, mgr.first_name
FROM employees emp, employees mgr
WHERE emp.manager_id=mgr.employee_id

SELECT emp.department_id, emp.first_name, d.department_name
FROM employees emp, departments d
where emp.department_id(+) = d.department_id;

SELECT emp.department_id, emp.first_name, d.department_name
FROM employees emp full OUTER JOIN departments d
ON emp.department_id=d.department_id;

SELECT emp.employee_id, emp.first_name,
       emp.manager_id, man.first_name manager
FROM employees emp, employees man
WHERE emp.manager_id = man.employee_id;
--1번 문제 각 사원에 대해서 사번, 이름, 부서명, 매니저의 이름을 조회하세요.//105명 employee e, departments d, employee m
SELECT e.employee_id "사번",
       e.first_name "이름",
       d.DEPARTMENT_NAME "부서명",
       m.first_name "매니저"
FROM employees e, departments d, employees m
WHERE e. manager_id = m. employee_id
AND  e. department_id = d. department_id;
SELECT e.employee_id "사번",
       e.first_name "이름",
       d.DEPARTMENT_NAME "부서명",
       m.first_name "매니저"
FROM employees e LEFT join employees m
ON e. manager_id = m. employee_id
        full JOIN departments d
ON e. department_id = d. department_id
ORDER BY 
 CASE "부서명"
      WHEN 'Executive' THEN 1
      WHEN 'Accounting' THEN 2
      WHEN 'Finance' THEN 3
      WHEN 'Administration' THEN 4
      ELSE 5
  END,
  "부서명";
--문제2. 지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름으로 출력하되 지역이름, 나라이름 순서대로 내림차순으로 정렬하세요.//25개국
SELECT r.region_name, c.country_name
FROM regions r, countries c
WHERE r.region_id = c.region_id
ORDER BY 1 desc,2 desc;
--public accountant의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요.(현재 public accountant의 직책으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name 과 last_name을 합쳐 출력합니다.//2명
SELECT e.employee_id "사번",
       e. first_name||' '||last_name "이름"
FROM employees e, job_history jh, JOBS j
WHERE e.employee_id= jh.EMPLOYEE_ID
AND jh.job_id=j.job_id
AND job_title='Public Accountant';
--문제 1-1. 각 사원에 대해서 사번, 이름, 부서명, 직속상관 이름과 , 부서장 이름을 조회하세요
--//105명 employees e, departments d, employees m, employees dm
SELECT e.EMPLOYEE_ID "사번", 
       e.FIRST_NAME||' '||e.LAST_NAME "이름", 
       d.DEPARTMENT_NAME "부서명", 
       m.FIRST_NAME||' '||m.LAST_NAME "직속상관 이름",
       dm.FIRST_NAME ||' '||dm.LAST_NAME  "부서장 이름"
FROM employees e, departments d, employees m, EMPLOYEES dm
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
and   e.MANAGER_ID = m.EMPLOYEE_ID 
AND   d.manager_id = dm.EMPLOYEE_ID;