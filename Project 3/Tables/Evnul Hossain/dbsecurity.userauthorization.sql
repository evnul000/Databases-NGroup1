USE [QueensClassSchedule]
GO

/****** Object:  Table [DbSecurity].[UserAuthorization]    Script Date: 5/17/2024 11:58:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DbSecurity].[UserAuthorization](
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[ClassTime] [Udt].[ClassTime] NULL,
	[IndividualProject] [Udt].[IndividualProject] NULL,
	[GroupMemberLastName] [Udt].[LastName] NOT NULL,
	[GroupMemberFirstName] [Udt].[FirstName] NOT NULL,
	[GroupName] [Udt].[GroupName] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAuthorizationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('09:15') FOR [ClassTime]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('PROJECT 3') FOR [IndividualProject]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('Group #') FOR [GroupName]
GO

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO


