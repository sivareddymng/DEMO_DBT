{{ config(materialized='table') }}
WITH trips AS (

    select
      RIDE_ID,
     -- RIDEABLE_TYPE,
      DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
      START_STATION_ID ,
      END_STATION_ID,
      MEMBER_CSUL AS MEMBER_CASUAL,
      TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
    FROM {{ ref('stg_bike') }}
    where ride_id not in ('Bike Id','bikeid','Bike ID')

)
select * from trips
