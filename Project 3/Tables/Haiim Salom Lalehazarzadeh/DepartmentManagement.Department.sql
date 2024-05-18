USE [QueensClassSchedule]
GO

/****** Object:  Table [DepartmentManagement].[Department]    Script Date: 5/17/2024 11:59:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DepartmentManagement].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[DepartmentCode] [nvarchar](20) NOT NULL,
	[MaxEnrollment] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [DepartmentManagement].[Department] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [DepartmentManagement].[Department] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO

ALTER TABLE [DepartmentManagement].[Department]  WITH CHECK ADD CHECK  (([MaxEnrollment]>=(0)))
GO


