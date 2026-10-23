
    
    

with all_values as (

    select
        payment_type as value_field,
        count(*) as n_records

    from "ecommerce_db"."marts"."payment_dim"
    group by payment_type

)

select *
from all_values
where value_field not in (
    'not_defined','boleto','debit_card','credit_card','voucher'
)


