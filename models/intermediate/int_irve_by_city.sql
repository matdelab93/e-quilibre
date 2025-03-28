SELECT 
    code_insee_commune
    , nom_standard
    , reg_code
    , reg_nom
    , reg_looker
    , typecom_texte
    , dep_code
    , population
    , grille_densite
    , grille_densite_texte
    , COUNT (DISTINCT id_station_local) AS nb_de_station
    , COUNT (id_pdc_local) AS nb_de_borne
    , MIN (date_mise_en_service) as date_mise_en_service_mini
    , MAX (date_mise_en_service) as date_mise_en_service_maxi
    ,ROUND(AVG((puissance_nominale)), 2) as puissance_moyenne_par_bornes
    ,ROUND(SUM((puissance_nominale)), 2) AS puissance_totale_bornes,
    FROM {{ ref('intermediate_irve_city_join') }}
    GROUP BY code_insee_commune, nom_standard, reg_code,reg_nom,reg_looker,typecom_texte, dep_code, population, grille_densite, grille_densite_texte