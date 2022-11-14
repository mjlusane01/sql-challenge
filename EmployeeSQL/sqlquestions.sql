
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