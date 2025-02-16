ALTER TABLE `product` ADD `is_sold` TINYINT NOT NULL DEFAULT '0' AFTER `code`;
UPDATE `product` SET `is_sold`='1' WHERE (SELECT COUNT(*) FROM order_meta WHERE order_meta.product_id = product.id)>0;



DELIMITER $$

CREATE PROCEDURE `sp_fail`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO `orders` (`id`, `customer_id`, `create_at`) VALUES (3, 2, NOW());
    INSERT INTO `order_meta` (`id`, `order_id`, `product_id`, `distributor_id`, `count`) VALUES (2, 3, 11, 2, 2);
    UPDATE `product_distributor` SET `stock`= product_distributor.stock - (SELECT count FROM order_meta WHERE order_meta.distributor_id=product_distributor.distributor_id AND order_meta.product_id=product_distributor.product_id ORDER BY id DESC LIMIT 1) WHERE product_distributor.distributor_id = 2 AND product_distributor.product_id = 11;
    UPDATE `product` SET `is_sold`='1' WHERE id=2;

    COMMIT;
END$$

DELIMITER ;