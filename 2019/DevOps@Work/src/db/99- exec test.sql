USE GLVOnAir2019_02;
GO

EXEC tsqlt.Run
    @TestName = N'GlvOnAirTests.[test with session id equal to 10 and speaker id equal to 1 the session code should be GLV01-10]';

EXEC tsqlt.Run
    @TestName = N'GlvOnAirTests.[test procedure ListAllSessionsWithSpeakers should return a fixed metadata]';

EXEC tsqlt.Run
    @TestName = N'GlvOnAirTests.[test procedure ListSessionsBySpeaker should not return any session for a missing speaker]';

-- tutti i test di GlvOnAirTests
EXEC tSQLt.RunAll