
insert into
    Sessions(SessionId, TeamId, ContestId, Start)
    values (

           );

IF NOT EXISTS (SELECT 1 FROM Sessions
                   WHERE Sess
BEGIN
INSERT INTO EmailsRecebidos (De, Assunto, Data)
VALUES (@_DE, @_ASSUNTO, @_DATA)
END

where TeamId not in (select 1 from Sessions where )

INSERT INTO EmailsRecebidos (De, Assunto, Data)
VALUES (@_DE, @_ASSUNTO, @_DATA)
    WHERE NOT EXISTS ( SELECT * FROM EmailsRecebidos
                   WHERE De = @_DE
                   AND Assunto = @_ASSUNTO
                   AND Data = @_DATA);

delete
from Runs
where SessionId in (
    select distinct SessionId
    from Sessions
    where TeamId in (
        select TeamId
        from Teams
        where TeamName = :TeamName
    )
);


