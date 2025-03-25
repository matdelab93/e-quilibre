SELECT 
    puissance_nominale,
    COUNT(*) AS nombre_de_bornes,
    CASE 
        WHEN puissance_nominale >= 10 AND puissance_nominale < 50 THEN 'Borne standard'
        WHEN puissance_nominale >= 50 AND puissance_nominale < 150 THEN 'Borne rapide'
        WHEN puissance_nominale >= 150 THEN 'Borne ultra-rapide'
    END AS categorie_puissance,
    CONCAT(
        FLOOR(60 / (puissance_nominale * 0.9)), 'h ', 
        ROUND((60 / (puissance_nominale * 0.9) - FLOOR(60 / (puissance_nominale * 0.9))) * 60), 'min'
    ) AS estimation_temps_charge
 FROM {{ ref('intermediate_irve_full') }}
WHERE puissance_nominale >= 10
GROUP BY puissance_nominale
ORDER BY nombre_de_bornes DESC

