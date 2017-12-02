SELECT prod_group, SUM(list_price*qty_on_hand)
FROM products
GROUP BY prod_group
HAVING SUM(list_price*qty_on_hand) >= ALL(
    SELECT SUM(list_price*qty_on_hand)
	FROM products
	GROUP BY prod_group);