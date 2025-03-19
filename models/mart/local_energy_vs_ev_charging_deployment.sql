SELECT 
    irve.code_insee_commune,
    irve.consolidated_commune AS nom_commune,
    COUNT(irve.nom_station) AS nombre_de_bornes,
    ROUND(SUM(CAST(irve.puissance_nominale AS FLOAT64)), 2) AS puissance_totale_bornes,
    ROUND(SAFE_DIVIDE(
        SUM(CAST(irve.puissance_nominale AS FLOAT64)), 
        NULLIF(COUNT(irve.nom_station), 0)
    ), 2) AS puissance_moyenne_par_borne
    FROM {{ ref('intermediate_irve') }} AS irve
LEFT JOIN {{ ref('intermediate_registre_elec_filtred') }} AS ele
    ON irve.code_insee_commune = ele.postesource  
WHERE irve.code_insee_commune IS NOT NULL
GROUP BY irve.code_insee_commune, irve.consolidated_commune
ORDER BY nombre_de_bornes DESC

