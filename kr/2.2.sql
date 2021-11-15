select TeamName
from (
    select distinct T.TeamId, TeamName
    from Sessions S, Runs R, Teams T
    where S.SessionId = R.SessionId
      and S.TeamId = T.TeamId
      and S.ContestId = :ContestId
      and Letter = :Letter
      and Accepted = 1
) T;
