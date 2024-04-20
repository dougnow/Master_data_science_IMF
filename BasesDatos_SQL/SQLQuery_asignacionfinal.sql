
 /****** Desarrollo de ejercicios de SQL para el curso de Data Analytics.  Universidad IMF. Master en Data Science ******/
  /****** MODULO V INTELIGENCIA DE NEGOCIOS Y VISUALIZACION DE DATOS******/
 /****** Estudiante Richard Douglas Grijalba. Modalidad Virtual ******/


/****** Este comando permite : la Creacion de las tablas Staging******/
USE STG_WWBI

--DROP TABLE STG_COUNTRY

CREATE TABLE STG_COUNTRY(	
[Country Code]	VARCHAR(250) NULL,
[Short Name]	VARCHAR(250) NULL,
[Table Name]	VARCHAR(250) NULL,
[Long Name]	VARCHAR(250) NULL,
[2-alpha code]	VARCHAR(250) NULL,
[Currency Unit]	VARCHAR(250) NULL,
[Special Notes]	VARCHAR(2500) NULL,
[Region]	VARCHAR(250) NULL,
[Income Group]	VARCHAR(250) NULL,
[WB-2 code]	VARCHAR(250) NULL,
[National accounts base year]	VARCHAR(250) NULL,
[National accounts reference year]	VARCHAR(250) NULL,
[SNA price valuation]	VARCHAR(250) NULL,
[Lending category]	VARCHAR(250) NULL,
[Other groups]	VARCHAR(250) NULL,
[System of National Accounts]	VARCHAR(250) NULL,
[Alternative conversion factor]	VARCHAR(250) NULL,
[PPP survey year]	VARCHAR(250) NULL,
[Balance of Payments Manual in use]	VARCHAR(250) NULL,
[External debt Reporting status]	VARCHAR(250) NULL,
[System of trade]	VARCHAR(250) NULL,
[Government Accounting concept]	VARCHAR(250) NULL,
[IMF data dissemination standard]	VARCHAR(250) NULL,
[Latest population census]	VARCHAR(250) NULL,
[Latest household survey]	VARCHAR(250) NULL,
[Source of most recent Income and expenditure data]	VARCHAR(250) NULL,
[Vital registration complete]	VARCHAR(250) NULL,
[Latest agricultural census]	VARCHAR(250) NULL,
[Latest industrial data]	VARCHAR(250) NULL,
[Latest trade data]	VARCHAR(250) NULL)


--DROP TABLE STG_DATA
	CREATE TABLE STG_DATA(	
	[Country Name]	VARCHAR(250) NULL,
	[Country Code]	VARCHAR(250) NULL,
	[Indicator Name]	VARCHAR(250) NULL,
	[Indicator Code]	VARCHAR(250) NULL,
	a2000	VARCHAR(250) NULL,
	a2001	VARCHAR(250) NULL,
	a2002	VARCHAR(250) NULL,
	a2003	VARCHAR(250) NULL,
	a2004	VARCHAR(250) NULL,
	a2005	VARCHAR(250) NULL,
	a2006	VARCHAR(250) NULL,
	a2007	VARCHAR(250) NULL,
	a2008	VARCHAR(250) NULL,
	a2009	VARCHAR(250) NULL,
	a2010	VARCHAR(250) NULL,
	a2011	VARCHAR(250) NULL,
	a2012	VARCHAR(250) NULL,
	a2013	VARCHAR(250) NULL,
	a2014	VARCHAR(250) NULL,
	a2015	VARCHAR(250) NULL,
	a2016	VARCHAR(250) NULL)



GO

/****** Este comando permite : la Creacion de las tablas data warehouse******/

USE DWH_WWBI

