SELECT 
   * 
FROM 
    {{ ref('intermediate_registre_elec_filtred') }} AS r
LEFT JOIN 
    {{ ref('intermediate_irve_city_join') }} AS irve
    ON r.codeinseecommune = irve.code_insee_commune
ORDER BY 
    r.codeinseecommune