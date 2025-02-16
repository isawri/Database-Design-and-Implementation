CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `world`.`distributor_distributes` AS
    SELECT 
        (SELECT 
                `world`.`product`.`name`
            FROM
                `world`.`product`
            WHERE
                (`world`.`product`.`id` = `world`.`product_distributor`.`product_id`)) AS `name`,
        (SELECT 
                `world`.`product`.`code`
            FROM
                `world`.`product`
            WHERE
                (`world`.`product`.`id` = `world`.`product_distributor`.`product_id`)) AS `code`,
        (SELECT 
                `world`.`product`.`brand_id`
            FROM
                `world`.`product`
            WHERE
                (`world`.`product`.`id` = `world`.`product_distributor`.`product_id`)) AS `brand_id`,
        (SELECT 
                `world`.`distributor`.`username`
            FROM
                `world`.`distributor`
            WHERE
                (`world`.`distributor`.`id` = `world`.`product_distributor`.`distributor_id`)) AS `distributor_username`,
        (SELECT 
                `world`.`distributor`.`mail`
            FROM
                `world`.`distributor`
            WHERE
                (`world`.`distributor`.`id` = `world`.`product_distributor`.`distributor_id`)) AS `distributor_mail`,
        (SELECT 
                `world`.`distributor`.`address_id`
            FROM
                `world`.`distributor`
            WHERE
                (`world`.`distributor`.`id` = `world`.`product_distributor`.`distributor_id`)) AS `distributor_address_id`,
        (SELECT 
                `world`.`distributor`.`work_time`
            FROM
                `world`.`distributor`
            WHERE
                (`world`.`distributor`.`id` = `world`.`product_distributor`.`distributor_id`)) AS `distributor_work_time`
    FROM
        `world`.`product_distributor`;
    




CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `world`.`customer_orders` AS
    SELECT 
        `world`.`orders`.`id` AS `order_id`,
        (SELECT 
                `world`.`customers`.`name`
            FROM
                `world`.`customers`
            WHERE
                (`world`.`customers`.`id` = `world`.`orders`.`customer_id`)) AS `name`,
        (SELECT 
                `world`.`customers`.`family`
            FROM
                `world`.`customers`
            WHERE
                (`world`.`customers`.`id` = `world`.`orders`.`customer_id`)) AS `family`,
        (SELECT 
                `world`.`customers`.`code`
            FROM
                `world`.`customers`
            WHERE
                (`world`.`customers`.`id` = `world`.`orders`.`customer_id`)) AS `code`,
        (SELECT 
                `world`.`customers`.`address_id`
            FROM
                `dbms`.`customers`
            WHERE
                (`world`.`customers`.`id` = `world`.`orders`.`customer_id`)) AS `address_id`,
        (SELECT 
                `world`.`customers`.`phone_number`
            FROM
                `world`.`customers`
            WHERE
                (`world`.`customers`.`id` = `world`.`orders`.`customer_id`)) AS `phone_number`,
        (SELECT 
                SUM(`world`.`order_meta`.`count`)
            FROM
                `world`.`order_meta`
            WHERE
                (`world`.`order_meta`.`order_id` = `world`.`orders`.`id`)) AS `product_count`,
        `world`.`orders`.`create_at` AS `create_at`
    FROM
        `world`.`orders`;



CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `world`.`product_type_brand_company` AS
    SELECT 
        `world`.`product`.`id` AS `id`,
        `world`.`product`.`name` AS `name`,
        `world`.`product`.`code` AS `code`,
        (SELECT 
                `world`.`product_type`.`type_id`
            FROM
                `world`.`product_type`
            WHERE
                (`world`.`product_type`.`product_id` = `world`.`product`.`id`)) AS `type_id`,
        `world`.`product`.`brand_id` AS `brand_id`,
        (SELECT 
                `world`.`brand`.`company_id`
            FROM
                `world`.`brand`
            WHERE
                (`world`.`product`.`brand_id` = `world`.`brand`.`id`)) AS `company_id`
    FROM
        `world`.`product`

