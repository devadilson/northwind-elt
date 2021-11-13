with
    source_data as (
        select
            phone
            , company_name
            , shipper_id
        from {{source('northwind','shippers')}}
    )

select * from source_data