
USE [testrdvdw]
GO

/****** Object:  Table [dbo].[DimEstudiante]    Script Date: 24/05/2019 10:41:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimEstudiante](
	[estudiante_id] [numeric](18, 0) IDENTITY(1,1)  NOT NULL,
	[estudiante_est_id] [int]			NOT	NULL,
	[estudiante_nombre] [nvarchar](300)		NULL,
	[estudiante_fecha_carga] [datetime] NOT NULL,
	CONSTRAINT [pk_estudiante_id] PRIMARY KEY ([estudiante_id])
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimEstudiante] ADD  CONSTRAINT [DF_DimEstudiante_estudiante_fecha_carga]  DEFAULT (sysdatetimeoffset()) FOR [estudiante_fecha_carga]
GO

/****** Object:  Table [dbo].[DimProfesor]    Script Date: 24/05/2019 10:41:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProfesor](
	[profesor_id]  [numeric](18, 0) IDENTITY(1,1)   NOT NULL,
	[profesor_prof_id]  [int]         NOT NULL,
	[profesor_nombre] [nvarchar](300)     NULL,
	[profesor_fecha_carga] [datetime] NOT NULL
	CONSTRAINT [pk_profesor_id] PRIMARY KEY ([profesor_id])
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimProfesor] 
	ADD  CONSTRAINT [DF_profesor_fecha_carga] DEFAULT (sysdatetimeoffset()) FOR [profesor_fecha_carga]
GO


/****** Object:  Table [dbo].[DimCursos]   Script Date: 24/05/2019 10:59:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCurso](
	[curso_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[curso_cur_id] [nchar](10) NOT NULL,
	[curso_nombre] [nchar](300) NULL,
	[curso_fecha_carga] [datetime] NOT NULL,
	CONSTRAINT [pk_curso_id] PRIMARY KEY ([curso_id])
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimCurso] 
	ADD  CONSTRAINT [DF_curso_fecha_carga] DEFAULT (sysdatetimeoffset()) FOR [curso_fecha_carga]
GO


/****** Object:  Table [dbo].[FactCargaMatriculaEstudiante]    Script Date: 24/05/2019 11:48:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactCargaMatriculaEstudiante](
	[curso_id]				[numeric](18, 0)	NOT NULL,
	[curso_cur_id]			[nchar](10)			    NULL,
	[estudiante_id]			[numeric](18, 0)	NOT NULL,
	[profesor_id]			[numeric](18, 0)	NOT NULL,
	[mat_year]				[int]				NOT NULL,
	[mat_semestre]			[int]				NOT NULL,
	[mat_nota_final_est]	[float]				NOT NULL,
	[fecha_carga]			[datetime]			NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactCargaMatriculaEstudiante]
	WITH CHECK ADD  CONSTRAINT [fk_curso_id] FOREIGN KEY([curso_id])
REFERENCES [dbo].[DimCurso] ([curso_id])
GO

ALTER TABLE [dbo].[FactCargaMatriculaEstudiante]
	WITH CHECK ADD  CONSTRAINT [fk_profesor_id] FOREIGN KEY([profesor_id])
REFERENCES [dbo].[DimProfesor] ([profesor_id])
GO

ALTER TABLE [dbo].[FactCargaMatriculaEstudiante]
	WITH CHECK ADD  CONSTRAINT [fk_estudiante_id] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[DimEstudiante] ([estudiante_id])
GO

ALTER TABLE [dbo].[FactCargaMatriculaEstudiante]
	ADD  CONSTRAINT [DF_mat_semestre] DEFAULT (1) FOR [mat_semestre]
GO

ALTER TABLE [dbo].[FactCargaMatriculaEstudiante]
	ADD  CONSTRAINT [DF_mat_year] DEFAULT (0) FOR [mat_year]
GO

ALTER TABLE [dbo].[FactCargaMatriculaEstudiante]
	ADD  CONSTRAINT [DF_mat_nota_final_est] DEFAULT (0) FOR [mat_nota_final_est]
GO

ALTER TABLE [dbo].[FactCargaMatriculaEstudiante] 
	ADD  CONSTRAINT [DF_fecha_carga]  DEFAULT (sysdatetimeoffset()) FOR [fecha_carga]
GO

