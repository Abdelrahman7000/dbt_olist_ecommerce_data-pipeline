with customers as (
    select *
    from {{source('olist', 'customers')}}

)

select * from customers