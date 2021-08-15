--Aula 33
-- CASE 

DROP TABLE tTemp;

SELECT x.*
    INTO tTEMP 
    FROM(
        SELECT ROW_NUMBER() OVER (order by id_aluno) as Linha,
                y.id_aluno, y.nome, y.sexo, y.nome_curso, y.data_inicio, y.data_termino, y.valor
        FROM (
            SELECT 
                a.id_aluno, a.nome, a.sexo,
                c.nome_curso,
                t.data_inicio, t.data_termino,
                at.valor
            FROM AlunosxTurmas at
                INNER join turmas t on (t.id_turma = at.id_turma)
                INNER join cursos c on (c.id_curso = t.id_curso)
                INNER join alunos a on (a.id_aluno = at.id_aluno) 
        ) y
    ) X

SELECT * FROM tTEMP;

SELECT ID_ALUNO, NOME, 
    CASE SEXO 
        WHEN 'M' THEN 'Masculino'
        WHEN 'F' THEN 'Feminino'
    ELSE 'Verifique' END AS SEXO,
    NOME_CURSO
FROM tTEMP

--CHECAGEM DO CAMPO SEXO

SELECT X.* FROM (
                    SELECT ID_ALUNO, NOME, 
                        CASE SEXO 
                            WHEN 'M' THEN 'Masculino'
                            WHEN 'F' THEN 'Feminino'
                        ELSE 'Verifique' END AS SEXO,
                        NOME_CURSO
                    FROM tTEMP
) X
WHERE SEXO = 'Verifique'
---------

SELECT nome, nome_curso, valor, CONVERT(date, data_inicio) dt_inicio,
    CASE YEAR(data_inicio)
        WHEN 2019 THEN 'Ano Anterior'
        WHEN 2020 THEN 'Ano Atual'
        WHEN 2021 THEN 'Próximo ano'
    ELSE 'Ano inválido' END análise_ano
FROM tTEMP;
-------------

SELECT nome, data_nascimento, DATEDIFF(year, data_nascimento, GETDATE()) idade,
    CASE 
        WHEN DATEDIFF(year, data_nascimento, GETDATE()) < 18 THEN 'Menor de Idade'
        WHEN DATEDIFF(year, data_nascimento, GETDATE()) >=18 THEN 'Maior de Idade'
    END Status_idade
FROM Alunos;
-------------

SELECT nome, nome_curso, sexo
    FROM tTEMP
ORDER BY
    CASE sexo WHEN 'F' THEN 'Feminino'
              WHEN 'M' THEN 'Masculino'
    ELSE 'SEXO' END DESC  

DROP TABLE tTEMP 