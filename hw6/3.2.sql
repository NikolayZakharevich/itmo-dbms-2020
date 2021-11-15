select StudentName, CourseName
from (
         select StudentId, CourseId
         from Students S,
              Plan P
         where S.GroupId = P.GroupId
         union
         select StudentId, CourseId
         from Marks
     ) SC,
     Students,
     Courses
where SC.StudentId = Students.StudentId
  and SC.CourseId = Courses.CourseId;



