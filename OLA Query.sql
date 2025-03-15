create database OLA;
use OLA;

#Q1.Reteive all successfull Bookings

Create View Successfull_bookings as
select * 
from bookings 
where Booking_Status = "Success"; 
 
select * from Successfull_bookings;

#Q2. Find the average ride distance for each vehicle type

Create View Avg_ride_dist as
select vehicle_type, round(avg(Ride_Distance),2) as Ride_distance
from Bookings
group by vehicle_type;

select * from Avg_ride_dist;

#Q3. Get the total number of cancel ride by customer.

Create View Cancel_by_customer as
select count(Booking_Status) as Cancel_by_customer
from bookings
where Booking_Status = "Canceled by Customer";

select * from Cancel_by_customer;

#Q4. List the top 5 customer who booked the highest number of rides

Create View Top_5_customer as
select count(Booking_ID) as total_rides, Customer_ID
from bookings 
group by Customer_ID
order by count(Booking_ID) desc
limit 5;

select * from Top_5_customer;

#Q5. Get the number of rides canceled by driver due to personal and car-related issue.

create View cancel_by_driver_PR as
select count(*) as cancel_by_driver
from bookings
where Canceled_Rides_by_Driver = "Personal & car related issue";
select * from cancel_by_driver_PR;

#Q6. Find the maximum and minimum driver rating for prime sedan.

create View sedan_rating as
select Vehicle_Type, max(Driver_Ratings) as Max_rating, min(Driver_Ratings) as Min_rating
from bookings
where Vehicle_Type = "Prime Sedan";

select * from sedan_rating;

#Q7. Retrieve all rides where payment was mad using UPI;

Create View UPI_Payment as
select * from bookings
where Payment_Method = 'UPI';

#Q8. Find average customer rating per vehicle type.

Create View  Customer_rating_Vehicle as
select round(Avg(Customer_Rating),2) as customer_rating, Vehicle_Type
from bookings
group by vehicle_Type;
select * from Customer_rating_Vehicle;

#Q9. Calculate the total booking value of rides completed successfully.
create View total_value as
select sum(Booking_value) as total_value
from bookings
where Booking_status = 'Success';

#Q10. List all incomplete rides with their reason.

Create View incomplete_rides as
select incomplete_rides,Booking_id, incomplete_rides_reason
from bookings
where incomplete_rides = "Yes"; 