select distinct S.StudentId, StudentName, S.GroupId
from Students S,
     Marks M,
     Courses C
where S.StudentId = M.StudentId
  and M.CourseId = C.CourseId
  and Mark = :Mark
  and CourseName = :CourseName