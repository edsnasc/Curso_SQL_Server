--Aula 39
--Procedures

--Procedure que valida se já existe o registro cadastrado 
--Se não Houver, cadastra
----------------------------------------------------------

CREATE PROCEDURE IncluirNovoCursoComValidacao
    @NomeCurso     VARCHAR(100),
    @LoginCadastro VARCHAR(100)
AS
BEGIN
    DECLARE @vIdCurso INT;
    DECLARE @vExisteCurso INT;

    SELECT @vExisteCurso = id_curso from Cursos WHERE nome_curso = @NomeCurso

    IF @vExisteCurso > 0
        BEGIN
            SELECT 'O curso já existe! Gravação não realizada' as retorno
        END
    ELSE
        BEGIN
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
        END
END;
GO

EXEC IncluirNovoCursoComValidacao 'Banco de Dados', 'EDSON_PC';
EXEC IncluirNovoCursoComValidacao 'VBA II', 'EDSON_PC';

SELECT * from cursos;