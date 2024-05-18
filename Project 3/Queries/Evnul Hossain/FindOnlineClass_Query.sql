-- Find all classes where the course is online 

SELECT DISTINCT
    c.ClassId,
    c.CourseId,
    cr.CourseName,
    c.Schedule,
    c.MaxEnrollment,
    mi.ModeName,
	i.FullName
FROM 
    CourseManagement.Class AS c
JOIN 
    CourseManagement.Course AS cr ON c.CourseId = cr.CourseId
JOIN 
    InstructionManagement.ModeOfInstruction AS mi ON c.ModeId = mi.ModeId
Join InstructorManagement.Instructor as i on cr.InstructorId = i.InstructorId
WHERE 
    c.ModeId = 3; --5 is the id for online classes if you look at the modeofinstruction table