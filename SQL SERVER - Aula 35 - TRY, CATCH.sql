--Aula 35
--TRY ... CATCH
--Implementação de tratamento de erros no SQL
--------------------------------------------------------------

SELECT x.*
    INTO tTEMP 
    FROM(
        SELECT ROW_NUMBER() OVER (order by id_aluno) as Linha,
                y.id_aluno, y.nome, y.sexo, y.nome_curso, y.data_inicio, y.data_termino, y.valor
        FROM (
            SELECT 
                a.id_aluno, a.nome, a.sexo,
                c.nome_curso,
                t.data_inicio, t.data_termino,
                at.valor
            FROM AlunosxTurmas at
                INNER join turmas t on (t.id_turma = at.id_turma)
                INNER join cursos c on (c.id_curso = t.id_curso)
                INNER join alunos a on (a.id_aluno = at.id_aluno) 
        ) y
    ) X

SELECT * FROM tTEMP;

--Exemplo 1
--Tabela não existe
BEGIN TRY
    SELECT * FROM tempTable;
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() as Número_erro,
        ERROR_MESSAGE() as Mensagem_erro;
END CATCH;

--Exemplo 2
--Utilizando em uma procedure

CREATE PROCEDURE prc_Exemplo
AS
    SELECT * FROM tempTable;
GO

BEGIN TRY
    EXEC prc_Exemplo
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() as Número_erro,
        ERROR_MESSAGE() as Mensagem_erro;
END CATCH;

--Exemplo 3
-----------------------

BEGIN
    BEGIN TRY
        SELECT 1/0;
    END TRY
    BEGIN CATCH
        PRINT 'Erro número   : ' + CONVERT(VARCHAR, ERROR_NUMBER());
        PRINT 'Erro mensagem : ' + error_message();
        PRINT 'Erro severity : ' + CONVERT(VARCHAR, error_severity());
        PRINT 'Erro state    : ' + CONVERT(VARCHAR, error_state());
        PRINT 'Erro line     : ' + CONVERT(VARCHAR, error_line());
        PRINT 'Erro proc     : ' + error_procedure();
    END CATCH;
END 
