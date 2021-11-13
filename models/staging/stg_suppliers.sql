with
    source_data as (
        select
            supplier_id
            ,  country
            ,  city
            ,  fax
            ,  postal_code
            ,  homepage
            ,  address
            ,  region
            ,  contact_name
            ,  phone
            ,  company_name
            ,  contact_title
        from {{source('northwind','suppliers')}}
    )

select * from source_data