{{ config(materialized='table') }}

with daily_weather as (

    select 
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from {{ source('demo', 'weather') }}
    limit 100
),
daily_weather_agg as (
    select
    daily_weather,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(clouds),2) as avg_clouds
   /* count(weather),
    ROW_NUMBER() OVER(PARTITION BY daily_weather order by count(weather) desc) as row_number */
    from daily_weather
    group by daily_weather,weather
    qualify ROW_NUMBER() OVER(PARTITION BY daily_weather order by count(weather) desc) =1
)

select * from daily_weather_agg