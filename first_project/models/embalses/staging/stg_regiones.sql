{{config(materialized='view')}}

SELECT * from {{source('gcp_source','maestro_regiones')}}