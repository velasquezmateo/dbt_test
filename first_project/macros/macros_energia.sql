{% macro volumen(columna_volumen) %}
    case
        when {{ columna_volumen }} >= 85 then 'Nivel Óptimo'
        when {{ columna_volumen }} >= 50 and {{ columna_volumen }} < 85 then 'Nivel Medio'
        when {{ columna_volumen }} < 50 then 'Alerta Crítica'
        else 'Sin Datos'
    end
{% endmacro %}