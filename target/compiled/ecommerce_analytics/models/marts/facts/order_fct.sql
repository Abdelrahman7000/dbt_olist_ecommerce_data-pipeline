



 with orders as (
    select 
        md5(cast(coalesce(cast(o.order_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(o.customer_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(o.order_purchase_timestamp as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as order_pk,
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
    from "ecommerce_db"."intermediate"."int_orders" o
 ), 
  order_review_agg as (
    select 
        order_id,
        avg(review_score) as avg_review_score,
        count(review_id) as total_reviews
    from "ecommerce_db"."intermediate"."int_order_reviews"
    group by 1
  ),
  order_payment_det as (
    select 
        order_id,
        sum(payment_value) as total_payment_value
    from "ecommerce_db"."intermediate"."int_order_payments"
    group by 1
  ),
  final as(

select 
    o.*,
    r.avg_review_score,
    r.total_reviews,
    p.total_payment_value
from orders o 
left join order_review_agg r using (order_id)
left join order_payment_det p using (order_id) 
  )



select s.*
from final s
left join "ecommerce_db"."marts"."order_fct" t
    on s.order_id = t.order_id
where
    t.order_id is null
    or s.order_pk 
        is distinct from t.order_pk
    or s.order_status
        is distinct from t.order_status

    or s.order_approved_at
        is distinct from t.order_approved_at

    or s.order_delivered_carrier_date
        is distinct from t.order_delivered_carrier_date

    or s.order_delivered_customer_date
        is distinct from t.order_delivered_customer_date

    or s.order_estimated_delivery_date
        is distinct from t.order_estimated_delivery_date

