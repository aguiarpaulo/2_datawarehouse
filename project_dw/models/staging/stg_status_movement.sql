with source as (
    select * from {{ ref('status_movements') }}
),

transformed as (
    select
        -- keys
        movement_id as movement_id,
        user_id as user_id,
        status_id as status_id,
        
        -- Dates
        transition_date as transition_date,

        -- Metadados
        current_timestamp as etl_inserted_at
        
    from source
)

select * from transformed