SELECT
*
FROM {{ ref('int_irve_by_city') }} AS irve_by_city
LEFT JOIN {{ ref('intermediate_immatriculation_group_by_codegeo') }} AS immat 
USING (code_insee_commune)
