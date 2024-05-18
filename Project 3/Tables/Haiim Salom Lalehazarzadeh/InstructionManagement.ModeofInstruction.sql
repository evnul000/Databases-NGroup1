USE [QueensClassSchedule]
GO

/****** Object:  Table [InstructionManagement].[ModeOfInstruction]    Script Date: 5/17/2024 11:59:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [InstructionManagement].[ModeOfInstruction](
	[ModeId] [int] IDENTITY(1,1) NOT NULL,
	[ModeName] [nvarchar](50) NOT NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ModeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [InstructionManagement].[ModeOfInstruction] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO

ALTER TABLE [InstructionManagement].[ModeOfInstruction] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO


