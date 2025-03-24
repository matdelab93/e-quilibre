SELECT
*
FROM {{ ref('intermediate_registre_elec_filtred') }}
LEFT JOIN {{ ref('int_city') }}
ON codeinseecommune = code_insee