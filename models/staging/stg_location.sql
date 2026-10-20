with location as (
    select *
    from {{source('olist', 'geolocation')}}

)

select * from location