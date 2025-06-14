with source as (
    select * from {{ ref('users') }}
),

transformed as (
    select
        -- keys
        user_id as user_id,

        -- Dates
        created_at as created_date,
        
        -- Details
        email as email,
        name as name,

        -- Metadados
        current_timestamp as etl_inserted_at

    from source
)

select * from transformed