drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists salaries;
drop table if exists departments;
drop table if exists employees;
drop table if exists titles;


create table titles(
	title_id varchar not null,
	title varchar(50) not null,
	primary key (title_id)
);

create table employees(
	emp_no int not null,
	emp_title varchar not null,
	birth_date date not null,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	sex varchar(2) not null,
	hire_date date not null,
	foreign key (emp_title) references titles(title_id),
	primary key (emp_no)
);

create table departments(
	dept_no varchar(4) not null,
	dept_name varchar(50) not null,
	primary key (dept_no)
);

create table salaries(
	emp_no int not null,
	salary int not null,
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no)
);

create table dept_manager(
	dept_no varchar(4) not null,
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (dept_no, emp_no)
);

create table dept_emp(
	emp_no int not null,
	dept_no varchar(4) not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);
