
      -- back compat for old kwarg name
  
  
        
            
            
            
            
        
    

    

    merge into "ecommerce_db"."marts"."order_items_fct" as DBT_INTERNAL_DEST
        using "order_items_fct__dbt_tmp115526220405" as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.order_item_pk = DBT_INTERNAL_DEST.order_item_pk))

    
    when matched then update set
        "order_item_pk" = DBT_INTERNAL_SOURCE."order_item_pk","order_id" = DBT_INTERNAL_SOURCE."order_id","order_pk" = DBT_INTERNAL_SOURCE."order_pk","order_item_id" = DBT_INTERNAL_SOURCE."order_item_id","seller_pk" = DBT_INTERNAL_SOURCE."seller_pk","product_pk" = DBT_INTERNAL_SOURCE."product_pk","price" = DBT_INTERNAL_SOURCE."price","shipping_limit_date" = DBT_INTERNAL_SOURCE."shipping_limit_date","freight_value" = DBT_INTERNAL_SOURCE."freight_value","product_weight_g" = DBT_INTERNAL_SOURCE."product_weight_g","product_length_cm" = DBT_INTERNAL_SOURCE."product_length_cm","product_height_cm" = DBT_INTERNAL_SOURCE."product_height_cm","product_width_cm" = DBT_INTERNAL_SOURCE."product_width_cm"
    

    when not matched then insert
        ("order_item_pk", "order_id", "order_pk", "order_item_id", "seller_pk", "product_pk", "price", "shipping_limit_date", "freight_value", "product_weight_g", "product_length_cm", "product_height_cm", "product_width_cm")
    values
        ("order_item_pk", "order_id", "order_pk", "order_item_id", "seller_pk", "product_pk", "price", "shipping_limit_date", "freight_value", "product_weight_g", "product_length_cm", "product_height_cm", "product_width_cm")


  