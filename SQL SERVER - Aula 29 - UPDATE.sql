SELECT *
    INTO TbTemp
    FROM Alunos;

SELECT * FROM TbTemp;

UPDATE TbTemp
    SET sexo = 'M';

DROP TABLE TbTemp;

SELECT *
    INTO TbTemp
    FROM Alunos;

SELECT * FROM TbTemp WHERE sexo is NULL;

UPDATE TbTemp 
    SET sexo = 'F'
WHERE id_aluno BETWEEN 210 and 215;

UPDATE TbTemp 
    SET sexo = 'M'
WHERE id_aluno IN (391, 392, 393);
    AND sexo is NULL;

UPDATE TbTemp
    SET sexo = null
WHERE id_aluno = 391;

UPDATE TbTemp
    SET sexo = LOWER(sexo),
        nome = UPPER(nome)
    WHERE id_aluno BETWEEN 200 and 290;

SELECT * FROM TbTemp
    WHERE id_aluno BETWEEN 190 and 300;

UPDATE TbTemp SET sexo = UPPER(sexo), nome = UPPER(nome) ;

SELECT * FROM TbTemp;

DROP TABLE TbTemp;