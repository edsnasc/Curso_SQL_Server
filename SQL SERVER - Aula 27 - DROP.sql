--DROP
--Aula 27

--Apaga itens do banco de dados
-------------------------------------------

--Apagar Tabelas

SELECT * FROM sys.tables;

SELECT *
INTO tbDELETE
FROM Cursos;

DROP TABLE tbDELETE;

--Apagar Sequences

SELECT * FROM sys.sequences;

DROP SEQUENCE seq_Teste02;

--Apagar Indices

CREATE INDEX indAlunosTeste ON Alunos(id_aluno);

DROP INDEX Alunos.indAlunosTeste;

--Apagar Procedures

CREATE PROCEDURE prcListaAlunos
AS
    SELECT al.nome, al.data_nascimento
    FROM Alunos al 
    WHERE al.nome LIKE 'G%';

EXEC prcListaAlunos;

DROP PROCEDURE prcListaAlunos;

--Apagar Constraints

SELECT name FROM sys.key_constraints WHERE name LIKE 'pk%'

SELECT *
    INTO tbDelete
    FROM Cursos

SELECT * FROM tbDelete;

USE SQL_DB_1
GO
ALTER TABLE tbDelete
ADD CONSTRAINT pk_idcurso UNIQUE (id_curso);

SELECT name FROM sys.key_constraints WHERE name LIKE 'pk%'

ALTER TABLE tbDelete
    DROP CONSTRAINT pk_idcurso;

--Apaga views
CREATE VIEW vwAlunosTurmasTeste
AS
    SELECT nome, data_nascimento, DATEDIFF(year, data_nascimento, GETDATE()) idade
        FROM Alunos
    where DATEDIFF(YEAR, data_nascimento, GETDATE()) < 18;

SELECT * from vwAlunosTurmasTeste

DROP VIEW vwAlunosTurmasTeste;

--Apaga banco de dados
CREATE DATABASE dbTesteDrop;

DROP DATABASE dbTesteDrop;