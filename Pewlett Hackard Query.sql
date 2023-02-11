
CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "Employee" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT Employee.emp_no, Employee.last_name, Employee.first_name, Employee.sex, Salaries.salary
FROM Employee
JOIN Salaries ON Employee.emp_no= Salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT Employee.first_name, Employee.last_name, Employee.hire_date
FROM Employee
WHERE hire_date LIKE '1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT Dept_manager.dept_no, Departments.dept_name, Dept_emp.emp_no, Employee.last_name, Employee.first_name
FROM Dept_manager
JOIN Departments ON Departments.dept_no = Dept_manager.dept_no
JOIN Employee ON Employee.emp_no = Dept_manager.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT Employee.emp_no, Employee.last_name, Employee.first_name, Departments.dept_name
FROM Employee
JOIN Dept_emp ON Employee.emp_no = Dept_emp.emp_no
JOIN Departments ON Dept_emp.dept_no = Departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT Employee.first_name, Employee.last_name, Employee.sex
FROM Employee
WHERE first_name = 'Hercules' AND last_name = 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT Employee.emp_no, Employee.last_name, Employee.first_name
FROM Employee
JOIN Dept_manager ON Employee.emp_no=Dept_manager.emp_no
JOIN Departments ON Dept_manager.dept_no = Departments.dept_no
WHERE dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employee.emp_no, Employee.last_name, Employee.first_name, Departments.dept_name
FROM Employee
JOIN Dept_manager ON Employee.emp_no=Dept_manager.emp_no
JOIN Departments ON Dept_manager.dept_no = Departments.dept_no
WHERE dept_name = 'Sales' AND dept_name='Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM Employee
GROUP BY last_name
ORDER BY "Frequency" DESC;


