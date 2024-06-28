-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 06:16 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oms`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Kitchen'),
(2, 'electronics'),
(3, 'washing'),
(4, 'fryers'),
(5, 'chopper'),
(6, 'whiskers'),
(7, 'ladels'),
(8, 'storage'),
(9, 'cutlery'),
(10, 'utensils');

-- --------------------------------------------------------

--
-- Stand-in structure for view `categoryview`
-- (See below for the actual view)
--
CREATE TABLE `categoryview` (
`Product_Name` varchar(100)
,`Category_Name` varchar(100)
,`Quantity_Sold` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `prod_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `commentsdate_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `reviewScore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comments`, `prod_id`, `cust_id`, `commentsdate_time`, `reviewScore`) VALUES
(1, 'Very satisfied with my purchase.', 12, 2, '2024-05-16 09:45:00', 5),
(2, 'The quality exceeded my expectations.', 13, 1, '2024-05-17 10:20:00', 5),
(3, 'Fast delivery and excellent service.', 22, 2, '2024-05-18 11:55:00', 5),
(4, 'Product arrived in perfect condition.', 7, 1, '2024-05-19 12:40:00', 5),
(5, 'good enough', 13, 6, '2024-06-25 14:40:19', 4),
(6, 'can be better', 17, 10, '2024-06-25 14:40:19', 5),
(7, 'excellent', 19, 8, '2024-06-25 14:40:19', 3),
(8, 'cheap purchase', 14, 7, '2024-06-25 14:40:19', 2),
(9, 'good quality', 11, 4, '2024-06-25 14:40:19', 5),
(10, 'satisfied', 8, 2, '2024-06-25 14:42:19', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerordersdetails`
-- (See below for the actual view)
--
CREATE TABLE `customerordersdetails` (
`Customer_ID` int(11)
,`Customer_Name` varchar(100)
,`Customer_Email` varchar(100)
,`Customer_Contact` varchar(100)
,`Customer_Address` varchar(100)
,`Total_Purchases` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `lastlogin_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `lastlogin_time`, `password`, `contact`, `address`, `created_at`) VALUES
(1, 'Emily Johnson', 'emily.johnson@example.com', '2024-05-03 07:00:00', 'password789', '9876543212', '789 Oak Lane, Ogdenville', '2024-06-12 14:22:18'),
(2, 'Michael Brown', 'michael.brown@example.com', '2024-05-04 09:45:00', 'passwordabc', '9876543213', '101 Pine Road, North Haverbrook', '2024-06-12 14:22:18'),
(3, 'akanksha', 'mahajanja@gmail.com', '2024-06-25 13:45:44', 'hdjksdl', '9988937837', 'angar mall', '2024-06-25 13:45:44'),
(4, 'kazim', 'kanjfk@gmail.com', '2024-06-25 13:45:44', 'kjuhjd1', '987886542', 'karachi 23 pak', '2024-06-25 13:45:44'),
(5, 'Anchal', 'thakur2@gmail.com', '2024-06-25 13:45:44', 'thakur5', '883886478', 'kala manj mukerian', '2024-06-25 13:45:44'),
(6, 'Sahil Gupta', 'sahilgup3@gmail.com', '2024-06-25 13:45:44', 'hsiodf', '567637467', 'vaishano jammu', '2024-06-25 13:45:44'),
(7, 'GUrjinder', 'bhullar22@gmail.com', '2024-06-25 13:45:44', 'guuuuu', '9876745356', 'sugar mill 22 paathankot', '2024-06-25 13:45:44'),
(8, 'Aneesh', 'mahajnaneesh@gmail.com', '2024-06-25 13:45:44', 'aneeesh@007', '4563837849', '14 wind chime canada', '2024-06-25 13:45:44'),
(9, 'Karanjeet', 'ghotra4@gmail.com', '2024-06-25 13:45:44', 'kghdjyj4', '847864884', '67 hardwook giesen', '2024-06-25 13:45:44'),
(10, 'Sabrina', 'piera44@gmail.com', '2024-06-25 13:47:57', 'ghjdhkjd', '889876589', 'siedelmeisterwg36', '2024-06-25 13:47:57');

--
-- Triggers `customers`
--
DELIMITER $$
CREATE TRIGGER `customer_trigger` AFTER UPDATE ON `customers` FOR EACH ROW IF NEW.lastlogin_time <> OLD.lastlogin_time THEN
        INSERT INTO customer_logins (cust_id, login_time)
        VALUES (NEW.id, NEW.lastlogin_time);
    END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `last_updated`) VALUES
(1, 22, 10, '2024-06-25 12:56:52'),
(2, 12, 6, '2024-06-25 12:56:52'),
(3, 7, 15, '2024-06-25 12:56:52'),
(4, 23, 18, '2024-06-25 12:56:52'),
(5, 15, 5, '2024-06-25 12:56:52'),
(6, 2, 20, '2024-06-25 12:56:52'),
(7, 18, 5, '2024-06-25 12:56:52'),
(8, 23, 15, '2024-06-25 14:59:38'),
(9, 12, 10, '2024-06-25 14:59:38'),
(10, 8, 25, '2024-06-25 14:59:38'),
(11, 11, 18, '2024-06-25 14:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `notification_type` varchar(100) NOT NULL,
  `message_text` varchar(100) NOT NULL,
  `read_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `cust_id`, `notification_type`, `message_text`, `read_status`, `created_at`) VALUES
