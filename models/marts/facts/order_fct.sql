 with orders as (
    select 
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_purchase_timestamp,
        o.order_approved_at,
        o.order_delivered_carrier_date,
        o.order_delivered_customer_date,
        o.order_estimated_delivery_date,
        o.days_to_deliver,
        o.delivery_delay_days,
        o.estimated_delivery_days,
        o.is_delivery_delayed
    from {{ ref('int_orders') }} 
 ),
  order_review_agg as (
    select 
        order_id,
        avg(review_score) as avg_review_score,
        count(review_id) as total_reviews
    from {{ ref('int_order_reviews') }}
  ),
  order_payment_det as (
    select 
        order_id,
        sum(payment_value) as total_payment_value
    from {{ ref('int_order_payments') }}
  )

select 
    o.*,
    r.avg_review_score,
    r.total_reviews
    p.total_payment_value
from orders o 
left join order_review_agg r using (order_id)
left join order_payment_det p using (order_id)