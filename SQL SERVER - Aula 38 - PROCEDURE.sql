--Aula 38
--Procedures
--Conjuntos de comandos SQLs que podem ser executados de uma só vez
----------------------------------------------------------------------------

CREATE PROCEDURE BuscaCurso
    @NomeCurso VARCHAR(20)
AS

SET @NomeCurso = '%'+@NomeCurso+'%';

SELECT c.id_curso, c.nome_curso, a.nome, ISNULL(a.sexo, 'NI') sexo
FROM Cursos C
    INNER JOIN Turmas t on (t.id_turma = c.id_curso)
    INNER JOIN AlunosxTurmas alt on (alt.id_turma = t.id_turma)
    INNER JOIN Alunos a on (a.id_aluno = alt.id_aluno)
WHERE nome_curso LIKE @NomeCurso

EXEC BuscaCurso 'VBA';
EXEC BuscaCurso 'Excel';
EXEC BuscaCurso '%';

--PROCEDURE com retorno
-----------------------------------

CREATE PROCEDURE IncluirNovoCurso
    @NomeCurso     VARCHAR(100),
    @LoginCadastro VARCHAR(100)
AS
BEGIN
    DECLARE @vIdCurso INT;

    SELECT @vIdCurso = MAX(id_curso) + 1
    FROM Cursos;

    INSERT into Cursos
        (id_curso, nome_curso, data_cadastro, login_cadastro)
    VALUES
        (@vIdCurso, @NomeCurso, GETDATE(), @LoginCadastro);

    SELECT @vIdCurso = id_curso
    FROM Cursos
    WHERE id_curso = @vIdCurso;

    SELECT @vIdCurso as retorno;
END;
GO

EXEC IncluirNovoCurso 'VBA I', 'EDSON_PC';

SELECT *
FROM Cursos
ORDER BY id_curso DESC;

DELETE from Cursos WHERE id_curso = 14