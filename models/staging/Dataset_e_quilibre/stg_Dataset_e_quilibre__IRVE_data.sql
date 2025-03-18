with 

source as (

    select * from {{ source('Dataset_e_quilibre', 'IRVE_data') }}

),

renamed as (

    select
        gratuit,
        num_pdl,
        date_maj,
        horaires,
        nbre_pdc,
        created_at,
        nom_station,
        paiement_cb,
        reservation,
        id_pdc_local,
        nom_enseigne,
        observations,
        prise_type_2,
        raccordement,
        tarification,
        coordonneesxy,
        last_modified,
        nom_amenageur,
        nom_operateur,
        paiement_acte,
        prise_type_ef,
        paiement_autre,
        adresse_station,
        condition_acces,
        siren_amenageur,
        cable_t2_attache,
        id_station_local,
        prise_type_autre,
        accessibilite_pmr,
        contact_amenageur,
        contact_operateur,
        id_pdc_itinerance,
        code_insee_commune,
        prise_type_chademo,
        puissance_nominale,
        station_deux_roues,
        datagouv_dataset_id,
        restriction_gabarit,
        telephone_operateur,
        consolidated_commune,
        datagouv_resource_id,
        date_mise_en_service,
        implantation_station,
        prise_type_combo_ccs,
        consolidated_latitude,
        consolidated_longitude

    from source

)

select * from renamed
