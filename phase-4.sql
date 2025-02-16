INSERT INTO `address` (`id`, `country`, `state`, `city`, `street`, `zipcode`) VALUES (5, 'UK', 'London', 'London', '212 Baker Street', '111');
INSERT INTO `customers` (`id`, `name`, `family`, `code`, `address_id`, `phone_number`) VALUES (5, 'Harry', 'Kane', '1234567810', 5, '4479628462');
INSERT INTO `orders` (`id`, `customer_id`, `create_at`) VALUES (4, 5, NOW());

INSERT INTO `order_meta` (`id`, `order_id`, `product_id`, `distributor_id`, `count`) VALUES (5, 4, 4, 3, 3);
INSERT INTO `order_meta` (`id`, `order_id`, `product_id`, `distributor_id`, `count`) VALUES (6, 4, 5, 2, 50);

UPDATE `customers` SET `phone_number` = '447342780080' WHERE `id` = 5;
DELETE FROM `customers` WHERE (SELECT COUNT(*) from orders WHERE orders.customer_id=customers.id) = 0;