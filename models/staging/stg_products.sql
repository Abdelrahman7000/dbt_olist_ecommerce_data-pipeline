with products as (
    select *
    from {{source('olist', 'products')}}

)

select * from products