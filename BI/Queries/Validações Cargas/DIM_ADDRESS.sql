-- TESTE INSERT e UPDATE DIMADDRESS

SELECT * FROM [dbo].[STG_Address]
SELECT * FROM [dbo].DIM_Address

--INSERT
INSERT INTO [dbo].[STG_Address] (clusterName,DataCenter,Type1,Type2,Address,Number,Complement,PostalCode,City,Country,LoadDate)
VALUES ('B','DataMin','Av','','João Maria',5678,'','2805-000','Almada','Portugal',GetDate())

INSERT INTO [dbo].[STG_Address] (clusterName,DataCenter,Type1,Type2,Address,Number,Complement,PostalCode,City,Country,LoadDate)
VALUES ('A','DataMax','Praça','','João 23',1234,'Prox. Mercado','2805-322','Lisboa','Portugal',GetDate())

--UPDATE
UPDATE [dbo].[STG_Address]
SET Number = 99
WHERE ID_ADDRESS = 1

--DELETE
delete FROM [dbo].DIM_Address where SK_Address = 5
delete FROM [dbo].STG_Address where Id_Address = 15

--truncate table [dbo].[DIM_Address]