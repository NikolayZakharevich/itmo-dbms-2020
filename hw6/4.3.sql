select distinct StudentId
from (select StudentId from Students) StudentMarks
    except
select distinct StudentId
from (select distinct S.StudentId, LecturerCourses.CourseId
      from (select distinct StudentId from Students) S,
           (select distinct CourseId
            from Plan P,
                 Lecturers L
            where P.LecturerId = L.LecturerId
              and LecturerName = :LecturerName) LecturerCourses
          except
      select distinct StudentId, CourseId
      from Marks
     ) StudentsNotEveryCourse