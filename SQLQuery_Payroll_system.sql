--CREATE DATABASE db_payroll
USE db_payroll

CREATE TABLE tbl_employee (
	employee_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	job_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_hire DATE 
);


CREATE TABLE tbl_job (
	job_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	job_title VARCHAR(50) NOT NULL,
	job_dept VARCHAR(50) NOT NULL,
	salary_id INT NOT NULL
);


CREATE TABLE tbl_salary (
	salary_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	hourly_rate MONEY NOT NULL
);


CREATE TABLE tbl_payroll (
	payrol_date DATE NOT NULL,
	employee_id INT NOT NULL,
	hours_worked INT NOT NULL
);


ALTER TABLE tbl_employee
ADD FOREIGN KEY (job_id) REFERENCES tbl_job(job_id)


ALTER TABLE tbl_job
ADD FOREIGN KEY (salary_id) REFERENCES tbl_salary(salary_id)

ALTER TABLE tbl_payroll
ADD FOREIGN KEY (employee_id) REFERENCES tbl_employee(employee_id)

INSERT INTO tbl_salary
	VALUES
	(19.50),
	(20.00),
	(20.50),
	(21.00),
	(21.50)
;
SELECT * FROM tbl_salary;

INSERT INTO tbl_job 
	VALUES
	('AR Director', 'Accounting', 2),
	('HR Director', 'Human Resources', 4),
	('Developer', 'IT', 5),
	('Customer Service Manager', 'Operations', 3),
	('Sales Manager', 'Sales and Marketing', 1)
;
SELECT * FROM tbl_job;

INSERT INTO tbl_employee
	VALUES
	(1, 'Sam', 'Smith', '2018-11-28'),
	(4, 'Amanda', 'James', '2020-04-01'),
	(3, 'David', 'McGrath', '2021-12-11'),
	(2, 'Valerie', 'Ringer', '2014-07-31'),
	(5, 'Andrea', 'Antivilo', '2019-02-04')
;
SELECT * FROM tbl_employee

INSERT INTO tbl_payroll
	VALUES
	('2023-06-07', 1, 40),
	('2023-06-07', 2, 25),
	('2023-06-07', 3, 38),
	('2023-06-07', 4, 22),
	('2023-06-07', 5, 34)
;
SELECT * FROM tbl_employee
	INNER JOIN tbl_payroll ON tbl_employee.employee_id = tbl_payroll.employee_id
	INNER JOIN tbl_job ON tbl_employee.job_id = tbl_job.job_id
	INNER JOIN tbl_salary ON tbl_job.salary_id = tbl_salary.salary_id
;

SELECT tbl_employee.first_name AS 'First Name',
	   tbl_employee.last_name AS 'Last Name',
	   
	   tbl_payroll.hours_worked AS 'Hours',
	   
	   tbl_salary.hourly_rate AS 'Rate',
	   
	   tbl_payroll.hours_worked*tbl_salary.hourly_rate AS 'Total Pay'
	   
	   FROM tbl_employee
	   INNER JOIN tbl_payroll ON tbl_employee.employee_id = tbl_payroll.employee_id
	   INNER JOIN tbl_job ON tbl_employee.job_id = tbl_job.job_id
	   INNER JOIN tbl_salary ON tbl_job.salary_id = tbl_salary.salary_id
;