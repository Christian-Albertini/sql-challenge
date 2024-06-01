--List the employee number, last name, first name, sex, and salary of each employee.
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees as emp
left join salaries as sal
on emp.emp_no=sal.emp_no
order by emp.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where hire_date between '1/1/1986' and '12/31/1986';

--List the manager of each department along with their department number,
--department name, employee number, last name, and first name.
select dep.dept_no, dep.dept_name, dept_manager.emp_no, emp.last_name, emp.first_name
from departments as dep
join dept_manager on dep.dept_no=dept_manager.dept_no
join employees as emp on dept_manager.emp_no=emp.emp_no;

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
select dep.dept_no, dept_emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from departments as dep
join dept_emp on dep.dept_no=dept_emp.dept_no
join employees as emp on dept_emp.emp_no=emp.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
select first_name, last_name, sex from employees
where first_name='Hercules' and last_name like 'B%';

--List each employee in the Sales department, 
--including their employee number, last name, and first name.
select emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employees as emp
join dept_emp on emp.emp_no=dept_emp.emp_no
join departments as dep on dept_emp.dept_no=dep.dept_no
where dep.dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employees as emp
join dept_emp on emp.emp_no=dept_emp.emp_no
join departments as dep on dept_emp.dept_no=dep.dept_no
where dep.dept_name='Sales' or dep.dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
select count(last_name) as frequency, last_name from employees
group by last_name
order by frequency desc;


