with orders as (
    select *
    from {{source('olist', 'orders')}}

)

select * from orders