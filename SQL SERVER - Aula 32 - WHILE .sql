--Aula 32
--WHILE
--------------------------------------------------------------

select *
into TTEMP
from Alunos
SELECT *
FROM TTEMP

--Subtistuição de valor com o While

DECLARE @vString VARCHAR(100) = 'SQL            Server           |';

WHILE CHARINDEX('  ', @vString) > 0
BEGIN
    SET @vString = REPLACE(@vString, '  ',' ')
END

SELECT @vString;

--------------------------------

DECLARE @vCONT INT = 1;

WHILE (@vCONT <= 10)
BEGIN
    PRINT 'O contador está em : ' + CONVERT(varchar, @vCONT)
    SET @vCONT = @vCONT + 1
END;

--------------------------------

DECLARE @vCONT1 INT = 1;

WHILE (@vCONT1 <= 10)
BEGIN
    PRINT 'O contador está em : ' + CONVERT(varchar, @vCONT1)
    IF @vCONT1 = 7
        BREAK
    SET @vCONT1 = @vCONT1 + 1
END;
---------------------------

DECLARE @vCONT2 INT = 1;

WHILE (@vCONT2 <= 17)
BEGIN
    IF @vCONT2 % 2 = 1
    BEGIN
        SET @vCONT2 = @vCONT2 + 1
        CONTINUE
    END
    PRINT 'O contador está em : ' + CONVERT(varchar, @vCONT2)
    IF @vCONT2 = 7
        BREAK
    SET @vCONT2 = @vCONT2 + 1
END;

DROP TABLE TTEMP;

--Ler registros em uma tabela
-------------------------------------

SELECT x.*
INTO tTemp
FROM (
        select ROW_NUMBER() over(order by id_aluno) linha,
        y.id_aluno, y.nome, y.nome_curso, y.data_inicio, y.data_termino
    from (
                select a.id_aluno, a.nome, c.nome_curso, t.data_inicio, t.data_termino
        from AlunosxTurmas at
            INNER join Turmas t on (t.id_turma = at.id_turma)
            INNER join cursos c on (c.id_curso = t.id_curso)
            INNER join alunos a on (a.id_aluno = at.id_aluno)
        ) y
        
    ) x

DECLARE @Contador INT,
        @MaxLinhas INT,
        @CursoProcura NVARCHAR(100),
        @CursoNome NVARCHAR(100),
        @NomeAluno NVARCHAR(100)
    
    SET @CursoProcura = 'Excel';

SELECT @Contador = MIN(linha), @MaxLinhas = max(linha) FROM tTemp;

WHILE(@Contador is not null and @Contador <= @MaxLinhas)
BEGIN
    SELECT @CursoNome = nome_curso, @NomeAluno = nome 
        FROM tTemp
    WHERE linha = @Contador

        IF CHARINDEX(@CursoProcura, @CursoNome) > 0
            PRINT convert(VARCHAR, @Contador) + '> Curso: ' + @CursoNome + ' Aluno: ' + @NomeAluno
    
    SET @Contador = @Contador + 1
END;