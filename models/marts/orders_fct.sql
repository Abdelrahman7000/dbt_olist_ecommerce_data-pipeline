{# with orders_fct as (
    select
        ot.order_item_key,
        ot.order_id,
        ot.seller_id,
        ot.customer_id,
        ot.product_id,
        ot.price,
        ot.shipping_limit_date,
        o.order_status,
        o.order_purchase_timestamp,
        o.order_approved_at,
        o.order_delivered_carrier_date,
        o.order_delivered_customer_date,
        o.order_estimated_delivery_date,
        o.days_to_deliver,
        o.delivery_delay_days,
        o.estimated_delivery_days,
        o.is_delivery_delayed,


    from {{ ref('int_orders') }} o
    join {{ ref('int_order_items') }} ot using (order_id)
    join {{ ref('int_order_payments') }} op using (order_id)
) #}