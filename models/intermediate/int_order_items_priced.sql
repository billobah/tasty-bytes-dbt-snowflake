SELECT
    d.order_detail_id,
    d.order_id,
    d.menu_item_id,
    d.line_number,
    d.quantity,
    d.unit_price,
    d.price,
    m.cost_of_goods_usd AS unit_cost_of_goods,
    m.cost_of_goods_usd * d.quantity AS cost_of_goods,
    d.price - (m.cost_of_goods_usd * d.quantity) AS gross_profit
FROM {{ ref('stg_order_detail') }} AS d
INNER JOIN {{ ref('stg_menu') }} AS m
    ON d.menu_item_id = m.menu_item_id