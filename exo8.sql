/*1) Quelle commande permet de créer un utilisateur nommé Rio avec le mot de passe Professor ?*/
CREATE USER 'Rio' IDENTIFIED BY 'Professor'; 
/*2) Quelle commande permet de donner le droit à l’utilisateur Rio de créer des tables dans la base HR ?*/
GRANT CREATE
ON hex_sql.*
TO 'Rio';
/*3) Créer deux nouveaux utilisateurs Berlin et Tokyo avec 123 pour mot de passe.
Quelle commande permettrait de créer une sorte de « groupe » composé des utilisateurs Rio, Berlin et
Tokyo, que l’on nommerait « Bandidos » ?
Donner le droit à ce « groupe » de pouvoir réaliser des commandes de type SELECT et UPDATE sur la table
EMPLOYEES du schéma HR.*/
CREATE USER 'Berlin' IDENTIFIED BY '123'; 
CREATE USER 'Tokyo' IDENTIFIED BY '123'; 
CREATE ROLE Bandidos;
GRANT SELECT,UPDATE
ON hex_sql.employees
TO Bandidos; 
GRANT Bandidos
TO 'Rio', 'Berlin','Tokyo';

/*4) Changer le mot de passe de l’utilisateur Tokyo en « 321 »*/
ALTER USER 'Tokyo' IDENTIFIED BY '321';
/*5) Donner le droit à l’utilisateur Rio de réaliser des DELETE sur la table EMPLOYEES, et également le droit de
distribuer ce privilège à n’importe quel autre utilisateur*/
GRANT DELETE,
ON hex_sql.employees
TO 'Rio';
GRANT ALL PRIVILEGES,
ON mysql.user
TO 'Rio';
/*6) Retirer le droit à l’utilisateur Rio de pouvoir créer des tables*/
REVOKE CREATE
ON hex_sql.*
TO 'Rio';