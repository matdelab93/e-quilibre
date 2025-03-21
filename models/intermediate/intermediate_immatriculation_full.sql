WITH full_data AS (
    SELECT * FROM {{ ref('intermediate_immatriculation') }}
    UNION ALL
    SELECT * FROM {{ ref('int_update_immat') }}
)

SELECT * FROM full_data