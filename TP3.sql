/*2.1)*/
DROP TABLE etape_pnc;
DROP TABLE coureur_pnc;
DROP TABLE participer_pnc;
DROP TABLE resultatetape_pnc;
/*2.2)*/
CREATE TABLE contratcoureur
(
idSaison INT NOT NULL AUTO_INCREMENT,
idCoureur CHAR(11) NOT NULL, 
idEquipe CHAR(3),
CONSTRAINT pk_epreuve PRIMARY KEY (idSaison,idCoureur) ,
CONSTRAINT fk_contrat_coureur FOREIGN KEY (idCoureur) REFERENCES coureur (codeuci),
CONSTRAINT fk_contrat_equipe FOREIGN KEY (idEquipe) REFERENCES equipe (idequipe)
)
/*2.3)*/
INSERT INTO contratcoureur(idCoureur,idEquipe) SELECT codeuci,idequipe FROM coureur;
/*2.4)*/
ALTER TABLE coureur DROP INDEX fk_equipe_coureur;
ALTER TABLE coureur DROP idequipe;
/*2.5)*/
CREATE TABLE contratdirecteur
(
idSaison INT NOT NULL AUTO_INCREMENT,
idEquipe CHAR(3) NOT NULL,
directeur VARCHAR(50),
CONSTRAINT contratdirecteur PRIMARY KEY (idEquipe,idSaison) ,
CONSTRAINT fk_contrat_equipe FOREIGN KEY (idEquipe) REFERENCES equipe (idequipe)
)
/*2.6)*/
INSERT INTO contratdirecteur(idEquipe,directeur) SELECT idequipe,directeur FROM equipe;
/*2.7)*/
ALTER TABLE equipe DROP directeur;
/*3.1)*/
CREATE VIEW vue_abandonsPNC AS
SELECT idCoureur
FROM resultatetape
WHERE abandon = 1 AND idepreuve='PNC';
/*3.2)*/
CREATE VIEW vue_classementParEtapePNC AS
SELECT idetape,classement,c.codeuci,c.prenom,c.nom,temps
FROM resultatetape
INNER JOIN coureur c
ON idCoureur= c.codeuci
WHERE idepreuve='PNC'
ORDER BY idetape,classement;
/*3.3)*/
CREATE VIEW vue_classementParEtapePNCSansAbandons AS
SELECT idetape,classement,codeuci,prenom,nom,temps
FROM vue_classementParEtapePNC
WHERE codeuci NOT IN (SELECT idCoureur FROM vue_abandonsPNC);
/*3.4)*/
CREATE VIEW vue_classementGeneralPNC AS
SELECT prenom,nom,SEC_TO_TIME(SUM(TIME_TO_SEC(temps))) AS temps
FROM vue_classementParEtapePNCSansAbandons
GROUP BY codeuci,nom,prenom;
/*3.5)*/
CREATE VIEW vue_classementGeneralPNCAvecEcarts AS
SELECT prenom,nom,temps,TIMEDIFF(temps,(SELECT MIN(temps)FROM vue_classementGeneralPNC))AS ecarts
FROM vue_classementGeneralPNC
order by temps ASC