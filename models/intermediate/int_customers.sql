with customers as (
    select 
        {{ dbt_utils.generate_surrogate_key(['customer_id', 'customer_unique_id','customer_zip_code_prefix','customer_city']) }} as customer_pk,
        customer_id,
        customer_unique_id,
        customer_zip_code_prefix,
        lower(customer_city) as customer_city,
        upper(customer_state) as customer_state
    from {{ref('stg_customers') }}
)

select * from customers 