WITH irve_trimestre AS (
  SELECT
    LAST_DAY(DATE_TRUNC(DATE_ADD(DATE_TRUNC(DATE_MISE_EN_SERVICE, QUARTER), INTERVAL 2 QUARTER), QUARTER), QUARTER) AS DATE_ARRETE,
    COUNT(DISTINCT id_station_local) AS nb_de_station,
    COUNT(id_pdc_local) AS nb_de_borne
  FROM
    {{ ref('intermediate_irve_full') }}
  GROUP BY
    DATE_ARRETE
),
cumulative_data AS (
  SELECT
    DATE_ARRETE,
    nb_de_station,
    nb_de_borne,
    SUM(nb_de_station) OVER (ORDER BY DATE_ARRETE ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumul_nb_de_station,
    SUM(nb_de_borne) OVER (ORDER BY DATE_ARRETE ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumul_nb_de_borne
  FROM
    irve_trimestre
)
SELECT
  DATE_ARRETE,
  nb_de_station,
  nb_de_borne,
  cumul_nb_de_station,
  cumul_nb_de_borne
FROM
  cumulative_data
ORDER BY
  DATE_ARRETE ASC
