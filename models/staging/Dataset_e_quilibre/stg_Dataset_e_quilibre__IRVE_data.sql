with 

source as (

    select * from {{ source('Dataset_e_quilibre', 'IRVE_data') }}

),

renamed as (

    select
        nom_amenageur,
        siren_amenageur,
        contact_amenageur,
        nom_operateur,
        contact_operateur,
        telephone_operateur,
        nom_enseigne,
        id_station_itinerance,
        id_station_local,
        nom_station,
        implantation_station,
        adresse_station,
        code_insee_commune,
        coordonneesxy,
        nbre_pdc,
        id_pdc_itinerance,
        id_pdc_local,
        puissance_nominale,
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
        condition_acces,
        reservation,
        horaires,
        accessibilite_pmr,
        restriction_gabarit,
        station_deux_roues,
        raccordement,
        num_pdl,
        date_mise_en_service,
        observations,
        date_maj,
        cable_t2_attache,
        last_modified,
        datagouv_dataset_id,
        datagouv_resource_id,
        datagouv_organization_or_owner,
        created_at,
        consolidated_longitude,
        consolidated_latitude,
        consolidated_code_postal,
        consolidated_commune,
        consolidated_is_lon_lat_correct,
        consolidated_is_code_insee_verified,
        consolidated_is_code_insee_modified

    from source

)

select * from renamed
