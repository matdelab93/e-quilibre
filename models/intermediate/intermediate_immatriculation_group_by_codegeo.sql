 SELECT 
    CODGEO AS code_insee_commune
    ,SUM (NB_VP) AS total_VP
    ,SUM (NB_VP_RECHARGEABLES_EL) AS total_VP_rechargeables
    ,SUM (RATIO_VP_RECHARGEABLES_EL_PCT) AS ratio_VP_rechargeables
    FROM {{ ref('intermediate_immatriculation') }}
    GROUP BY CODGEO