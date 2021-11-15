select TeamName
from Teams
where TeamId in
      (select TeamId
       from (
                select distinct TeamId, ContestId
                from Teams T,
                     Contests C
                    except
                select distinct TeamId, ContestId
                from Sessions
                where SessionId in (select distinct SessionId from Runs where Accepted = 1)
            ) TeamContest
          );
