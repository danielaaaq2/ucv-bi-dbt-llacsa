select
    d.year,
    sum(f.sales_amount) as total_sales
from {{ ref('fact_sales') }} f
join {{ ref('dim_date') }} d
    on f.date_key = d.date_key
where d.year = 2026
group by d.year
