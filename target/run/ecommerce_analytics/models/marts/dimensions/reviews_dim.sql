
  
    

  create  table "ecommerce_db"."marts"."reviews_dim__dbt_tmp"
  
  
    as
  
  (
    with reviews as (
    select 
        review_id,
        order_id,
        review_score ,
        review_comment_title,
        review_comment_message,
        review_creation_date ,
        review_answer_timestamp 

    from "ecommerce_db"."intermediate"."int_order_reviews"
)

select * from reviews
  );
  