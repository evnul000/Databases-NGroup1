-- FIND THE DURATION OF ALL CLASSES IN HOURS AND MINUTES ALONG SIDE ITS INSTRUCTOR TOO.

SELECT DISTINCT
    c.CourseId,
	co.courseName as [Course Name],
	i.fullname as Instructor,
    -- Convert duration to hours and minutes
    CAST(DATEDIFF(MINUTE,
        CAST(REPLACE(SUBSTRING(c.Schedule, 1, CHARINDEX('-', c.Schedule) - 1), ' ', '') AS TIME),
        CAST(REPLACE(SUBSTRING(c.Schedule, CHARINDEX('-', c.Schedule) + 1, LEN(c.Schedule)), ' ', '') AS TIME)
    ) / 60 AS VARCHAR) + ' hours ' +
    CAST(DATEDIFF(MINUTE,
        CAST(REPLACE(SUBSTRING(c.Schedule, 1, CHARINDEX('-', c.Schedule) - 1), ' ', '') AS TIME),
        CAST(REPLACE(SUBSTRING(c.Schedule, CHARINDEX('-', c.Schedule) + 1, LEN(c.Schedule)), ' ', '') AS TIME)
    ) % 60 AS VARCHAR) + ' minutes' AS Duration
	
  FROM [CourseManagement].[Class] as c
  JOIN CourseManagement.Course AS co ON c.CourseId = co.CourseId
  JOIN InstructorManagement.Instructor as i on i.InstructorId = co.InstructorId