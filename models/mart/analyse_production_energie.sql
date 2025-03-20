SELECT 
    region,
    ROUND(SUM(puismaxinstallee), 2) AS energie_produite_totale_kwh,
    COUNT(nbinstallations) AS nombre_total_installations,
    ROUND(SAFE_DIVIDE(SUM(puismaxinstallee), COUNT(DISTINCT codeinseecommune)), 2) AS moyenne_puissance_par_communes_kw
FROM 
    {{ref('intermediate_registre_elec_filtred')}}
WHERE 
    region IS NOT NULL
GROUP BY 
    region
ORDER BY 
    energie_produite_totale_kwh DESC
