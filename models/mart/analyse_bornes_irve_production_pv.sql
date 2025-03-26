SELECT 
     irve.code_insee_commune
    , irve.nom_standard
    , irve.reg_code
    , irve.reg_nom
    , irve.reg_looker 
    , irve.typecom_texte
    , irve.dep_code
    , irve.population
    , irve.grille_densite
    , irve.grille_densite_texte
    , irve.nb_de_station
    , irve.nb_de_borne
    , irve.date_mise_en_service_mini
    , irve.date_mise_en_service_maxi
    , irve.puissance_totale_bornes
    ,irve.puissance_moyenne_par_bornes
    ,ROUND(SUM(ele.puismaxinstallee), 2) AS energie_produite_totale_kwh
    ,SUM(ele.nbinstallations) AS nombre_total_installations_PV
    ,ROUND(AVG(ele.puismaxinstallee), 2) AS moyenne_puissance_installe_par_communes_kw
FROM {{ ref('int_irve_by_city') }} AS irve
LEFT JOIN {{ ref('intermediate_registre_elec_city') }} AS ele
    ON irve.code_insee_commune = ele.codeinseecommune  
WHERE irve.code_insee_commune IS NOT NULL
GROUP BY irve.code_insee_commune
    , irve.nom_standard
    , irve.reg_code
    , irve.reg_nom 
    , irve.reg_looker
    , irve.typecom_texte
    , irve.dep_code
    , irve.population
    , irve.grille_densite
    , irve.grille_densite_texte
    , irve.nb_de_station
    , irve.nb_de_borne
    , irve.date_mise_en_service_mini
    , irve.date_mise_en_service_maxi
    , irve.puissance_totale_bornes
    ,irve.puissance_moyenne_par_bornes
ORDER BY irve.nb_de_borne DESC