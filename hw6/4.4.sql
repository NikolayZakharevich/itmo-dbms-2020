select distinct StudentId
from Students
where StudentId not in (
    select distinct StudentId
    from (select distinct S.StudentId, LecturerCourses.CourseId
          from (select distinct StudentId, GroupId from Students) S,
               (select distinct GroupId, CourseId
                from Plan P,
                     Lecturers L
                where P.LecturerId = L.LecturerId
                  and LecturerName = :LecturerName) LecturerCourses
          where S.GroupId = LecturerCourses.GroupId
              except
          select distinct StudentId, CourseId
          from Marks
         ) StudentsNotEveryCourse
);