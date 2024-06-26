USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddForeignKey]    Script Date: 5/17/2024 11:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Haiim Lalehzarzadeh
-- Procedure: sp_AddForeignKey
-- Create date: 2024-05-15
-- Description: Adds a foreign key constraint to a table
-- =============================================
ALTER PROCEDURE [dbo].[sp_AddForeignKey]
    @ForeignKeyName NVARCHAR(50),
    @TableName NVARCHAR(50),
    @ColumnName NVARCHAR(50),
    @ReferencedTableName NVARCHAR(50),
    @ReferencedColumnName NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = 'ALTER TABLE ' + QUOTENAME(@TableName) + 
               ' ADD CONSTRAINT ' + QUOTENAME(@ForeignKeyName) +
               ' FOREIGN KEY (' + QUOTENAME(@ColumnName) + ')' +
               ' REFERENCES ' + QUOTENAME(@ReferencedTableName) +
               ' (' + QUOTENAME(@ReferencedColumnName) + ');';

    EXEC sp_executesql @SQL;

    PRINT 'Foreign key ' + @ForeignKeyName + ' added successfully.';
END;
