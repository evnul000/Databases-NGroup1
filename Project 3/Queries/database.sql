USE [master]
GO
/****** Object:  Database [QueensClassSchedule]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE DATABASE [QueensClassSchedule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QC2019', FILENAME = N'/var/opt/mssql/data/QueensClassScheduleCurrentSemester.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QC2019_log', FILENAME = N'/var/opt/mssql/data/QueensClassScheduleCurrentSemester_0.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QueensClassSchedule] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QueensClassSchedule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QueensClassSchedule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ARITHABORT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QueensClassSchedule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QueensClassSchedule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QueensClassSchedule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QueensClassSchedule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET RECOVERY FULL 
GO
ALTER DATABASE [QueensClassSchedule] SET  MULTI_USER 
GO
ALTER DATABASE [QueensClassSchedule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QueensClassSchedule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QueensClassSchedule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QueensClassSchedule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QueensClassSchedule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QueensClassSchedule] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QueensClassSchedule', N'ON'
GO
ALTER DATABASE [QueensClassSchedule] SET QUERY_STORE = OFF
GO
USE [QueensClassSchedule]
GO
/****** Object:  User [student]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE USER [student] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [EC3\thehitman]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE USER [EC3\thehitman] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BiStudent]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE USER [BiStudent] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [student]
GO
ALTER ROLE [db_owner] ADD MEMBER [EC3\thehitman]
GO
ALTER ROLE [db_datareader] ADD MEMBER [BiStudent]
GO
/****** Object:  Schema [CourseManagement]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [CourseManagement]
GO
/****** Object:  Schema [DbSecurity]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [DbSecurity]
GO
/****** Object:  Schema [DepartmentManagement]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [DepartmentManagement]
GO
/****** Object:  Schema [GroupNameProject3]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [GroupNameProject3]
GO
/****** Object:  Schema [InstructionManagement]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [InstructionManagement]
GO
/****** Object:  Schema [InstructorManagement]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [InstructorManagement]
GO
/****** Object:  Schema [LocationManagement]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [LocationManagement]
GO
/****** Object:  Schema [Process]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [Process]
GO
/****** Object:  Schema [Udt]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [Udt]
GO
/****** Object:  Schema [Uploadfile]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [Uploadfile]
GO
/****** Object:  Schema [Utils]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [Utils]
GO
/****** Object:  Schema [YourLastName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE SCHEMA [YourLastName]
GO
/****** Object:  UserDefinedDataType [Udt].[BuildingName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[BuildingName] FROM [nvarchar](100) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[ClassTime]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[ClassTime] FROM [nchar](5) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[CourseCode]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[CourseCode] FROM [nvarchar](20) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[CourseName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[CourseName] FROM [nvarchar](100) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[DateAdded]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[DateAdded] FROM [datetime] NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[DateOfLastUpdate]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[DateOfLastUpdate] FROM [datetime] NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[DepartmentCode]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[DepartmentCode] FROM [nvarchar](20) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[DepartmentName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[DepartmentName] FROM [nvarchar](100) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[FirstName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[FirstName] FROM [nvarchar](20) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[FullName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[FullName] FROM [nvarchar](100) NULL
GO
/****** Object:  UserDefinedDataType [Udt].[GroupName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[GroupName] FROM [nvarchar](20) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[IndividualProject]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[IndividualProject] FROM [nvarchar](60) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[LastName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[LastName] FROM [nvarchar](35) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[NodeName]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[NodeName] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[OldSurrogateKeyInt]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[OldSurrogateKeyInt] FROM [int] NULL
GO
/****** Object:  UserDefinedDataType [Udt].[RoomNumber]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[RoomNumber] FROM [nvarchar](20) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[Schedule]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[Schedule] FROM [nvarchar](50) NOT NULL
GO
/****** Object:  UserDefinedDataType [Udt].[SurrogateKeyInt]    Script Date: 5/17/2024 9:35:43 PM ******/
CREATE TYPE [Udt].[SurrogateKeyInt] FROM [int] NULL
GO
/****** Object:  UserDefinedFunction [dbo].[JSONHierarchy]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[JSONHierarchy]
(
    @JSONData varchar(max)
  , @Parent_object_ID int = null
  , @MaxObject_id int = 0
  , @type int = null
)
returns @ReturnTable table
(											  
	-- https://www.red-gate.com/simple-talk/blogs/consuming-hierarchical-json-documents-sql-server-using-openjson/?utm_source=simpletalk&utm_medium=pubemail&utm_content=20171010-slota1&utm_term=simpletalkmain 
	--
    Element_ID int identity(1, 1) primary key /* internal surrogate primary key gives the order of parsing and the list order */
  , SequenceNo int null                       /* the sequence number in a list */
  , Parent_ID int                             /* if the element has a parent then it is in this column. The document is the ultimate parent, so you can get the structure from recursing from the document */
  , Object_ID int                             /* each list or object has an object id. This ties all elements to a parent. Lists are treated as objects here */
  , Name nvarchar(2000)                       /* the name of the object */
  , StringValue nvarchar(max) not null        /*the string representation of the value of the element. */
  , ValueType varchar(10) not null            /* the declared type of the value represented as a string in StringValue*/
)
as
begin
    --the types of JSON
    declare @null    int = 0
          , @string  int = 1
          , @int     int = 2
          , @boolean int = 3
          , @array   int = 4
          , @object  int = 5;

    declare @OpenJSONData table
    (
        sequence int identity(1, 1)
      , [key] varchar(200)
      , Value varchar(max)
      , type int
    );

    declare @key       varchar(200)
          , @Value     varchar(max)
          , @Thetype   int
          , @ii        int
          , @iiMax     int
          , @NewObject int
          , @firstchar char(1);

    insert into @OpenJSONData
    (
        [key]
      , Value
      , type
    )
    select [Key]
         , Value
         , Type
    from openjson(@JSONData);
    select @ii    = 1
         , @iiMax = scope_identity();
    select @firstchar
        = --the first character to see if it is an object or an array
        substring(
                     @JSONData
                   , patindex(
                                 '%[^' + char(0) + '- ' + char(160) + ']%'
                               , ' ' + @JSONData + '!' collate SQL_Latin1_General_CP850_BIN
                             ) - 1
                   , 1
                 );
    if @type is null
       and @firstchar in ( '[', '{' )
    begin
        insert into @ReturnTable
        (
            SequenceNo
          , Parent_ID
          , Object_ID
          , Name
          , StringValue
          , ValueType
        )
        select 1
             , null
             , 1
             , '-'
             , ''
             , case @firstchar
                   when '[' then
                       'array'
                   else
                       'object'
               end;
        select @type             = case @firstchar
                                       when '[' then
                                           @array
                                       else
                                           @object
                                   end
             , @Parent_object_ID = 1
             , @MaxObject_id     = coalesce(@MaxObject_id, 1) + 1;
    end;
    while (@ii <= @iiMax)
    begin
        --OpenJSON renames list items with 0-nn which confuses the consumers of the table
        select @key     = case
                              when [key] like '[0-9]%' then
                                  null
                              else
                                  [key]
                          end
             , @Value   = Value
             , @Thetype = type
        from @OpenJSONData
        where sequence = @ii;

        if @Thetype in ( @array, @object ) --if we have been returned an array or object
        begin
            select @MaxObject_id = coalesce(@MaxObject_id, 1) + 1;
            --just in case we have an object or array returned
            insert into @ReturnTable --record the object itself
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , Name
              , StringValue
              , ValueType
            )
            select @ii
                 , @Parent_object_ID
                 , @MaxObject_id
                 , @key
                 , ''
                 , case @Thetype
                       when @array then
                           'array'
                       else
                           'object'
                   end;

            insert into @ReturnTable --and return all its children
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , [Name]
              , StringValue
              , ValueType
            )
            select SequenceNo
                 , Parent_ID
                 , Object_ID
                 , [Name]
                 , StringValue
                 , ValueType
            from dbo.JSONHierarchy(@Value, @MaxObject_id, @MaxObject_id, @type);
            select @MaxObject_id = max(Object_ID) + 1
            from @ReturnTable;
        end;
        else
            insert into @ReturnTable
            (
                SequenceNo
              , Parent_ID
              , Object_ID
              , Name
              , StringValue
              , ValueType
            )
            select @ii
                 , @Parent_object_ID
                 , null
                 , @key
                 , @Value
                 , case @Thetype
                       when @string then
                           'string'
                       when @null then
                           'null'
                       when @int then
                           'int'
                       when @boolean then
                           'boolean'
                       else
                           'int'
                   end;

        select @ii = @ii + 1;
    end;

    return;
end;
GO
/****** Object:  UserDefinedFunction [dbo].[DatabaseObjects]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[DatabaseObjects]
/**
    Summary: >
      lists out the full names, schemas and (where appropriate)
      the owner of the object.
    Author: PhilFactor
    Date: 10/9/2017
    Examples:
       - Select * from dbo.DatabaseObjects('2123154609,960722475,1024722703')
    Returns: >
      A table with the id, name of object and so on.
            **/
(
    @ListOfObjectIDs varchar(max)
)
returns table
--WITH ENCRYPTION|SCHEMABINDING, ..
as
return
(
    select object_id
         , schema_name(schema_id) + '.' + coalesce(object_name(parent_object_id) + '.', '') + name as name
    from sys.objects as ob
        inner join openjson(N'[' + @ListOfObjectIDs + N']')
            on convert(int, Value) = ob.object_id
);
GO
/****** Object:  View [Utils].[uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Utils].[uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint] AS
SELECT  CONCAT(tbl.TABLE_SCHEMA, '.', tbl.TABLE_NAME) AS FullyQualifiedTableName ,
        tbl.TABLE_SCHEMA AS SchemaName ,
        tbl.TABLE_NAME AS TableName ,
        col.COLUMN_NAME AS ColumnName ,
        col.ORDINAL_POSITION AS OrdinalPosition,
        CONCAT(col.DOMAIN_SCHEMA, '.', col.DOMAIN_NAME) AS FullyQualifiedDomainName ,
        col.DOMAIN_NAME AS DomainName ,
        CASE 
			 WHEN col.DATA_TYPE = 'varchar'
             THEN CONCAT('varchar(', CHARACTER_MAXIMUM_LENGTH, ')')
			 WHEN col.DATA_TYPE = 'nvarchar'
             THEN CONCAT('nvarchar(', CHARACTER_MAXIMUM_LENGTH, ')')
			 WHEN col.DATA_TYPE = 'nchar'
             THEN CONCAT('nchar(', CHARACTER_MAXIMUM_LENGTH, ')')
             WHEN col.DATA_TYPE = 'numeric'
             THEN CONCAT('numeric(', NUMERIC_PRECISION_RADIX, ', ',
                         NUMERIC_SCALE, ')')
             WHEN col.DATA_TYPE = 'decimal'
             THEN CONCAT('decimal(', NUMERIC_PRECISION_RADIX, ', ',
                         NUMERIC_SCALE, ')')
             ELSE col.DATA_TYPE
        END AS DataType ,
        col.IS_NULLABLE AS IsNullable,
        dcn.DefaultName ,
        col.COLUMN_DEFAULT AS DefaultNameDefinition ,
        cc.CONSTRAINT_NAME AS CheckConstraintRuleName,
        cc.CHECK_CLAUSE  AS CheckConstraintRuleNameDefinition
FROM    ( SELECT    TABLE_CATALOG ,
                    TABLE_SCHEMA ,
                    TABLE_NAME ,
                    TABLE_TYPE
          FROM      INFORMATION_SCHEMA.TABLES
          WHERE     ( TABLE_TYPE = 'BASE TABLE' )
        ) AS tbl
        INNER JOIN ( SELECT TABLE_CATALOG ,
                            TABLE_SCHEMA ,
                            TABLE_NAME ,
                            COLUMN_NAME ,
                            ORDINAL_POSITION ,
                            COLUMN_DEFAULT ,
                            IS_NULLABLE ,
                            DATA_TYPE ,
                            CHARACTER_MAXIMUM_LENGTH ,
                            CHARACTER_OCTET_LENGTH ,
                            NUMERIC_PRECISION ,
                            NUMERIC_PRECISION_RADIX ,
                            NUMERIC_SCALE ,
                            DATETIME_PRECISION ,
                            CHARACTER_SET_CATALOG ,
                            CHARACTER_SET_SCHEMA ,
                            CHARACTER_SET_NAME ,
                            COLLATION_CATALOG ,
                            COLLATION_SCHEMA ,
                            COLLATION_NAME ,
                            DOMAIN_CATALOG ,
                            DOMAIN_SCHEMA ,
                            DOMAIN_NAME
                     FROM   INFORMATION_SCHEMA.COLUMNS
                   ) AS col ON col.TABLE_CATALOG = tbl.TABLE_CATALOG
                               AND col.TABLE_SCHEMA = tbl.TABLE_SCHEMA
                               AND col.TABLE_NAME = tbl.TABLE_NAME
        LEFT OUTER JOIN ( SELECT    t.name AS TableName ,
                                    SCHEMA_NAME(s.schema_id) AS SchemaName ,
                                    ac.name AS ColumnName ,
                                    d.name AS DefaultName
                          FROM      sys.all_columns AS ac
                                    INNER JOIN sys.tables AS t ON ac.object_id = t.object_id
                                    INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
                                    INNER JOIN sys.default_constraints AS d ON ac.default_object_id = d.object_id
                        ) AS dcn ON dcn.SchemaName = tbl.TABLE_SCHEMA
                                    AND dcn.TableName = tbl.TABLE_NAME
                                    AND dcn.ColumnName = col.COLUMN_NAME
        LEFT OUTER JOIN ( SELECT    cu.TABLE_CATALOG ,
                                    cu.TABLE_SCHEMA ,
                                    cu.TABLE_NAME ,
                                    cu.COLUMN_NAME ,
                                    c.CONSTRAINT_CATALOG ,
                                    c.CONSTRAINT_SCHEMA ,
                                    c.CONSTRAINT_NAME ,
                                    c.CHECK_CLAUSE
                          FROM      INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
                                    AS cu
                                    INNER JOIN INFORMATION_SCHEMA.CHECK_CONSTRAINTS
                                    AS c ON c.CONSTRAINT_NAME = cu.CONSTRAINT_NAME
                        ) AS cc ON cc.TABLE_SCHEMA = tbl.TABLE_SCHEMA
                                   AND cc.TABLE_NAME = tbl.TABLE_NAME
                                   AND cc.COLUMN_NAME = col.COLUMN_NAME


GO
/****** Object:  Table [CourseManagement].[Class]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseManagement].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NULL,
	[Schedule] [nvarchar](50) NOT NULL,
	[MaxEnrollment] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
	[ModeId] [int] NULL,
	[Enrollment] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CourseManagement].[Course]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseManagement].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](20) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
	[InstructorId] [int] NULL,
	[Credits] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DbSecurity].[UserAuthorization]    Script Date: 5/17/2024 9:35:43 PM ******/
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
/****** Object:  Table [DepartmentManagement].[Department]    Script Date: 5/17/2024 9:35:43 PM ******/
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
/****** Object:  Table [InstructionManagement].[ModeOfInstruction]    Script Date: 5/17/2024 9:35:43 PM ******/
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
/****** Object:  Table [InstructorManagement].[Instructor]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [InstructorManagement].[Instructor](
	[InstructorId] [int] IDENTITY(1,1) NOT NULL,
	[MaxCredits] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
	[FullName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [LocationManagement].[BuildingLocation]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LocationManagement].[BuildingLocation](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](100) NOT NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [LocationManagement].[RoomLocation]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LocationManagement].[RoomLocation](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NULL,
	[RoomNumber] [nvarchar](20) NOT NULL,
	[Capacity] [int] NULL,
	[UserAuthorizationKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[DateAdded] [Udt].[DateAdded] NOT NULL,
	[DateOfLastUpdate] [Udt].[DateOfLastUpdate] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Process].[WorkflowSteps]    Script Date: 5/17/2024 9:35:43 PM ******/
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
/****** Object:  Table [Uploadfile].[CurrentSemesterCourseOfferings]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Uploadfile].[CurrentSemesterCourseOfferings](
	[Semester] [varchar](50) NULL,
	[Sec] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Course (hr, crd)] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Day] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Instructor] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Enrolled] [varchar](50) NULL,
	[Limit] [varchar](50) NULL,
	[Mode of Instruction] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [CourseManagement].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [CourseManagement].[Class] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [CourseManagement].[Course] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [CourseManagement].[Course] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('09:15') FOR [ClassTime]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('PROJECT 3') FOR [IndividualProject]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('Group #') FOR [GroupName]
GO
ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [DepartmentManagement].[Department] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [DepartmentManagement].[Department] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [InstructionManagement].[ModeOfInstruction] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [InstructionManagement].[ModeOfInstruction] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (NULL) FOR [FullName]
GO
ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (NULL) FOR [FirstName]
GO
ALTER TABLE [InstructorManagement].[Instructor] ADD  DEFAULT (NULL) FOR [LastName]
GO
ALTER TABLE [LocationManagement].[BuildingLocation] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [LocationManagement].[BuildingLocation] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [LocationManagement].[RoomLocation] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]
GO
ALTER TABLE [LocationManagement].[RoomLocation] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]
GO
ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT ((0)) FOR [WorkFlowStepTableRowCount]
GO
ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [StartingDateTime]
GO
ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [EndingDateTime]
GO
ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT ('09:15') FOR [ClassTime]
GO
ALTER TABLE [Uploadfile].[CurrentSemesterCourseOfferings] ADD  CONSTRAINT [DF_CurrentSemesterCourseOfferings_Semester]  DEFAULT ('Current Semester') FOR [Semester]
GO
ALTER TABLE [CourseManagement].[Class]  WITH CHECK ADD CHECK  (([MaxEnrollment]>=(0)))
GO
ALTER TABLE [CourseManagement].[Course]  WITH CHECK ADD CHECK  (([Credits]>=(0)))
GO
ALTER TABLE [CourseManagement].[Course]  WITH CHECK ADD CHECK  (([Credits]>=(0)))
GO
ALTER TABLE [DepartmentManagement].[Department]  WITH CHECK ADD CHECK  (([MaxEnrollment]>=(0)))
GO
ALTER TABLE [InstructorManagement].[Instructor]  WITH CHECK ADD CHECK  (([MaxCredits]>=(0)))
GO
ALTER TABLE [LocationManagement].[RoomLocation]  WITH CHECK ADD CHECK  (([Capacity]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[LoadDataFromUpload]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Evnul Hossain>
-- Create date: <05/5/2024>
-- Description:    <To load data from the upload file given to us>
-- =============================================
CREATE PROCEDURE [dbo].[LoadDataFromUpload]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_AddForeignKey]    Script Date: 5/17/2024 9:35:43 PM ******/
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
CREATE PROCEDURE [dbo].[sp_AddForeignKey]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DropForeignKey]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Haiim Lalehzarzadeh>
-- Create date: <05/5/2024>
-- Description:    <To drop foreign keys from tables>
-- =============================================
    CREATE PROCEDURE [dbo].[sp_DropForeignKey]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_TruncateQueensClassTables]    Script Date: 5/17/2024 9:35:43 PM ******/
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
CREATE PROCEDURE [dbo].[sp_TruncateQueensClassTables]
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
GO
/****** Object:  StoredProcedure [Process].[usp_ShowWorkflowSteps]    Script Date: 5/17/2024 9:35:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Evnul Hossain>
-- Create date: <05/5/2024>
-- Description:    <To show each WorkFlowStep Process>
-- =============================================
CREATE PROCEDURE [Process].[usp_ShowWorkflowSteps] 
AS
BEGIN
    -- For no additional results we do "SET NOCOUNT ON" 
    SET NOCOUNT ON;
    SELECT *
    FROM [Process].[WorkFlowSteps];
END
GO
/****** Object:  StoredProcedure [Process].[usp_TrackWorkFlow]    Script Date: 5/17/2024 9:35:43 PM ******/
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
CREATE PROCEDURE [Process].[usp_TrackWorkFlow]
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
GO
USE [master]
GO
ALTER DATABASE [QueensClassSchedule] SET  READ_WRITE 
GO
