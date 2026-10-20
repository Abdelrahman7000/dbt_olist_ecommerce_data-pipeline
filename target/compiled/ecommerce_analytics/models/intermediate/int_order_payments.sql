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
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
from payments