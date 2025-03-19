SELECT *
FROM {{ ref('intermediate_registre_elec') }}
WHERE codeinseecommune is not null