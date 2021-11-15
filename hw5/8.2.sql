select StudentName, AvgMark
from (
         select S.StudentId, cast(sum(Mark) as float) / count(*) as AvgMark
         from Students S
                  left join Marks M on S.StudentId = M.StudentId
         group by StudentId
     ) t
         natural join Students