USE [QueensClassSchedule]
GO

/****** Object:  Table [CourseManagement].[Class]    Script Date: 5/17/2024 11:56:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [CourseManagement].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[Schedule] [nvarchar](50) NOT NULL,
	[MaxEnrollment] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
	[ModeId] [int] NULL,
	[Enrollment] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [CourseManagement].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [CourseManagement].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [CourseManagement].[Class]  WITH CHECK ADD CHECK  (([MaxEnrollment]>=(0)))
GO


