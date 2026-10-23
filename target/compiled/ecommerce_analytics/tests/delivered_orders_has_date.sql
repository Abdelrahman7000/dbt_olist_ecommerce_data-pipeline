select *
from "ecommerce_db"."marts"."order_fct"
where order_status = 'delivered'
  and order_delivered_customer_date is null