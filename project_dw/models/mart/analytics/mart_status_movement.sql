{{
    config(
        materialized = 'table',
        unique_key = 'movement_id',
        tags = ['mart', 'metrics']
    )
}}

with 
dim_status as (
    select * from {{ ref('int_dim_status') }}
),

dim_users as (
    select * from {{ ref('int_dim_users') }}
),

fact_movement as (
    select * from {{ ref('int_fact_status_movement') }}
),


status_movement as (
    select f.movement_id as movement_id
	,u."name" as user_name
	,u.email as email
	,s.status_name as status_name
	,f.transition_date as  transition_date
	,f.value as value
from fact_movement f
left join dim_users u
on f.user_id = u.user_id
left join dim_status s 
on s.status_id = f.status_id
)
select * from status_movement