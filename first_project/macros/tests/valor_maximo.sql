{% test valor_maximo(model, column_name) %}

    select
        {{ column_name }} as valor_a_probar
    from {{ model }}
    where {{ column_name }} > 100

{% endtest %}
