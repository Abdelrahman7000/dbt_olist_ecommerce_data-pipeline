with payments as (
    select 
        order_id,
        payment_sequential :: integer,
        payment_type,
        payment_installments :: integer,
        payment_value :: numeric
     from {{ ref('stg_order_payments') }}
)
 
select
    {{ dbt_utils.generate_surrogate_key(['order_id', 'payment_sequential']) }} as payment_det_pk,
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
from payments
