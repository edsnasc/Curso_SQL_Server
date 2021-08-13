--Alter Table
--Aula 28

--Alteração das características dos campos de uma tabela
--Utilizando para Adicionar, Deletar ou modificar colunas de uma tabela existente

---------------------------------------------------------------------------------------------

SELECT *
    INTO tTEMP 
    FROM Alunos;

exec sp_columns tTemp;

--Adicionar coluna

ALTER TABLE tTEMP
    ADD cpf NUMERIC(11);

SELECT * FROM tTEMP;

UPDATE tTEMP
    SET cpf = 11122233344
WHERE id_aluno = 155;

UPDATE tTEMP
    SET cpf = 111222333445555
WHERE id_aluno = 155;

ALTER TABLE tTemp 
    ADD EMAIL VARCHAR(100);

--Apagar uma coluna

ALTER TABLE Ttemp
    DROP column email;

SELECT * FROM tTEMP;

--Alterar tipo de dados de uma coluna

ALTER TABLE tTemp 
    DROP COLUMN cpf;

ALTER TABLE tTemp 
    ADD CPF VARCHAR(100);

EXEC sp_columns tTemp;

DROP TABLE tTEMP;
