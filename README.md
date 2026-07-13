# ReputData Sénégal - Scoring alternatif & inclusion financière


##  Présentation du projet

**ReputData Sénégal** est un prototype analytique développé sous **Power BI**. Il explore comment utiliser des données économiques alternatives pour construire un **score de fiabilité** destiné aux profils peu bancarisés.

Le projet centralise plusieurs signaux économiques, comme la régularité des revenus, le respect des échéances de paiement, la stabilité de l’activité et les recommandations clients, afin de produire des indicateurs d’aide à la décision.

> **Avertissement :** ReputData est un projet de démonstration réalisé avec des données entièrement fictives. Le score présenté ne doit pas être utilisé seul pour accepter ou refuser une demande de crédit.

---

## Problématique

De nombreux travailleurs et entrepreneurs du secteur informel restent exclus des services financiers classiques en raison de l’absence de :

- fiche de paie stable ;
- contrat de travail permanent ;
- historique bancaire suffisamment complet ;
- garanties financières traditionnelles ;
- preuves de revenus centralisées.

Pourtant, ces profils peuvent générer des revenus réguliers, réaliser des missions, respecter leurs échéances et recevoir des recommandations positives.

---

## Solution proposée

ReputData transforme ces données économiques dispersées en indicateurs lisibles permettant d’évaluer plusieurs dimensions :

- la régularité des revenus ;
- la ponctualité des paiements ;
- la stabilité de l’activité ;
- le volume des transactions ;
- l’ancienneté du profil ;
- la qualité des recommandations ;
- la complétude des informations disponibles.

Le résultat est présenté sous la forme d’un **score alternatif sur 100 points** et d’une **classe de risque de A à D**.

---

## Public cible

Le prototype s’intéresse principalement aux profils suivants :

- freelances et travailleurs indépendants ;
- vendeurs en ligne ;
- livreurs et travailleurs des plateformes numériques ;
- prestataires de services ;
- jeunes actifs ;
- micro-entrepreneurs du secteur informel.

L’outil pourrait servir de support analytique à une fintech, une institution de microfinance ou une structure travaillant dans l’inclusion financière.

---

## Objectifs du projet

- Centraliser les informations économiques de profils peu bancarisés.
- Construire un score alternatif transparent et compréhensible.
- Segmenter les utilisateurs selon leur niveau de fiabilité.
- Identifier les profils présentant un potentiel de financement.
- Analyser les revenus, transactions, missions et comportements de paiement.
- Présenter les résultats dans un tableau de bord interactif.
- Sensibiliser aux limites éthiques et réglementaires du scoring financier.

---

## Technologies utilisées

| Domaine | Outils et technologies |
|---|---|
| Analyse de données | Power BI Desktop |
| Préparation des données | Power Query |
| Calculs analytiques | DAX |
| Analyse exploratoire | SQL |
| Modélisation | Modèle relationnel et schéma en étoile |
| Stockage | Fichiers CSV |
| Visualisation | Graphiques, KPI, tableaux et segmentation Power BI |

---

## Données utilisées

Les données du projet sont fictives et ont été générées uniquement pour la démonstration.

| Table | Description |
|---|---|
| `utilisateurs_reputdata` | Informations démographiques et caractéristiques générales des profils |
| `revenus_reputdata` | Revenus mensuels, sources de revenus et canaux d’encaissement |
| `paiements_reputdata` | Historique des paiements, statuts et retards |
| `missions_reputdata` | Missions réalisées, activité et notes clients |
| `transactions_reputdata` | Entrées, sorties et catégories de transactions |
| `scores_reputdata` | Sous-scores, score global, classe de risque et plafond proposé |

---

## Modélisation des données

Le modèle repose sur une table principale consacrée aux utilisateurs. Elle est reliée aux différentes tables transactionnelles grâce à la clé `id_utilisateur`.

```text
                         [ revenus_reputdata ]
                                  |
                                  | N
                                  |
[ utilisateurs_reputdata ] 1 -----+----- N [ paiements_reputdata ]
                                  |
                                  +----- N [ missions_reputdata ]
                                  |
                                  +----- N [ transactions_reputdata ]
                                  |
                                  +----- N [ scores_reputdata ]
```

Cette organisation permet d’analyser les résultats par utilisateur, région, sexe, type de profil, période et classe de risque.

---

## Logique du score alternatif

Le score global est calculé sur 100 points à partir de plusieurs critères pondérés.

