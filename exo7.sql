/*1) Créer une nouvelle table DEPT respectant les spécifications suivantes :
 ID, Clé primaire, INT, 7 digits
 NAME, VARCHAR, 25 charactères maximum*/
CREATE TABLE DEPT (
	id INT(7) PRIMARY KEY,
	name VARCHAR(25)
)
/*2) Grâce à une requête INSERT, peupler la table DEPT en se servant directement des données présentes dans la
table DEPARTMENTS, en ne servant dans la requête que des colonnes nécessaires à cette opération*/
INSERT INTO DEPT(id,name) SELECT department_id,department_name from departments;
/*3) Créer une table EMP respectant les spécifications suivantes :
 ID -> Numérique de longueur 7
 LAST_NAME -> Alphanumérique de longueur 25
 FIRST_NAME -> Alphanumérique de longueur 25
 DEPT_ID -> numérique de longueur 7, clé étrangère pointant vers la colonne ID de la table DEPT*/
CREATE TABLE EMP (
	id INT(7) PRIMARY KEY,
	last_name VARCHAR(25),
	first_name VARCHAR(25),
	dept_id INT(7),
	FOREIGN KEY (dept_id) REFERENCES dept(id)
);
/*4) Créer une table EMP2 basée sur la structure de la table EMPLOYEES, en n’incluant que les colonnes :
 employee_id, first_name, last_name, salary, et department_id
Nommer respectivement ces colonnes (dans la nouvelle table)
 id, f_name, l_name, sal et dept_id*/
CREATE TABLE EMP2 (
	id INT(7) PRIMARY KEY,
	f_name VARCHAR(25),
	l_name VARCHAR(25),
	sal INT(25),
	dept_id INT(7),
);
/*5) Supprimer la table EMP*/
DROP TABLE EMP;
/*6) Créer une vue « V_EMPLOYEES » permettant de retourner le nom, le prénom, le salaire et le numéro de
département de tous les employés (table employees), en remplaçant dans la vue les noms de colonne par
leur traduction française.*/
CREATE VIEW V_EMPLOYEES
AS SELECT e.last_name AS nom,e.first_name AS prenom,e.salary AS salaire,e.department_id AS numeroDepartement 
FROM employees e;
/*7) En utilisant la vue précédemment créée, écrire une requête permettant de voir, pour chaque employé ayant
un « e » dans son prénom :
 Son prénom
 Son nom de famille
 Le nom du département dans lequel il travaille*/
SELECT prenom,nom,department_name FROM V_EMPLOYEES
INNER JOIN departments
ON department_id = numeroDepartement
WHERE prenom LIKE  '%e%';
/*8) Créer un index nommé ix_dept_name sur la colonne NAME de la table DEPT*/
CREATE INDEX ix_dept_name ON dept (name);
/*9) Changer le type de la colonne FIRST_NAME de la table EMP en la passant en VARCHAR(30)*/
ALTER TABLE emp modify first_name VARCHAR(40);
/*10) Ajouter une contrainte de non-nullité à la colonne LAST_NAME de la table EMP*/
ALTER TABLE emp modify last_name VARCHAR(25) NOT NULL;