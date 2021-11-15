delete
from Runs
where SessionId in (
    select distinct SessionId
    from Sessions
    where ContestId = :ContestId
);


