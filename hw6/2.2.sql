select S.StudentId, StudentName, GroupName
from (select StudentId, StudentName, GroupId
      from Students
          except
      select S.StudentId, StudentName, S.GroupId
      from Students S,
           Marks M,
           Courses C
      where S.StudentId = M.StudentId
        and M.CourseId = C.CourseId
        and CourseName = :CourseName
     ) S, Groups G
where S.GroupId = G.GroupId