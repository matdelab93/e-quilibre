SELECT 
    code_insee,
    NULLIF(TRIM(nom_standard), '') AS nom_standard,
    NULLIF(TRIM(nom_standard_majuscule), '') AS nom_standard_majuscule,
    NULLIF(TRIM(typecom_texte), '') AS typecom_texte,
    reg_code,
    NULLIF(TRIM(reg_nom), '') AS reg_nom,
    dep_code,
    canton_code,
    NULLIF(TRIM(canton_nom), '') AS canton_nom,
    code_postal,
    codes_postaux,
    population,
    superficie_km2,
    latitude_mairie,
    longitude_mairie,
    grille_densite,
    NULLIF(TRIM(grille_densite_texte), '') AS grille_densite_texte
FROM {{ ref('stg_Dataset_e_quilibre__communes') }}