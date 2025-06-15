{{
    config(
        materialized = 'table',
        unique_key = 'movement_id',
        tags = ['intermediate', 'fact']
    )
}}

with movement as (
    select * from {{ ref('stg_status_movement') }}
)

select
    -- keys
    movement_id as movement_id,
    user_id as user_id,
    status_id as status_id,
        
    -- Dates
     transition_date as transition_date,

    -- Values
    value as value,

    -- Metadada
    current_timestamp as dbt_updated_at,
    '{{ run_started_at }}' as dbt_loaded_at
from movement