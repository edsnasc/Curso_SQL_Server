-- Aula 14 Operações de agregação n select

--Ganho com turmas
--1º Quanto paga cada aluno

SELECT c.nome_curso, t.id_turma, at.valor Valor_bruto,
    at.valor * at.valor_desconto Valor_desconto,
    at.valor - (at.valor * at.valor_desconto) Valor_liquido
FROM Turmas t
    inner join AlunosxTurmas at on at.id_turma = t.id_turma
    inner join Cursos c on c.id_curso = t.id_curso

--2º Somatória

SELECT c.nome_curso, sum(at.valor) Valor_bruto,
    sum(at.valor * at.valor_desconto) Valor_desconto,
    sum(at.valor - (at.valor * at.valor_desconto)) Valor_liquido
FROM Turmas t
    inner join AlunosxTurmas at on at.id_turma = t.id_turma
    inner join Cursos c on c.id_curso = t.id_curso
GROUP BY c.nome_curso

--3º somatório por curso x turma

SELECT c.nome_curso, at.id_turma, sum(at.valor) Valor_bruto,
    sum(at.valor * at.valor_desconto) Valor_desconto,
    sum(at.valor - (at.valor * at.valor_desconto)) Valor_liquido
FROM Turmas t
    inner join AlunosxTurmas at on at.id_turma = t.id_turma
    inner join Cursos c on c.id_curso = t.id_curso
GROUP BY c.nome_curso, at.id_turma

--4º Arredondamento dos valores

SELECT c.nome_curso, at.id_turma, sum(at.valor) Valor_bruto,
    round(sum(at.valor * at.valor_desconto), 0) Valor_desconto,
    round(sum(at.valor - (at.valor * at.valor_desconto)), 0) Valor_liquido
FROM Turmas t
    inner join AlunosxTurmas at on at.id_turma = t.id_turma
    inner join Cursos c on c.id_curso = t.id_curso
GROUP BY c.nome_curso, at.id_turma

--5º Ganhos por ano
SELECT
    YEAR(t.data_inicio) ano,
    sum(at.valor) Valor_bruto,
    round(sum(at.valor * at.valor_desconto), 0) Valor_desconto,
    round(sum(at.valor - (at.valor * at.valor_desconto)), 0) Valor_liquido
FROM Turmas t
    inner join AlunosxTurmas at on at.id_turma = t.id_turma
    inner join Cursos c on c.id_curso = t.id_curso
GROUP BY YEAR(t.data_inicio)

