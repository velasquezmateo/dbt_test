{{config(materialized='view')}}

SELECT * from {{source('source','maestro_regiones')}}