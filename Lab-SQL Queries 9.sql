use sakila;

-- Create a table rentals_may to store the data from rental table with information for the month of May.
select * from sakila.rental;

CREATE TABLE `rentals_may` (
  `rental_id` int DEFAULT NULL,
  `rental_date` date,
  `inventory_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `return_date` date,
  `staff_id` int DEFAULT NULL,
  `last_update` date
);

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
insert into rentals_may -- (rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
select rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update from sakila.rental
where substring(rental_date, 6, 2)= 05;

select * from sakila.rentals_may;

CREATE TABLE `rentals_june` (
  `rental_id` int DEFAULT NULL,
  `rental_date` date,
  `inventory_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `return_date` date,
  `staff_id` int DEFAULT NULL,
  `last_update` date
);

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into rentals_june -- (rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
select rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update from sakila.rental
where substring(rental_date, 6, 2)=06;

-- Check the number of rentals for each customer for May.
select customer_id, count(customer_id) as number_of_rentals_for_each_customer_id_may from rental
where substring(rental_date, 6, 2)= 05
group by customer_id;

-- Check the number of rentals for each customer for June.
select customer_id, count(customer_id) as number_of_rentals_for_each_customer_id_june from rental
where substring(rental_date, 6, 2)= 06
group by customer_id;