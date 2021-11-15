-- Создание таблиц
create table Groups
(
    group_id int,
    group_no char(5)
);
create table Students
(
    student_id int,
    name       varchar(30),
    group_id   int
);

-- Вставка данных
insert into Groups
    (group_id, group_no)
values (1, 'M3437'),
       (2, 'M3439');
insert into Students
    (student_id, name, group_id)
values (1, 'Ali Alekperov', 1),
       (2, 'Ildar Amirov', 2),
       (3, 'Alexandra Drozdova', 2);

-- Список групп
select group_id, group_no
from Groups;

-- Список студентов
select student_id, name, group_id
from Students;

-- Список студентов и групп
select name, group_no
from Students
         natural join Groups;
select Students.name, Groups.group_no
from Students
         inner join Groups
                    on Students.group_id = Groups.group_id;

-- Добавить. Почему это плохо: дубли, противоречия
insert into Groups (group_id, group_no)
values (1, 'M3438');

-- Удалить противоречия
delete
from Groups
where group_no = 'M3438';

-- Запретить
alter table Groups
    add constraint group_id_unique unique (group_id);

-- Добавить. Почему это плохо: потеря информации, противоречия
update Students
set group_id = 5
where student_id = 1;

-- Удалить противоречия
update Students
set group_id = 1
where student_id = 1;

-- Запретить
alter table Students
    add foreign key (group_id)
        references Groups (group_id);
