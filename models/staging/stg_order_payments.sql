with order_payments as (
    select *
    from {{source('olist', 'order_payments')}}

)

select * from order_payments