with payments as (
    select 
        order_id,
        payment_sequential :: integer,
        payment_type,
        payment_installments :: integer,
        payment_value :: numeric
     from "ecommerce_db"."raw"."stg_order_payments"
)
 
select
    md5(cast(coalesce(cast(order_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(payment_sequential as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as payment_det_pk,
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
from payments