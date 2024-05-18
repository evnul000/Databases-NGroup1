USE [QueensClassSchedule]
GO

/****** Object:  Table [LocationManagement].[BuildingLocation]    Script Date: 5/18/2024 12:01:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [LocationManagement].[BuildingLocation](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](100) NOT NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [LocationManagement].[BuildingLocation] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [LocationManagement].[BuildingLocation] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO


