create procedure CheckCredentials(in UserId_ int,
                                  in Pass_ varchar(80))
as
$$
begin
    if not exists(
            select *
            from Users
            where UserId = UserId_
              and PasswordHash = md5(concat(Pass_, '$', PasswordSalt))
        )
    then
rollback;
end if;
end
    $$ language plpgsql;

create function Reserve(UserId_ int, Pass_ varchar(80), FlightId_ int, SeatNo_ int)
    returns bool
as
$$
begin
    call CheckCredentials(UserId_ := UserId_, Pass_ := Pass_);

if exists(select 1 from FreeSeats(FlightId_) where FreeSeatNo = SeatNo_) then
insert into Tickets (FlightId, SeatNo, State, ReservedAt, BoughtAt)
values (FlightId_, SeatNo_, 'reserved', localtimestamp, null);
else
        return false;
end if;

return true;
end
    $$ language plpgsql;
