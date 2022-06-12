-- Use Dictinct with Orderby to remove duplicate rows
--Deliverable 1
--Number of retiring employees by title
SELECT e.emp_no,
	e.firts_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--The Number of Retiring Employees by Title.
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.firts_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

--Check if they work individualy
SELECT * FROM retirement_titles;
SELECT * FROM unique_titles;
SELECT * FROM retiring_titles;

--Deliverable 2
-- Create databes of employees elegibles for mentorship
SELECT e.emp_no, 
	e.firts_name, 
	e.last_name,
	e.birth_date,
	de.from_date, 
	de.to_date
INTO employees_complete
FROM employees AS e
INNER JOIN dept_emp AS de
   on (e.emp_no = de.emp_no)
WHERE (e.birth_date) BETWEEN ('1965-01-01')
	AND ('1965-12-31')

--Adding Titles, eliminating duplicates and emplyees that have left PH 
SELECT DISTINCT ON (ec.emp_no) ec.emp_no,
	ec.firts_name, 
	ec.last_name,
	ec.birth_date,
	ti.from_date, 
	ti.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees_complete AS ec
INNER JOIN titles AS ti
   on (ec.emp_no = ti.emp_no)
WHERE ti.to_date='9999-01-01'
ORDER BY ec.emp_no;

-- Check if it works
SELECT COUNT (em.emp_no)
 FROM mentorship_eligibility as em;
 
SELECT * FROM mentorship_eligibility;

