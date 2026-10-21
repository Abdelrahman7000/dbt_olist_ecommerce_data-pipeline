with payment_det as(
    select 
        {{ dbt_utils.generate_surrogate_key(['order_id', 'payment_sequential']) }} as payment_det_pk,
        order_id,
        payment_sequential,
        payment_type
    from {{ ref('int_order_payments') }}
)

select *
from payment_det 