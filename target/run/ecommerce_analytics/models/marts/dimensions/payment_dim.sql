
  
    

  create  table "ecommerce_db"."marts"."payment_dim__dbt_tmp"
  
  
    as
  
  (
    with payment_det as(
    select 
        md5(cast(coalesce(cast(order_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(payment_sequential as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as payment_det_pk,
        order_id,
        payment_sequential,
        payment_type
    from "ecommerce_db"."intermediate"."int_order_payments"
)

select *
from payment_det
  );
  