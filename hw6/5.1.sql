select distinct GroupId, CourseId
from (select distinct CourseId from Courses) t1,
     (select distinct GroupId from Groups) t2
    except
select distinct GroupId, CourseId
from (select distinct CourseId, StudentId, GroupId
      from (select distinct CourseId from Courses) t3,
           (select distinct StudentId, GroupId from Students) t4
          except
      select distinct CourseId, StudentId, GroupId
      from Marks,
           Groups
      where Mark >= 3) t5;