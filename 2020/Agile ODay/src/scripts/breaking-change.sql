-- breaking change (usare questo per provare la prevenzione della regressione)
alter table dbo.users add LastStatusChangeDate datetime not null

-- non breaking change (usare questo per far eseguire la build fino alla fine con successo)
--alter table dbo.users add LastStatusChangeDate datetime not null