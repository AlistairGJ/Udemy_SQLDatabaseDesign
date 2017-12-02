SELECT prod_group, SUM(list_price*qty_on_hand)
FROM products
GROUP BY prod_group
ORDER BY SUM(list_price*qty_on_hand) DESC;