| Critère | Pondération |
|---|---:|
| Régularité des revenus | 25 % |
| Ponctualité des paiements | 20 % |
| Stabilité de l’activité | 15 % |
| Volume des transactions | 15 % |
| Ancienneté du profil | 10 % |
| Recommandations clients | 10 % |
| Complétude du profil | 5 % |
| **Total** | **100 %** |

---

## Classes de risque

| Classe | Intervalle | Interprétation |
|---|---:|---|
| A | 80 à 100 | Profil très fiable présentant un risque faible |
| B | 65 à 79 | Profil fiable avec un comportement globalement stable |
| C | 50 à 64 | Profil intermédiaire nécessitant une analyse complémentaire |
| D | 0 à 49 | Profil fragile ou disposant d’informations insuffisantes |

La classe de risque est un indicateur d’aide à l’analyse et ne représente pas une décision automatique de crédit.

---

## Résultats principaux du prototype

- **250 utilisateurs** analysés ;
- **66,46 sur 100** de score moyen global ;
- **144 profils fiables**, appartenant aux classes A et B ;
- **106 profils à surveiller**, appartenant aux classes C et D ;
- **classe B** comme classe de risque dominante ;
- environ **62 % de paiements effectués à temps** ;
- environ **34 millions de FCFA de revenus mensuels** analysés.

---

# Tableau de bord Power BI

Le rapport Power BI est organisé en six pages complémentaires.

## Page 1 — Vue d’ensemble

Cette page présente une synthèse générale du portefeuille analysé. Elle regroupe les principaux indicateurs : nombre d’utilisateurs, score moyen, revenus du dernier mois, nombre de profils fiables et nombre de profils à risque.

Les graphiques permettent également d’observer :

- la répartition des utilisateurs par classe de risque ;
- le score moyen par type de profil ;
- les différences de score entre les régions ;
- l’évolution mensuelle du score moyen.

