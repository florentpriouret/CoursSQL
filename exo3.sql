/*1) Ecrire une requête permettant de connaitre le salaire le plus haut, le salaire le plus bas, et la moyenne des
salaires des employés du département 30*/
SELECT MAX(salary),MIN(salary),AVG(salary) FROM employees WHERE department_id=30;
/*2) Ecrire une requête permettant de savoir combien d'employés travaillent dans chaque département*/
SELECT department_id,COUNT(*) FROM employees GROUP BY department_id;
/*3) Retourner le salaire augmenté de 15% de chaque employé, en l’arrondissant à la centaine*/
SELECT ROUND(salary*1.15,-2) FROM employees;
/*4) Retourner la moyenne d'ancienneté (en jours) des employés par département*/
SELECT AVG(DATEDIFF(SYSDATE(),hire_date)) FROM employees GROUP BY department_id;
/*5) Ecrire la requête permettant de retourner le nom de famille (en majuscule) et la longueur de ce dernier des
employés dont le nom de famille commence par M ou A*/
SELECT UPPER(last_name),LENGTH(last_name) FROM employees WHERE last_name LIKE 'A%' OR last_name LIKE 'M%';
/*6) Ecrire une requête permettant de générer une colonne affichant pour chaque employé son prénom et nom
de famille (séparés d’un espace)*/
SELECT CONCAT(first_name,' ',last_name ) FROM employees;
/*7) Retourner le nom et le prénom de tous les employés ayant été embauchés un Mardi ou un Jeudi (Tuesday
ou Thursday)*/
SELECT first_name,last_name FROM employees
WHERE DAYNAME(hire_date)='Tuesday' OR DAYNAME(hire_date)='Thursday';
/*8) Ecrire une requête permettant de retourner le salaire et la commission de chaque employé.
 Si un employé n’a pas de commission, retourner « Pas de commission » à la place.
 Nommer la colonne de commission « COMM »*/
 SELECT salary,COALESCE(commission_pct,'pas de comission') AS COMM FROM employees ;
/*9) En utilisant la fonction CASE, écrire une requête permettant d’assigner une note ( de A à E ) à chaque
employé en fonction du code de son job, en respectant la notation suivante :
 Si le job est AD_PRES alors la note est A
 Si le job est ST_MAN alors la note est B
 Si le job est IT_PROG alors la note est C
 Si le job est SA_REP alors la note est D
 Si le job est ST_CLERK alors la note est E
 Pour tout autre job, alors la note est Z*/
SELECT last_name AS 'Nom', first_name AS 'Prenom', job_id,
	CASE 
    	WHEN job_id='AD_PRES' THEN 'A'
       	WHEN job_id='ST_MAN' THEN 'B'
       	WHEN job_id='IT_PROG' THEN 'C'
       	WHEN job_id='SA_REP' THEN 'D'
       	WHEN job_id='ST_CLERK' THEN 'E'
       	-- ELSE 'Z'
	END
FROM `employees`;

/*10) Syntaxiquement parlant, est-il possible de retrouver la clause HAVING avant la clause WHERE dans une
requête SQL ?
 Oui on peut aussi bien trouver la cause HAVING avant que après la clause WHERE*/
/*11) Retourner le nombre d’employés qui ont un rôle de manager pour d’autres employés.
Attention : il ne faut pas lister les managers, simplement les dénombrer.*/
 SELECT COUNT(DISTINCT manager_id) AS 'nb employés rôle manager' FROM employees;
/*12) Retourner la différence entre le salaire le plus haut et le salaire le plus bas*/
SELECT MAX(salary) - MIN(salary) AS 'Diff salaire max min' FROM `employees`;