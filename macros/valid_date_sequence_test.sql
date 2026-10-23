{% test valid_date_sequence(model, start_date, end_date) %}

select *
from {{ model }}
where {{ end_date }} < {{ start_date }}

{% endtest %}