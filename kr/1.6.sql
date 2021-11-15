select SessionId
from (
         select distinct SessionId, ContestId
         from Sessions
             except
         select distinct SessionId, ContestId
         from (
                  (select distinct SessionId from Sessions) T11, (select distinct Letter, P.ContestId from Problems) T12
                      Letter, P.ContestId
                  from Sessions S,
                       Problems P
                      except
                  select distinct S.SessionId, Letter, ContestId
                  from Sessions S
                           inner join Runs R
              ) T1
     ) T2;

pi {SessionId} (
  pi{SessionId, ContestId} (Sessions)
  diff
  pi {SessionId, ContestId} (
    pi{SessionId} (Sessions) × pi {Letter, ContestId} (Problems)
    diff
    pi{SessionId, Letter, ContestId} (Sessions ⋈ Runs)
  )
)
