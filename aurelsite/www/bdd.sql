#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

drop database if exists asalocauto ; 
CREATE database asalocauto ;

use asalocauto; 

#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        id_client   int (11) Auto_increment  NOT NULL ,
        cli_nom     Varchar (25) ,
        cli_adresse Varchar (250) ,
        cli_tel     Varchar (25) ,
        cli_email   Varchar (250) ,
        cli_mdp     Varchar (250) ,
        droits      Varchar (25) ,
        id_ville    Int ,
        PRIMARY KEY (id_client )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: entreprise
#------------------------------------------------------------

CREATE TABLE entreprise(
        siret     Varchar (25) ,
        statut    Varchar (25) ,
        id_client Int NOT NULL ,
        PRIMARY KEY (id_client )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: particulier
#------------------------------------------------------------

CREATE TABLE particulier(
        prenom    Varchar (25) ,
        id_client Int NOT NULL ,
        PRIMARY KEY (id_client )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ville
#------------------------------------------------------------

CREATE TABLE ville(
        id_ville int (11) Auto_increment  NOT NULL ,
        cp       Varchar (25) ,
        nom      Varchar (25) ,
        region   Varchar (25) ,
        PRIMARY KEY (id_ville )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: commande
#------------------------------------------------------------

CREATE TABLE commande(
        id_commande int (11) Auto_increment  NOT NULL ,
        com_libelle Varchar (250) ,
        com_date    Date ,
        id_client   Int ,
        id_mode     Int ,
        PRIMARY KEY (id_commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: produit
#------------------------------------------------------------

CREATE TABLE produit(
        id_produit       int (11) Auto_increment  NOT NULL ,
        prod_libelle     Varchar (250) ,
        prod_description Varchar (250) ,
        prod_prix        Float ,
        prod_image       Varchar (250) ,
        prod_qte_stock   Int ,
        id_categorie     Int ,
        PRIMARY KEY (id_produit )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: categorie
#------------------------------------------------------------

CREATE TABLE categorie(
        id_categorie int (11) Auto_increment  NOT NULL ,
        cat_libelle  Varchar (25) ,
        PRIMARY KEY (id_categorie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: mode_paiement
#------------------------------------------------------------

CREATE TABLE mode_paiement(
        id_mode          int (11) Auto_increment  NOT NULL ,
        paiement_libelle Varchar (25) ,
        PRIMARY KEY (id_mode )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fournisseur
#------------------------------------------------------------

CREATE TABLE fournisseur(
        id_fournisseur int (11) Auto_increment  NOT NULL ,
        four_nom       Varchar (25) ,
        four_adresse   Varchar (250) ,
        four_tel       Varchar (25) ,
        four_email     Varchar (25) ,
        four_mdp       Varchar (25) ,
        PRIMARY KEY (id_fournisseur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: livraison
#------------------------------------------------------------

CREATE TABLE livraison(
        id_livraison   int (11) Auto_increment  NOT NULL ,
        qte_produit    Int ,
        date_debut Date ,
        date_fin Date ,
        id_fournisseur Int ,
        id_produit     Int ,
        PRIMARY KEY (id_livraison )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: composer
#------------------------------------------------------------

/*CREATE TABLE composer(
        qte_produit Int ,
        id_commande Int NOT NULL ,
        id_produit  Int NOT NULL ,
        PRIMARY KEY (id_commande ,id_produit )
)ENGINE=InnoDB;*/

ALTER TABLE Client ADD CONSTRAINT FK_Client_id_ville FOREIGN KEY (id_ville) REFERENCES ville(id_ville);
ALTER TABLE entreprise ADD CONSTRAINT FK_entreprise_id_client FOREIGN KEY (id_client) REFERENCES Client(id_client);
ALTER TABLE particulier ADD CONSTRAINT FK_particulier_id_client FOREIGN KEY (id_client) REFERENCES Client(id_client);
ALTER TABLE commande ADD CONSTRAINT FK_commande_id_client FOREIGN KEY (id_client) REFERENCES Client(id_client);
ALTER TABLE commande ADD CONSTRAINT FK_commande_id_mode FOREIGN KEY (id_mode) REFERENCES mode_paiement(id_mode);
ALTER TABLE produit ADD CONSTRAINT FK_produit_id_categorie FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie);
ALTER TABLE livraison ADD CONSTRAINT FK_livraison_id_fournisseur FOREIGN KEY (id_fournisseur) REFERENCES fournisseur(id_fournisseur);
ALTER TABLE livraison ADD CONSTRAINT FK_livraison_id_produit FOREIGN KEY (id_produit) REFERENCES produit(id_produit);
ALTER TABLE composer ADD CONSTRAINT FK_composer_id_commande FOREIGN KEY (id_commande) REFERENCES commande(id_commande);
ALTER TABLE composer ADD CONSTRAINT FK_composer_id_produit FOREIGN KEY (id_produit) REFERENCES produit(id_produit);
