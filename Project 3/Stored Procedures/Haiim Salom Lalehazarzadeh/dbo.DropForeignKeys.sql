USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [dbo].[sp_DropForeignKey]    Script Date: 5/17/2024 11:53:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Haiim Lalehzarzadeh>
-- Create date: <05/5/2024>
-- Description:    <To drop foreign keys from tables>
-- =============================================
    ALTER PROCEDURE [dbo].[sp_DropForeignKey]
        @ForeignKeyName NVARCHAR(50),
        @TableName NVARCHAR(50)
    AS
    BEGIN
        SET NOCOUNT ON;

        IF EXISTS (
            SELECT 1
            FROM sys.foreign_keys
            WHERE name = @ForeignKeyName
            AND parent_object_id = OBJECT_ID(@TableName)
        )
        BEGIN
            DECLARE @SQL NVARCHAR(MAX);
            SET @SQL = 'ALTER TABLE ' + QUOTENAME(@TableName) + 
                       ' DROP CONSTRAINT ' + QUOTENAME(@ForeignKeyName);

            EXEC sp_executesql @SQL;

            PRINT 'Foreign key ' + @ForeignKeyName + ' dropped successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Foreign key ' + @ForeignKeyName + ' does not exist on ' + @TableName + '.';
        END
    END;