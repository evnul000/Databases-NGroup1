USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [dbo].[sp_TruncateQueensClassTables]    Script Date: 5/17/2024 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Hanlin Wang
-- Procedure: sp_TruncateQueensClassTables
-- Create date: 2024-05-10
-- Description: Truncates all tables related to QueensClassSchedule database
-- =============================================
ALTER PROCEDURE [dbo].[sp_TruncateQueensClassTables]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableName NVARCHAR(255);
    DECLARE @SchemaName NVARCHAR(255);
    DECLARE @ConstraintName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);

    -- Drop foreign key constraints
    DECLARE constraint_cursor CURSOR FOR
    SELECT s.name AS SchemaName, t.name AS TableName, fk.name AS ConstraintName
    FROM sys.foreign_keys fk
    INNER JOIN sys.tables t ON fk.parent_object_id = t.object_id
    INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name IN ('Udt', 'DepartmentManagement', 'InstructorManagement', 'LocationManagement', 'InstructionManagement','CourseManagement');

    OPEN constraint_cursor;
    FETCH NEXT FROM constraint_cursor INTO @SchemaName, @TableName, @ConstraintName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SQL = 'ALTER TABLE ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ' DROP CONSTRAINT ' + QUOTENAME(@ConstraintName) + ';';
        EXEC sp_executesql @SQL;

        FETCH NEXT FROM constraint_cursor INTO @SchemaName, @TableName, @ConstraintName;
    END;

    CLOSE constraint_cursor;
    DEALLOCATE constraint_cursor;

    -- Truncate tables
    DECLARE table_cursor CURSOR FOR
    SELECT s.name AS SchemaName, t.name AS TableName
    FROM sys.tables t
    INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE s.name IN ('Udt', 'DepartmentManagement', 'InstructorManagement', 'LocationManagement', 'InstructionManagement','CourseManagement');

    OPEN table_cursor;
    FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SQL = 'TRUNCATE TABLE ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + ';';
        EXEC sp_executesql @SQL;

        FETCH NEXT FROM table_cursor INTO @SchemaName, @TableName;
    END;

    CLOSE table_cursor;
    DEALLOCATE table_cursor;

    -- Recreate foreign key constraints
    OPEN constraint_cursor;
    FETCH NEXT FROM constraint_cursor INTO @SchemaName, @TableName, @ConstraintName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- The script to create the foreign key constraint needs to be stored or retrieved
        -- Assuming they are stored in another table or known, you need to recreate them here
        -- Example:
        -- SET @SQL = 'ALTER TABLE ' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + 
        -- ' ADD CONSTRAINT ' + QUOTENAME(@ConstraintName) + ' FOREIGN KEY (Column) REFERENCES OtherTable(Column);';
        -- EXEC sp_executesql @SQL;

        FETCH NEXT FROM constraint_cursor INTO @SchemaName, @TableName, @ConstraintName;
    END;

    CLOSE constraint_cursor;
    DEALLOCATE constraint_cursor;

    PRINT 'All QueensClassSchedule related tables truncated successfully.';
END;