/*1) Ecrire une requête permettant de retourner le nom du manager de chaque département (table
departments)*/
SELECT last_name,e.department_id 
FROM employees e
INNER JOIN departments d 
ON d.manager_id = e.employee_id ;
/*2) Ecrire une requête permettant de savoir combien d'employés travaillent dans chaque département
(récupérer le nom du département)*/
SELECT COUNT(employee_id),d.department_name
FROM employees e
INNER JOIN departments d
ON d.department_id = e.department_id
GROUP BY d.department_id;
/*3) Ecrire une requête permettant de retourner nom de famille et prénom de chaque employé, ainsi que le nom
de famille de son manager, en incluant l'employé 100 (qui n'a pas de manager)*/
SELECT e.last_name AS 'Nom', e.first_name AS 'Prénom', em.last_name
FROM employees e
LEFT OUTER JOIN departments ON departments.manager_id = e.manager_id
LEFT OUTER JOIN employees em ON  em.employee_id = departments.manager_id;
/*4) Ecrire une requête permettant de retourner, pour chaque département, le nom du département et la ville
dans laquelle il est situé*/
SELECT d.department_name,l.city
FROM departments d 
INNER JOIN locations l
ON d.location_id =l.location_id;
/*5) Ecrire une requête permettant de savoir combien d'employés travaillent dans la ville de Toronto*/
SELECT COUNT(employee_id)
FROM employees e
INNER JOIN departments d 
ON d.department_id= e.department_id
INNER JOIN locations l
ON d.location_id =l.location_id
WHERE l.city='Toronto';
/*6) Ecrire une requête permettant de connaitre le nom et prénom de tous les employés qui sont arrivés dans
l'entreprise avant leur propre manager*/
SELECT e.last_name AS 'Nom', e.first_name AS 'Prénom' 
FROM employees e 
INNER JOIN departments ON departments.manager_id = e.manager_id 
INNER JOIN employees em ON em.employee_id = departments.manager_id 
WHERE e.hire_date<em.hire_date;
/*7) Retourner le numéro de département, le prénom et le nom du job des employés travaillant dans le
département "Executive"*/
SELECT d.department_id,e.last_name AS 'Nom', e.first_name AS 'Prénom',j.job_title
FROM employees e 
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN jobs j ON j.job_id = e.job_id
WHERE d.department_name = 'Executive';