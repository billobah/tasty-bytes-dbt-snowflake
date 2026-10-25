SELECT
    menu_item_id,
    menu_type_id,
    menu_item_name,
    menu_type,
    truck_brand_name,
    item_category,
    item_subcategory,
    cost_of_goods_usd,
    sale_price_usd
FROM {{ source('tasty_bytes_pos', 'menu') }}