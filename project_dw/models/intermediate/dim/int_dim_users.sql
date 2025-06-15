{{
    config(
        materialized = 'table',
        unique_key = 'user_id',
        tags = ['intermediate', 'dimension']
    )
}}

with users as (
    select * from {{ ref('stg_users') }}
)

select
    -- (surrogate key)
    --{{ dbt_utils.generate_surrogate_key(['cpf']) }} as sk_client,
    
    -- keys
        user_id,

        -- Dates
        created_date,
        
        -- Details
        email,
        name,
    
    -- Metadada
    current_timestamp as dbt_updated_at,
    '{{ run_started_at }}' as dbt_loaded_at
from users