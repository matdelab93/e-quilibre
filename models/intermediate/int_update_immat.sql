{{ config(
    materialized='table'
) }}

WITH max_dates AS (
    SELECT
        CODGEO,
        MAX(DATE_ARRETE) AS max_date_arrete
    FROM {{ ref('intermediate_immatriculation') }}
    WHERE
        CODGEO IN ('19997', '54997', '25997', '53997', '88997', '56997', '63997', '73997', '17997')
    GROUP BY
        CODGEO
),

rows_to_insert AS (
    SELECT
        i.CODGEO,
        i.LIBGEO,
        i.EPCI,
        i.LIBEPCI,
        DATE '2024-12-31' AS DATE_ARRETE,
        i.NB_VP_RECHARGEABLES_EL,
        i.NB_VP,
        i.RATIO_VP_RECHARGEABLES_EL_PCT
    FROM
        {{ ref('intermediate_immatriculation') }} i
    JOIN
        max_dates md
    ON
        i.CODGEO = md.CODGEO
        AND i.DATE_ARRETE = md.max_date_arrete
)

SELECT * FROM rows_to_insert