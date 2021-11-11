{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ ref('stg_order_detail') }}
)
    , transformed as (
        select
        row_number() over (order by order_id) as order_sk -- auto incremental surrogate key
          ,order_id	
          ,product_id
          ,discount
          ,unit_price
          ,quantity	
        from staging     
)

select * from transformed