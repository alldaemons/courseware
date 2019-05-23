USE [TESTRDV]
GO

IF OBJECT_ID ('dbo.rdv_upd_num_cursos','TR') IS NOT NULL
   DROP TRIGGER dbo.rdv_upd_num_cursos 
GO

CREATE TRIGGER dbo.rdv_upd_num_cursos 
   ON  [dbo].[asignaciones]
   AFTER insert, delete, update
AS 
	begin transaction t1

		update [profesores]
		 set [prof_cursos_asignados] = t.n_cursos
		FROM (
		select a.prof_id, count(cur_nombre_curso)  as n_cursos 
		from  [dbo].[asignaciones] a
		inner join [dbo].[profesores] on a.[prof_id] =[dbo].[profesores].[prof_id]
		inner join [dbo].[cursos] on [dbo].[cursos].[cur_id] = a.[cur_id] 
		group by a.prof_id
		) t
		where t.prof_id = [profesores].[prof_id]

	commit transaction t1

GO

