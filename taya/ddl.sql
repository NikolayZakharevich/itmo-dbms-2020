create table Gambler
(
    gambler_id int         not null primary key,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    cash       numeric     not null check ( cash >= 0 )
);

create table Online_Gambler
(
    gambler_id int         not null primary key references Gambler (gambler_id),
    email      varchar(50) not null unique,
    rating     int         null
);

create table Offline_Gambler
(
    gambler_id int         not null primary key references Gambler (gambler_id),
    passport   varchar(10) not null unique
);

create table Tables
(
    table_id  int not null primary key,
    seats     int not null check ( seats > 0 ),
    big_blind int not null check ( big_blind > 0 )
);

create table Online_Table
(
    table_id   int not null primary key references Tables (table_id),
    gambler_id int not null
);

create table Online_Gambler_Table
(
    gambler_id int not null primary key references Online_Gambler (gambler_id),
    table_id   int not null references Online_Table (table_id),
    constraint unique_online_gambler_table_gambler_id_table_id unique (gambler_id, table_id)
);

alter table Online_Table
    add constraint fk_online_table_online_gambler_table
        foreign key (table_id, gambler_id)
    references Online_Gambler_Table (table_id, gambler_id);

create table Offline_Table
(
    table_id   int not null primary key references Tables (table_id),
    gambler_id int not null
);

create table Offline_Gambler_Table
(
    gambler_id int not null primary key references Offline_Gambler (gambler_id),
    table_id   int not null references Offline_Table (table_id),
    constraint unique_offline_gambler_table_gambler_id_table_id unique (gambler_id, table_id)
);

alter table Offline_Table
    add constraint fk_offline_table_offline_gambler_table
        foreign key (table_id, gambler_id)
    references Offline_Gambler_Table (table_id, gambler_id);

create table Casino
(
    casino_id     int         not null primary key,
    name          varchar(50) not null,
    tournament_id int         not null,
    table_id      int         not null
);

create table Cash_Table
(
    table_id  int     not null primary key references Tables (table_id),
    rake      numeric not null check ( rake >= 0 ),
    casino_id int     not null references Casino (casino_id),
    constraint unique_cash_table_casino_id_table_id unique (casino_id, table_id)
);

alter table Casino
    add constraint fk_casino_cash_table
        foreign key (table_id, casino_id)
    references Cash_Table (table_id, casino_id);

create table Tournament
(
    tournament_id int         not null primary key,
    name          varchar(50) not null,
    buy_in        numeric     not null check ( buy_in >= 0 ),
    re_buy        numeric     not null check ( re_buy >= 0 ),
    casino_id     int         not null references Casino (casino_id),
    table_id      int         not null,

    constraint unique_tournament_tournament_id_casino_id unique (tournament_id, casino_id)
);

alter table Casino
    add constraint fk_casino_tournament
        foreign key (tournament_id, casino_id)
    references Tournament (tournament_id, casino_id);

create table Tournament_Table
(
    table_id       int not null primary key references Tables (table_id),
    period_bb      int not null check (period_bb > 0 ),
    chips_per_coin int not null check ( chips_per_coin > 0 ),
    tournament_id  int not null references Tournament (tournament_id),

    constraint unique_tournament_table_tournament_id_table_id unique (tournament_id, table_id)
);

alter table Tournament
    add constraint fk_tournament_tournament_table
        foreign key (tournament_id, table_id)
    references Tournament_Table (tournament_id, table_id);

create table Casino_Course
(
    course_id int         not null primary key,
    name      varchar(50) not null,
    price     numeric     not null,
    casino_id int         not null references Casino (casino_id)
);

create table Online_Gambler_Course
(
    gambler_id int not null references Online_Gambler (gambler_id),
    course_id  int not null references Casino_Course (course_id),
    primary key (gambler_id, course_id)
);

create table Roulette
(
    casino_id int     not null primary key references Casino (casino_id),
    can_win   boolean not null
);

create table Offline_Gambler_Roulette
(
    gambler_id int not null references Offline_Gambler (gambler_id),
    casino_id  int not null references Roulette (casino_id),
    primary key (gambler_id, casino_id)
);

create table Novel_Dostoevsky
(
    novel_id int         not null primary key,
    name     varchar(50) not null unique
);

create table Alexei
(
    gambler_id int not null primary key references Gambler (gambler_id),
    novel_id   int not null references Novel_Dostoevsky (novel_id) unique
);
