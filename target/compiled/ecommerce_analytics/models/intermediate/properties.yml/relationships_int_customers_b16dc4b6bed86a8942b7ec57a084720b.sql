
    
    

with child as (
    select customer_zip_code_prefix as from_field
    from "ecommerce_db"."intermediate"."int_customers"
    where customer_zip_code_prefix is not null
),

parent as (
    select geolocation_zip_code_prefix as to_field
    from "ecommerce_db"."intermediate"."int_location"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


