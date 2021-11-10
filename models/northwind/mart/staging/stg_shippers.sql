with
    source_data as (
        select
           shipper_id
           ,company_name as shipper_name
           ,phone	

        from {{ source('northwind202111','public_shippers') }}
    )

select * from source_data