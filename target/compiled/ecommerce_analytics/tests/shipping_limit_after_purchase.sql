select
    i.order_id,
    i.order_item_id,
    o.order_purchase_timestamp,
    i.shipping_limit_at
from "ecommerce_db"."intermediate"."int_order_items" i
join "ecommerce_db"."intermediate"."int_orders" o on i.order_id = o.order_id
where i.shipping_limit_at < o.order_purchase_timestamp