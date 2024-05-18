USE [QueensClassSchedule]
GO

/****** Object:  Table [InstructorManagement].[Instructor]    Script Date: 5/18/2024 12:00:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [InstructorManagement].[Instructor](
	[InstructorId] [int] IDENTITY(1,1) NOT NULL,
	[MaxCredits] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
	[FullName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (NULL) FOR [FullName]
GO

ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (NULL) FOR [FirstName]
GO

ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (NULL) FOR [LastName]
GO

ALTER TABLE [InstructorManagement].[Instructor]  WITH CHECK ADD CHECK  (([MaxCredits]>=(0)))
GO


