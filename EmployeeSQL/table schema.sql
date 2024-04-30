-- In case of errors drop tables and start table creation and importing process again
DROP TABLE departments
DROP TABLE dept_emp
DROP TABLE dep_manager
DROP TABLE employees
DROP TABLE salaries
DROP TABLE titles 

select * from departments
Select * from dept_emp
select * from dep_manager
select * from employees
select * from salaries
select * from titles


-- Import each corresponding csv to each table after creation

CREATE TABLE "departments" (
    "dep_no" varchar(255)   NOT NULL,
    "dep_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dep_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(255)   NOT NULL
);

CREATE TABLE "dep_manager" (
    "dept_no" varchar(255)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(255)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(255)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(255)   NOT NULL,
    "title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- ONLY ALTER TABLES TO ADD FOREIGN KEYS AFTER TABLES ARE CREATED AND CSV ARE IMPORTED 


ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dep_no");

ALTER TABLE "dep_manager" ADD CONSTRAINT "fk_dep_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dep_no");

ALTER TABLE "dep_manager" ADD CONSTRAINT "fk_dep_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");



















