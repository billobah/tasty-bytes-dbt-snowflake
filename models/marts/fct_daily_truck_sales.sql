SELECT
    o.order_date,
    o.truck_id,
    t.primary_city,
    COUNT(*) AS order_count,
    SUM(o.order_total) AS total_revenue
FROM {{ ref('fct_orders') }} AS o
INNER JOIN {{ ref('stg_trucks') }} AS t
    ON o.truck_id = t.truck_id
GROUP BY
    o.order_date,
    o.truck_id,
    t.primary_city