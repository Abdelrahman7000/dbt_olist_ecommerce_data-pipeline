
  
    

  create  table "ecommerce_db"."intermediate"."int_order_reviews__dbt_tmp"
  
  
    as
  
  (
    

with order_reviews as(
    select 
        review_id,
        order_id,
        review_score :: int,
        review_comment_title,
        review_comment_message,
        review_creation_date :: timestamp,
        review_answer_timestamp :: timestamp
    from "ecommerce_db"."raw"."stg_order_reviews"
)

select * from order_reviews
  );
  