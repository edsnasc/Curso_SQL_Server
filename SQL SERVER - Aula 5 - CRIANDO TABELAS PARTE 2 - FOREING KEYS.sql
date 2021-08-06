CREATE TABLE Alunos
(
    id_aluno INT PRIMARY KEY NOT NULL,
    nome VARCHAR(200) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo VARCHAR(1) NULL,
    --M para Masculino ou F para Feminino
    data_cadastro DATETIME NOT NULL,
    login_cadastro VARCHAR(15) NOT NULL,
);

--ALTER TABLE Aluno DROP CONSTRAINT fk_Turmas;

CREATE TABLE Situacao
(
    id_situacao INT PRIMARY KEY NOT NULL,
    situacao VARCHAR(25) NOT NULL,
    data_cadastro DATETIME,
    login_cadastro VARCHAR(15)
);

CREATE TABLE Cursos
(
    id_curso INT PRIMARY KEY NOT NULL,
    nome_curso VARCHAR(200) NOT NULL,
    data_cadastro DATETIME NOT NULL,
    login_cadastro VARCHAR(15) NOT NULL
);

CREATE TABLE Turmas
(
    id_turma INT PRIMARY KEY NOT NULL,
    id_curso INT NOT NULL,
    valor_turma NUMERIC(15,2) NOT NULL,
    desconto NUMERIC(3,2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_termino DATE,
    data_cadastro DATETIME NOT NULL,
    login_cadastro VARCHAR(15)
);

ALTER TABLE Turmas 
    ADD CONSTRAINT fk_Alunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Turmas 
    ADD CONSTRAINT fk_Curso FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso);

CREATE TABLE Registro_Presenca
(
    id_turma INT NOT NULL,
    id_aluno INT NOT NULL,
    id_situacao INT NOT NULL,
    data_presenca DATE NOT NULL,
    data_cadastro DATE NOT NULL,
    login_cadastro VARCHAR(15) NOT NULL
);

ALTER TABLE Registro_Presenca 
    ADD CONSTRAINT fk_TurmasRP FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);

ALTER TABLE Registro_Presenca 
    ADD CONSTRAINT fk_AlunoRP FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Registro_Presenca 
    ADD CONSTRAINT fk_SituacaoRP FOREIGN KEY (id_situacao) REFERENCES Situacao (id_situacao);

CREATE TABLE AlunosxTurmas
(
    id_turma INT NOT NULL,
    id_aluno INT NOT NULL,
    valor NUMERIC(13,2) NOT NULL,
    valor_desconto NUMERIC(3,2),
    data_cadastro DATETIME NOT NULL,
    login_cadastro VARCHAR(15) NOT NULL
);

ALTER TABLE AlunosxTurmas
    ADD CONSTRAINT fk_turma FOREIGN KEY (id_turma) REFERENCES Turmas(id_turma);

ALTER TABLE AlunosxTurmas
    ADD CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno);

INSERT INTO Turmas  
(id_turma, id_curso, data_inicio, data_termino, data_cadastro, login_cadastro)
VALUES
(1, 1, '13/07/2021', '15/12/2021', getdate(), 'EDSON_PC')

INSERT INTO AlunosxTurmas  
(id_turma, id_aluno, valor, valor_desconto, data_cadastro, login_cadastro)
VALUES
(1, 10, 1200, 0.1, getdate(), 'EDSON_PC')

SELECT * from AlunosxTurmas
SELECT * from Cursos
SELECT * from Turmas

/*
DROP TABLE Alunos;
DROP TABLE Cursos;
DROP TABLE registro_Presenca;
DROP TABLE Situacao;
DROP TABLE Turmas;
*/

--Apagar coluna desnecessária da tabela Turmas

ALTER TABLE Turmas
DROP CONSTRAINT fk_alunos;

ALTER TABLE Turmas
DROP COLUMN id_aluno;

ALTER TABLE Turmas
DROP COLUMN Valor_Turma;

ALTER TABLE Turmas
DROP COLUMN desconto;
