{{ config(materialized='table') }}
WITH BIKE AS (

    select
      DISTINCT 
      START_STATION_ID AS station_id,
      START_STATION_NAME as station_name,
      START_LAT as station_lat,
      START_LNG as station_lng
  --  FROM {{ source('demo', 'bike') }}
  from {{ ref('stg_bike') }}
    where ride_id !='ride_id'

)

select * from BIKE