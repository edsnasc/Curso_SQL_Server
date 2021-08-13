--DELETE
--Aula 26

--Apagar TODOS os dados de uma tabela
--Apagar dados selecionados
--------------------------------------------------------------

SELECT *
    INTO dbo.tbDELETE
    FROM dbo.Cursos;

DELETE FROM dbo.tbDELETE;

SELECT * FROM tbDELETE;
    DROP TABLE tbDelete;

DELETE from dbo.tbDELETE
    WHERE nome_curso like '%Avançado%';

DELETE FROM dbo.tbDELETE
    WHERE nome_curso = 'VBA I';

--

SELECT * 
    INTO AlunosTemp
    FROM Alunos;

SELECT * FROM AlunosTemp

--Apagar os alunos que não estão em nenhum cursos
--opção 1

SELECT A.Nome, a.sexo, t.valor
FROM AlunosTemp A
    INNER JOIN AlunosxTurmas T on T.id_aluno = A.id_aluno;

SELECT * FROM AlunosTemp;

DELETE FROM AlunosTemp
    WHERE id_aluno NOT IN
    (
        SELECT a.id_aluno
        FROM AlunosTemp A
            INNER JOIN AlunosxTurmas T on T.id_aluno = A.id_aluno
    );

--Opção 2
SELECT A.Nome, A.sexo
FROM AlunosTemp A
WHERE A.id_aluno NOT IN
    (
        SELECT t.id_aluno FROM AlunosxTurmas t WHERE A.id_aluno = t.id_aluno
    )

DROP TABLE alunosTemp;

SELECT * 
INTO AlunosTemp
FROM Alunos;

--Apagar todos os registros de alunos
--que tenham mais de 30 anos

--1) identificar os registros
SELECT 
    nome,
    DATEDIFF(year, data_nascimento, getdate()) as idade,
    a.sexo
FROM AlunosTemp a
WHERE DATEDIFF(year, data_nascimento, getdate()) > 30
ORDER BY 2

--2) Apagar os registros
DELETE FROM AlunosTemp
    WHERE DATEDIFF(year, data_nascimento, getdate()) > 30;

--3) Query unificada
DELETE FROM AlunosTemp
    WHERE id_aluno IN
        (
            SELECT id_aluno
            FROM AlunosTemp a
            WHERE DATEDIFF(year, data_nascimento, getdate()) > 20
        );

SELECT * FROM AlunosTemp;

DROP TABLE AlunosTemp;
