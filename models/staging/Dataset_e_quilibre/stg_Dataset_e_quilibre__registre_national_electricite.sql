with 

source as (

    select * from {{ source('Dataset_e_quilibre', 'registre_national_electricite') }}

),

renamed as (

    select
        idpeps,
        nominstallation,
        codeeicresourceobject,
        codeiris,
        codeinseecommune,
        commune,
        codeepci,
        epci,
        codedepartement,
        departement,
        coderegion,
        region,
        codeiriscommuneimplantation,
        codeinseecommuneimplantation,
        codes3renr,
        dateraccordement,
        datederaccordement,
        datemiseenservice,
        datedebutversion,
        datemiseenservice_date,
        postesource,
        tensionraccordement,
        moderaccordement,
        codefiliere,
        filiere,
        codecombustible,
        combustible,
        codescombustiblessecondaires,
        combustiblessecondaires,
        codetechnologie,
        technologie,
        typestockage,
        puismaxinstallee,
        puismaxraccharge,
        puismaxcharge,
        puismaxrac,
        puismaxinstalleedischarge,
        nbgroupes,
        nbinstallations,
        regime,
        energiestockable,
        capacitereservoir,
        hauteurchute,
        productible,
        debitmaximal,
        codegestionnaire,
        gestionnaire,
        energieannuelleglissanteinjectee,
        energieannuelleglissanteproduite,
        energieannuelleglissantesoutiree,
        energieannuelleglissantestockee,
        maxpuis

    from source

)

select * from renamed
