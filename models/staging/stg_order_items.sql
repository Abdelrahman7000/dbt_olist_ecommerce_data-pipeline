with order_items as (
    select *
    from {{source('olist', 'order_items')}}

)

select * from order_items