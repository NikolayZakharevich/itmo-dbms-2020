create table Players
(
    PlayerId     serial primary key  not null,
    Login        varchar(127) unique not null,
    PasswordHash varchar(127)        not null
);

create table Clans
(
    ClanId   serial primary key  not null,
    Name     varchar(127) unique not null,
    LeaderId serial              not null
);

create type race as enum ('human', 'orc', 'undead', 'night elf');

create table Games
(
    GameId           serial primary key                   not null,
    FirstPlayerId    serial references Players (PlayerId) not null,
    SecondPlayerId   serial references Players (PlayerId) not null
        constraint differentPlayers check (
            FirstPlayerId != SecondPlayerId
            ),
    WinnerPlayerId   serial references Players (PlayerId) not null
        constraint existingPlayer check (
                FirstPlayerId = WinnerPlayerId or
                SecondPlayerId = WinnerPlayerId
            ),
    FirstPlayerRace  race                                 not null,
    SecondPlayerRace race                                 not null,
    StartedAt        timestamp                            not null,
    FinishedAt       timestamp                            not null
);

create table MatchmakingRatings
(
    PlayerId serial not null,
    Race     race   not null,
    Rating   int,
    primary key (PlayerId, Race)
);

create table Tournaments
(
    TournamentId serial primary key not null,
    WinnerId     serial references Players (PlayerId),
    CreatedAt    timestamp          not null
);

create table TournamentPlayers
(
    PlayerId     serial                                       not null,
    TournamentId serial references Tournaments (TournamentId) not null,
    primary key (PlayerId, TournamentId)
);

create index players_login_index on Players using hash (Login);

create index clans_name_index on Clans using hash (Name);

create index matchmaking_ratings_player_index on MatchmakingRatings using hash (PlayerId);
create index matchmaking_ratings_best_player_index on MatchmakingRatings using btree (Rating DESC);

create index games_first_player_index on Games using hash (FirstPlayerId);
create index games_second_player_index on Games using hash (SecondPlayerId);
create index games_winner_player_index on Games using hash (WinnerPlayerId);
create index games_created_at_index on Games using btree (FinishedAt DESC);



STUDENTS ~ 10^4
GROUPS ~ 10^7

select * from students natural join group where groupId = 'M3437';
