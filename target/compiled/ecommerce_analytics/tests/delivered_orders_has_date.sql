select *
from "ecommerce_db"."marts"."order_fct"--"ecommerce_db"."intermediate"."int_orders"
where order_status = 'delivered'
  and order_delivered_customer_date is null