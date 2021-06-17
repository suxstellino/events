USE GLVOnAir2019_02;
GO

IF OBJECT_ID('dbo.SpeakersSessions') IS NOT NULL
	DROP TABLE dbo.SpeakersSessions;
GO
CREATE TABLE dbo.SpeakersSessions
(
    SessionId int NOT NULL
  , SpeakerId int NOT NULL
  , RoomId smallint NOT NULL
  , SessionTime time NOT NULL
  , SessionCode char(8) NOT NULL
  , CONSTRAINT PK_SpeakersSessions
        PRIMARY KEY CLUSTERED
        (
            SessionId
          , SpeakerId
        )
);
GO

IF OBJECT_ID('dbo.Speakers') IS NOT NULL
	DROP TABLE dbo.Speakers;
GO
CREATE TABLE dbo.Speakers
(
    SpeakerId int NOT NULL
  , SpeakerFullName varchar(50) NOT NULL
  , SpeakerBio varchar(2000) NOT NULL
  , CONSTRAINT PK_Speakers
        PRIMARY KEY CLUSTERED (SpeakerId)
);
GO

IF OBJECT_ID('dbo.Rooms') IS NOT NULL
	DROP TABLE dbo.Rooms;
GO
CREATE TABLE dbo.Rooms
(
      RoomId smallint NOT NULL
	, RoomName varchar(30) NOT NULL
	, CONSTRAINT PK_Rooms
        PRIMARY KEY CLUSTERED (RoomId)
);
GO

IF OBJECT_ID('dbo.AllSessions') IS NOT NULL
	DROP TABLE dbo.AllSessions;
GO
CREATE TABLE dbo.AllSessions
(
    SessionId int NOT NULL
  , SessionName varchar(50) NOT NULL
  , SessionAbstract varchar(2000) NOT NULL
  , SessionLevel smallint NOT NULL
  , CONSTRAINT PK_AllSessions
        PRIMARY KEY CLUSTERED (SessionId)
);
GO

ALTER TABLE dbo.SpeakersSessions ADD CONSTRAINT FK_SpeakersSessions_AllSessions FOREIGN KEY (SessionId) REFERENCES dbo.AllSessions (SessionId);
GO
ALTER TABLE dbo.SpeakersSessions ADD CONSTRAINT FK_SpeakersSessions_Speakers FOREIGN KEY (SpeakerId) REFERENCES dbo.Speakers (SpeakerId);
GO
ALTER TABLE dbo.SpeakersSessions ADD CONSTRAINT FK_SpeakersSessions_Rooms FOREIGN KEY (RoomId) REFERENCES dbo.Rooms (RoomId);
GO


IF OBJECT_ID('dbo.udf_GenerateSessionCode') IS NOT NULL
	DROP FUNCTION dbo.udf_GenerateSessionCode;
GO
CREATE FUNCTION dbo.udf_GenerateSessionCode
(
	  @SpeakerId int
	, @SessionId int
	, @EventCode char(3)
)
RETURNS char(8)
AS
BEGIN
    
	DECLARE @SessionCode char(8) = 
		@EventCode +
		RIGHT('00' + CAST(@SpeakerId AS varchar(2)), 2) + 
		'-'	+ 
		RIGHT('00' + CAST(@SessionId AS varchar(2)), 2);

	RETURN @SessionCode;
END;
GO

IF OBJECT_ID('dbo.proc_ListAllSessionsWithSpeakers') IS NOT NULL
	DROP PROCEDURE dbo.proc_ListAllSessionsWithSpeakers;
GO
CREATE PROCEDURE dbo.proc_ListAllSessionsWithSpeakers
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT
		SS.SessionCode
	  , SS.SessionTime
	  , S.SessionName
	  , S.SessionLevel
	  , R.RoomName
	  , P.SpeakerFullName
	FROM
		dbo.SpeakersSessions	SS
		JOIN dbo.AllSessions	S	ON S.SessionId = SS.SessionId
		JOIN dbo.Rooms			R	ON R.RoomId = SS.RoomId
		JOIN dbo.Speakers		P	ON P.SpeakerId = SS.SpeakerId;
END;
GO

IF OBJECT_ID('dbo.proc_ListSessionsBySpeaker') IS NOT NULL
	DROP PROCEDURE dbo.proc_ListSessionsBySpeaker;
GO
CREATE PROCEDURE dbo.proc_ListSessionsBySpeaker
	@SpeakerId int
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT
		SS.SessionCode
	  , SS.SessionTime
	  , S.SessionName
	  , S.SessionLevel
	  , R.RoomName
	  , P.SpeakerFullName
	FROM
		dbo.SpeakersSessions	SS
		JOIN dbo.AllSessions	S	ON S.SessionId = SS.SessionId
		JOIN dbo.Rooms			R	ON R.RoomId = SS.RoomId
		JOIN dbo.Speakers		P	ON P.SpeakerId = SS.SpeakerId
	WHERE
		SS.SpeakerId = @SpeakerId;
END;
GO