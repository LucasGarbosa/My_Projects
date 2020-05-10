USE [DW_InfraDB]
GO

/****** Object:  Table [dbo].[DIM_Calendar]    Script Date: 24/04/2020 10:05:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_Calendar](
	[Sk_Tempo] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[Year] [smallint] NOT NULL,
	[ShortDate] [date] NOT NULL,
	[WeekDay] [varchar](15) NOT NULL,
	[MonthDay] [smallint] NOT NULL,
	[NameMonth] [varchar](10) NOT NULL,
	[NumberMonth] [smallint] NOT NULL,
	[Trimestre] [smallint] NOT NULL,
	[Semestre] [smallint] NOT NULL,
	[DtCarga] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sk_Tempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [DW_InfraDB]
GO

/****** Object:  StoredProcedure [dbo].[LOAD_DIM_CALENDAR]    Script Date: 24/04/2020 10:06:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LOAD_DIM_CALENDAR]
@DataIni date , @DataFim date
AS
SET LANGUAGE Brazilian
 
Set nocount ON
DECLARE @Ano smallint
DECLARE @Data smalldatetime
DECLARE @DataCurta char(10)
DECLARE @DiaSemana varchar(15)
DECLARE @DiaMes smallint
DECLARE @MesNome varchar(10)
DECLARE @MesNumero smallint
DECLARE @Trimestre smallint
DECLARE @Semestre smallint
 
--SET @DataIni='01/01/2000'
--SET @DataFim='31/12/2001'
 
SET @Data=@DataIni
While @Data<=@DataFim
Begin
     Set @DataCurta = convert(char(10), @Data, 103)
     Set @DiaSemana = datename(weekday,@Data)
     Set @DiaMes = day(@Data)
     Set @MesNome = datename(month,@Data)
     Set @MesNumero = month(@Data)
     Set @Trimestre = DATEPART(quarter,@Data)
     Select @Semestre= Case
          when @MesNumero in (1,2,3,4,5,6) then 1
          when @MesNumero in (7,8,9,10,11,12) then 2
     End
     Set @Ano = YEAR(@Data)
     INSERT INTO [dbo].[DIM_Calendar] values(@Data, @Ano, @DataCurta, @DiaSemana, @DiaMes, @MesNome, @MesNumero, @Trimestre, @Semestre, GETDATE())
 
     Set @Data=dateadd(day,1,@Data)
End
Set nocount OFF
GO


