create table Players
(
    PlayerId     serial       not null,
    Login        varchar(32)  not null,
    PasswordHash varchar(127) not null,
    constraint pk_Players primary key (PlayerId)
);

create table Clans
(
    PlayerId     int          not null,
    Login        varchar(32)  not null,
    PasswordHash varchar(127) not null,
    constraint pk_Players primary key (PlayerId)
);


create table university_groups
(
    group_id int        not null,
    name     varchar(8) not null,
    constraint pk_groups primary key (group_id),
    constraint uc_groups_name unique (name)
);

create table students
(
    education_form varchar(16) not null,
    student_id     int         not null,
    group_id       int         not null,
    constraint fk_students_student_id foreign key (student_id)
        references academics (academic_id),
    constraint fk_students_group_id foreign key (group_id)
        references university_groups (group_id),
    constraint pk_students primary key (student_id)
);

create table teachers
(
    teacher_rank varchar(32) not null,
    teacher_id   int         not null,
    constraint fk_teachers_teacher_id foreign key (teacher_id)
        references academics (academic_id),
    constraint pk_teachers primary key (teacher_id)
);

create table subjects
(
    subject_id int,
    name       varchar(64) not null,
    constraint pk_subjects primary key (subject_id)
);

create table courses
(
    semester   int       not null,
    year       int       not null,
    created    timestamp not null default now(),
    subject_id int       not null,
    constraint fk_courses_subject_id foreign key (subject_id)
        references subjects (subject_id),
    constraint pk_courses primary key (semester, year, subject_id)
);

create table course_teachers
(
    semester   int not null,
    year       int not null,
    subject_id int not null,
    teacher_id int not null,
    constraint fk_course_teachers_semester foreign key (semester, year, subject_id)
        references courses (semester, year, subject_id),
    constraint fk_course_teachers_teacher_id foreign key (teacher_id)
        references teachers (teacher_id),
    constraint pk_course_teachers primary key (semester, year, subject_id, teacher_id)
);

create table enrolled_students
(
    student_id   int       not null,
    grade_value  int,
    grade_letter char,
    assessed     timestamp,
    enrolled     timestamp not null default now(),
    semester     int       not null,
    year         int       not null,
    subject_id   int       not null,

    constraint fk_enrolled_students_student_id foreign key (student_id)
        references students (student_id),
    constraint fk_enrolled_students_semester foreign key (semester, year, subject_id)
        references courses (semester, year, subject_id),
    constraint pk_enrolled_students primary key (student_id, semester, year, subject_id)
);

insert into academics (academic_id, first_name, middle_name, second_name)
values (1, 'Николай', 'Сергеевич', 'Захаревич'),
       (2, 'Максим', 'Валерьевич', 'Есмантович'),
       (3, 'Владимир', 'Олегович', 'Байкалов'),
       (4, 'Нурсан', null, 'Валеев'),
       (5, 'Георгий', 'Александрович', 'Корнеев');

insert into university_groups (group_id, name)
values (1, 'M3437'),
       (2, 'M3436'),
       (3, 'Z3443');

insert into students (education_form, student_id, group_id)
values ('budget', 1, 1),
       ('budget', 2, 3),
       ('contract', 3, 2),
       ('budget', 4, 1);

insert into teachers (teacher_rank, teacher_id)
values ('associate professor', 5),
       ('laboratory assistant', 1);

insert into subjects (subject_id, name)
values (1, 'Базы данных'),
       (2, 'Алгоритмы и структуры данных'),
       (3, 'Машинное обучение');

insert into courses (semester, year, subject_id)
values (1, 2020, 1),
       (1, 2020, 2);

insert into course_teachers (semester, year, subject_id, teacher_id)
values (1, 2020, 1, 5),
       (1, 2020, 2, 5);

insert into enrolled_students (student_id, semester, year, subject_id)
values (1, 1, 2020, 1),
       (3, 1, 2020, 1),
       (4, 1, 2020, 1);
