/* 1) Quelle requête permet de montrer la structure de la table DEPARTMENTS ?*/
DESCRIBE DEPARTMENTS;
/*2) Ecrire une requête permet de récupérer le nom de famille et la date d’embauche de tous les employés, en
faisant en sorte que les colonnes retournées soient respectivement intitulées « Nom_famille » et
« Date_embauche »*/
SELECT last_name AS Nom_famille,hire_date AS Date_embauche FROM employees;
/*3) Ecrire la requête permettant de retourner une seule fois tous les identifiants de jobs occupés par au moins
un employé*/
SELECT DISTINCT job_id FROM employees;
/*4) Récupérer nom et le salaire de tous les employés gagnant plus de $10,000*/
SELECT last_name AS Nom_famille,salary AS salaire FROM employees WHERE salary >10000;
/*5) Afficher le nom, prénom et numéro de département des employés ayant les identifiants 170, 176 et 178*/
SELECT last_name AS Nom_famille,first_name AS Prenom_famille,department_id FROM employees WHERE employee_id in (170,176,178);
/*6) Récupérer le nom et prénom des employés ayant un salaire qui n’est pas situé entre $6000 et $14000*/
SELECT last_name AS Nom_famille,first_name AS Prenom_famille FROM employees WHERE salary NOT BETWEEN 6000 AND 14000;
/*7) Afficher le numéro d’employé et la date d’embauche des employés dont les noms de famille sont Matos et
Taylor. Ordonner les résultats de l’employé le plus ancien au plus récent*/
SELECT employee_id,hire_date FROM employees WHERE last_name IN ('Matos','Taylor') ORDER BY hire_date ASC;
/*8) Afficher le prénom, le nom de famille et numéro de département des employés travaillant dans les
départements 20 et 50, en faisant en sorte que les résultats soient triés par ordre alphabétique de prénom*/
SELECT last_name,first_name,department_id FROM employees WHERE department_id IN (20,50) ORDER BY first_name ASC;
/*9) Récupérer l’identifiant et la date d’embauche des employés ayant rejoint l’entreprise en 1994*/
SELECT employee_id,hire_date FROM employees WHERE YEAR(hire_date)=1994;
/*10) Lister le nom et le numéro de job des employés n’ayant aucun manager*/
SELECT last_name,job_id FROM employees WHERE manager_id IS NULL;
/*11) Retourner le nom de famille, le salaire et la commission de tous les employés bénéficiant d’une commission,
et s’assurer que les résultats sont retournés par salaire (descendant) et par commission (descendant)*/
SELECT last_name,salary,commission_pct FROM employees WHERE commission_pct IS NOT NULL ORDER BY salary,commission_pct DESC;
/*12) Retourner les noms et prénoms des employés ayant un nom de famille ayant pour troisième lettre « a »*/
SELECT last_name,first_name FROM employees WHERE last_name LIKE '__a%';
/*13) Retourner les noms et prénoms des employés ayant un « a » et un « e » dans leur nom de famille*/
SELECT last_name,first_name FROM employees WHERE last_name LIKE '%a%' AND '%e%';
/*14) Afficher l’identifiant des employés dont le job est soit « SA_REP », soit « ST_CLERK », et dont le salaire n’est
ni $2,500, ni $3,500 ni $7,000*/
SELECT employee_id FROM employees WHERE job_id IN ('SA_REP','ST_CLERK') AND SALARY NOT IN(2500,3500,700);