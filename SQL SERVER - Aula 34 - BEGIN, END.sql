--Aula 34
--Begin ...END
--Controle de Fluxo das instrução T-SQL (Transaction SQL)
-------------------------------------------------------------------------

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

DECLARE @vCONTADOR INT = 1;

WHILE @vCONTADOR < 10
BEGIN
    PRINT 'Contador: '+ CONVERT(varchar, @vCONTADOR)
    SET @vCONTADOR += 1
END;

--SEM O BEGIN ALINHADO

BEGIN TRANSACTION;

IF @@TRANCOUNT = 0

    SELECT nome, nome_curso, sexo
    FROM tTEMP
    WHERE sexo = 'M';

ROLLBACK TRANSACTION;

PRINT 'Executar Dois Rollbacks Geraria um erro de execusão do segundo';

ROLLBACK TRANSACTION;

PRINT 'Transação desfeita'

--BEGIN ALINHADO

BEGIN TRANSACTION;

IF @@TRANCOUNT = 0

BEGIN
    SELECT nome, nome_curso, sexo
    FROM tTEMP
    WHERE sexo = 'M';
    ROLLBACK TRANSACTION;
    PRINT 'Executar Dois Rollbacks Geraria um erro de execusão do segundo';
END

ROLLBACK TRANSACTION;

PRINT 'Transação desfeita'

DROP TABLE tTEMP;


