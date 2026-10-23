
    
    

select
    seller_pk as unique_field,
    count(*) as n_records

from "ecommerce_db"."intermediate"."int_sellers"
where seller_pk is not null
group by seller_pk
having count(*) > 1


