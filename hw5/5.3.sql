select StudentName, CourseName
from (select distinct StudentId, CourseId
      from Students
               natural join Plan
          except
      select distinct StudentId, CourseId
      from Students
               natural join Marks
      where Mark = 4
         or Mark = 5
     ) t
         natural join Students
         natural join Courses