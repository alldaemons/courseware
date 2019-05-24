-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'rdv_sp_consultar_curso_est' 
)
   DROP PROCEDURE dbo.rdv_sp_consultar_curso_est
GO

CREATE PROCEDURE dbo.rdv_sp_consultar_curso_est
	@estudiante_id int = 0
AS
select [est_nombre], [cur_nombre_curso], [cur_id], [mat_year], [mat_semestre]
from [dbo].[matriculas] 
inner join [dbo].[estudiantes]	on [mat_est_id] = [est_id]
inner join [dbo].[cursos]       on [mat_cur_id] = [cur_id]
where [est_id] = @estudiante_id
GO

-- =============================================
-- Example to execute the stored procedure
-- =============================================
EXECUTE dbo.rdv_sp_consultar_curso_est 177
GO
