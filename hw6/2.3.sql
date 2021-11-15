select S.StudentId, StudentName, G.GroupName
from (
         select S.StudentId, StudentName, S.GroupId
         from Students S,
              Plan P,
              Courses C
         where S.GroupId = P.GroupId
           and P.CourseId = C.CourseId
           and CourseName = :CourseName
             except
         select S.StudentId, StudentName, S.GroupId
         from Students S,
              Marks M,
              Courses C
         where S.StudentId = M.StudentId
           and M.CourseId = C.CourseId
           and CourseName = :CourseName
     ) S,
     Groups G
where S.GroupId = G.GroupId;