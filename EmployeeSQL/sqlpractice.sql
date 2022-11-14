--Data Engineering to create tables

CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )

);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" VARCHAR(8)   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(8)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INTEGER   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL
);

-- To show tables use Select
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- Q1
-- ========================================

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees 
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- Q2
-- ========================================
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date 
BETWEEN '1/1/1986' AND '12/31/1986' 
ORDER BY hire_date;

-- Q3
-- ========================================
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name 
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- Q4
-- ========================================
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM dept_emp 
JOIN employees ON dept_emp.emp_no = employees.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- Q5
-- =========================================
SELECT employees.first_name, employees.last_name, employees.sex 
FROM employees 
WHERE first_name = 'Hercules' AND last_name Like 'B%'

-- Q6
-- =========================================
SELECT departments.dept_name, employees.emp_no,employees.last_name, employees.first_name 
FROM dept_emp 
JOIN employees ON dept_emp.emp_no = employees.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- Q7
-- ========================================
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
FROM dept_emp 
JOIN employees ON dept_emp.emp_no = employees.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- Q8
-- ======================================== 
SELECT last_name, COUNT(last_name) AS "frequency" 
FROM employees 
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC;