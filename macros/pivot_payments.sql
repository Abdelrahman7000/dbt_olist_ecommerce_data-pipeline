{% macro pivot_payments(column_name, values) %}
    {% for val in values %}
        coalesce(sum(case when {{ column_name }} = '{{ val }}' then payment_value end), 0) as {{ val }}_amount
        {%- if not loop.last %},{% endif %}
    {% endfor %}
{% endmacro %}