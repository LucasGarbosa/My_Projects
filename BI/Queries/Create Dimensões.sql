USE [DW_InfraDB]
GO

/****** CREATE TABLE DIMENSÃO Script Date: 16/04/2020 18:38:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_Address' and xtype='U')
CREATE TABLE [dbo].[DIM_Address](
	[SK_Address] [int] IDENTITY(1,1) NOT NULL,
	[FK_Id_Address] [int] NOT NULL,
	[ClusterName] [nvarchar](75) NOT NULL,
	[Datacenter] [varchar](50) NULL,
	[Type1] [varchar](50) NULL,
	[Type2] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Number] [int] NULL,
	[Complement] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	LoadStatus varchar(1) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[SK_Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_ADDRESS_DIM_ADDRESS')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_Address')
)

ALTER TABLE [dbo].[DIM_Address]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_ADDRESS_DIM_ADDRESS] FOREIGN KEY([FK_Id_Address])
REFERENCES [dbo].[STG_Address] ([ID_Address])
GO

ALTER TABLE [dbo].[DIM_Address] NOCHECK CONSTRAINT [FK_STG_ADDRESS_DIM_ADDRESS]
GO

