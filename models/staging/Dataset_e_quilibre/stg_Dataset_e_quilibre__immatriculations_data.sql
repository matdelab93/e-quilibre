with 

source as (

    select * from {{ source('Dataset_e_quilibre', 'immatriculations_data') }}

),

renamed as (

    select
        codgeo,
        libgeo,
        epci,
        libepci,
        date_arrete,
        nb_vp_rechargeables_el,
        nb_vp_rechargeables_gaz,
        nb_vp

    from source

)

select * from renamed
