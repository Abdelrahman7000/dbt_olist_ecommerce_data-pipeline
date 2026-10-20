{# select
    order_id,
    avg(review_score) as avg_review_score,
    count(review_id) as total_reviews
from {{ ref('stg_order_reviews') }}
group by order_id #}

with order_reviews as(
    select 
        review_id,
        order_id,
        review_score :: int,
        review_comment_title,
        review_comment_message,
        review_creation_date :: timestamp,
        review_answer_timestamp :: timestamp
    from {{ ref('stg_order_reviews') }}
)

select * from order_reviews