select distinct CourseId, GroupId
from (select distinct CourseId, GroupId
      from (
               select distinct CourseId
               from (
                        select distinct CourseId, StudentId
                        from Students
                                 natural join Marks
                        where Mark >= 3
                    ) q1
           ) piXQ1
               cross join (
          select distinct GroupId
          from (
                   select distinct StudentId, GroupId
                   from Students
               ) S
      ) piZS) lhs except
select distinct CourseId, GroupId
from (
         select distinct CourseId, GroupId
         from (select distinct CourseId, StudentId, GroupId
               from (
                        select distinct CourseId
                        from (
                                 select distinct CourseId, StudentId
                                 from Students
                                          natural join Marks
                                 where Mark >= 3
                             ) Q
                    ) piXQ
                        cross join (
                   select distinct StudentId, GroupId
                   from Students
               ) S except
               select distinct CourseId, StudentId, GroupId
               from (
                        select distinct CourseId, StudentId
                        from Students
                                 natural join Marks
                        where Mark >= 3
                    ) Q
                        natural join (
                   select distinct StudentId, GroupId
                   from Students
               ) S
              ) t1
     ) rhs