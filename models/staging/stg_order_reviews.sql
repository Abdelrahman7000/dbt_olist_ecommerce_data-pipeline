with order_reviews as (
    select *
    from {{source('olist', 'order_reviews')}}

)

select * from order_reviews