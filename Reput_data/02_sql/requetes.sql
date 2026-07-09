-- ReputData Sénégal - Script MySQL
-- 1) Créer la base de données
CREATE DATABASE IF NOT EXISTS reputdata_senegal;
USE reputdata_senegal;



CREATE TABLE utilisateurs (
    id_utilisateur VARCHAR(10) PRIMARY KEY,
    nom_utilisateur VARCHAR(100),
    age INT,
    sexe VARCHAR(20),
    region VARCHAR(50),
    type_profil VARCHAR(60),
    anciennete_activite_mois INT,
    niveau_bancarisation VARCHAR(80)
);

CREATE TABLE revenus (
    id_revenu VARCHAR(12) PRIMARY KEY,
    id_utilisateur VARCHAR(10),
    mois CHAR(7),
    source_revenu VARCHAR(80),
    montant_revenu INT,
    canal_reception VARCHAR(30),
    revenu_recurrent VARCHAR(5),
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);

CREATE TABLE paiements (
    id_paiement VARCHAR(12) PRIMARY KEY,
    id_utilisateur VARCHAR(10),
    mois CHAR(7),
    type_paiement VARCHAR(80),
    montant_paiement INT,
    statut_paiement VARCHAR(30),
    jours_retard INT,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);

CREATE TABLE missions (
    id_mission VARCHAR(12) PRIMARY KEY,
    id_utilisateur VARCHAR(10),
    type_mission VARCHAR(80),
    date_debut DATE,
    date_fin DATE,
    montant_mission INT,
    statut_mission VARCHAR(30),
    note_client DECIMAL(3,1),
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);

CREATE TABLE transactions (
    id_transaction VARCHAR(12) PRIMARY KEY,
    id_utilisateur VARCHAR(10),
    date_transaction DATE,
    type_transaction VARCHAR(20),
    canal VARCHAR(30),
    montant INT,
    categorie VARCHAR(60),
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);

CREATE TABLE scores (
    id_score VARCHAR(12) PRIMARY KEY,
    id_utilisateur VARCHAR(10),
    mois CHAR(7),
    score_revenu DECIMAL(5,1),
    score_paiement DECIMAL(5,1),
    score_activite DECIMAL(5,1),
    score_recommandation DECIMAL(5,1),
    score_transaction DECIMAL(5,1),
    score_anciennete DECIMAL(5,1),
    score_completude DECIMAL(5,1),
    score_global DECIMAL(5,1),
    classe_risque CHAR(1),
    recommandation_decisionnelle TEXT,
    plafond_microcredit_simule INT,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
-- 3) Import CSV
-- Dans MySQL Workbench, adapte les chemins selon l'emplacement de tes fichiers.
-- Exemple :
LOAD DATA LOCAL INFILE 'C:\Users\NDEYAH13\OneDrive\Desktop\Reput_data\01_donnees\utilisateurs_reputdata.csv'
INTO TABLE utilisateurs
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 4) Requêtes d'analyse

-- Score moyen par type de profil
SELECT
    u.type_profil,
    ROUND(AVG(s.score_global), 2) AS score_moyen,
    COUNT(DISTINCT u.id_utilisateur) AS nombre_utilisateurs
FROM utilisateurs u
JOIN scores s ON u.id_utilisateur = s.id_utilisateur
WHERE s.mois = '2026-06'
GROUP BY u.type_profil
ORDER BY score_moyen DESC;

-- Répartition des classes de risque
SELECT
    classe_risque,
    COUNT(*) AS nombre_profils,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM scores WHERE mois = '2026-06'), 2) AS pourcentage
FROM scores
WHERE mois = '2026-06'
GROUP BY classe_risque
ORDER BY classe_risque;

-- Taux de paiements à temps par profil
SELECT
    u.type_profil,
    ROUND(SUM(CASE WHEN p.statut_paiement = 'À temps' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taux_paiements_temps
FROM utilisateurs u
JOIN paiements p ON u.id_utilisateur = p.id_utilisateur
GROUP BY u.type_profil
ORDER BY taux_paiements_temps DESC;

-- Top 10 profils les plus fiables
SELECT
    u.nom_utilisateur,
    u.region,
    u.type_profil,
    s.score_global,
    s.classe_risque,
    s.plafond_microcredit_simule
FROM utilisateurs u
JOIN scores s ON u.id_utilisateur = s.id_utilisateur
WHERE s.mois = '2026-06'
ORDER BY s.score_global DESC
LIMIT 10;

-- Profils à accompagner
SELECT
    u.nom_utilisateur,
    u.region,
    u.type_profil,
    s.score_global,
    s.classe_risque,
    s.recommandation_decisionnelle
FROM utilisateurs u
JOIN scores s ON u.id_utilisateur = s.id_utilisateur
WHERE s.mois = '2026-06'
  AND s.classe_risque IN ('C', 'D')
ORDER BY s.score_global ASC
LIMIT 20;
