with payment_totals as (
    select
        order_id,
        sum(payment_value) as total_payment
    from "ecommerce_db"."intermediate"."int_order_payments"
    group by order_id
),

order_totals as (
    select
        order_id,
        sum(price + freight_value) as expected_total
    from "ecommerce_db"."intermediate"."int_order_items"
    group by order_id
)

select
    p.order_id,
    p.total_payment,
    o.expected_total
from payment_totals p
inner join order_totals o
    on p.order_id = o.order_id
where abs(p.total_payment - o.expected_total) > 0.01