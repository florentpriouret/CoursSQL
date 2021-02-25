/*1) Ajouter les employés suivants dans la nouvelle table :
ID : 1, First Name : Emerick, Last Name : DUVAL, Salary : 3200
ID : 2, First Name : Anna, Last Name : DUPONT, Salary : 4300
ID : 3, First Name : Antoine, Last Name : DUPUY, Salary : 2200
ID : 4, First Name : Jérémy, Last Name : DURANT, Salary : 1650
ID : 5, First Name : Julie, Last Name : DUMONT, Salary : 3800
ID : 6, First Name : Léo, Last Name : DUBOIS, Salary : 3560*/
INSERT INTO employees_2 (id,first_name,last_name,salary) VALUES 
(1,'Emerick','DUVAL',3200),
(2,'Anna','DUPONT',4300),
(3,'Antoine','DUPUY',2200),
(4,'Jérémy','DURANT',1650),
(5,'Julie','DUMONT',3800),
(6,'Léo','DUBOIS',3560)
/*2) Mettre à jour toutes les lignes de la table employees_2 en générant (grâce à une fonction) des valeurs pour la
colonne "userid".
La fonction utilisée doit permettre de générer une valeur en prenant les 3 premières lettres du prénom et les 5
premières lettres du nom de famille de chaque employé.*/
UPDATE employees_2 
SET userid = (
  select concat(left(first_name,3),left(last_name,5)))
/*3) Changer le nom de famille de l'employé "DURANT" en "DUROI"*/
UPDATE employees_2 SET last_name='DUROI'
WHERE last_name ='DURANT'
/*4) Augmenter de 10% le salaire de tous les employés ayant un "o" dans leur prénom*/
UPDATE employees_2 
SET salary =salary*1.1 
WHERE first_name LIKE '%o%'
/*5) Supprimer tous les employés dont le salaire est inférieur à 2000*/
DELETE 
FROM employees_2 
WHERE salary<2000
