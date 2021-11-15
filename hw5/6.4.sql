select StudentId
from (
         select distinct StudentId, GroupId GroupId1
         from (select distinct StudentId, GroupId
               from (select distinct StudentId from (select distinct StudentId, CourseId from Marks) q1) pixq1
                        cross join (select distinct GroupId
                                    from (select distinct CourseId, GroupId
                                          from Lecturers
                                                   natural join Plan
                                          where LecturerName = :LecturerName) s1) pizs) lhs except
         select distinct StudentId, GroupId GroupId1
         from (select distinct StudentId, GroupId
               from (select distinct StudentId, CourseId, GroupId
                     from (select distinct StudentId from (select distinct StudentId, CourseId from Marks) q2) pixq2
                              cross join (select distinct CourseId, GroupId
                                          from Lecturers
                                                   natural join Plan
                                          where LecturerName = :LecturerName) s2 except
                     select distinct StudentId, CourseId, GroupId
                     from (select distinct StudentId, CourseId from Marks) q3
                              natural join (select distinct CourseId, GroupId
                                            from Lecturers
                                                     natural join Plan
                                            where LecturerName = :LecturerName) s3) t1) rhs
     ) kek
         natural join Students
where GroupId1 = GroupId;