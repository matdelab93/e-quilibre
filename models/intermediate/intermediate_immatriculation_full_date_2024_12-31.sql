SELECT *
FROM {{ ref('intermediate_immatriculation_full') }}
WHERE date_arrete = '2024-12-31'