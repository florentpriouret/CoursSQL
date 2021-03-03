/*2.1)*/
INSERT INTO equipe (idequipe,nom,directeur,url,nationalite) VALUES('BSC','BRETAGNE - SCHULLER','Emmanuel HUBERT','http://www.bretagne-schuller.fr/','FRA');
/*2.2)*/
INSERT INTO etape(distance,idetape,villearrivee,villedepart,idepreuve) SELECT distance,idetape,villearrivee,villedepart,'PNC' FROM etape_pnc;
/*2.3)*/
INSERT INTO coureur SELECT * FROM coureur_pnc WHERE coureur_pnc.idequipe='PNC';
/*2.4)*/
INSERT INTO participer(dossard,idcoureur,idepreuve) SELECT dossard,idcoureur,'PNC' FROM participer_pnc;
/*2.5)*/
INSERT INTO resultatetape(abandon,classement,idcoureur,idetape,temps,idepreuve) SELECT abandon,classement,idcoureur,idetape,temps,'PNC' FROM resultatetape_pnc;
/*3.1)*/
DELETE FROM etape_pnc;
DELETE FROM coureur_pnc;
DELETE FROM participer_pnc;
DELETE FROM resultatetape_pnc;
/*3.2)*/
UPDATE resultatetape SET temps='05:00:56' WHERE idCoureur='ESP19831124';
/*3.3)*/
UPDATE resultatetape SET temps=NULL,classement=NULL,abandon=1 WHERE idCoureur='FRA19750430';
/*3.4)*/
DELETE FROM resultatetape WHERE idepreuve='PNC' AND classement=1 AND idetape=8;
UPDATE resultatetape SET classement=classement-1 WHERE idepreuve='PNC' AND idetape=8;