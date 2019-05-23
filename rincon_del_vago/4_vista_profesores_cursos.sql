USE TESTRDV
GO

IF object_id(N'dbo.v_asignaciones', 'V') IS NOT NULL
	DROP VIEW dbo.v_asignaciones
GO

CREATE VIEW dbo.v_asignaciones AS
SELECT prof_nombre_profesor, cur_nombre_curso FROM [dbo].[asignaciones] a
inner join [dbo].[profesores] on a.[prof_id] =[dbo].[profesores].[prof_id]
inner join [dbo].[cursos] on [dbo].[cursos].[cur_id] = a.[cur_id] 
;

/*
select * from dbo.v_asignaciones
order by prof_nombre_profesor;
*/