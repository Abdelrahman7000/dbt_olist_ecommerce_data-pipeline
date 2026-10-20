{% snapshot snapshot_sellers %}

{{
    config(
      target_schema='snapshots',
      unique_key='seller_id',
      strategy='check',
      check_cols=['customer_zip_code_prefix', 'customer_city', 'customer_state'],
    )
}}

select
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
from {{ ref('int_customers') }}

{% endsnapshot %}