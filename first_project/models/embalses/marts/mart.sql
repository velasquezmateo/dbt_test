{{
    config(
        materialized='incremental',
        unique_key='id_rep',
        on_schema_change='fail'
    )
}}

with embalses as (
select * from  {{ref('stg_embalses')}}

{% if is_incremental() %}
-- Realiza una comparación entre los registros de las tablas RAW para traer lo más reciente						
where fecha_registro > (select max(fecha_registro) from {{ this }})
{% endif %}

),
regiones as(
select * from  {{ref('stg_regiones')}}
),
final_table as(
SELECT ec.id_rep,
	ec.nombre_represa,
	ec.volumen_util,
	{{ volumen('ec.volumen_util') }} as estado_embalse,
	ec.fecha_registro,
	ec.region,
	r.clima
FROM embalses ec
LEFT JOIN regiones r ON ec.region=r.nombre_reg
)
SELECT * FROM final_table


	