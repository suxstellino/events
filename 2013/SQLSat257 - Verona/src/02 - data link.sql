USE DemoDatabase;
GO

-- test data (data link to SCM)

INSERT INTO dbo.Levels (LevelId, LevelDescription)
VALUES  
	  (1, 'Beginner')
	, (2, 'Intermediate')
	, (3, 'Advnced');
GO

INSERT INTO dbo.Speakers (SpeakerFullName)
VALUES
	  ('Gilberto Zampatti')
	, ('Davide Mauri')
	, ('Francesco Diaz')
	, ('Luca Ferrari')
	, ('Gianluca Sartori');
GO

INSERT INTO dbo.SqlSatSessions (SessionId, SessionTitle, SessionAbstract, SpeakerId, LevelId)
VALUES  
	  (1, 'Baselining with SQL Server Dynamic Management Views', 'When you''re monitoring SQL Server, it is better to capture a baseline for those aspects that you''re checking, such as workload, Physical I/O or performance.', 1, 2)
	, (2, 'BI Markup Language - BI to the next level', 'BIML è un linguaggio XML-Based che permette di modellare completamente una soluzione di BI.', 2, 2)
	, (3, 'SQL Server workloads and Windows Azure platform: better together', 'Join myself and Xin Jin for our session if you want to understand all the possibilities offered by Windows Azure to run SQL Server workloads.', 3, 2)
	, (4, 'SQL Server Profiling with Extended Events', 'Dopo anni di onoratissimo servizio anche per Sql Server Profiler ? giunta l''ora della meritata pensione... Ma chi lo sostituirà !?!?! Gli Extended Events !!!', 4, 3)
	, (5, 'Sql server Disaster Recovery', 'Cosa sono i recovery model ? Come si inseriscono nel disaster recovery di SQL 2012 ? Che tipi di backup ho a disposizione ? Come li posso utilizzare ?', 4, 2)
	, (6, 'SQL Server Security in an Insecure World', 'One of the first responsibilities of a SQL Server DBA is to safeguard the data and protect it from unauthorized access.', 5, 2)
	, (7, 'SQL Server Data Collector From Every Angle', 'The SQL Server Data Collector has been around since SQL Server 2008 but a surprisingly high number of DBAs are not using it.', 5, 2);
GO