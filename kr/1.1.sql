select RunId, SessionId, Letter, SubmitTime, Accepted
from Sessions
         natural join Runs
         natural join Problems
where TeamId = :TeamId
  and ContestId = :ContestId;
