
-- DROP toutes les tables

DROP table detaildepot;
DROP table detaildemande;
DROP table espace_stockage;
DROP table type_dechet;
DROP table centretraitement;
DROP table demande;
DROP table tournee;
DROP table employe;
DROP table fonction;
DROP table camion;
DROP table type_camion;
DROP table entreprise;
DROP table adresse;




DROP SEQUENCE seq_typedechet;
DROP SEQUENCE seq_centre;
DROP SEQUENCE seq_employe;
DROP SEQUENCE seq_tournee;
DROP SEQUENCE seq_demande;
DROP SEQUENCE seq_adresse;
DROP SEQUENCE seq_fonction;



--Aucune foreign key
create table fonction
(
    NoFonction	 number(3) not null,
    NomFonction	 varchar(50) not null,
    constraint PK_Fonction primary key(NoFonction)
);	


create table adresse
(
    NoAdresse   number(5) not null,
    NoRue	 number(3),
    Rue	 varchar(200),
    Cpostal	 number(5),
    Ville	 varchar(50),
    constraint PK_adresse primary key(NoAdresse)
);

create table type_camion
(
    id_Type      NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY Primary Key,
    NoRue	 number(3),
    Modele	 varchar(200),
    Marque	 varchar(200),
    QuantiteMax number,
    NombreEnlevementsMax number
);

create table type_dechet
(
    NoTypeDechet      NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY Primary Key,
    Nom	 varchar(200),
    Niv_danger number,
    Tarif_Forfaitaire number,
    Tarif_Par_Lot number
);

-- Une seule foreign key

create table camion
(
    NoImmatric	 char(10) not null,
    DateAchat	 date,
    NoType	 number,
    constraint PK_camion primary key(NoImmatric),
    constraint FK_type_camion foreign key (NoType) references type_camion(id_Type)
);

create table employe
(
    NoEmploye	 number(5) not null,
    Nom		 varchar(50),
    Prenom		 varchar(50),
    dateNaiss	 date,
    dateEmbauche	 date,
    Salaire		 number(8,2),
    NoFonction	 number(3),
    constraint PK_employe primary key(Noemploye),
    constraint FK_employe_fonction foreign key (nofonction) references fonction(nofonction)
);

create table entreprise
(

    Siret		 number(15) not null,
    RaisonSociale	 char(50) not null,
    NoTel		 char(10),
    NomContact		 char(50),
    NoAdresse      number,
    constraint PK_entreprise primary key(Siret),
    constraint FK_entreprise_adresse foreign key (noadresse) references adresse(noadresse)
);

create table centretraitement
(
    NoCentre	 number(3) not null,
    NomCentre	 varchar(100),
    NoAdresse      number,
    constraint PK_centretraitement primary key(Nocentre),
    constraint FK_centretraitement_adresse foreign key (noadresse) references adresse(noadresse)
);
  

create table tournee
(
    NoTournee	 number(6) not null,
    DateTournee	 date,
    NoImmatric	 char(10) not null,
    NoEmploye	 number(5) not null,
    constraint PK_tournee primary key(Notournee),
    constraint FK_tournee_camion foreign key (NoImmatric) references camion(noImmatric),
    constraint FK_tournee_employe foreign key (noemploye) references employe(noemploye)
);


 -- sans Web_O_N / ATT chargem table

create table demande
(
    NoDemande	 number(6) not null,
    DateDemande	 date,
    DateEnlevement	 date,
    Siret		 number(15) not null,
    NoTournee	 number(6) null,
    constraint PK_demande primary key(Nodemande),
    constraint FK_demande_entreprise foreign key (Siret) references entreprise(Siret),
    constraint FK_demande_tournee foreign key (notournee) references tournee(notournee)
);


-- les tables avec FK/PK
-- =====================

-- avec remarque /  ATT : chargement table

create table detaildemande
(
    QuantiteEnlevee	 number(3) not null,
    Remarque		 varchar(100),
    NoDemande		 number(6) not null,
    NoTypeDechet		 number(3) not null,
    constraint PK_detaildemande primary key(Nodemande, notypedechet),
    constraint FK_detaildem_demande foreign key (NoDemande) references demande(NoDemande),
    constraint FK_detaildem_typedech foreign key (notypedechet) references type_dechet(notypedechet)
);

create table espace_stockage
(
    Quantite	 number,
    QuantiteMax	 number,
    NoEspaceStockage		 number(6) not null,
    NoCentre		 number(6) not null,
    NoTypeDechet		 number(3) not null,
    constraint PK_espacestock primary key(NoEspaceStockage, notypedechet),
    constraint FK_nocentre foreign key (NoCentre) references centretraitement(NoCentre),
    constraint FK_espacestock_typedech foreign key (notypedechet) references type_dechet(notypedechet)
);


create table detaildepot
(
    QuantiteDeposee	 number(3) not null,
    NoTournee		 number(6) not null,
    NoTypeDechet		 number(3) not null,
    NoCentre		 number(3) not null,
    constraint PK_detaildepot primary key(Notournee, notypedechet, nocentre),
    constraint FK_detaildep_tournee foreign key (NoTournee) references tournee(NoTournee),
    constraint FK_detaildep_typedech foreign key (notypedechet) references type_dechet(notypedechet),
    constraint FK_detaildep_centre foreign key (NoCentre) references centretraitement(NoCentre)
);



-- cr?ation de s?quences
create sequence seq_typedechet start with 1 increment by 1;
create sequence seq_centre start with 1 increment by 1;
create sequence seq_employe start with 1 increment by 1;
create sequence seq_tournee start with 1 increment by 1;
create sequence seq_demande start with 1 increment by 1;
create sequence seq_adresse start with 1 increment by 1;
create sequence seq_fonction start with 1 increment by 1;

