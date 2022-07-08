SET SERVEROUTPUT ON;

-- Procedure création d'un employé avec la fonction

CREATE OR REPLACE PROCEDURE insertEmploye(
	   p_nom in varchar,
	   p_prenom in varchar,
       p_daten in date,
       p_dateb in  date, 
       p_salaire in  number,
       p_fonction in  varchar
) 
IS
    id_fonct  fonction.nofonction%TYPE;
    id_employe  employe.noemploye%TYPE;
BEGIN
     SELECT SEQ_FONCTION.NEXTVAL INTO id_fonct FROM  dual;
     SELECT SEQ_EMPLOYE.NEXTVAL INTO id_employe FROM  dual;
     
     insert into fonction (nomfonction, nofonction) values (p_fonction, id_fonct);
     insert into employe (nom, prenom, datenaiss, dateembauche, salaire, nofonction, noemploye) values (p_nom, p_prenom, p_daten, p_dateb, p_salaire, id_fonct, id_employe);
END;

-- Procedure création entreprisse association avec l'adresse

CREATE OR REPLACE PROCEDURE insertEntreprise(
	   p_siret in number,
	   p_raisonSociale in char,
       p_noRue in number,
       p_rue in  varchar, 
       p_cpostal in  number,
       p_ville in  varchar,
	   p_notel IN char,
	   p_nomContact IN char
) 
IS
    id_addr  adresse.noadresse%TYPE;
BEGIN
     SELECT SEQ_ADRESSE.NEXTVAL INTO id_addr FROM  dual;
     insert into adresse (norue, rue, cpostal, ville, noadresse) values (p_noRue, p_rue, p_cpostal, p_ville, id_addr);
     insert into entreprise (siret, raisonsociale, notel, nomcontact, noadresse) values (p_siret, p_raisonSociale, p_notel, p_nomContact, id_addr);
END;

-- Procedure création d'un centre association avec l'adresse


CREATE OR REPLACE PROCEDURE insertCentre(
	   p_nomcentre in varchar,
       p_noRue in number,
       p_rue in  varchar, 
       p_cpostal in  number,
       p_ville in  varchar
) 
IS
    id_addr  adresse.noadresse%TYPE;
    id_centre  centretraitement.nocentre %TYPE;
BEGIN
     SELECT SEQ_ADRESSE.NEXTVAL INTO id_addr FROM  dual;
     SELECT SEQ_CENTRE.NEXTVAL INTO id_centre FROM  dual;

     insert into adresse (norue, rue, cpostal, ville, noadresse) values (p_noRue, p_rue, p_cpostal, p_ville, id_addr);
     insert into centretraitement (nomcentre, nocentre, noadresse) values (p_nomcentre, id_centre, id_addr);
END;

-- Ajout des données des fonctions

-- Paris 
EXEC insertemploye('Dupond', 'Marc', '18/01/1970', '25/12/2003', 1300, 'chauffeur');



-- Ajout des données des adresses

-- Paris / Entreprise

EXECUTE insertentreprise(12345678900001, 'Energym', 10, 'Boulevard de Pontoise', 95000, 'Pontoise', '0134205236', 'Mme servant');
EXECUTE insertentreprise(23456789010002, 'La clé des champs', 18, 'Rue des Nouvelles', 95490, 'Vauréal', '0135615879', 'M Fourdan');
EXECUTE insertentreprise(34567890120003, 'Formalys', 145, 'rue des Allouettes', 78000, 'Saint Germain', '0136579321', 'M Cresdon');
EXECUTE insertentreprise(48334367900013, 'Cartoooche', 84, 'avenue de la République', 75011, 'Paris', '0135201895', 'M Dun');
EXECUTE insertentreprise(39116278100044, 'Propack', 140, 'rue du faubourg Saint Honoré', 75008, 'Paris', '0135206598', 'M Corall');
EXECUTE insertentreprise(38221444300014, 'Mavick', 32, 'rue du Général Beuret', 75015, 'Paris', '0136548790', 'M Dravick');
EXECUTE insertentreprise(38310924600025, 'Aqualia', 26, 'rue Nicolai', 7512, 'Paris', '0135659875', 'M Brilat');
EXECUTE insertentreprise(33041607400038, 'Perenco', 7, 'rue de logelbach', 75017, 'Paris', '0135879632', 'Mme Vandenberck');
EXECUTE insertentreprise(41167102700059, 'Caroil', 51, 'rue Anjou', 75008, 'Paris', '0135647562', 'M Durand');
EXECUTE insertentreprise(38238166300014, 'Atelier Joel', 135, 'Boulevard de Sebastopol', 75002, 'Paris', '0136546874', 'M Fractur');
EXECUTE insertentreprise(33364631300010, 'Ciambelli', 12, 'rue Dauphine', 75006, 'Paris', '0135213258', 'M Dactibne');
EXECUTE insertentreprise(41392116400013, 'Antada', 3, 'rue du colonel Moll', 75017, 'Paris', '0134542655', 'M Martin');
EXECUTE insertentreprise(42382805200013, 'AJLC', 18, 'rue Saint Ferdinand', 75017, 'Paris', '0135213265', 'Mme Lutin');
EXECUTE insertentreprise(38248452500037, 'Tyfatou', 103, 'rue de Rennes', 75006, 'Paris', '0135213658', 'M Detallis');
EXECUTE insertentreprise(38219696200064, 'Arkanorum', 27, 'rue de Linne', 75005, 'Paris', '0134206741', 'Mme Lorginel');


-- Lille / Entreprise




-- Paris / Centre
EXECUTE insertcentre('Centre Bourdin', 23, 'rue des Accassias', 95800, 'Jouy-le-Moutier');
EXECUTE insertcentre('Prorecycle', 218, 'Avenue des ponts', 75019, 'Paris');
EXECUTE insertcentre('Revie', 56, 'allée des Sycomores', 94400, 'Vitry-sur-Seine');
EXECUTE insertcentre('Deuxième Vie', 36, 'rue des grands espoirs', 94490, 'Ivry');
EXECUTE insertcentre('Neo', 78, 'Boulevard Jourdan', 95000, 'Cergy');


