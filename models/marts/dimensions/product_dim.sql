with products_dim as (
    select 
        product_id,
        product_category_name,
        p.product_name_lenght,
        p.product_description_lenght,
        p.product_photos_qty
    from {{ ref('int_products') }}
)

select *
from products_dim