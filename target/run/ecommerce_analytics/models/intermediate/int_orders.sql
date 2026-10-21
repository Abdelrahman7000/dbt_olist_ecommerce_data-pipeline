
  
    

  create  table "ecommerce_db"."intermediate"."int_orders__dbt_tmp"
  
  
    as
  
  (
    with orders as (
    select 
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp :: timestamp as order_purchase_timestamp,
        order_approved_at :: timestamp as order_approved_at,
        order_delivered_carrier_date :: timestamp as order_delivered_carrier_date,
        order_delivered_customer_date :: timestamp as order_delivered_customer_date,
        order_estimated_delivery_date :: timestamp as order_estimated_delivery_date
    from "ecommerce_db"."raw"."stg_orders"
)

select
    md5(cast(coalesce(cast(order_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(order_purchase_timestamp as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as order_pk,
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    
    -- Delivery Duration in Days
    EXTRACT(DAY FROM (order_delivered_customer_date - order_purchase_timestamp)) as days_to_deliver,
    
    -- Estimate Difference (Negative means delivered earlier than estimated)
    EXTRACT(DAY FROM (order_delivered_customer_date - order_estimated_delivery_date)) as delivery_delay_days,
    
    EXTRACT(DAY FROM (order_estimated_delivery_date - order_purchase_timestamp)) as estimated_delivery_days,
    
    -- Operational Flag
    case 
        when order_delivered_customer_date > order_estimated_delivery_date and order_status = 'delivered'then true 
        when order_delivered_customer_date < order_estimated_delivery_date and order_status = 'delivered'then false
        else null 
    end as is_delivery_delayed

from orders
  );
  