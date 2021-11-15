create table Seats
(
    PlaneId int not null,
    SeatNo  int not null,
    constraint seats_PlaneId_ukey unique (PlaneId)
);

create table Flights
(
    FlightId   int       not null primary key,
    FlightTime timestamp not null,
    PlaneId    int       not null,
    foreign key (PlaneId) references Seats (PlaneId)
);

create type TicketState as enum ('reserved', 'sold');

create table Tickets
(
    FlightId   int         not null,
    SeatNo     int         not null, -- position in plane
    State      TicketState not null,
    ReservedAt timestamp,
    BoughtAt   timestamp,
    foreign key (FlightId) references Flights (FlightId)
);

create table Users
(
    UserId       int         not null primary key,
    PasswordHash varchar(80) not null,
    PasswordSalt varchar(80) not null
);