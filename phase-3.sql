
INSERT INTO `address` (`id`, `country`, `state`, `city`, `street`, `zipcode`) VALUES
(1, 'US', 'Illinois', 'Hickory Hills', '240 Vesta Drive', 60457),
(4, 'US', 'Illinois', 'Springfield', '2087 Little Acres Lane', 62707),
(3, 'US', 'Indiana', 'Fremont', '679 Windy Ridge Road', 46737),
(2, 'US', 'Ohio', 'Mansfield', '1190 Harter Street', 44907);


INSERT INTO `brand` (`id`, `company_id`, `name`, `create_at`) VALUES
(1, 1, 'Chest Cheese', '2023-06-25 07:06:54'),
(2, 2, 'Oceans Clean Up', '2023-06-25 07:07:48'),
(3, 3, 'The Armed Small Ltd', '2023-06-25 07:07:59'),
(4, 4, 'White Wolf Foods', '2023-06-25 07:08:10'),
(5, 5, 'Repair Group Co', '2023-06-25 07:08:19'),
(6, 6, 'Storm Solutions', '2023-06-25 07:08:29'),
(7, 2, 'Design Box', '2023-06-25 07:15:02'),
(8, 2, 'Clean Getaway', '2023-06-25 07:15:20'),
(9, 4, 'Sign Sports', '2023-06-25 07:15:33'),
(10, 5, 'Indesign Graphics', '2023-06-25 07:15:43');


INSERT INTO `company` (`id`, `name`, `business_license_number`, `address_id`, `create_at`) VALUES
(1, 'Crooks PLC', '439446206439446206', 1, '2023-06-25 06:55:53'),
(2, 'Baumbach Inc', '746277800746277800', 2, '2023-06-25 07:01:11'),
(3, 'Crooks-Grimes', '755754274755754274', 3, '2023-06-25 07:02:04'),
(4, 'Dicki Group', '874781973874781973', 4, '2023-06-25 07:03:13'),
(5, 'Gislason LLC', '011664635011664635', 2, '2023-06-25 07:04:10'),
(6, 'Collins and Sons', '717621664717621664', 3, '2023-06-25 07:05:13');


INSERT INTO `customers` (`id`, `name`, `family`, `code`, `address_id`, `phone_number`) VALUES
(1, 'Alberta', 'Bondy', '6012910389', 1, '6013970562'),
(2, 'Steven ', 'Cruz', '2672306034', 2, '4847690821'),
(3, 'Lawrence', 'Green', '6165165616', 4, '6168817985'),
(4, 'Latoya', 'Long', '9162934844', 3, '9164104269');


INSERT INTO `distributor` (`id`, `username`, `mail`, `address_id`, `work_time`) VALUES
(1, 'haley', 'marie_town0@hotmail.com', 3, '11-20'),
(2, 'Destroyer103', 'lester1983@hotmail.com', 1, '8-23'),
(3, '420SmokeOne', 'claire.kerlu@gmail.com', 3, '9-22'),
(4, 'mi3e', 'timmy_larso10@hotmail.com', 4, '11-20'),
(5, 'susie.mann', 'lawrence.fra@gmail.com', 2, '9-22');


INSERT INTO `orders` (`id`, `customer_id`, `create_at`) VALUES
(1, 1, '2023-06-25 08:00:33'),
(2, 2, '2023-06-25 08:00:33'),
(3, 4, '2023-06-25 08:00:40');


INSERT INTO `order_meta` (`id`, `order_id`, `product_id`, `distributor_id`, `count`) VALUES
(1, 1, 10, 1, 2),
(2, 2, 10, 5, 3),
(3, 3, 9, 4, 3),
(4, 2, 1, 2, 1);


INSERT INTO `product` (`id`, `brand_id`, `name`, `code`) VALUES
(1, 10, 'cheata', '6012910389'),
(2, 8, 'Washing liquid', '9162934844'),
(3, 9, 'Soccer ball', '2672306034'),
(4, 4, 'Pizza', '8160934844'),
(5, 2, 'hand soap', '2522402104'),
(6, 2, 'hand soap lux', '9160974844'),
(7, 7, 'car', '6812010329'),
(8, 7, 'windows', '5625224021'),
(9, 3, 'home service', '6012910380'),
(10, 1, 'fatty cheese', '9160974811'),
(11, 6, 'color', '6012910300'),
(12, 8, 'best cleaner', '9162934211'),
(13, 7, 'glasses', '2577402004'),
(14, 3, 'lens', '2577402044');


INSERT INTO `product_distributor` (`product_id`, `distributor_id`, `stock`, `price`) VALUES
(1, 2, 4, 100),
(7, 3, 6, 120),
(9, 4, 10, 25),
(4, 5, 50, 120),
(10, 5, 20, 50),
(10, 1, 50, 40);


INSERT INTO `product_type` (`product_id`, `type_id`) VALUES
(7, 1),
(1, 1),
(4, 6),
(5, 4),
(3, 2),
(6, 4);


INSERT INTO `type` (`id`, `brand_id`, `name`) VALUES
(1, 7, 'art work'),
(2, 9, 'ball'),
(3, 10, 'diigital art'),
(4, 8, 'soap'),
(5, 2, 'water'),
(6, 4, 'fast foods'),
(7, 1, 'salty'),
(8, 9, 'tenis'),
(9, 5, 'car repairing'),
(10, 4, 'seafood');