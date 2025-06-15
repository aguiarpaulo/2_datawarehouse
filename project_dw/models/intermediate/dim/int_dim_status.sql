{{
    config(
        materialized = 'table',
        unique_key = 'status_id',
        tags = ['intermediate', 'dimension']
    )
}}

with status as (
    select * from {{ ref('stg_status') }}
)

select
    -- keys
        status_id as status_id,
        
    -- Details
        status_name as status_name,
    -- Metadada
    current_timestamp as dbt_updated_at,
    '{{ run_started_at }}' as dbt_loaded_at
from status