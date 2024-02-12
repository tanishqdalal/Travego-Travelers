use travego;

#2.a) How many females and how many male passengers traveled a minimum distance of 600 KMs?
select gender,count(gender) from passenger where distance>=600 group by gender;

#2.b) Find the minimum ticket price of a Sleeper Bus. 
select min(Price) from Price where Bus_Type = 'Sleeper';

#2.c) Select passenger names whose names start with character 'S' 
select passenger_name from passenger having passenger_name like"s%";

#2.d) Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output. 
select a.Passenger_name,a.Boarding_City,a.Destination_City,a.Bus_type,b.Price from Passenger a , Price b where (a.Bus_Type = b.Bus_Type and a.Distance = b.Distance);

#2.e) What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select a.Passenger_name,b.Price from Passenger a ,Price b where (a.Bus_Type = "Sitting" and b.Bus_Type = "Sitting" and a.Distance = 1000 and b.Distance=1000);

#2.f) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT Price FROM Price where distance=(SELECT Distance FROM Passenger where passenger_name = "Pallavi");

#2.g) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
 select distinct(distance) from passenger order by distance desc;
 
 #2.h) Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables
 select passenger_name,(distance*100)/(select sum(distance) from passenger) as percentage_traveled
 from passenger;
 