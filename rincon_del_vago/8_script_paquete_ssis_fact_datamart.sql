USE [testrdvdw]
GO

INSERT INTO [testrdvdw].[dbo].[FactCargaMatriculaEstudiante]
           ([curso_id]
           ,[curso_cur_id]
           ,[estudiante_id]
           ,[profesor_id]
           ,[mat_year]
           ,[mat_semestre]
           ,[mat_nota_final_est]
		   ,[fecha_carga]
           )

SELECT [curso_id]
	  ,[curso_cur_id]
      ,[estudiante_id]
	  ,[profesor_id]
      ,[mat_year]
      ,[mat_semestre]
      ,[mat_nota_final_est]
	  ,SYSDATETIMEOFFSET()
  FROM [TESTRDV].[dbo].[matriculas] R
  INNER JOIN   ( SELECT [curso_id], [curso_cur_id], max([curso_fecha_carga]) AS curso_fecha_carga
				FROM [dbo].[DimCurso] 
				GROUP BY [curso_id], [curso_cur_id]
			  ) C ON [curso_cur_id] = R.[mat_cur_id]

  INNER JOIN   ( SELECT [estudiante_id],[estudiante_est_id] , max([estudiante_fecha_carga]) AS estudiante_fecha_carga 
				FROM [dbo].[DimEstudiante]
				GROUP BY [estudiante_id],[estudiante_est_id]
			  ) E ON [estudiante_est_id] = R.[mat_est_id]
  ,
  (SELECT [profesor_id], [prof_id], [cur_id], max([profesor_fecha_carga]) AS profesor_fecha_carga 
   FROM [TESTRDV].[dbo].[asignaciones] 
   INNER JOIN   [dbo].[DimProfesor]   ON [profesor_prof_id] = [prof_id]
   GROUP BY [profesor_id], [prof_id], [cur_id] )  P
		         
WHERE   P.cur_id = R.mat_cur_id 
    AND E.estudiante_est_id = R.mat_est_id