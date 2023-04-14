#Show all the database on the schema
show databases;

#Working on the database project.
use project1;

#show the all the tables that's on the table.
show tables;

#On the actions2load table show all the columns 
SELECt * FROM actions2load;

#count all the rows in actions2load
SELECT count(*) FROM actions2load;

#call the account_id column
select account_id from actions2load;

#Count all the rows on the column
select count(account_id) from actions2load;

#call out the event_type column
select event_type from actions2load;

#Call out the event_time column
select event_time from actions2load;

#To describe the actionsload dataset and
#it shows that there is no primary key indicate on our dataset./*
desc actions2load;

#check the activities weekly
SELECT event_time, event_time * 52 as weeklyevent FROM actions2load;

#checking the event occurence base on week,month, and year
SELECT event_time, 
event_time * 52 as weeklyevent,
event_time * 52 + 12 as monthlyevent,
event_time * 52 * 12 - 1 as yearlyevent  FROM actions2load;

#Giving the sum of all the event_time
select sum(event_time) as 'sum of event_time' from actions2load;

##Changing the date format on a single data
SELECT date_format("2023-02-06", "%M %D %Y") as new_date;

#Attach the same method on all the dataset
SELECT event_time as original, DATE_FORMAT(event_time, "%M %D %Y") as New_Date1
FROM actions2load;

#Using groupby to determine the time of event
SELECT DATE_FORMAT(event_time, '%H:%i') as event_day, count(*) as event_count
from actions2load
group by event_day
order by event_day;

#Give me the ReadingOwnedBook everywhere in the actions2load dataset
SELECT * FROM actions2load WHERE event_type = 'ReadingOwnedBook';

#Count all the ReadingOwnedBook in the event type
SELECT count(*) FROM actions2load WHERE event_type = 'ReadingOwnedBook';
 
 #Using groupby to determine the highest and lowest number of event
select event_type, count(event_type) 
from actions2load 
group by event_type
order by count(event_type) desc limit 10;

#Using groupby to determine the number of highest account_id that took part in the event
select account_id, count(account_id) 
from actions2load 
group by account_id
order by count(account_id) desc limit 5;

-- To know the event month and year
SELECT
	YEAR(event_time) AS event_Year,
	MONTH(event_time) AS event_Month
FROM actions2load;

-- To check for the event unique year
select distinct year(event_time) as 'Unique Years' from actions2load;
select distinct date_format(event_time, '%Y') as 'Unique Years' from actions2load;

-- To check for the event unique months
select distinct month(event_time) as 'Unique months' from actions2load;
select distinct date_format(event_time, '%M') as 'Unique months' from actions2load;

-- To check for the event unique weeks
select distinct week(event_time) as 'Unique weeks' from actions2load;
select distinct date_format(event_time, '%W') as 'Unique weeks' from actions2load;

-- To check for the event unique days
select distinct day(event_time) as 'Unique days' from actions2load;
select distinct date_format(event_time, '%D') as 'Unique days' from actions2load;

-- To check for the event unique hours
select distinct hour(event_time) as 'Unique hours' from actions2load;
select distinct date_format(event_time, '%H') as 'Unique hours' from actions2load;

-- To check for the unique event
select distinct(event_type) as 'Unique event' from actions2load;
select distinct count(event_type) as 'Unique event' from actions2load;

# count the distinct/unique account_id 
select distinct account_id from actions2load;
select count(distinct account_id) from actions2load;
select count(account_id) from actions2load;

# count frequecy of each account_id
select distinct account_id, count(*) as frequency
from actions2load group by account_id;

# count frequecy of each event type
select distinct event_type, count(*) as frequency
from actions2load group by event_type;

# count frequecy of each event time
select distinct event_time, count(*) as frequency
from actions2load group by event_time;

# count frequecy of each product id
select distinct product_id, count(*) as frequency
from actions2load group by product_id;

-- Showing the max and min event
select max(event_time) from actions2load;
select min(event_time) from actions2load;
select min(event_type) from actions2load;
select max(event_type) from actions2load;
select max(account_id) from actions2load;
select min(account_id) from actions2load;
