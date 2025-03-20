WITH subquery_1 AS (
    SELECT 
    code_insee_commune
    , nom_standard
    , reg_nom 
    , typecom_texte
    , dep_code
    , population
    , grille_densite
    , grille_densite_texte
    , nbre_pdc
    , COUNT (nom_station) AS nb_station
    FROM {{ ref('intermediate_irve_city_join') }}
    GROUP BY code_insee_commune, nom_standard, reg_nom,typecom_texte, dep_code, population, grille_densite,grille_densite_texte, nbre_pdc
),

subquery_2 AS(
    SELECT 
    CODGEO
    ,SUM (NB_VP) AS total_VP
    ,SUM (NB_VP_RECHARGEABLES_EL) AS total_VP_rechargeables
    ,SUM (RATIO_VP_RECHARGEABLES_EL_PCT) AS ratio_VP_rechargeables
    FROM {{ ref('intermediate_immatriculation') }}
    GROUP BY CODGEO
)
SELECT 
sub_1.*
,sub_2.*
FROM subquery_2 AS sub_2
LEFT JOIN subquery_1 AS sub_1
ON sub_1.code_insee_commune = sub_2.CODGEO