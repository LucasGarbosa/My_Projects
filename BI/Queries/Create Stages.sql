USE [DW_InfraDB]
GO

/****** CREATE TABLE STAGES THE FIRST STEP OF DATA TRANSFORMATION   Script Date: 16/04/2020 18:38:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_Address' and xtype='U')
CREATE TABLE [dbo].[STG_Address](
	[ID_Address] [int] IDENTITY(1,1) NOT NULL,
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
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

