select StudentId, CourseId
from Students S,
     Plan P
where S.GroupId = P.GroupId
union
select StudentId, CourseId
from Marks;


select ((1, 2), (1, 3))
union
select ((1, 4), (1, 2));