
------- Exploring the data ------

select * 
from Cyclistic_analyst_proyect1..[202101-divvy-tripdata]

SELECT COUNT(ride_id)
FROM Cyclistic_analyst_proyect1..[202102-divvy-tripdata]
WHERE ride_id is not NULL


SELECT * 
from Cyclistic_analyst_proyect1..[202112-divvy-tripdata]


SELECT COUNT(ride_id)
FROM Cyclistic_analyst_proyect1..[202102-divvy-tripdata]
WHERE ride_id is not NULL



SELECT ride_id
FROM Cyclistic_analyst_proyect1..[202101-divvy-tripdata]
WHERE ride_id <> ''


SELECT COUNT(start_station_name)
FROM Cyclistic_analyst_proyect1..[202101-divvy-tripdata]
WHERE start_station_name != ''

SELECT COUNT(start_station_name)
FROM Cyclistic_analyst_proyect1..[202101-divvy-tripdata]
WHERE start_station_name is not NULL

SELECT *
FROM Cyclistic_analyst_proyect1..[202101-divvy-tripdata]
WHERE ride_id = 'E19E6F1B8D4C42ED'

select * 
from Cyclistic_analyst_proyect1..[202101-divvy-tripdata]
WHERE rideable_type = 'electric_bike'


----------------- Adding some columns based on the data we have ------------

--  Casting some columns
--  ride_length from date time to time

--202101
-- creating a new column to cast 'ride_length' to time
ALTER TABLE Cyclistic_analyst_proyect1..[202101-divvy-tripdata] 
ADD ride_length_converted time

-- updating the column with the start date casted
UPDATE Cyclistic_analyst_proyect1..[202101-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202102
ALTER TABLE Cyclistic_analyst_proyect1..[202102-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202102-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202103
ALTER TABLE Cyclistic_analyst_proyect1..[202103-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202103-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202104
ALTER TABLE Cyclistic_analyst_proyect1..[202104-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202104-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202105
ALTER TABLE Cyclistic_analyst_proyect1..[202105-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202105-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202106
ALTER TABLE Cyclistic_analyst_proyect1..[202106-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202106-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202107
ALTER TABLE Cyclistic_analyst_proyect1..[202107-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202107-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202108
ALTER TABLE Cyclistic_analyst_proyect1..[202108-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202108-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202109
ALTER TABLE Cyclistic_analyst_proyect1..[202109-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202109-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202110
ALTER TABLE Cyclistic_analyst_proyect1..[202110-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202110-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202111
ALTER TABLE Cyclistic_analyst_proyect1..[202111-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202111-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



--202112
ALTER TABLE Cyclistic_analyst_proyect1..[202112-divvy-tripdata] 
ADD ride_length_converted time

UPDATE Cyclistic_analyst_proyect1..[202112-divvy-tripdata] 
SET ride_length_converted = CONVERT(time,ride_length)



------- Select data I am going to be using  ------


-- Day of week = 1 - Sunday | 7 - Saturday
SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week
from Cyclistic_analyst_proyect1..[202101-divvy-tripdata]

SELECT member_casual, cast(cast(avg(cast(CAST(ride_length_converted as datetime) as float)) as datetime) as time) AvgTime, day_of_week
FROM Cyclistic_analyst_proyect1..[202101-divvy-tripdata]
ORDER BY day_of_week


-- General average ride time by type of member
SELECT member_casual, cast(cast(avg(cast(CAST(ride_length_converted as datetime) as float)) as datetime) as time) AvgTime
FROM Cyclistic_analyst_proyect1..[202101-divvy-tripdata]
GROUP BY member_casual

-- Average ride time by each day of week and type of member
SELECT member_casual, cast(cast(avg(cast(CAST(ride_length_converted as datetime) as float)) as datetime) as time) AvgTime, day_of_week
FROM Cyclistic_analyst_proyect1..[202101-divvy-tripdata]
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week



---- MERGING ALL THE DATA SETS FROM JANUARY TO DECEMBER 2021 -----


SELECT *
FROM
#temp_year_tripdata


WITH year_tripdata (ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, current_month)
as
(
SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202101-divvy-tripdata]

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202102-divvy-tripdata]

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202103-divvy-tripdata]

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202104-divvy-tripdata] 

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202105-divvy-tripdata] 

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202106-divvy-tripdata] 

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202107-divvy-tripdata] 

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202108-divvy-tripdata] 

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202109-divvy-tripdata] 

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202110-divvy-tripdata] 

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202111-divvy-tripdata] 

UNION ALL

SELECT ride_id, rideable_type, member_casual, ride_length_converted, day_of_week, MONTH(started_at)
FROM
Cyclistic_analyst_proyect1..[202112-divvy-tripdata] 
)
SELECT * INTO #temp_year_tripdata
FROM
year_tripdata

DROP TABLE #temp_year_tripdata




------ These will be the data to create effective data visualizations

-- General average ride time by type of member
SELECT member_casual, cast(cast(avg(cast(CAST(ride_length_converted as datetime) as float)) as datetime) as time) AvgTime
FROM #temp_year_tripdata
GROUP BY member_casual

-- Average ride time by each day of week and type of member
SELECT member_casual, cast(cast(avg(cast(CAST(ride_length_converted as datetime) as float)) as datetime) as time) AvgTime, day_of_week
FROM #temp_year_tripdata
GROUP BY member_casual, day_of_week
ORDER BY member_casual, day_of_week

-- Average ride time by each month and type of member
SELECT member_casual, cast(cast(avg(cast(CAST(ride_length_converted as datetime) as float)) as datetime) as time) AvgTime, current_month
FROM #temp_year_tripdata
GROUP BY member_casual, current_month
ORDER BY member_casual, current_month


-- Getting the count of riders by month
SELECT member_casual, COUNT(member_casual) as members_count, current_month
FROM #temp_year_tripdata
GROUP BY member_casual, current_month
ORDER BY member_casual, current_month

-- Getting the count of each bicycle used by user
SELECT member_casual, rideable_type, COUNT(rideable_type) as ridable_count
FROM #temp_year_tripdata
GROUP BY member_casual, rideable_type
ORDER BY member_casual, rideable_type
