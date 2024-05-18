USE [QueensClassSchedule]
GO

/****** Object:  Table [LocationManagement].[RoomLocation]    Script Date: 5/18/2024 12:01:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [LocationManagement].[RoomLocation](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NULL,
	[RoomNumber] [nvarchar](20) NOT NULL,
	[Capacity] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [LocationManagement].[RoomLocation] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [LocationManagement].[RoomLocation] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [LocationManagement].[RoomLocation]  WITH CHECK ADD CHECK  (([Capacity]>=(0)))
GO


