select distinct cast(sum(Mark) as float) / count(coalesce(Mark, 0)) as AvgMark
from Marks
where StudentId = :StudentId;