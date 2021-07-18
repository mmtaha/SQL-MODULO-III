-- Este c�digo verifica se h� no disco C:\ uma pasta chamada Bancos e se n�o 
-- houver ela ser� criada
DECLARE @result int
EXEC @result = xp_cmdshell 'dir C:\Bancos'
IF (@result <> 0)
   Exec master.dbo.xp_cmdshell 'MD C:\Bancos'

EXEC @result = xp_cmdshell 'dir C:\Bancos\Empresa'
IF (@result <> 0)
   Exec master.dbo.xp_cmdshell 'MD C:\Bancos\Empresa'

go
-- Criando o database Empresa
CREATE DATABASE Empresa
ON
(
  name= 'Empresa_Dados1',
  filename='C:\Bancos\Empresa\Empresa_Dados1.mdf',
  size= 10MB,
  maxsize=100MB,
  filegrowth= 10MB
),
(
  name= 'Empresa_Dados2',
  filename='C:\Bancos\Empresa\Empresa_Dados2.ndf',
  size= 10MB,
  maxsize=100MB,
  filegrowth= 10MB
)
LOG ON
(
  name= 'Empresa_Log',
  filename='C:\Bancos\Empresa\Empresa_Log.ldf',
  size= 10MB,
  maxsize=10MB,
  filegrowth= 10MB
) 
go
Use Empresa
go
CREATE TABLE Funcionario
(
Cod_Func	Int	,
Nome_Func	Varchar(100)
)
go
INSERT Funcionario VALUES(1,'Jorge')
INSERT Funcionario VALUES(2,'Ronaldo')
INSERT Funcionario VALUES(3,'Cl�udia')
INSERT Funcionario VALUES(4,'Francisco')
INSERT Funcionario VALUES(5,'Agnaldo')
go
Use Empresa
go
Exec SP_HelpFile
go
Exec SP_HelpFileGroup
go
Exec SP_HelpSort
go
SELECT * FROM ::Fn_HelpCollations()
WHERE Description = 'Latin1-General, case-insensitive, accent-sensitive, kanatype-insensitive, width-insensitive for Unicode Data, SQL Server Sort Order 52 on Code Page 1252 for non-Unicode Data'
go
Exec SP_Help 'Funcionario'
go
