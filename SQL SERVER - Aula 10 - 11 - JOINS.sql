-- Total de Turmas por curso
SELECT c.id_curso, c.nome_curso, count(t.id_turma) Total_turmas
    FROM dbo.Turmas t
        INNER JOIN dbo.cursos c on c.id_curso = t.id_curso
    group by c.id_curso, c.nome_curso;

--Todos os cursos, independente se há ou não turmas
SELECT nome_curso, count(t.id_turma) Total_turmas
    FROM dbo.Turmas t
    RIGHT JOIN dbo.cursos c
        ON c.id_curso = t.id_curso
    GROUP BY c.nome_curso;

--CUIDADO SE NÃO FIZER A LIGAÇÃO DOS DADOS
SELECT c.*
    FROM dbo.turmas t,
         dbo.cursos c

SELECT c.nome_curso, COUNT(t.id_turma) Total_turmas
    FROM dbo.turmas t,
         dbo.cursos c
    WHERE c.id_curso = t.id_curso
    GROUP BY c.nome_curso

--Lista completa de alunos

SELECT c.nome_curso, at.valor, at.valor_desconto, t.data_inicio, t.data_termino,
       a.nome, a.sexo 
    FROM AlunosxTurmas at
        INNER JOIN dbo.turmas t on t.id_turma = at.id_turma
        INNER JOIN dbo.cursos c on c.id_curso = t.id_curso
        INNER JOIN dbo.alunos a on a.id_aluno = at.id_aluno

--Quantidade de Turmas com alunos

SELECT c.nome_curso, t.id_turma, COUNT(1)
    FROM dbo.Turmas t
        INNER JOIN AlunosxTurmas at on at.id_turma = t.id_turma
        INNER JOIN cursos c on c.id_curso = t.id_curso
    GROUP BY c.nome_curso, t.id_turma