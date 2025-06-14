with source as (
    select * from {{ ref('status') }}
),

transformed as (
    select
        -- keys
        status_id as status_id,
        
        -- Details
        status_name as status_name,

        -- Metadados
        current_timestamp as etl_inserted_at
        
    from source
)

select * from transformed