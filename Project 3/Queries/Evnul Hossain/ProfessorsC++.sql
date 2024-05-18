-- Find all professors that teaches C++ including the Schedule

SELECT DISTINCT
    c.CourseName,
    I.LastName,
    I.FirstName,
	cl.Schedule
FROM
    InstructorManagement.Instructor AS I
JOIN
    CourseManagement.Course AS C ON I.InstructorID = C.InstructorID
Join CourseManagement.Class as cl on cl.CourseId = c.CourseId
WHERE
    C.CourseName LIKE '%C++%';
