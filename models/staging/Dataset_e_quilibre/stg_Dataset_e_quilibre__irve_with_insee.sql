with 

source as (

    select * from {{ source('Dataset_e_quilibre', 'irve_with_insee') }}

),

renamed as (

    select
        code_insee_commune 
        consolidated_longitude,
        consolidated_latitude,
        concat(consolidated_longitude,', ', consolidated_latitude) AS coordonnees_xy_2


    from source

)

select * from renamed
