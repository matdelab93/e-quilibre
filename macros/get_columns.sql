{% macro get_columns_for_table(table_name) %}
    {% set columns = adapter.get_columns_in_relation(ref(table_name)) %}
    {{ return(columns) }}
{% endmacro %}