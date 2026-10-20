{% snapshot snapshot_sellers %}

{{
    config(
      target_schema='snapshots',
      unique_key='seller_id',
      strategy='check',
      check_cols=['seller_zip_code_prefix', 'seller_city', 'seller_state'],
    )
}}

select
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
from {{ ref('int_sellers') }}

{% endsnapshot %}