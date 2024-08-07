
# Food Delivery Application Database

## Overview

This document provides a comprehensive overview of the database schema used for the Food Delivery Application. The database is designed to manage user profiles, orders, menus, transactions, deliveries, and notifications.

## Database Schema

### 1. `user` Table
- **Purpose**: Stores user information.
- **Columns**:
  - `user_id` (INT, Primary Key): Unique identifier for each user.
  - `username` (VARCHAR): Username of the user.
  - `email` (VARCHAR): Email address of the user.
  - `password` (VARCHAR): Password for the user account.

### 2. `addresses` Table
- **Purpose**: Stores addresses associated with users.
- **Columns**:
  - `address_id` (INT, Primary Key, Auto Increment): Unique identifier for each address.
  - `user_id` (INT, Foreign Key): References `user(user_id)`.
  - `street` (VARCHAR): Street address.
  - `city` (VARCHAR): City of the address.
  - `state` (VARCHAR): State of the address.
  - `zip_code` (VARCHAR): ZIP code of the address.
  - `country` (VARCHAR): Country of the address.

### 3. `restaurant` Table
- **Purpose**: Stores information about restaurants.
- **Columns**:
  - `restaurant_id` (INT, Primary Key, Auto Increment): Unique identifier for each restaurant.
  - `name` (VARCHAR): Name of the restaurant.
  - `address_id` (INT, Foreign Key): References `addresses(address_id)`.
  - `phone` (VARCHAR): Contact phone number of the restaurant.
  - `email` (VARCHAR): Email address of the restaurant.

### 4. `menu` Table
- **Purpose**: Stores menu items offered by restaurants.
- **Columns**:
  - `menu_id` (INT, Primary Key, Auto Increment): Unique identifier for each menu item.
  - `restaurant_id` (INT, Foreign Key): References `restaurant(restaurant_id)`.
  - `item_name` (VARCHAR): Name of the menu item.
  - `item_description` (TEXT): Description of the menu item.
  - `price` (DECIMAL): Price of the menu item.

### 5. `order` Table
- **Purpose**: Stores orders placed by users.
- **Columns**:
  - `order_id` (INT, Primary Key, Auto Increment): Unique identifier for each order.
  - `user_id` (INT, Foreign Key): References `user(user_id)`.
  - `restaurant_id` (INT, Foreign Key): References `restaurant(restaurant_id)`.
  - `order_date` (DATETIME): Date and time when the order was placed.
  - `order_status` (VARCHAR): Status of the order (e.g., Delivered, Pending, Cancelled).

### 6. `cart` Table
- **Purpose**: Manages items added to the cart by users.
- **Columns**:
  - `cart_id` (INT, Primary Key, Auto Increment): Unique identifier for each cart entry.
  - `user_id` (INT, Foreign Key): References `user(user_id)`.
  - `menu_id` (INT, Foreign Key): References `menu(menu_id)`.
  - `quantity` (INT): Quantity of the menu item.

### 7. `delivery` Table
- **Purpose**: Stores delivery information for orders.
- **Columns**:
  - `delivery_id` (INT, Primary Key, Auto Increment): Unique identifier for each delivery.
  - `order_id` (INT, Foreign Key): References `order(order_id)`.
  - `delivery_status` (VARCHAR): Status of the delivery (e.g., Delivered, Pending, Cancelled).
  - `delivery_date` (DATETIME): Date and time when the delivery was made.
  - `delivery_address` (INT, Foreign Key): References `addresses(address_id)`.

### 8. `bill` Table
- **Purpose**: Stores billing information related to orders.
- **Columns**:
  - `bill_id` (INT, Primary Key, Auto Increment): Unique identifier for each bill.
  - `order_id` (INT, Foreign Key): References `order(order_id)`.
  - `amount` (DECIMAL): Total amount of the bill.
  - `payment_status` (VARCHAR): Payment status (e.g., Paid, Unpaid, Cancelled).

### 9. `payment` Table
- **Purpose**: Stores payment information related to orders.
- **Columns**:
  - `payment_id` (INT, Primary Key, Auto Increment): Unique identifier for each payment.
  - `order_id` (INT, Foreign Key): References `order(order_id)`.
  - `payment_method` (VARCHAR): Method of payment (e.g., Cash on Delivery, Credit Card).
  - `payment_date` (DATETIME): Date and time of the payment.
  - `payment_status` (VARCHAR): Status of the payment (e.g., Paid, Unpaid).

### 10. `notification` Table
- **Purpose**: Stores notifications sent to users.
- **Columns**:
  - `notification_id` (INT, Primary Key, Auto Increment): Unique identifier for each notification.
  - `user_id` (INT, Foreign Key): References `user(user_id)`.
  - `message` (TEXT): Notification message.
  - `status` (VARCHAR): Status of the notification (e.g., Read, Unread).

## Relationships

- **User-Address**: A user can have multiple addresses. (`user_id` in `addresses`).
- **User-Order**: A user can place multiple orders. (`user_id` in `order`).
- **User-Cart**: A user can have multiple items in their cart. (`user_id` in `cart`).
- **User-Notification**: A user can receive multiple notifications. (`user_id` in `notification`).
- **Restaurant-Menu**: A restaurant can offer multiple menu items. (`restaurant_id` in `menu`).
- **Order-Bill**: Each order has one bill. (`order_id` in `bill`).
- **Order-Delivery**: Each order can have a delivery entry. (`order_id` in `delivery`).
- **Order-Payment**: Each order can have a payment record. (`order_id` in `payment`).
- **Restaurant-Address**: Each restaurant is located at a specific address. (`address_id` in `restaurant`).
- **Delivery-Address**: Each delivery is made to a specific address. (`delivery_address` in `delivery`).

## Indexes and Constraints

- **Indexes**: Primary keys and foreign keys are indexed to ensure efficient querying and referential integrity.
- **Constraints**: Foreign key constraints ensure that relationships between tables are maintained and data integrity is preserved.

## Auto-Increment

Tables with primary keys that are auto-incremented ensure unique identification for each record and manage unique IDs automatically.

## Usage

This database schema is designed to support a food delivery application by managing user profiles, orders, menu items, restaurants, and delivery details effectively. Ensure that appropriate data validation and security measures are in place when integrating this schema into your application.

