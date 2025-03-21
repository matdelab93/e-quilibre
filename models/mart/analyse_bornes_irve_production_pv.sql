SELECT 
    irve.reg_nom, 
    COUNT (DISTINCT irve.id_pdc_local) AS nombre_de_bornes,
    ROUND(SUM((irve.puissance_nominale)), 2) AS puissance_totale_bornes,
    ROUND(AVG((irve.puissance_nominale)), 2) as puissance_moyenne_par_bornes,
    ROUND(SUM(ele.puismaxinstallee), 2) AS energie_produite_totale_kwh,
    SUM(ele.nbinstallations) AS nombre_total_installations_PV,
    ROUND(AVG(ele.puismaxinstallee), 2) AS moyenne_puissance_installe_par_communes_kw
FROM {{ ref('intermediate_irve_city_join') }} AS irve
LEFT JOIN {{ ref('intermediate_registre_elec_filtred') }} AS ele
    ON irve.code_insee_commune = ele.codeinseecommune  
WHERE irve.reg_nom IS NOT NULL
GROUP BY irve.reg_nom
ORDER BY nombre_de_bornes DESC