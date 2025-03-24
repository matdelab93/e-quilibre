SELECT
        codeiris,
        CASE 
        WHEN codeinseecommune BETWEEN '75101' AND '75120' THEN '75056'  
        WHEN codeinseecommune BETWEEN '69381' AND '69389' THEN '69123'  
        WHEN codeinseecommune BETWEEN '13201' AND '13216' THEN '13055'  
        ELSE codeinseecommune
    END AS codeinseecommune,
        commune,
        codeepci,
        epci,
        codedepartement,
        departement,
        CAST(coderegion AS INTEGER) AS coderegion,
        region,
        datemiseenservice,
        datemiseenservice_date,
        postesource,
        tensionraccordement,
        filiere,
        combustible,
        technologie,
        CAST(puismaxinstallee AS FLOAT64) as puismaxinstallee,
        CAST(nbinstallations AS INTEGER) AS nbinstallations,
        energieannuelleglissanteinjectee,
        energieannuelleglissanteproduite,
        energieannuelleglissantesoutiree,
        energieannuelleglissantestockee,
        maxpuis
FROM {{ ref('stg_Dataset_e_quilibre__registre_national_electricite') }} 