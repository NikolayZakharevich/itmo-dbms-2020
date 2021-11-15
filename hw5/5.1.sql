select StudentName, CourseName
from (select distinct CourseName, StudentName
      from Students
               natural join Plan
               natural join Courses) t