(1, 1, 'Order status', 'Your order #1234 has been shipped.', 0, '2024-06-25 12:18:52'),
(2, 2, 'Promotion', 'Get 20% off on your next purchase!', 0, '2024-06-25 12:18:52'),
(3, 1, 'Order Update', 'Your order #5678 is out for delivery.', 0, '2024-06-25 12:18:52'),
(4, 2, 'track', 'you can now track your order', 0, '2024-06-25 12:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `offers_promotions`
--

CREATE TABLE `offers_promotions` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `dis_percentage` decimal(5,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offers_promotions`
--

INSERT INTO `offers_promotions` (`id`, `title`, `description`, `dis_percentage`, `start_date`, `end_date`, `created_at`) VALUES
(1, 'Summer Sale', 'Enjoy up to 50% off on summer essentials!', '50.00', '2024-06-01', '2024-06-30', '2024-06-24 17:19:14'),
(2, 'Black Friday', 'Exclusive Black Friday deals on all products!', '30.00', '2024-11-25', '2024-11-30', '2024-06-24 17:19:14'),
(3, 'Christmas end sale', 'buy 1 get 1 free!', '75.00', '2024-12-06', '2024-12-31', '2024-06-24 17:19:14'),
(4, 'season end', ' enjoy upto 20% off !', '20.00', '2024-05-12', '2024-07-01', '2024-06-24 17:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `order_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `cust_id`, `order_datetime`) VALUES
(1, 1, '2024-05-15 16:47:36'),
(2, 2, '2024-06-12 16:48:06'),
(3, 2, '2024-05-24 16:48:06'),
(4, 1, '2024-06-12 16:48:06'),
(5, 4, '2024-06-25 16:22:30'),
(6, 5, '2024-06-25 16:22:30'),
(7, 9, '2024-06-25 16:22:30'),
(8, 5, '2024-06-25 16:22:30'),
(9, 7, '2024-06-25 16:22:30'),
(10, 10, '2024-06-25 16:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `quantity`, `price`) VALUES
(1, 2, 3, 3, '300'),
(2, 1, 14, 1, '100'),
(3, 3, 5, 2, '250'),
(4, 3, 22, 8, '400'),
(5, 4, 18, 15, '500'),
(6, 1, 7, 12, '300'),
(7, 8, 17, 7, '41'),
(8, 10, 14, 5, '359'),
(9, 9, 11, 8, '290'),
(10, 5, 12, 12, '110');

--
-- Triggers `order_items`
--
DELIMITER $$
CREATE TRIGGER `Inventory_update_trigger` AFTER INSERT ON `order_items` FOR EACH ROW UPDATE inventory
    SET quantity = quantity - NEW.quantity
    WHERE prod_id = NEW.prod_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `payment_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `order_id`, `payment_mode`, `payment_status`, `amount`, `transaction_id`, `payment_date`) VALUES
(2, 1, 'Credit Card', 'Completed', '109.99', 'TX1234567847', '2024-06-24 17:36:53'),
(3, 2, 'Google pay', 'Completed', '149.92', 'TX987633321', '2024-06-24 17:36:53'),
(4, 4, 'Mastercard', 'Completed', '300.00', 'TPbbdjkjhd', '2024-06-24 17:36:53'),
(5, 3, 'Cash', 'Pending', '209.50', 'TX9974934793', '2024-06-24 17:36:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `supp_id` int(10) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `supp_id`, `tags`, `created_at`) VALUES
(1, 'Stainless Steel Saucepan', 'Durable stainless steel saucepan, 2L', '25.99', 1, 1, 'stainless steel,kitchen,cooking', '2024-06-17 17:25:09'),
(2, 'Cast Iron Skillet', 'Pre-seasoned cast iron skillet, 30cm', '30.99', 1, 1, 'cast iron,kitchen,cooking', '2024-06-17 17:25:09'),
(3, 'Ceramic Baking Dish', 'Ceramic baking dish, 3L', '15.99', 1, 1, 'ceramic,kitchen,baking', '2024-06-17 17:25:09'),
(4, 'Wooden Spoon Set', 'Set of 5 wooden spoons', '9.99', 1, 1, 'wooden,kitchen,utensils', '2024-06-17 17:25:09'),
(5, 'Silicone Spatula', 'Heat-resistant silicone spatula', '7.99', 1, 1, 'silicone,kitchen,utensils', '2024-06-17 17:25:09'),
(6, 'Blender', 'High-power blender with multiple settings', '39.99', 1, 2, 'blender,kitchen,appliance', '2024-06-17 17:25:09'),
(7, 'Microwave Oven', 'Compact microwave oven, 700W', '49.99', 1, 2, 'microwave,kitchen,appliance', '2024-06-17 17:25:09'),
(8, 'Toaster', '2-slice toaster with browning control', '24.99', 1, 2, 'toaster,kitchen,appliance', '2024-06-17 17:25:09'),
(9, 'Pressure Cooker', '6L electric pressure cooker', '59.99', 1, 2, 'pressure cooker,kitchen,appliance', '2024-06-17 17:25:09'),
(10, 'Coffee Maker', 'Automatic drip coffee maker, 12 cups', '29.99', 1, 2, 'coffee maker,kitchen,appliance', '2024-06-17 17:25:09'),
(11, 'Air Fryer', 'Compact air fryer, 3.5L', '59.99', 2, 3, 'air fryer,kitchen,appliance', '2024-06-24 14:56:28'),
(12, 'Induction Cooktop', 'Portable induction cooktop with touch controls', '49.99', 2, 3, 'induction,kitchen,appliance', '2024-06-24 14:56:28'),
(13, 'Waffle Maker', 'Belgian waffle maker with removable plates', '29.99', 2, 3, 'waffle maker,kitchen,appliance', '2024-06-24 14:56:28'),
(14, 'Deep Fryer', 'Electric deep fryer, 3L', '39.99', 2, 3, 'deep fryer,kitchen,appliance', '2024-06-24 14:56:28'),
(15, 'Immersion Blender', 'Handheld immersion blender with attachments', '24.99', 2, 3, 'immersion blender,kitchen,appliance', '2024-06-24 14:56:28'),
(16, 'Electric Grill', 'Indoor electric grill with adjustable temperature', '44.99', 2, 3, 'electric grill,kitchen,appliance', '2024-06-24 14:56:28'),
(17, 'Chai Maker', 'Automatic chai maker with brew strength control', '29.99', 3, 4, 'chai maker,kitchen,appliance', '2024-06-24 14:56:28'),
(18, 'Rotimatic', 'Automatic roti maker with advanced settings', '199.99', 3, 4, 'roti maker,kitchen,appliance', '2024-06-24 14:56:28'),
(19, 'Idli Steamer', 'Electric idli steamer with multiple tiers', '39.99', 3, 4, 'idli steamer,kitchen,appliance', '2024-06-24 14:56:28'),
(20, 'Chapati Press', 'Electric chapati press with non-stick plates', '24.99', 3, 4, 'chapati press,kitchen,appliance', '2024-06-24 14:56:28'),
(21, 'Masala Box', 'Stainless steel masala box with 7 compartments', '14.99', 3, 4, 'masala box,kitchen,storage', '2024-06-24 14:56:28'),
(22, 'Kadai', 'Heavy-duty cast iron kadai', '29.99', 3, 4, 'kadai,kitchen,cooking', '2024-06-24 14:56:28'),
(23, 'Pani Puri Maker', 'Automatic pani puri maker', '49.99', 3, 4, 'pani puri,kitchen,appliance', '2024-06-24 14:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `id` int(10) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `reason` varchar(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recommendation`
--

INSERT INTO `recommendation` (`id`, `product_id`, `reason`, `created_at`) VALUES
(1, 6, 'Blah blah', '2024-06-24 16:25:57'),
(2, 2, 'Based on yo', '2024-06-24 16:47:59'),
(3, 22, 'Frequently ', '2024-06-24 16:47:59'),
(4, 15, 'Similar fea', '2024-06-24 16:47:59'),
(5, 12, 'Customers a', '2024-06-24 16:47:59'),
(6, 17, 'You might l', '2024-06-24 16:47:59'),
(7, 7, 'you will li', '2024-06-24 16:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `return_items`
--

CREATE TABLE `return_items` (
  `id` int(10) NOT NULL,
  `order_item_id` int(10) NOT NULL,
  `return_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reason` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `return_items`
--

INSERT INTO `return_items` (`id`, `order_item_id`, `return_date`, `reason`) VALUES
(1, 2, '2024-05-15 22:00:00', 'Wrong item shipped'),
(2, 3, '2024-05-16 22:00:00', 'Item not as described'),
(3, 4, '2024-05-17 22:00:00', 'Changed mind'),
(4, 5, '2024-05-18 22:00:00', 'Item arrived late'),
(5, 5, '2024-05-19 22:00:00', 'Better price available elsewhere'),
(6, 6, '2024-05-20 22:00:00', 'Product damaged in shipping'),
(7, 2, '2024-05-21 22:00:00', 'Item not needed anymore'),
(8, 1, '2024-05-22 22:00:00', 'Ordered by mistake'),
(9, 9, '2024-06-25 15:04:26', 'misising items'),
(10, 10, '2024-06-25 15:04:26', 'arrived too late'),
(11, 7, '2024-06-25 15:04:26', 'changed my mind');

--
-- Triggers `return_items`
--
DELIMITER $$
CREATE TRIGGER `product_return` AFTER INSERT ON `return_items` FOR EACH ROW INSERT INTO return_items (order_item_id, return_date, reason)
    VALUES (NEW.order_item_id, NEW.return_date, NEW.reason)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `return_item_view`
-- (See below for the actual view)
--
CREATE TABLE `return_item_view` (
`Product_Name` varchar(100)
,`Customer_Name` varchar(100)
,`Return_Reason` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`id`, `name`) VALUES
(1, 'bad'),
(2, 'not bad'),
(3, 'good'),
(4, 'better'),
(5, 'best');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  `shipping_method` varchar(100) NOT NULL,
  `tracking_numb` varchar(100) NOT NULL,
  `shipping_status` varchar(100) NOT NULL,
  `estimated_delivery` date NOT NULL,
  `shipping_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `order_id`, `shipping_address`, `shipping_method`, `tracking_numb`, `shipping_status`, `estimated_delivery`, `shipping_date`, `delivery_date`, `created_at`) VALUES
(1, 1, 'Mahajana Mohalla', 'Standard', 'TRACK1234', 'Shipped', '2024-06-15', '2024-06-10', '2024-06-14', '2024-06-24 18:03:40'),
(2, 3, '24 Kitchlu Nagar, Ludhiana', 'Express', 'TRACK5678', 'In Transit', '2024-06-12', '2024-06-09', '2024-06-11', '2024-06-24 18:03:40'),
(3, 2, 'Dav University', 'DHL', 'TG83894', 'Out for delivery', '2024-05-31', '2024-05-22', '2024-05-26', '2024-06-24 18:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `address`, `city`, `Country`, `contact`, `email`) VALUES
(1, 'Pan Kitchen', 'Ram Nagar 12', 'Ludhiana', 'India', '9876579277', 'pan05@gmail.com'),
(2, 'kitchen essentials', 'Kitchlu Nagar 10', 'Jalandhar', 'India', '1234567890', 'forward00@gmail.com'),
(3, 'Mom\'s Kitchen', 'Sangar Bazar 9', 'Beijing', 'China', '+98483583700', 'dkle02@gmail.com'),
(4, 'Ghar ka Sawad', '78 Wellnes Road', 'Spain', 'Madrid', '+348877665544', 'adv9@gamil.com'),
(5, 'home cooked', 'vivek bhawan 2', 'Delhi', 'India', '+324789497', 'vivekb5@gmail.com'),
(6, 'chai wala', 'hotroom 67', 'karachi', 'pakistan', '+92774899474', 'chai7@gmail.com'),
(7, 'Pan Degli', 'stugatter platz', 'charlottenburg', 'germany', '+49873784994', 'degli43@gmail.com'),
(8, 'Amrit', 'brandtor22', 'potsdamer platz', 'Germany', '+363873897849', 'amrik6@gmail.com'),
(9, 'Paan', 'annad bhawan 36', 'Anandpur', 'India', '9776648946', 'patakavg33@gmail.com'),
(10, 'Malhi Cusinie', 'main road 25', 'Panipat', 'Inida', '+9186784648', 'cusinke43@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(10) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `cust_id`, `product_id`, `added_at`) VALUES
(1, 1, 22, '2024-06-25 12:14:35'),
(2, 2, 12, '2024-06-25 12:14:35'),
(3, 2, 7, '2024-06-25 12:14:35'),
(4, 10, 5, '2024-06-25 12:14:35'),
(5, 1, 3, '2024-06-25 12:14:35'),
(6, 6, 18, '2024-06-25 12:14:35'),
(7, 8, 23, '2024-06-25 12:14:35'),
(8, 4, 6, '2024-06-25 13:51:15'),
(9, 9, 10, '2024-06-25 13:51:15'),
(10, 7, 20, '2024-06-25 13:51:15'),
(11, 8, 18, '2024-06-25 13:51:15');

-- --------------------------------------------------------

--
-- Structure for view `categoryview`
--
DROP TABLE IF EXISTS `categoryview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `categoryview`  AS SELECT `p`.`name` AS `Product_Name`, `c`.`name` AS `Category_Name`, sum(`oi`.`quantity`) AS `Quantity_Sold` FROM (((`products` `p` join `order_items` `oi` on(`p`.`id` = `oi`.`prod_id`)) join `orders` `o` on(`oi`.`order_id` = `o`.`id`)) join `category` `c` on(`p`.`category_id` = `c`.`id`)) GROUP BY `p`.`id`, `p`.`name`, `c`.`name` ORDER BY sum(`oi`.`quantity`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `customerordersdetails`
--
DROP TABLE IF EXISTS `customerordersdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerordersdetails`  AS SELECT `c`.`id` AS `Customer_ID`, `c`.`name` AS `Customer_Name`, `c`.`email` AS `Customer_Email`, `c`.`contact` AS `Customer_Contact`, `c`.`address` AS `Customer_Address`, sum(`oi`.`quantity` * `oi`.`price`) AS `Total_Purchases` FROM ((`customers` `c` join `orders` `o` on(`c`.`id` = `o`.`cust_id`)) join `order_items` `oi` on(`o`.`id` = `oi`.`order_id`)) GROUP BY `c`.`id`, `c`.`name`, `c`.`email`, `c`.`contact`, `c`.`address` ORDER BY sum(`oi`.`quantity` * `oi`.`price`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `return_item_view`
--
DROP TABLE IF EXISTS `return_item_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `return_item_view`  AS SELECT `p`.`name` AS `Product_Name`, `c`.`name` AS `Customer_Name`, `ri`.`reason` AS `Return_Reason` FROM ((((`return_items` `ri` join `order_items` `oi` on(`ri`.`order_item_id` = `oi`.`id`)) join `orders` `o` on(`oi`.`order_id` = `o`.`id`)) join `products` `p` on(`oi`.`prod_id` = `p`.`id`)) join `customers` `c` on(`o`.`cust_id` = `c`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentsproduct` (`prod_id`),
  ADD KEY `commentcust` (`cust_id`),
  ADD KEY `fk_reviewScore` (`reviewScore`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_email_index` (`email`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inventprod` (`product_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notificust` (`cust_id`);

--
-- Indexes for table `offers_promotions`
--
ALTER TABLE `offers_promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custorder` (`cust_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order` (`order_id`),
  ADD KEY `productorder` (`prod_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payorder` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_supp` (`supp_id`),
  ADD KEY `prod_cate` (`category_id`),
  ADD KEY `product_name_index` (`name`);

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pdt_recomm` (`product_id`);

--
-- Indexes for table `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returnorder` (`order_item_id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shipping_order` (`order_id`),
  ADD KEY `tracking_numb_index` (`tracking_numb`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_index` (`contact`),
  ADD KEY `email_index` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wishcust` (`cust_id`),
  ADD KEY `fk_wishproduct` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `offers_promotions`
--
ALTER TABLE `offers_promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `commentcust` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `commentsproduct` FOREIGN KEY (`prod_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_reviewScore` FOREIGN KEY (`reviewScore`) REFERENCES `score` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk_inventprod` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notificust` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `custorder` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `productorder` FOREIGN KEY (`prod_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD CONSTRAINT `fk_payorder` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `prod_cate` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `prod_supp` FOREIGN KEY (`supp_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD CONSTRAINT `fk_pdt_recomm` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `return_items`
--
ALTER TABLE `return_items`
  ADD CONSTRAINT `returnorder` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `fk_shipping_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `fk_wishcust` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_wishproduct` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
