select ContestId, Letter
from Problems
except
select ContestId, Letter
from Runs R, Sessions S
where R.SessionId = S.SessionId
  and Accepted = 1;
