--AULA 15 -- SQL SERVER

SELECT  * FROM ALUNOSXTURMAS

SELECT SUM(VALOR) AS TOTAL FROM ALUNOSXTURMAS

SELECT t.id_turma, sum(AT.VALOR) AS TOTAL
	FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.TURMAS  t on t.id_turma =  at.id_turma
	GROUP BY  T.ID_TURMA

SELECT t.id_turma, c.nome_curso, sum(AT.VALOR) AS TOTAL
	FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.TURMAS  t on t.id_turma =  at.id_turma
	GROUP BY  T.ID_TURMA, c.nome_curso
	
	--subQuery
	SELECT  sum(v.TOTAL) FROM     (
																		SELECT t.id_turma, c.nome_curso, sum(AT.VALOR) AS TOTAL
																		FROM ALUNOSXTURMAS AT
																		INNER JOIN DBO.TURMAS  t on t.id_turma =  at.id_turma
																		GROUP BY  T.ID_TURMA, c.nome_curso
																		) v

--COUNT
SELECT t.id_turma, COUNT(AT.id_aluno) AS TOTAL_ALUNOS, SUM(AT.VALOR) VALOR_TOTAL
FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.Turmas t on t.id_turma =  at.id_turma
GROUP BY T.ID_TURMA

SELECT t.id_turma, COUNT(1) AS TOTAL_ALUNOS
FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.Turmas t on t.id_turma =  at.id_turma
GROUP BY T.ID_TURMA

--average / AVG (MÉDIA)

SELECT t.id_turma, c.nome_curso, avg(AT.VALOR) AS TOTAL
FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.Turmas t on t.id_turma =  at.id_turma
	INNER JOIN DBP.Cursos c on c.id_curso = t.id_curso
GROUP BY T.ID_TURMA, c.nome_curso

--MAX

SELECT t.id_turma, c.nome_curso, max(AT.VALOR) AS MAXIMO
FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.Turmas t on t.id_turma =  at.id_turma
	INNER JOIN DBP.Cursos c on c.id_curso = t.id_curso
GROUP BY T.ID_TURMA, c.nome_curso

-- MIN 

SELECT t.id_turma, c.nome_curso, min(AT.VALOR) AS MINIMO
FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.Turmas t on t.id_turma =  at.id_turma
	INNER JOIN DBP.Cursos c on c.id_curso = t.id_curso
GROUP BY T.ID_TURMA, c.nome_curso

--EXEMPLOS

SELECT t.id_turma, c.nome_curso, max(AT.VALOR) AS MAXIMO, min(AT.VALOR) AS MINIMO
FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.Turmas t on t.id_turma =  at.id_turma
	INNER JOIN DBP.Cursos c on c.id_curso = t.id_curso
GROUP BY T.ID_TURMA, c.nome_curso

SELECT t.id_turma, c.nome_curso, max(AT.VALOR) AS MAXIMO, min(AT.VALOR) AS MINIMO
		MAX(AT.VALOR) - MIN(AT.VALOR) AS DIFERENÇA
FROM ALUNOSXTURMAS AT
	INNER JOIN DBO.Turmas t on t.id_turma =  at.id_turma
	INNER JOIN DBP.Cursos c on c.id_curso = t.id_curso
GROUP BY T.ID_TURMA, c.nome_curso

