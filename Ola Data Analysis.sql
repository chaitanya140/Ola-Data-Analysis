create database Ola;
Use Ola;

 Create View Successful_Bookings AS
 Select * from Bookings Where Booking_Status = 'Success';
 
  #1. Retrive all successful bookings
  Select * from Successful_Bookings;
  
  
  Create View Ride_Distance_For_Each_Vehicle AS
  Select Vehicle_Type, AVG(Ride_Distance)
  AS avg_distance FROM Bookings
  GROUP BY Vehicle_Type;
  
#2. Find the average ride distance for each vehicle type.
Select * from Ride_Distance_For_Each_Vehicle;


Create View Canceled_Rides AS
Select Count(*) from Bookings Where Booking_Status = 'Canceled by Customer';

#3. Get the total number of cancel rides by customers.
Select * from Canceled_Rides;


Create View Highest_Number_Of_Rides AS
Select Customer_ID, COUNT(Booking_ID) as total_rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

#4. List the top 5 customers who booked the highest number of rides.
Select * from Highest_Number_Of_Rides;


Create View Canceled_By_Drivers AS
Select Count(*) from Bookings Where Booking_Status = 'Canceled By Driver'
AND Canceled_Rides_by_Driver = 'Personal & Car related issue';

#5. Get the number of rides canceled by drivers due to personal or car related-issues.
Select * from Canceled_By_Drivers;


Create View Min_Max_Driver_Ratings AS
Select Max(Driver_Ratings) as max_rating,
Min(Driver_Ratings) as min_rating
From Bookings Where Vehicle_Type = 'Prime Sedan';

#6. Find the Maximum and Minimum driver ratings for Prime Sedan Bookings.
Select * from Min_Max_Driver_Ratings;


Create View Retrieve_All_Rides AS
Select * From Bookings
Where Payment_Method = 'UPI';

#7. Retrieve all rides where payment was made with UPI.
Select * from Retrieve_All_Rides;


Create View Average_Customer_Rating AS
Select Vehicle_Type, Avg(Customer_Rating) AS Avg_Customer_Values
From Bookings
Group By Vehicle_Type;

#8. Find the average customer rating per vehicle type.
Select * from Average_Customer_Rating;


Create View Total_Booking_Values AS
Select Sum(Booking_Value) As Total_Value From Bookings
Where Booking_Status = 'Success';

#9. Calculate the total booking value of rides completed successfully.
Select * from Total_Booking_Values;


Create View Incomplete_Rides AS
Select Booking_ID, Incomplete_Rides_Reason From Bookings
Where Incomplete_Rides = 'Yes';

#10. List all incomplete rides along with the reason.
Select * from Incomplete_Rides;