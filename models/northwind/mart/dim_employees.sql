{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ ref('stg_employees') }}
)
    , transformed as (
        select
           row_number() over (order by employee_id) as employee_sk -- auto incremental surrogate key
           , employee_id
           , first_name
           , last_name
           , country
           , city
           , postal_code
           , hire_date
           , address
           , birth_date       	
        from staging     
)

select * from transformed