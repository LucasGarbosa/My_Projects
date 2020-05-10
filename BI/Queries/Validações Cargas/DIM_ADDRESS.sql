-- TESTE INSERT e UPDATE DIMADDRESS

SELECT * FROM [dbo].[STG_Address]
SELECT * FROM [dbo].DIM_Address

INSERT INTO [dbo].[STG_Address] (clusterName,DataCenter,Type1,Type2,Address,Number,Complement,PostalCode,City,Country,LoadDate)
VALUES ('hoje','dia','de','testar','dados',99999999,'sempre','business','forever','just',GetDate())

INSERT INTO [dbo].[DIM_Address]( FK_ID_Address,ClusterName,DataCenter,Type1,Type2,Address,Number,Complement,PostalCode,City,Country,StartDate, EndDate, LoadDate, Active, LoadStatus)
VALUES (10,'a','a','a','a','a',1,'a','a','a','a',GetDate(),GetDate(),GetDate(),1,'U')

UPDATE [dbo].[STG_Address]
SET Number = 99
WHERE ID_ADDRESS = 1

delete FROM [dbo].DIM_Address where SK_Address = 5
delete FROM [dbo].STG_Address where Id_Address = 15

truncate table [dbo].[DIM_Address]

UPDATE DIM_ADDRESS 
SET [EndDate] = GETDATE(), Active = 0, LoadStatus = 'U' 
WHERE FK_ID_Address = 1 AND [EndDate] IS NULL