/****** Object:  Table [dbo].[DIM_COUNTRY]    Script Date: 19/05/2020 22:20:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIM_COUNTRY]') AND type in (N'U'))
DROP TABLE [dbo].[DIM_COUNTRY]
GO

/****** Object:  Table [dbo].[DIM_COUNTRY]    Script Date: 19/05/2020 22:20:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_COUNTRY](
	[ID_PAIS] [varchar](3) NOT NULL PRIMARY KEY,
	[DESC_PAIS] [varchar](250) NULL,
	[ISO2] [varchar](250) NULL,
	[DESC_MONEDA] [varchar](250) NULL,
	[DESC_REGION] [varchar](250) NULL,
	[DESC_GRUPO] [varchar](250) NULL,
	[System of National Accounts] [varchar](250) NULL,
	[System of trade] [varchar](250) NULL
) ON [PRIMARY]
GO


GO

/****** Object:  Table [dbo].[DIM_METRICAS]    Script Date: 19/05/2020 22:21:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIM_METRICAS]') AND type in (N'U'))
DROP TABLE [dbo].[DIM_METRICAS]
GO

/****** Object:  Table [dbo].[DIM_METRICAS]    Script Date: 19/05/2020 22:21:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DIM_METRICAS](
	[Indicator_Code] [varchar](270) NOT NULL PRIMARY KEY,
	[Indicator_Name] [varchar](2700) NULL,
) ON [PRIMARY]
GO




/****** Object:  Table [dbo].[FACT_WDI]    Script Date: 19/05/2020 22:25:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FACT_WDI]') AND type in (N'U'))
DROP TABLE [dbo].[FACT_WDI]
GO

/****** Object:  Table [dbo].[FACT_WDI]    Script Date: 19/05/2020 22:25:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACT_WDI](
	[ID_PAIS] [varchar](3) NULL,
	[ID_METRICA] [varchar](270) NULL,
	[ID_AÑO] INT NULL,
	[IN_VALUE] FLOAT NULL
) ON [PRIMARY]
GO

/****** Este comando permite : conocer la estructura de la base de datos ******/
SELECT 
    *
FROM
    information_schema.tables;

	SELECT @@SERVERNAME AS 'Nombre del Servidor';

	/****** Este comando permite : probar que se cargaron los datos en la tabla country******/
	/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Country Code]
      ,[Short Name]
      ,[Table Name]
      ,[Long Name]
      ,[2-alpha code]
      ,[Currency Unit]
      ,[Special Notes]
      ,[Region]
      ,[Income Group]
      ,[WB-2 code]
      ,[National accounts base year]
      ,[National accounts reference year]
      ,[SNA price valuation]
      ,[Lending category]
      ,[Other groups]
      ,[System of National Accounts]
      ,[Alternative conversion factor]
      ,[PPP survey year]
      ,[Balance of Payments Manual in use]
      ,[External debt Reporting status]
      ,[System of trade]
      ,[Government Accounting concept]
      ,[IMF data dissemination standard]
      ,[Latest population census]
      ,[Latest household survey]
      ,[Source of most recent Income and expenditure data]
      ,[Vital registration complete]
      ,[Latest agricultural census]
      ,[Latest industrial data]
      ,[Latest trade data]
  FROM [STG_WWBI].[dbo].[STG_COUNTRY]


 
 /****** Este comando permite : conocer el total de filas de la tabla country ******/

 SELECT COUNT(*) AS TotalFilas
FROM STG_COUNTRY;

  /****** Este comando permite : conocer el total de filas de la tabla data  ******/

   SELECT COUNT(*) AS TotalFilas
FROM STG_DATA;



  /****** Este comando permite : revisar que los datos de la tabla DIM Country se encuentren cargados ******/

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID_PAIS]
      ,[DESC_PAIS]
      ,[ISO2]
      ,[DESC_MONEDA]
      ,[DESC_REGION]
      ,[DESC_GRUPO]
      ,[System of National Accounts]
      ,[System of trade]
  FROM [DWH_WWBI].[dbo].[DIM_COUNTRY]

  /****** Este comando permite : Revisar la carga correcta de los datos en la tabla DIM Metricas ******/
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Indicator_Code]
      ,[Indicator_Name]
  FROM [DWH_WWBI].[dbo].[DIM_METRICAS]

  /****** Este comando permite : Verificar la carga de datos en la tabla de FACT ******/

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID_PAIS]
      ,[ID_METRICA]
      ,[ID_AÑO]
      ,[IN_VALUE]
  FROM [DWH_WWBI].[dbo].[FACT_WDI]


  /****** Este comando permite : Contar la cantidad de filas de la tabla de hechos******/

  SELECT COUNT(*) AS TotalFilas
FROM FACT_WDI;



 /****** Desarrollo de ejercicios de SQL para el curso de Data Analytics.  Universidad IMF. Master en Data Science ******/
 /****** MODULO V INTELIGENCIA DE NEGOCIOS Y VISUALIZACION DE DATOS******/
 /****** Estudiante Richard Douglas Grijalba. Modalidad Virtual ******/