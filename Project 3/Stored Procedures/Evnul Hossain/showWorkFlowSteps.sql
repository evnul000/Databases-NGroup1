USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [Process].[usp_ShowWorkflowSteps]    Script Date: 5/17/2024 11:54:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Evnul Hossain>
-- Create date: <05/5/2024>
-- Description:    <To show each WorkFlowStep Process>
-- =============================================
ALTER PROCEDURE [Process].[usp_ShowWorkflowSteps] 
AS
BEGIN
    -- For no additional results we do "SET NOCOUNT ON" 
    SET NOCOUNT ON;
    SELECT *
    FROM [Process].[WorkFlowSteps];
END