{% set columns = get_columns_for_table('intermediate_registre_elec_filtred') %}

WITH empty_counts AS (
    SELECT
        {% for column in columns %}
            {% if column.data_type in ['STRING', 'VARCHAR', 'TEXT'] %}
                SUM(CASE WHEN {{ column.name }} IS NULL OR {{ column.name }} = '' THEN 1 ELSE 0 END) AS {{ column.name }}_vides,
            {% else %}
                SUM(CASE WHEN {{ column.name }} IS NULL THEN 1 ELSE 0 END) AS {{ column.name }}_vides,
            {% endif %}
        {% endfor %}
    FROM
        {{ ref('intermediate_registre_elec_filtred') }}
)

SELECT * FROM empty_counts
