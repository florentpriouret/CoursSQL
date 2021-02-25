/*1) Retourner le prénom et la date d'embauche de tous les employés travaillant dans le département de
Monsieur Chen, excepté lui-même.*/
SELECT e.last_name AS 'Nom', e.first_name AS 'Prénom', e.hire_date
FROM employees e
WHERE department_id IN (
	SELECT department_id 
	FROM employees 
	WHERE last_name='CHEN'
)
AND e.last_name<>'CHEN'
/*2) Retourner le nom de famille et le salaire de tous les employés dont le salaire est supérieur au salaire moyen.*/
SELECT e.last_name AS 'Nom', salary
FROM employees e
WHERE salary>(	
	SELECT AVG(salary) 
	FROM employees
)
/*3) Retourner le nom des départements dans lesquels au moins une personne dont le nom de famille
commence par “A” travaille*/
SELECT department_name FROM departments WHERE department_id IN (
	SELECT department_id 
	FROM employees 
	WHERE last_name LIKE 'A%'
) 
/*4) Retourner le nom de famille des employés travaillant dans un département dont le location_id est 1700.*/
SELECT e.last_name
FROM employees e
WHERE department_id IN(
	SELECT department_id 
	FROM departments 
	WHERE location_id =1700
)
/*5) Retourner le nom de famille et le salaire des employés dont le manager est Steven King.*/
SELECT e.last_name AS 'Nom', salary
FROM employees e 
WHERE manager_id IN (
	SELECT employee_id 
	FROM employees 
	WHERE last_name='King' 
	AND first_name='Steven'
)