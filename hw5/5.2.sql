select StudentName, CourseName
from (select distinct StudentId, CourseId
      from Students
               natural join Plan
          except
      select distinct StudentId, CourseId
      from Students
               natural join Marks
     ) t
         natural join Students
         natural join Courses