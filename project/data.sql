insert into Players (PlayerId, Login, PasswordHash)
values (1, 'player1', 'p1p1p1p1'),
       (2, 'player2', 'p2p2p2p2'),
       (3, 'player3', 'p3p3p3p3');

insert into Clans (ClanId, Name, LeaderId)
values (1, 'clan1', 1),
       (2, 'clan2', 3);

insert into Games (GameId, FirstPlayerId, SecondPlayerId, WinnerPlayerId, FirstPlayerRace, SecondPlayerRace, StartedAt,
                   FinishedAt)
values (1, 1, 2, 1, 'human', 'human', now() - interval '1 hour', now()),
       (2, 1, 3, 3, 'human', 'human', now() - interval '2 hours', now()),
       (3, 1, 2, 2, 'orc', 'human', now() - interval '45 minutes', now()),
       (4, 3, 1, 1, 'human', 'undead', now() - interval '1 hour', now()),
       (5, 2, 3, 3, 'human', 'human', now() - interval '1 hour', now());

insert into MatchmakingRatings (PlayerId, Race, Rating)
values (1, 'human', 2200),
       (1, 'undead', 2100),
       (2, 'orc', 2040),
       (2, 'human', 1940),
       (3, 'human', 2400);

insert into Tournaments(TournamentId, WinnerId, CreatedAt)
values (1, 1, now() - interval '1 hour'),
       (2, 2, now());

insert into TournamentPlayers(TournamentId, PlayerId)
values (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 2);
