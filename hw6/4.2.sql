select distinct StudentId
from Students
    except
select distinct S.StudentId
from Students S,
     Marks M,
     Plan P,
     Lecturers L
where S.StudentId = M.StudentId
  and S.GroupId = P.GroupId
  and M.CourseId = P.CourseId
  and P.LecturerId = L.LecturerId
  and LecturerName = :LecturerName;