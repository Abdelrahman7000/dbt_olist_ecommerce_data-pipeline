with reviews as (
    select 
        review_pk,
        review_id,
        order_id,
        review_score ,
        review_comment_title,
        review_comment_message,
        review_creation_date ,
        review_answer_timestamp 

    from {{ ref('int_order_reviews') }}
)

select * from reviews