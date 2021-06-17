USE GLVOnAir2019_02;
GO

DELETE FROM dbo.SpeakersSessions;
GO
DELETE FROM dbo.AllSessions;
GO
DELETE FROM dbo.Speakers;
GO
DELETE FROM dbo.Rooms;
GO

INSERT INTO dbo.Rooms (RoomId, RoomName)
VALUES
     (1, 'Nera'), (2, 'Verde'), (3, 'Rossa'), (4, 'Blu'), (5, 'Arancio');
GO

INSERT INTO dbo.Speakers (SpeakerId, SpeakerFullName, SpeakerBio)
VALUES
     (1, 'Alessandro Alpi', 'Gioca ancora coi lego'),
	 (2, 'Gian Maria Ricci', 'Gioca ancora con git'),
	 (3, 'Gianluca Hotz', 'Gioca ancora con SQL Server'),
	 (4, 'Emanuele Bartolesi', 'Full snack developer'),
	 (5, 'Marco Pozzan', 'Gioca ancora con le barche');
GO

INSERT INTO dbo.AllSessions (SessionId, SessionName, SessionAbstract, SessionLevel)
VALUES
     (10, 'Sviluppare web senza web', 'Come da titolo', 400),
	 (20, 'Pull, push, dipende da che parte stai della porta', 'Non ci credo!', 400),
	 (30, 'DevOps non esiste', 'Non concordo', 300),
	 (40, 'Remare dalla stessa parte', 'il team...', 200),
	 (50, 'Il mago del DB', 'sottile.', 400);
GO

INSERT INTO dbo.SpeakersSessions (SessionId, SpeakerId, RoomId, SessionTime, SessionCode)
VALUES
     (10, 4, 1, '09:00:00', dbo.udf_GenerateSessionCode(4,10,'GLVOnAir2019')),
	 (20, 2, 2, '09:00:00', dbo.udf_GenerateSessionCode(2,20,'GLVOnAir2019')),
	 (30, 1, 3, '09:00:00', dbo.udf_GenerateSessionCode(1,30,'GLVOnAir2019')),
	 (40, 5, 4, '09:00:00', dbo.udf_GenerateSessionCode(5,40,'GLVOnAir2019')),
	 (50, 3, 5, '09:00:00', dbo.udf_GenerateSessionCode(3,50,'GLVOnAir2019'));
GO

SELECT
	Ss.SessionCode
  , SS.SessionTime
  , S.SessionId
  , S.SessionName
  , S.SessionAbstract
  , S.SessionLevel
  , R.RoomName
  , P.SpeakerFullName
  , P.SpeakerBio
FROM
	dbo.SpeakersSessions	SS
	JOIN dbo.AllSessions	S	ON S.SessionId = SS.SessionId
	JOIN dbo.Rooms			R	ON R.RoomId = SS.RoomId
	JOIN dbo.Speakers		P	ON P.SpeakerId = SS.SpeakerId;
GO