select distinct StudentId
from Marks
where Studentid not in (
    select Studentid
    from (select Studentid, CourseId
          from (select CourseId
                from Lecturers
                         natural join Plan
                where LecturerName = :LecturerName) t1
                   cross join
               (select distinct StudentId
                from Marks) t2
              EXCEPT
          select StudentId, CourseId
          from Marks
         ) t3
);


