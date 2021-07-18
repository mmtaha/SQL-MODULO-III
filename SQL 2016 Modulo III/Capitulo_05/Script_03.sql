-- Antes de executar este exerc�cio, verifique se o arquivo BackupPubs.Bak est� na
-- pasta Backup e se esta pasta est� na raiz do disco C:\
Exec sp_addumpdevice
 @devtype     =  'Disk', 
 @logicalname =  'BackupPubs',
 @physicalname = 'C:\Backup\BackupPubs.Bak'
go

CREATE DATABASE Pubs2008
go
RESTORE DATABASE  Pubs2008
FROM BackupPubs
WITH REPLACE
go
Use Pubs2008
go
SELECT * FROM authors
go