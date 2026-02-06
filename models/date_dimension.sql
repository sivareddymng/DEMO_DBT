{{ config(materialized='table') }}

with CTE as (
    select 
    to_timestamp(STARTED_AT) as STARTED_AT ,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
        DAYOFWEEK(TO_TIMESTAMP(STARTED_AT)) AS DAY_OF_WEEK,
        DAYNAME(TO_TIMESTAMP(STARTED_AT)) AS DAY_NAME,
       
        {{day_type('STARTED_AT')}} AS DAY_TYPE,          /* Created Macro function day_type() from date_utils.sql file */  
        {{get_season('STARTED_AT')}} as STATION_OF_YEAR   /* Created Macro function get_season() from date_utils.sql file */
      
    from {{ source('demo', 'bike') }}
    WHERE STARTED_AT != 'started_at'
   
)

select * from CTE
