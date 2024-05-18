USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [Process].[usp_TrackWorkFlow]    Script Date: 5/17/2024 11:54:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Evnul Hossain>
-- Create date: <05/5/2024>
-- Description:    <To show track each WorkFlowStep within the database when processing>
-- =============================================
-- Create the usp_TrackWorkFlow stored procedure
ALTER PROCEDURE [Process].[usp_TrackWorkFlow]
    @StartTime DATETIME2,
    @WorkFlowDescription NVARCHAR(100),
    @WorkFlowStepTableRowCount INT,
    @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert tracking data into the WorkflowSteps table
    INSERT INTO Process.WorkflowSteps (WorkFlowStepKey, WorkFlowStepDescription, WorkFlowStepTableRowCount, StartingDateTime, UserAuthorizationKey)
    VALUES (
        (SELECT ISNULL(MAX(WorkFlowStepKey), 0) + 1 FROM Process.WorkflowSteps),
        @WorkFlowDescription,
        @WorkFlowStepTableRowCount,
        @StartTime,
        @UserAuthorizationKey
    );

    PRINT 'Workflow step tracked successfully.';
END;
