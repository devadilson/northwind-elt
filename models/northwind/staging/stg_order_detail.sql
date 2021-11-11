with
    source_data as (
        select
          product_id
          ,discount
          ,unit_price
          ,quantity
          ,order_id

        from {{ source('northwind','order_details') }}
    )

select * from source_data