create function FreeSeats(_FlightId int)
    returns table
            (
                FreeSeatNo int
            )
as
$$
begin
    return query
        (select generate_series(1, SeatNo) seats
         from Seats
                  natural join Flights
         where FlightId = _FlightId
             except
         select SeatNo
         from Tickets
         where FlightId = _FlightId
           and State in ('reserved', 'sold')
        );
end;
$$ language plpgsql;
