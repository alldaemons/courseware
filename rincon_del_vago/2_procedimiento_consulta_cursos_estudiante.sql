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
	@est_id int = 0
AS
	SELECT @est_id
GO

-- =============================================
-- Example to execute the stored procedure
-- =============================================
EXECUTE dbo.rdv_sp_consultar_curso_est 1
GO
