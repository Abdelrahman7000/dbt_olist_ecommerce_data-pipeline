
      -- back compat for old kwarg name
  
  
        
            
            
            
            
        
    

    

    merge into "ecommerce_db"."marts"."order_fct" as DBT_INTERNAL_DEST
        using "order_fct__dbt_tmp054024331783" as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.order_id = DBT_INTERNAL_DEST.order_id))

    
    when matched then update set
        "order_pk" = DBT_INTERNAL_SOURCE."order_pk","order_id" = DBT_INTERNAL_SOURCE."order_id","customer_id" = DBT_INTERNAL_SOURCE."customer_id","order_status" = DBT_INTERNAL_SOURCE."order_status","order_purchase_timestamp" = DBT_INTERNAL_SOURCE."order_purchase_timestamp","order_approved_at" = DBT_INTERNAL_SOURCE."order_approved_at","order_delivered_carrier_date" = DBT_INTERNAL_SOURCE."order_delivered_carrier_date","order_delivered_customer_date" = DBT_INTERNAL_SOURCE."order_delivered_customer_date","order_estimated_delivery_date" = DBT_INTERNAL_SOURCE."order_estimated_delivery_date","days_to_deliver" = DBT_INTERNAL_SOURCE."days_to_deliver","delivery_delay_days" = DBT_INTERNAL_SOURCE."delivery_delay_days","estimated_delivery_days" = DBT_INTERNAL_SOURCE."estimated_delivery_days","is_delivery_delayed" = DBT_INTERNAL_SOURCE."is_delivery_delayed","avg_review_score" = DBT_INTERNAL_SOURCE."avg_review_score","total_reviews" = DBT_INTERNAL_SOURCE."total_reviews","total_payment_value" = DBT_INTERNAL_SOURCE."total_payment_value"
    

    when not matched then insert
        ("order_pk", "order_id", "customer_id", "order_status", "order_purchase_timestamp", "order_approved_at", "order_delivered_carrier_date", "order_delivered_customer_date", "order_estimated_delivery_date", "days_to_deliver", "delivery_delay_days", "estimated_delivery_days", "is_delivery_delayed", "avg_review_score", "total_reviews", "total_payment_value")
    values
        ("order_pk", "order_id", "customer_id", "order_status", "order_purchase_timestamp", "order_approved_at", "order_delivered_carrier_date", "order_delivered_customer_date", "order_estimated_delivery_date", "days_to_deliver", "delivery_delay_days", "estimated_delivery_days", "is_delivery_delayed", "avg_review_score", "total_reviews", "total_payment_value")


  