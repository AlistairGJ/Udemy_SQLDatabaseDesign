SELECT a.order_no, prod_cod, SUM(order_price*order_qty)
FROM orders a 
INNER JOIN order_details b
ON a.order_no = b.order_no
GROUP BY a.order_no, prod_cod;