USE GLVOnAir2019_02;
GO

-- eseguire la riga seguente solo se la classe di test non è ancora stata creata
--EXEC tsqlt.NewTestClass @ClassName = N'GlvOnAirTests';
--GO

IF OBJECT_ID('GlvOnAirTests.[test with session id equal to 10 and speaker id equal to 1 the session code should be GLV01-10]') IS NOT NULL
	DROP PROCEDURE GlvOnAirTests.[test with session id equal to 10 and speaker id equal to 1 the session code should be GLV01-10];
GO
CREATE PROCEDURE GlvOnAirTests.[test with session id equal to 10 and speaker id equal to 1 the session code should be GLV01-10]
AS
BEGIN

	-- assemble

	-- act
	DECLARE @resultCode char(8) = dbo.udf_GenerateSessionCode(1, 10, 'GLV');

	---- assertion
	EXEC tSQLt.AssertEqualsString
	    @Expected = N'GLV01-10'
	  , @Actual = @resultCode
	  , @Message = N'Wrong code!'

END;
GO


IF OBJECT_ID('GlvOnAirTests.[test procedure ListAllSessionsWithSpeakers should return a fixed metadata]') IS NOT NULL
	DROP PROCEDURE GlvOnAirTests.[test procedure ListAllSessionsWithSpeakers should return a fixed metadata];
GO
CREATE PROCEDURE GlvOnAirTests.[test procedure ListAllSessionsWithSpeakers should return a fixed metadata]
AS
BEGIN

	-- assemble
	EXEC tSQLt.FakeTable
	    @TableName = N'SpeakersSessions'
	  , @SchemaName = N'dbo'
	  , @Identity = 1
	  , @ComputedColumns = 1
	  , @Defaults = 1;	

	-- act
	DECLARE @ExpectedMetadata varchar(MAX) = '
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
									JOIN dbo.Speakers		P	ON P.SpeakerId = SS.SpeakerId;';
		
	-- assertion
	BEGIN TRY
		EXEC tSQLt.AssertResultSetsHaveSameMetaData
			  @expectedCommand = @ExpectedMetadata
			, @actualCommand = 'EXEC dbo.proc_ListAllSessionsWithSpeakers;'
	END TRY
	BEGIN CATCH
		EXEC tSQLt.Fail @Message0 = 'The SpeakerSessions table missed at least a field';
		
	END CATCH	
END;
GO

IF OBJECT_ID('GlvOnAirTests.[test procedure ListSessionsBySpeaker should not return any session for a missing speaker]') IS NOT NULL
	DROP PROCEDURE GlvOnAirTests.[test procedure ListSessionsBySpeaker should not return any session for a missing speaker];
GO
CREATE PROCEDURE GlvOnAirTests.[test procedure ListSessionsBySpeaker should not return any session for a missing speaker]
AS
BEGIN

	-- assemble
	EXEC tSQLt.FakeTable
	    @TableName = N'SpeakersSessions'
	  , @SchemaName = N'dbo'
	  , @Identity = 1
	  , @ComputedColumns = 1
	  , @Defaults = 1;	

	EXEC tSQLt.FakeTable
	    @TableName = N'Speakers'
	  , @SchemaName = N'dbo'
	  , @Identity = 1
	  , @ComputedColumns = 1
	  , @Defaults = 1;

	INSERT INTO dbo.SpeakersSessions (SessionId, SpeakerId, RoomId, SessionTime, SessionCode)
	VALUES
	     (10, 4, 1, '10:00:00', 'GLV01-01');

	INSERT INTO dbo.Speakers (SpeakerId, SpeakerFullName, SpeakerBio)
	VALUES
	     (555, 'Missing Speaker', 'WIP');

	-- act
	IF OBJECT_ID('dbo.tempSessions') IS NULL
		CREATE TABLE dbo.tempSessions
		(
			  SessionCode char(8) NOT NULL
			, SessionTime time NOT NULL
			, SessionName varchar(100) NOT NULL
			, SessionLevel smallint NOT NULL
			, RoomName varchar(30) NOT NULL
			, SpeakerFullName varchar(50) NOT NULL
		);

	INSERT INTO dbo.tempSessions (SessionCode, SessionTime, SessionName, SessionLevel, RoomName, SpeakerFullName)
		EXEC dbo.proc_ListAllSessionsWithSpeakers;
		
	-- assertion
	EXEC tSQLt.AssertEmptyTable
	    @TableName = N'dbo.tempSessions'
	  , @Message = N'The table is not empty!'
	
	DROP TABLE dbo.tempSessions;
END;
GO