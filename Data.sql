/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     27/04/2020 01:47:53                          */
/*==============================================================*/


create database GCours;
use GCours;


/*==============================================================*/
/* Table: Enseignant                                            */
/*==============================================================*/
create table Enseignant (
   id_Enseignant        int                  not null,
   Id_Cours             int                  not null,
   Code_Departement     int                  not null,
   Nom                  varchar(254)         null,
   Prenom               varchar(254)         null,
   Tel                  varchar(254)         null,
   Email                varchar(254)         null,
   Date_Prise_Fonction  date             null,
   constraint PK_ENSEIGNANT primary key nonclustered (id_Enseignant)
)
;


/*==============================================================*/
/* Table: Cours                                                 */
/*==============================================================*/
create table Cours (
   Id_Cours             int                  not null,
   Id_Salle             int                  not null,
   Libelle              varchar(254)         null,
   constraint PK_COURS primary key nonclustered (Id_Cours)
)
;

/*==============================================================*/
/* Table: Departement                                           */
/*==============================================================*/
create table Departement (
   Code_Departement     int                  not null,
   Nom                  varchar(254)         null,
   constraint PK_DEPARTEMENT primary key nonclustered (Code_Departement)
)
;
/*==============================================================*/
/* Table: Etudiant                                              */
/*==============================================================*/
create table Etudiant (
   id_Etudiant          int                  not null,
   Nom                  varchar(254)         null,
   Prenom               varchar(254)         null,
   tel                  varchar(254)         null,
   Email                varchar(254)         null,
   Date_Entree          datetime             null,
   constraint PK_ETUDIANT primary key nonclustered (id_Etudiant)
)
;

/*==============================================================*/
/* Table: Salle                                                 */
/*==============================================================*/
create table Salle (
   Id_Salle             int                  not null,
   Nom                  varchar(254)         null,
   Capacite             int                  null,
   constraint PK_SALLE primary key nonclustered (Id_Salle)
)
;
/*==============================================================*/
/* Table: Association_1                                         */
/*==============================================================*/
create table Association_1 (
   id_Etudiant          int                  not null,
   Id_Cours             int                  not null,
   constraint PK_ASSOCIATION_1 primary key (id_Etudiant, Id_Cours)
)
;

/*==============================================================*/
/* Index: ASSOCIATION_1_FK                                      */
/*==============================================================*/
create index ASSOCIATION_1_FK on Association_1 (
id_Etudiant ASC
)
;

/*==============================================================*/
/* Index: ASSOCIATION_1_FK2                                     */
/*==============================================================*/
create index ASSOCIATION_1_FK2 on Association_1 (
Id_Cours ASC
)
;


/*==============================================================*/
/* Index: ASSOCIATION_3_FK                                      */
/*==============================================================*/
create index ASSOCIATION_3_FK on Cours (
Id_Salle ASC
)
;





/*==============================================================*/
/* Index: ASSOCIATION_2_FK                                      */
/*==============================================================*/
create index ASSOCIATION_2_FK on Enseignant (
Id_Cours ASC
)
;

/*==============================================================*/
/* Index: ASSOCIATION_4_FK                                      */
/*==============================================================*/
create index ASSOCIATION_4_FK on Enseignant (
Code_Departement ASC
)
;



alter table Association_1
   add constraint FK_ASSOCIAT_ASSOCIATI_COURS foreign key (Id_Cours)
      references Cours (Id_Cours)
;

alter table Association_1
   add constraint FK_ASSOCIAT_ASSOCIATI_ETUDIANT foreign key (id_Etudiant)
      references Etudiant (id_Etudiant)
;

alter table Cours
   add constraint FK_COURS_ASSOCIATI_SALLE foreign key (Id_Salle)
      references Salle (Id_Salle)
;

alter table Enseignant
   add constraint FK_ENSEIGNA_ASSOCIATI_COURS foreign key (Id_Cours)
      references Cours (Id_Cours)
;
alter table Enseignant
   add constraint FK_ENSEIGNA_ASSOCIATI_DEPARTEM foreign key (Code_Departement)
      references Departement (Code_Departement)
;

-- Users --

/* Creation des utilisateurs */


Create user 'yahya' @'localhost' IDENTIFIED BY 'admin123' ;
Grant all privileges on *. *to 'yahya' @'localhost';
Flush privileges;

-- Insertion --

-- Insert Into Table Recette --

insert into Salle values (1,'SalleA',30); 
insert into Etudiant values (1,'BenBahadou','Mohammed','+2124685','MedBen@gmail.com','2020-04-27');
insert into Departement values (1,'Departement Informatique');
insert into Cours values (1,1,'SQL');
insert into Enseignant values (1,1,1,'Rabii','Mouad','+212796945','RabiMouad@gmail.com','2018-01-01');
insert into Association_1 values(1,1);


-- Select From All tables --

select * from Salle;
select * from Etudiant;
select * from Departement;
select * from Cours;
select * from Enseignant;
select * from Association_1;

-- Update -- 

UPDATE Salle
SET Nom='SalleInfo'
WHERE Id_Salle=1;

UPDATE Etudiant
SET tel='+212966294'
WHERE id_Etudiant=1;

UPDATE Departement
SET Nom='Info Departement'
WHERE Code_Departement=1;

UPDATE Cours
SET Libelle='Uml/Merise'
WHERE Id_Cours=1;

UPDATE Enseignant
SET Nom='El ouzani',Prenom='Ahmed'
WHERE id_Enseignant=1;


-- Delete --

DELETE FROM Association_1 WHERE id_Etudiant=1 and Id_Cours=1;
DELETE FROM Enseignant WHERE id_Enseignant=1;
Delete From Cours Where Id_Cours=1;
Delete From Departement Where Code_Departement=1;
DELETE FROM Etudiant WHERE id_Etudiant=1;
DELETE FROM Salle WHERE Id_Salle=1;