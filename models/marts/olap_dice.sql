select
    d.year,
    st.city,
    p.category,
    sum(f.sales_amount) as total_sales
from {{ ref('fact_sales') }} f
join {{ ref('dim_date') }} d on f.date_key = d.date_key
join {{ ref('dim_store') }} st on f.store_key = st.store_key
join {{ ref('dim_product') }} p on f.product_key = p.product_key
where d.year = 2026
  and st.city = 'Lima'
  and p.category = 'Computers'
group by d.year, st.city, p.category
