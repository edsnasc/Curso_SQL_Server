INSERT INTO dbo.Alunos
(id_aluno, nome, data_nascimento, sexo, data_cadastro, login_cadastro)
VALUES
(2, 'Alessandro Henrique Peres Porfirio', '04/10/1989', 'M', '07/07/2021 23:30:00', 'ALESS');

SELECT count(*) FROM dbo.Alunos;
SELECT * FROM dbo.Alunos;

INSERT INTO dbo.Cursos
(id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
(1, 'VBA I', '07/07/2021 23:30:00', 'ALESS');

SELECT * FROM dbo.Cursos

INSERT INTO dbo.Situacao
(id_situacao, situacao, data_cadastro, login_cadastro)
VALUES
(1, 'Presença confirmada', '07/07/2021 23:30:00', 'ALESS')

INSERT INTO dbo.Situacao
(id_situacao, situacao, data_cadastro, login_cadastro)
VALUES
(2, 'Ausente Sem Justificativa', '07/07/2021 23:30:00', 'ALESS')

INSERT INTO dbo.Situacao
(id_situacao, situacao, data_cadastro, login_cadastro)
VALUES
(3, 'Ausente Com Justificativa', '07/07/2021 23:30:00', 'ALESS')

SELECT * FROM dbo.Situacao