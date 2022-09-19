USE [Project]
GO
--Create new table BikeTrip
CREATE TABLE Bike (
	[ride_id] [nvarchar](255) ,
	[rideable_type] [nvarchar](255) ,
	[started_at] [datetime] ,
	[ended_at] [datetime] ,
	[ride_length] [datetime] ,
	[day_of_week] [nvarchar](255),
	[start_station_name] [nvarchar](255) ,
	[start_station_id] [nvarchar](max) ,
	[end_station_name] [nvarchar](255) ,
	[end_station_id] [nvarchar](max) ,
	[start_lat] [float] ,
	[start_lng] [float] ,
	[end_lat] [float] ,
	[end_lng] [float],
	[member_casual] [nvarchar](255) 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--Insert all different table into BikeTrip
Insert into [Bike] Select * From [202107]
Insert into [Bike] Select * From [202108]
Insert into [Bike] Select * From [202109]
Insert into [Bike] Select * From [202110]
Insert into [Bike] Select * From [202111]
Insert into [Bike] Select * From [202112]
Insert into [Bike] Select * From [202201]
Insert into [Bike] Select * From [202202]
Insert into [Bike] Select * From [202203]
Insert into [Bike] Select * From [202204]
Insert into [Bike] Select * From [202205]
Insert into [Bike] Select * From [202206];

--Remove Null Values from station name
SELECT 
       [rideable_type]
      ,[ride_length]
      ,[day_of_week]
      ,[start_station_name]
      ,[start_station_id] as Station_id
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat] as Lat
      ,[start_lng] as Lng
      ,[member_casual],DATENAME(mm, [started_at]) as month --Create new column month
  FROM [Project].[dbo].Bike
  where [start_station_name] is not null and [end_station_name] is not null and start_station_id is not null 
  