![Vue d'ensemble](Reput_data/04_maquettes/screenshots/page1_vue_ensemble.png)

---

## Page 2 — Score alternatif

Cette page détaille la construction et la composition du score global. Elle compare les principaux sous-scores liés aux revenus, aux paiements, à l’activité et aux recommandations.

Elle permet notamment de consulter :

- le score moyen global ;
- le score moyen des revenus ;
- le score moyen des paiements ;
- le score moyen de l’activité ;
- le score moyen des recommandations ;
- la répartition des utilisateurs entre les classes A, B, C et D ;
- le détail du score et du plafond proposé pour chaque utilisateur.

![Score alternatif](Reput_data/04_maquettes/screenshots/page2_score_alternatif.png)

---

## Page 3 — Revenus et activité

Cette page analyse la capacité économique et le niveau d’activité des profils étudiés.

Elle présente :

- le revenu total du dernier mois ;
- le revenu moyen par utilisateur ;
- les montants des transactions entrantes et sortantes ;
- le nombre de missions terminées ;
- l’évolution mensuelle des revenus ;
- la répartition des revenus par canal d’encaissement ;
- les revenus et missions par type de profil.

Cette analyse permet de mesurer la régularité économique et la stabilité de l’activité des utilisateurs.

![Revenus et activité](Reput_data/04_maquettes/screenshots/page3_revenus_activite.png)

---

## Page 4 — Paiements et fiabilité

Cette page étudie le comportement de paiement des utilisateurs afin d’évaluer leur ponctualité et leur fiabilité.

Elle permet de suivre :

- le taux de paiements effectués à temps ;
- le nombre total de paiements du dernier mois ;
- le nombre de paiements réglés dans les délais ;
- le nombre moyen de jours de retard ;
- la répartition des paiements entre les statuts à temps, en retard et impayé ;
- les comportements par type de paiement ;
- l’évolution mensuelle du taux de paiements à temps ;
- le retard moyen selon le type de profil.

![Paiements et fiabilité](Reput_data/04_maquettes/screenshots/page4_paiements_fiabilite.png)

---

## Page 5 — Analyse du risque

Cette page transforme les résultats du scoring en informations utiles pour l’analyse du risque.

Elle présente :

- le nombre de profils fiables ;
- le nombre de profils à risque ;
- le plafond moyen de microcrédit simulé ;
- la classe de risque dominante ;
- la segmentation des profils par activité et classe de risque ;
- le score moyen par région ;
- la relation entre le revenu et le score global ;
- une liste des profils présentant un potentiel élevé.

Cette page ne constitue pas une décision de financement. Elle sert à identifier les profils pouvant faire l’objet d’une étude complémentaire.

![Analyse du risque](Reput_data/04_maquettes/screenshots/page5_analyse_risque.png)

---

## Page 6 — Éthique et limites du projet

Cette page rappelle les principes indispensables à respecter avant toute utilisation réelle d’un système de scoring.

Elle met en avant :

- l’utilisation de données fictives dans le prototype ;
- la nécessité d’obtenir le consentement des utilisateurs ;
- la transparence des critères de calcul ;
- l’explicabilité des résultats ;
- la prévention des discriminations ;
- l’interdiction d’utiliser le score comme unique base de décision.

Une version réelle nécessiterait un cadre juridique, une protection renforcée des données, des tests de biais et une validation par des professionnels du risque financier.

![Éthique et limites](Reput_data/04_maquettes/screenshots/page6_ethique_limites.png)

---

## Analyse SQL

Le dossier [`Reput_data/02_sql`](Reput_data/02_sql) contient les requêtes utilisées pour explorer les données et vérifier les principaux indicateurs du projet.

Les analyses SQL portent notamment sur :

- les revenus mensuels ;
- la régularité des revenus ;
- les transactions financières ;
- les comportements de paiement ;
- les retards et impayés ;
- les missions réalisées ;
- les scores moyens ;
- la segmentation des profils par classe de risque.

---

## Structure du dépôt

```text
ReputData-Senegal-Scoring-Alternatif/
│
├── README.md
│
└── Reput_data/
    │
    ├── 01_donnees/
    │   ├── utilisateurs_reputdata.csv
    │   ├── revenus_reputdata.csv
    │   ├── paiements_reputdata.csv
    │   ├── transactions_reputdata.csv
    │   ├── missions_reputdata.csv
    │   └── scores_reputdata.csv
    │
    ├── 02_sql/
    │   └── requetes_analyse_reputdata.sql
    │
    ├── 03_powerbi/
    │   └── projetdata.pbix
    │
    ├── 04_maquettes/
    │   └── screenshots/
    │       ├── page1_vue_ensemble.png
    │       ├── page2_score_alternatif.png
    │       ├── page3_revenus_activite.png
    │       ├── page4_paiements_fiabilite.png
    │       ├── page5_analyse_risque.png
    │       └── page6_ethique_limites.png
    │
    └── 05_documentation/
        └── ReputData_Senegal_Presentation_GitHub.pdf
```

---

## Compétences mises en pratique

- analyse d’une problématique liée à l’inclusion financière ;
- préparation et transformation de données avec Power Query ;
- modélisation relationnelle dans Power BI ;
- création de mesures et d’indicateurs avec DAX ;
- analyse exploratoire avec SQL ;
- conception d’un système de scoring basé sur des règles ;
- segmentation de profils selon leur niveau de risque ;
- création de tableaux de bord interactifs ;
- analyse des revenus, paiements et activités ;
- prise en compte de l’éthique et des risques de discrimination ;
- communication de résultats destinés à l’aide à la décision.

---

## Limites du projet

- Les données sont entièrement simulées.
- Le score n’a pas été testé sur des comportements financiers réels.
- Les pondérations reposent sur des règles analytiques et non sur un modèle prédictif validé.
- Le prototype ne mesure pas encore les biais potentiels liés au sexe, à la région ou au type d’activité.
- Le plafond de microcrédit présenté est uniquement une simulation.
- Le projet ne remplace pas l’analyse réalisée par un professionnel du risque.

---

## Perspectives d’amélioration

Les prochaines évolutions possibles sont :

- intégrer un modèle prédictif avec Python et `scikit-learn` ;
- comparer le score basé sur des règles avec un modèle de Machine Learning ;
- réaliser une analyse statistique des biais ;
- ajouter des tests d’équité entre les différents groupes ;
- mettre en place un suivi historique des changements de score ;
- développer une interface permettant de simuler une demande de financement ;
- connecter le tableau de bord à une base de données actualisée automatiquement.

---

## Conclusion

ReputData Sénégal montre comment la Business Intelligence peut contribuer à l’inclusion financière en transformant des données économiques dispersées en indicateurs compréhensibles.

Le projet met en pratique des compétences en Power BI, Power Query, DAX, SQL, modélisation de données, analyse du risque et visualisation décisionnelle.

Il constitue un prototype d’aide à l’analyse et non un système réel ou automatique d’octroi de crédit.

---

## Auteur

**Mareme SECK**  
Data Analyst Junior

- Email : [Seckmareme739@gmail.com](mailto:Seckmareme739@gmail.com)
- LinkedIn : [www.linkedin.com/in/marème-seck-0484aa20b](https://www.linkedin.com/in/mar%C3%A8me-seck-0484aa20b)

Je suis actuellement à la recherche d’une opportunité en analyse de données, Business Intelligence, fintech ou suivi-évaluation.
