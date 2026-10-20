with category as (
    select *
    from "ecommerce_db"."raw"."product_category_name_translation"

)

select * from category