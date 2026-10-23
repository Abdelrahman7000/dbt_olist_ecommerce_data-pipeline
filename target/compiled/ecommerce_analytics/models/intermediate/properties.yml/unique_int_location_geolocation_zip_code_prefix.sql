
    
    

select
    geolocation_zip_code_prefix as unique_field,
    count(*) as n_records

from "ecommerce_db"."intermediate"."int_location"
where geolocation_zip_code_prefix is not null
group by geolocation_zip_code_prefix
having count(*) > 1


