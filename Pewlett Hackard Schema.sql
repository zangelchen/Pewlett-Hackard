Departments
-
dept_no PK VARCHAR
dept_name VARCHAR

Dept_emp
-
emp_no PK INT FK >- Employee.emp_no
dept_no PK VARCHAR FK >- Departments.dept_no

Dept_manager
-
dept_no PK VARCHAR FK >- Departments.dept_no
emp_no PK INT FK >- Employee.emp_no 

Employee
-
emp_no PK INT
emp_title_id VARCHAR FK >- Titles.title_id  
birth_date DATE
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date DATE

Salaries
-
emp_no PK INT FK >- Employee.emp_no
salary INT

Titles
-
title_id PK VARCHAR
title VARCHAR