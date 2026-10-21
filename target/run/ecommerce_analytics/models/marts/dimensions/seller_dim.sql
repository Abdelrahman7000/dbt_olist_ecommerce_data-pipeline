
  
    

  create  table "ecommerce_db"."marts"."seller_dim__dbt_tmp"
  
  
    as
  
  (
    with seller_snapshots as (
    select * from "ecommerce_db"."snapshots"."snapshot_sellers"
)
 
select
    -- Generate dynamic surrogate key for each dimensional revision
    md5(cast(coalesce(cast(seller_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(seller_zip_code_prefix as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(seller_city as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as seller_pk,
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state,
    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,
    (dbt_valid_to is null) as is_current
from seller_snapshots
  );
  