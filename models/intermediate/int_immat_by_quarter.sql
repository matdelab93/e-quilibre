SELECT 
DATE_ARRETE,
sum(NB_VP_RECHARGEABLES_EL) as nb_VE,
sum(NB_VP) as nb_VP
FROM {{ ref('intermediate_immatriculation_full') }}
GROUP BY DATE_ARRETE
ORDER BY DATE_ARRETE ASC 