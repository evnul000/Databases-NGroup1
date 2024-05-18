USE [QueensClassSchedule]
GO

/****** Object:  Table [Process].[WorkflowSteps]    Script Date: 5/18/2024 12:01:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Process].[WorkflowSteps](
	[WorkFlowStepKey] [int] NOT NULL,
	[WorkFlowStepDescription] [nvarchar](100) NOT NULL,
	[WorkFlowStepTableRowCount] [int] NULL,
	[StartingDateTime] [datetime2](7) NULL,
	[EndingDateTime] [datetime2](7) NULL,
	[ClassTime] [char](5) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkFlowStepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT ((0)) FOR [WorkFlowStepTableRowCount]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [StartingDateTime]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [EndingDateTime]
GO

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT ('09:15') FOR [ClassTime]
GO


