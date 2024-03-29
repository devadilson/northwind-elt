with
    source_data as (
        select
            country
            , city
            , fax
            , postal_code
            , _sdc_table_version
            , address
            , region
            , _sdc_received_at
            , customer_id
            , _sdc_sequence
            , contact_name
            , phone
            , company_name
            , contact_title
        from {{source('northwind','customers')}}
)

select * from source_data