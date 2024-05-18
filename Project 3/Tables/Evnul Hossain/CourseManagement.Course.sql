USE [QueensClassSchedule]
GO

/****** Object:  Table [CourseManagement].[Course]    Script Date: 5/17/2024 11:58:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [CourseManagement].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](20) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
	[InstructorId] [int] NULL,
	[Credits] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [CourseManagement].[Course] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [CourseManagement].[Course] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [CourseManagement].[Course]  WITH CHECK ADD CHECK  (([Credits]>=(0)))
GO

ALTER TABLE [CourseManagement].[Course]  WITH CHECK ADD CHECK  (([Credits]>=(0)))
GO


