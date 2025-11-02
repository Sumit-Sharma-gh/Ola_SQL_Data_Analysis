select * from ola.ola_rides;

select * from ola.ola_rides
where status = 'Completed';

select ride_id, cancelled_reason from ola.ola_rides
where status = 'cancelled';

select * from ola.ola_rides
where driver_name = 'Arun';

select * from ola.ola_rides
where fare_amount > 300;

select * from ola.ola_rides
where payment_method = 'UPI';

select * from ola.ola_rides
where customer_name = 'Priya' and extract(MONTH FROM ride_date) = 1;

select count(*) as TOTAL_RIDES from ola.ola_rides;

select count(*) as TOTAL_CANCELLED from ola.ola_rides
where status = 'cancelled';

select distinct(pickup_location) from ola.ola_rides;

select * from ola.ola_rides
order by fare_amount
desc limit 10;






select count(*) as TOTAL , driver_name 
from ola.ola_rides
group by driver_name
order by count(*)
desc;

select round(avg(fare_amount),2) , payment_method 
from ola.ola_rides
group by payment_method;

select max(rating), driver_name
from ola.ola_rides
group by driver_name;

select round(sum(distance_km),2) as Total_distance , pickup_location
from ola.ola_rides
group by pickup_location; 

select avg(fare_amount) , extract(month from ride_date) as each_month
from ola.ola_rides
group by each_month;

select count(*) , customer_name 
from ola.ola_rides
group by customer_name;

select count(*) as Total_rides ,
sum(status = 'Completed') as Completed_rides, 
sum(status= 'cancelled') as Cancelled_Rides
from ola.ola_rides;

select Round(sum(fare_amount),2) as Total_earning , driver_name 
from ola.ola_rides
group by driver_name;

select driver_name , round(avg(ride_time_min),2) as Average_ride_time
from ola.ola_rides
group by driver_name;

select count(*) as Total_5_Rating from ola.ola_rides
where rating = 5;



select * from ola.ola_rides
where rating = null;

select * from ola.ola_rides
where distance_km > 10 and fare_amount < 200;

select * from ola.ola_rides
where cancelled_reason = 'Customer no-show';

select distinct(rating) from ola.ola_rides;

select customer_name, rating  from ola.ola_rides
where rating = 5;

select status , count(*) as Total , round(avg(fare_amount),2) as Average_Fare 
from ola.ola_rides
group by status;

select driver_name , round(sum(fare_amount),2) as Sum from ola.ola_rides
group by driver_name
having sum > 5000;

select customer_name, round(avg(rating),2) as average from ola.ola_rides
group by customer_name 
having average < 4;

select driver_name, distance_km from ola.ola_rides
order by distance_km
desc limit 1;

select * from ola.ola_rides
where pickup_location in ('Delhi', 'Mumbai', 'Bangalore', 'Chennai', 'Kolkata') 
and drop_location in ('Delhi', 'Mumbai', 'Bangalore', 'Chennai', 'Kolkata');

select * from ola.ola_rides
where extract(month from ride_date) = 2;

SELECT *
FROM ola.ola_rides
WHERE MONTHNAME(ride_date) = 'February';

select driver_name , sum(fare_amount) as total from ola.ola_rides
group by driver_name
order by total
desc limit 1;

select customer_name , count(*) from
ola.ola_rides
where status = 'cancelled' 
group by customer_name
order by count(*) desc;

select round(sum(distance_km),2) as Total_Distance , round(avg(fare_amount),2) as Average_distance, monthname(ride_date) as month_n
from ola.ola_rides
group by month_n;
 
 
select driver_name , round(avg(rating),2) 
from ola.ola_rides
group by driver_name
order by avg(rating)
desc limit 5;

select pickup_location , count(*) as Total 
from ola.ola_rides
where status = 'Completed'
group by pickup_location
order by Total
desc limit 3;

select ride_date, count(*) as Total_Ride 
from ola.ola_rides
group by ride_date
order by ride_date;

select count(*) as Total , payment_method
from ola.ola_rides
group by payment_method
order by Total
desc limit 1;

select ride_id, customer_name, driver_name, fare_amount, distance_km,
round(fare_amount/distance_km,2) as Fare_per_km
from ola.ola_rides
order by Fare_per_km
desc;

select count(*) as Total_cancelled , ride_date  from ola.ola_rides
where status = 'cancelled'
group by ride_date
order by count(*)
desc limit 1;

select ride_id, customer_name, driver_name, fare_amount, distance_km, 
round(fare_amount/ride_time_min,2) as Fare_per_min 
from ola.ola_rides
where (fare_amount/ride_time_min) > 10;