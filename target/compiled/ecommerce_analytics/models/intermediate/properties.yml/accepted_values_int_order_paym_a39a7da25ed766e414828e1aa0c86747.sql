
    
    

with all_values as (

    select
        payment_type as value_field,
        count(*) as n_records

    from "ecommerce_db"."intermediate"."int_order_payments"
    group by payment_type

)

select *
from all_values
where value_field not in (
    'not_defined','boleto','debit_card','credit_card','voucher'
)


