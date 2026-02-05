select * from {{ source('demo', 'bike') }} limit 10
/* select * from {{ ref('my_second_dbt_model') }} limit 10 */