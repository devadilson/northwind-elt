with
    source_data as (
        select
           country
           ,city
           ,postal_code
           ,hire_date
           ,first_name
           ,last_name
           ,employee_id
           ,address
           ,birth_date

        from {{ source('northwind','employees') }}
    )

select * from source_data