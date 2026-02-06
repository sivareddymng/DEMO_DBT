WITH BIKE AS (
    select 
    RIDE_ID,
    STARTED_AT,
    ENDED_AT,
    START_STATION_NAME,
    START_STATION_ID,
    END_STATION_NAME,
    END_STATION_ID,
    START_LAT,
    START_LNG,
    END_LAT,
    END_LNG,
    MEMBER_CSUL
    from {{ source('demo', 'bike') }}
   -- where ride_id not in ('Bike Id','bikeid')
   where  ride_id not ilike '%id%'
)

select * from bike