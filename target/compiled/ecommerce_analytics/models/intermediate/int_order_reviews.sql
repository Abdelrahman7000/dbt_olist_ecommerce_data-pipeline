

with order_reviews as(
    select 
         md5(cast(coalesce(cast(review_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(order_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as review_pk,
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