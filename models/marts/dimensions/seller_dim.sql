{# with seller_snapshots as (
    select * from {{ ref('snapshot_sellers') }}
)
 
select
    -- Generate dynamic surrogate key for each dimensional revision
    {{ dbt_utils.generate_surrogate_key(['s.seller_id', 's.seller_zip_code_prefix','s.seller_city']) }} as seller_pk,
    s.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    ROUND(
        (
            COUNT(CASE WHEN o.is_delivery_delayed = TRUE THEN 1 END)::numeric
            /
            NULLIF(
                COUNT(CASE WHEN o.is_delivery_delayed IS NOT NULL THEN 1 END),
                0
            )
        ) * 100,
    2
    ) AS seller_delayed_delivery_rate_percentage,
    s.dbt_valid_from as valid_from,
    s.dbt_valid_to as valid_to,
    (s.dbt_valid_to is null) as is_current
from seller_snapshots s
left join {{ ref('int_order_items') }} ot on s.seller_id=ot.seller_id
left join {{ ref('int_orders') }} o on o.order_id=ot.order_id #}





with seller_snapshots as (
    select *
    from {{ ref('snapshot_sellers') }}
),

seller_delivery_metrics as (
    select
        ot.seller_id,
        ROUND(
            (
                COUNT(CASE
                    WHEN o.is_delivery_delayed = TRUE THEN 1
                END)::numeric
                /
                NULLIF(
                    COUNT(CASE
                        WHEN o.is_delivery_delayed IS NOT NULL THEN 1
                    END),
                    0
                )
            ) * 100,
            2
        ) AS seller_delayed_delivery_rate_percentage
    from {{ ref('int_order_items') }} ot
    left join {{ ref('int_orders') }} o
        on o.order_id = ot.order_id
    group by ot.seller_id
)

select
    -- Surrogate key for each seller dimension revision
    {{ dbt_utils.generate_surrogate_key([
        's.seller_id',
        's.seller_zip_code_prefix',
        's.seller_city'
    ]) }} as seller_pk,

    s.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,

    sdm.seller_delayed_delivery_rate_percentage,

    s.dbt_valid_from as valid_from,
    s.dbt_valid_to as valid_to,
    (s.dbt_valid_to is null) as is_current

from seller_snapshots s
left join seller_delivery_metrics sdm
    on s.seller_id = sdm.seller_id
