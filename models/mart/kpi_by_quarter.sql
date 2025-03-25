select *
FROM {{ ref('int_irve_by_quarter') }}
LEFT JOIN {{ ref('int_immat_by_quarter') }} USING (DATE_ARRETE)
ORDER BY DATE_ARRETE ASC