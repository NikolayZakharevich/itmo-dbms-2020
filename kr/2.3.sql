select distinct TeamId
from Sessions S, Runs R
where S.SessionId = R.SessionId
  and S.ContestId = :ContestId
  and Accepted = 1;
