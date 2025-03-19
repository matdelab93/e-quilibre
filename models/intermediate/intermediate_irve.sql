select
    nom_station,
    id_station_local
    adresse_station,
    code_insee_commune,
    coordonneesxy,
    CAST(puissance_nominale AS FLOAT64) AS puissance_nominale,
    prise_type_ef,
    prise_type_2,
    prise_type_combo_ccs,
    prise_type_chademo,
    prise_type_autre,
    gratuit,
    paiement_acte,
    paiement_cb,
    paiement_autre,
    tarification,
    date_mise_en_service,
    consolidated_longitude,
    consolidated_latitude,
    consolidated_commune,
    consolidated_is_code_insee_verified,
    consolidated_is_code_insee_modified,
    consolidated_latitude||","||consolidated_longitude AS coord_lat_lon
from {{ ref("stg_Dataset_e_quilibre__IRVE_data") }}

