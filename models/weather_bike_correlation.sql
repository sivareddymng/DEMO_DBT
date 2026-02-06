with CTE as (

    select t.* , w.*
    from {{ ref('trip_fact') }} t
    left join {{ ref('daily_weather') }} w
    on t.trip_date=w.daily_weather
    order by trip_date desc

    limit 10
)

select * from CTE