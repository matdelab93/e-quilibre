SELECT
        codeiris,
        codeinseecommune,
        commune,
        codeepci,
        epci,
        codedepartement,
        departement,
        coderegion,
        region,
        datemiseenservice,
        datemiseenservice_date,
        postesource,
        tensionraccordement,
        filiere,
        combustible,
        technologie,
        puismaxinstallee,
        nbinstallations,
        energieannuelleglissanteinjectee,
        energieannuelleglissanteproduite,
        energieannuelleglissantesoutiree,
        energieannuelleglissantestockee,
        maxpuis
FROM {{ ref('stg_Dataset_e_quilibre__registre_national_electricite') }} 