with products as (
    select 
        product_id,
        product_category_name,
        product_name_lenght :: integer as product_name_length,
        product_description_lenght :: integer as product_description_length,
        product_photos_qty :: integer as product_photos_qty,
        product_weight_g :: integer as product_weight_g,
        product_length_cm :: integer as product_length_cm,
        product_height_cm :: integer as product_height_cm,
        product_width_cm :: integer as product_width_cm
    from {{ ref('stg_products') }}
), 
translations as (
    select * from {{ ref('stg_product_category') }}
)

select
    p.product_id,
    coalesce(t.product_category_name_english, p.product_category_name, 'unknown') as product_category_name,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_qty,
    coalesce(p.product_weight_g, 0) as product_weight_g,
    coalesce(p.product_length_cm, 0) as product_length_cm,
    coalesce(p.product_height_cm, 0) as product_height_cm,
    coalesce(p.product_width_cm, 0) as product_width_cm
from products p
left join translations t 
    on p.product_category_name = t.product_category_name