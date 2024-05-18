USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [dbo].[LoadDataFromUpload]    Script Date: 5/17/2024 11:48:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Evnul Hossain>
-- Create date: <05/5/2024>
-- Description:    <To load data from the upload file given to us>
-- =============================================
ALTER PROCEDURE [dbo].[LoadDataFromUpload]
AS
BEGIN
    SET NOCOUNT ON;

    -- Load data into CourseManagement.Course table, avoiding duplicates
    INSERT INTO CourseManagement.Course (CourseCode, CourseName, Credits, InstructorId, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
    SELECT DISTINCT
        [Code] AS CourseCode,
        [Description] AS CourseName,
        CASE 
            WHEN CHARINDEX('(', [Course (hr, crd)]) > 0 AND CHARINDEX(')', [Course (hr, crd)]) > 0
                THEN TRY_CAST(SUBSTRING([Course (hr, crd)], CHARINDEX('(', [Course (hr, crd)]) + 1, CHARINDEX(')', [Course (hr, crd)]) - CHARINDEX('(', [Course (hr, crd)]) - 1) AS DECIMAL(10, 2))
            ELSE 0 -- Set default value for Credits if extraction fails
        END AS Credits,
        HASHBYTES('MD5', [Instructor]) AS InstructorId, -- Assuming numeric InstructorId
        1 AS UserAuthorizationKey,
        GETDATE() AS DateAdded,
        GETDATE() AS DateOfLastUpdate
    FROM [QueensClassSchedule].[Uploadfile].[CurrentSemesterCourseOfferings]
    WHERE [Code] NOT IN (SELECT CourseCode FROM CourseManagement.Course);

    -- Load data into InstructorManagement.Instructor table with valid names
    INSERT INTO InstructorManagement.Instructor (LastName, FirstName, MaxCredits, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
    SELECT DISTINCT
        PARSENAME([Instructor], 1) AS LastName,
        PARSENAME([Instructor], 2) AS FirstName,
        15 AS MaxCredits,
        1 AS UserAuthorizationKey,
        GETDATE() AS DateAdded,
        GETDATE() AS DateOfLastUpdate
    FROM [QueensClassSchedule].[Uploadfile].[CurrentSemesterCourseOfferings]
    WHERE [Instructor] IS NOT NULL 
    AND [Instructor] != ' ' 
    AND LEN(RTRIM(LTRIM([Instructor]))) > 0
    AND LEN(RTRIM(LTRIM(PARSENAME([Instructor], 2)))) > 0;

    -- Load data into LocationManagement.BuildingLocation table
    INSERT INTO LocationManagement.BuildingLocation (BuildingName, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
    SELECT DISTINCT
        [Location] AS BuildingName,
        1 AS UserAuthorizationKey,
        GETDATE() AS DateAdded,
        GETDATE() AS DateOfLastUpdate
    FROM [QueensClassSchedule].[Uploadfile].[CurrentSemesterCourseOfferings]
    WHERE [Location] IS NOT NULL;

    -- Load data into DepartmentManagement.Department table
    INSERT INTO DepartmentManagement.Department (DepartmentName, DepartmentCode, MaxEnrollment, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
    SELECT DISTINCT
        SUBSTRING([Description], 1, CHARINDEX(' - ', [Description]) - 1) AS DepartmentName,
        SUBSTRING([Description], CHARINDEX(' - ', [Description]) + 3, LEN([Description])) AS DepartmentCode,
        100 AS MaxEnrollment,
        1 AS UserAuthorizationKey,
        GETDATE() AS DateAdded,
        GETDATE() AS DateOfLastUpdate
    FROM [QueensClassSchedule].[Uploadfile].[CurrentSemesterCourseOfferings]
    WHERE [Description] LIKE '% - %' AND SUBSTRING([Description], 1, CHARINDEX(' - ', [Description]) - 1) NOT IN (SELECT DepartmentName FROM DepartmentManagement.Department);

    -- Check and insert ModeOfInstruction for 'In-Person', 'Hybrid', and 'Online'
    IF NOT EXISTS (SELECT 1 FROM InstructionManagement.ModeOfInstruction WHERE ModeName = 'In-Person')
    BEGIN
        INSERT INTO InstructionManagement.ModeOfInstruction (ModeName, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
        VALUES ('In-Person', 1, GETDATE(), GETDATE());
    END
    
    IF NOT EXISTS (SELECT 1 FROM InstructionManagement.ModeOfInstruction WHERE ModeName = 'Hybrid')
    BEGIN
        INSERT INTO InstructionManagement.ModeOfInstruction (ModeName, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
        VALUES ('Hybrid', 1, GETDATE(), GETDATE());
    END
    
    IF NOT EXISTS (SELECT 1 FROM InstructionManagement.ModeOfInstruction WHERE ModeName = 'Online')
    BEGIN
        INSERT INTO InstructionManagement.ModeOfInstruction (ModeName, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
        VALUES ('Online', 1, GETDATE(), GETDATE());
    END

	IF NOT EXISTS (SELECT 1 FROM InstructionManagement.ModeOfInstruction WHERE ModeName = 'Web-Enhanced')
    BEGIN
        INSERT INTO InstructionManagement.ModeOfInstruction (ModeName, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
        VALUES ('Web-Enhanced', 1, GETDATE(), GETDATE());
    END
     -- Load data into CourseManagement.Class table with valid CourseId and ModeId
    INSERT INTO CourseManagement.Class (CourseId, Schedule, MaxEnrollment, ModeId, UserAuthorizationKey, DateAdded, DateOfLastUpdate)
    SELECT DISTINCT
        cm.CourseId,
        c.[Time] AS Schedule,
        c.[Limit] AS MaxEnrollment,
        mi.ModeId, -- Insert ModeId from InstructionManagement.ModeOfInstruction
        1 AS UserAuthorizationKey,
        GETDATE() AS DateAdded,
        GETDATE() AS DateOfLastUpdate
    FROM [QueensClassSchedule].[Uploadfile].[CurrentSemesterCourseOfferings] c
    JOIN CourseManagement.Course cm ON cm.CourseCode = c.[Code]
    JOIN InstructionManagement.ModeOfInstruction mi ON mi.ModeName = c.[Mode Of Instruction]
    WHERE EXISTS (SELECT 1 FROM CourseManagement.Course WHERE CourseCode = c.[Code])
	AND mi.ModeId IS NOT NULL; 

    PRINT 'Data loaded successfully into all tables.';
END