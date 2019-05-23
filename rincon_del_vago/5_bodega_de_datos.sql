USE [testrdvdw]
GO

/****** Object:  Table [dbo].[profesores]    Script Date: 23/05/2019 0:05:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProfesores](
	[prof_id] [int]  NOT NULL,
	[prof_nombre_profesor] [nchar](256) NOT NULL,
	[prof_fecha_carga] [int] NOT NULL
) ON [PRIMARY]
GO



