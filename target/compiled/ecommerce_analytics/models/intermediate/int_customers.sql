with customers as (
    select 
        md5(cast(coalesce(cast(customer_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_unique_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_zip_code_prefix as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_city as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customer_pk,
        customer_id,
        customer_unique_id,
        customer_zip_code_prefix,
        lower(customer_city) as customer_city,
        upper(customer_state) as customer_state
    from "ecommerce_db"."raw"."stg_customers"
)

select * from customers