Nombre de la base de datos: TESTRDV
Motor: SQL Server
Versión 2012 (110)
Descripción: El modelo debe soportar las siguientes condiciones:
- Un curso puede tener asociado uno o varios estudiantes
- Un estudiante puede estar matriculado a uno o varios cursos.
- Un curso puede ser dictado por uno o varios profesores.
- Un curso puede tener una nota final

1. Modelo de base de datos: 
	a. Imagen de Diagrama Entidad - Relación: rdv_diagrama_er.jpg
	b. Script de Generación de Datos: 
2. Procedimiento almacenado que consulta los cursos por estudiante: 2_procedimiento_consulta_cursos_estudiante.sql
3. Trigger aplicable al modelo:	3_rdv_trigger_numero_asignaciones_profesores_cursos.sql
4. Vista que permita visualizar los profesores por curso: 4_vista_profesores_cursos.sql
5. Bodega de datos:	
6. Datamart con las tablas de hechos y dimensiones:	
7. Cubo:	
8. Paquete de SSIS para mover la data de la base de datos transaccional a la bodega: 
