-- 1
SELECT product_id,(SELECT SUM(order_meta.count) FROM order_meta WHERE order_meta.distributor_id=product_distributor.distributor_id and order_meta.product_id=product_distributor.product_id) as sel_count FROM `product_distributor`  ORDER BY sel_count DESC LIMIT 10;

-- 2
SELECT product_id,(SELECT SUM(order_meta.count) as sel_count FROM order_meta WHERE order_meta.order_id IN (SELECT id FROM `orders` WHERE customer_id IN (SELECT id FROM `customers` WHERE address_id IN (SELECT id FROM `address`)))) ORDER BY sel_count DESC LIMIT 10;

-- 3
SELECT product_distributor.distributor_id,(SELECT SUM(order_meta.count) FROM order_meta WHERE order_meta.distributor_id=product_distributor.distributor_id and order_meta.product_id=product_distributor.product_id and (SELECT COUNT(*) FROM orders WHERE year(curdate())=year(create_at) AND orders.id = order_meta.order_id )>0 ) as sel_count FROM `product_distributor` ORDER BY sel_count DESC LIMIT 5;

-- 4
SELECT COUNT(*) FROM `distributor` WHERE (SELECT SUM(order_meta.count) FROM order_meta WHERE order_meta.product_id IN ( SELECT id FROM `product` WHERE name='krossan') AND order_meta.distributor_id=distributor.id) < (SELECT SUM(order_meta.count) FROM order_meta WHERE order_meta.product_id IN ( SELECT id FROM `product` WHERE name='gol mohammadi') AND order_meta.distributor_id=distributor.id);

-- 5
SELECT product_id,SUM(count) as sel_count FROM `order_meta` WHERE order_id IN (SELECT id FROM orders WHERE id IN (SELECT order_id FROM order_meta WHERE order_meta.product_id IN (SELECT id FROM `product` WHERE name='milk'))) GROUP BY product_id ORDER BY sel_count DESC LIMIT 3;