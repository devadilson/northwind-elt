{{ config(materialized='table') }}

with 
    customers as (
        select
        customer_sk
        ,customer_id
        ,customer_name
        from {{ref('dim_customers')}}
    )

    , employees as (
        select
        employee_sk,
        employee_id
        from {{ref('dim_employees')}}
    )

, products as (
        select
        product_id
        ,product_name
        ,unit_price
        from {{ref('dim_product')}}
    )

    , shippers as (
        select
        shipper_sk
        ,shipper_id
        ,shipper_name
        from {{ref('dim_shipper')}}
)

, orders_with_sk as (
        select
        orders.order_id
        , employees.employee_id
        , customers.customer_id
        , customers.customer_name
        , orders.order_date
        , orders.ship_region
        , orders.shipped_date
        , orders.ship_country
        , orders.ship_address
        , orders.ship_postal_code
        , orders.ship_city
        , orders.ship_name
        , orders.freight
        , orders.required_date 

    from {{ref('stg_orders')}} orders
    left join employees employees on orders.employee_id = employees.employee_id
    left join customers customers on orders.customer_id = customers.customer_id
    left join shippers shippers on orders.shipper_id = shippers.shipper_sk
)

, suppliers as (
        select
        supplier_sk
        ,supplier_id
        ,supplier_name
        from {{ref('dim_supplier')}}
)

select  order_id
        , customer_id
        , customer_name
        , employees.employee_id
        , first_name
        , last_name
        , product_id
        , product_name
        , order_date
        , shipper_id
        , shipper_name
        , ship_region
        , shipped_date
        , ship_country
        , ship_address
        , ship_postal_code
        , ship_city
        , ship_name
        , freight
        , required_date 
        , supplier_id
        , supplier_name
from products, orders_with_sk, shippers, suppliers, employees