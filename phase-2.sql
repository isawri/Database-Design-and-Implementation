
START TRANSACTION;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `country` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL,
  `state` varchar(45) COLLATE utf8mb3_persian_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL,
  `street` varchar(100) COLLATE utf8mb3_persian_ci NOT NULL,
  `zipcode` int NOT NULL
);

CREATE TABLE `company` (
  `id` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL,
  `business_license_number` varchar(18) COLLATE utf8mb3_persian_ci NOT NULL,
  `address_id` int NOT NULL,
  `create_at` datetime NOT NULL
);

CREATE TABLE `brand` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL,
  `create_at` datetime NOT NULL
);


CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL,
  `family` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb3_persian_ci NOT NULL,
  `address_id` int NOT NULL,
  `phone_number` varchar(13) COLLATE utf8mb3_persian_ci NOT NULL
);



CREATE TABLE `distributor` (
  `id` int NOT NULL,
  `username` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL,
  `mail` varchar(80) COLLATE utf8mb3_persian_ci NOT NULL,
  `address_id` int NOT NULL,
  `work_time` varchar(40) COLLATE utf8mb3_persian_ci NOT NULL
);


CREATE TABLE `product` (
  `id` int NOT NULL,
  `brand_id` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL,
  `code` varchar(12) COLLATE utf8mb3_persian_ci NOT NULL
);


CREATE TABLE `orders` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `create_at` datetime NOT NULL
);


CREATE TABLE `order_meta` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `distributor_id` int NOT NULL,
  `count` int NOT NULL
);


CREATE TABLE `product_distributor` (
  `product_id` int NOT NULL,
  `distributor_id` int NOT NULL,
  `stock` int NOT NULL,
  `price` int NOT NULL
);


CREATE TABLE `type` (
  `id` int NOT NULL,
  `brand_id` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_persian_ci NOT NULL
);

CREATE TABLE `product_type` (
  `product_id` int NOT NULL,
  `type_id` int NOT NULL
);







--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address_info` (`country`,`state`,`city`,`street`,`zipcode`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `business_license_number_UNIQUE` (`business_license_number`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`mail`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_meta`
--
ALTER TABLE `order_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `distributor_id` (`distributor_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `product_distributor`
--
ALTER TABLE `product_distributor`
  ADD KEY `distributor_id` (`distributor_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_meta`
--
ALTER TABLE `order_meta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `distributor`
--
ALTER TABLE `distributor`
  ADD CONSTRAINT `distributor_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_meta`
--
ALTER TABLE `order_meta`
  ADD CONSTRAINT `order_meta_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_meta_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_meta_ibfk_3` FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_distributor`
--
ALTER TABLE `product_distributor`
  ADD CONSTRAINT `product_distributor_ibfk_1` FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_distributor_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_type`
--
ALTER TABLE `product_type`
  ADD CONSTRAINT `product_type_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `type_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


COMMIT;