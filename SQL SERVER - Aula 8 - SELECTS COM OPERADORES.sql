SELECT a.* 
    FROM Alunos a
 WHERE a.nome = 'Alvaro Caroline'

SELECT a.* 
    FROM Alunos a
        WHERE a.data_nascimento >= '10/01/2003'
    ORDER BY data_nascimento

-- > maior
-- < menor
-- >= maior ou igual
-- <= menor ou igual
-- <> diferente
-- = igual

SELECT a.* 
    FROM Alunos a
    WHERE a.sexo = 'F'

SELECT a.* 
    FROM Alunos a
    WHERE a.sexo = 'M'

SELECT a.* 
    FROM Alunos a
    WHERE a.sexo = 'M' 
    AND a.data_nascimento >= '01/01/2003'
    AND a.id_aluno > 500

SELECT a.nome, a.sexo, YEAR(a.data_nascimento) ano
    FROM Alunos a
    WHERE a.data_nascimento >= '01/01/2003'

-- to_Date('1012203', ddmmyyyy') --ORACLE

SELECT at.* 
    FROM alunosxturmas at
    WHERE at.valor > 500

SELECT at.id_aluno, at.valor * at.valor_desconto as desconto
    FROM alunosxturmas at

SELECT at.id_aluno, at.valor * at.valor_desconto as desconto
    FROM alunosxturmas at
    WHERE at.valor  > 500

SELECT floor(at.valor * at.valor_desconto) as desconto
    FROM AlunosxTurmas at
    WHERE at.valor_desconto > 0
        AND at.valor > 500

--Extra 

-- joins (jUNTAR ou UNIR)

SELECT c.nome_curso, t.data_inicio, t.data_termino,
       floor(at.valor) valor_bruto, floor((at.valor * at.valor_desconto)) as desconto,
       floor(at.valor - (at.valor * at.valor_desconto)) as valor_desconto
    FROM AlunosxTurmas at, Turmas t, Cursos c
    WHERE at.id_turma = t.id_turma
        AND t.id_curso = c.id_curso
        AND t.id_turma = 6