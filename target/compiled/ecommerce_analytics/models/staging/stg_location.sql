with location as (
    select *
    from "ecommerce_db"."raw"."geolocation"

)

select * from location