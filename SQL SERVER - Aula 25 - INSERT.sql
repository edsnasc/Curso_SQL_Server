--INSERT em tabelas 
--Aula 25

--Insert com descrição dos campos
--Insert para uma nova tabela
--Insert com select

SELECT * FROM Alunos;
SELECT MAX(id_aluno) FROM Alunos;
SELECT MAX(id_aluno) +1 FROM Alunos;

CREATE SEQUENCE seq_tbAlunos
    START WITH 793
    INCREMENT BY 1;

SELECT NEXT VALUE FOR seq_tbAlunos;

--Identificar campos em tabelas
EXEC sp_columns Alunos;

------------------------------------------------------------
INSERT INTO dbo.Alunos
    (id_aluno,nome,data_nascimento,sexo,data_cadastro,login_cadastro)
VALUES
    (NEXT VALUE FOR dbo.seq_tbAlunos, 'Edson Nascimento', '10/10/1989', 'M', GETDATE(), 'EDSON_PC');

SELECT * 
    FROM Alunos
WHERE data_cadastro >= CONVERT(date,GETDATE());

-- Exemplo 2

EXEC sp_columns Cursos;

SELECT * FROM Cursos;

INSERT INTO Cursos
    (id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
    (12, 'VBA Avançado I', getdate(), 'EDSON_PC')

-- Exemplo 3
SELECT * FROM Cursos;

DECLARE @vID int;
SELECT @vID = max(id_curso) +1 FROM dbo.Cursos;

INSERT INTO Cursos
    (id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
    (@vID, 'VBA Avançado II', GETDATE(), 'EDSON_PC');

-- INSERT com a criação de uma nova tabela

SELECT *
    INTO dbo.tbNova
    FROM dbo.Cursos;

SELECT * FROM dbo.tbNova;

DROP TABLE DBO.tbNova;

-- INSERT COM SELECT
DELETE FROM dbo.tbNova;

EXEC sp_columns tbNova;

SELECT * FROM dbo.tbNova;

INSERT INTO tbNova
    (id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT id_curso,
        nome_curso,
        GETDATE(),
        'Nascimento'
    FROM Cursos
WHERE id_curso > 5;

SELECT * FROM dbo.tbNova;

DELETE From dbo.tbNova;

INSERT INTO tbNova 
    (id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT * FROM Cursos 
WHERE nome_curso like '%VBA%'

SELECT * FROM tbNova
