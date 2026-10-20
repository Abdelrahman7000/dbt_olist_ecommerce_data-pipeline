with sellers as (
    select *
    from {{source('olist', 'sellers')}}

)

select * from sellers