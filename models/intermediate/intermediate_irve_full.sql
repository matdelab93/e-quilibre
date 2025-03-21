SELECT 
intermediate_irve.nom_station,
    intermediate_irve.id_station_local,
    intermediate_irve.id_pdc_local,
    intermediate_irve.adresse_station,
    CASE WHEN intermediate_irve.code_insee_commune IS NOT NULL THEN intermediate_irve.code_insee_commune
         ELSE irve_with_insee.code_insee_2
         END AS code_insee_commune,
    intermediate_irve.coordonneesxy,
    intermediate_irve.puissance_nominale, 
    intermediate_irve.nbre_pdc,
    intermediate_irve.prise_type_ef,
    intermediate_irve.prise_type_2,
    intermediate_irve.prise_type_combo_ccs,
    intermediate_irve.prise_type_chademo,
    intermediate_irve.prise_type_autre,
    intermediate_irve.gratuit,
    intermediate_irve.paiement_acte,
    intermediate_irve.paiement_cb,
    intermediate_irve.paiement_autre,
    intermediate_irve.tarification,
    intermediate_irve.date_mise_en_service,
    intermediate_irve.consolidated_longitude,
    intermediate_irve.consolidated_latitude,
    intermediate_irve.consolidated_commune,
    intermediate_irve.consolidated_is_code_insee_verified,
    intermediate_irve.consolidated_is_code_insee_modified,
    intermediate_irve.coord_lat_lon
FROM {{ ref('intermediate_irve') }} AS intermediate_irve
LEFT JOIN {{ ref('stg_Dataset_e_quilibre__irve_with_insee') }} AS irve_with_insee
ON intermediate_irve.consolidated_longitude = irve_with_insee.consolidated_longitude AND intermediate_irve.consolidated_latitude = irve_with_insee.consolidated_latitude
