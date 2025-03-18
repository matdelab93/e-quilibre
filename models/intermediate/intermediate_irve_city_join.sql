SELECT
*
FROM {{ ref('intermediate_irve') }} 
LEFT JOIN {{ ref('int_city') }}
ON code_insee_commune = code_insee
