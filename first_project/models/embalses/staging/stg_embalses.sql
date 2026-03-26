{{ config(materialized= "view") }}

WITH raw_data as (
SELECT  id_rep,
	nom_repre as nombre_represa,
	cast(vol_util as FLOAT) as volumen_util,
	cast(fecha_reg as DATE) as fecha_registro,
	region
FROM {{source('source','datos_embalses_crudos')}}
),

stg_embalses as (
SELECT *,
       {{ volumen('volumen_util') }} as estado_embalse
FROM raw_data)

SELECT * from stg_embalses
