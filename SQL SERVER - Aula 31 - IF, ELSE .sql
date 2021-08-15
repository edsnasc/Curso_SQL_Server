--IF ... ELSE...
--Aula 31
----------------------------------------------------------------------------------------------

DROP TABLE TTEMP;
SELECT * INTO TTEMP FROM Alunos

IF 10 > 20
    SELECT '10 é maior que 20'
ELSE
    SELECT '10 é menor que 20'

IF datename(weekday, getdate()) IN (' Sábado', ' Domingo')
    SELECT 'Estamos no fim de semana. Hoje é' + DATENAME(weekday, GETDATE())
ELSE
    SELECT 'Estamos em um dia de semana. Hoje é' + DATENAME(weekday, getdate());

--Variáveis Globais do SQL

SELECT @@SERVERNAME;
SELECT @@LANGUAGE;
SELECT @@LANGID;
SELECT @@TRANCOUNT;

IF @@LANGUAGE <> 'Português (Brasil)'
    SELECT 'Today is ' + DATENAME(weekday, GETDATE())
ELSE
    SELECT 'Hoje é '+ DATENAME(weekday, GETDATE());

IF OBJECT_ID('dbo.Alunos', 'U') is NULL
    SELECT 'Esta tabela não existe!'
ELSE
    EXEC sp_columns Alunos;

/*
Você pode ter visto o cógigo Transct-SQL que transmite cadeias de caracteres usando um prefixo N.
Isso indica que a sequência subsequente está em Unicode (o N realmente significa conjunto
de caracteres do idioma nacional). O que significa que você esta passando um valor 
NCHAR, NVARCHAR ou NTEXT, em oposição a CHAR, VARCHAR ou TEXT.

Prefixo constantes da cadeia de caracteres Unicode com a letra N. Sem prefixo N, a cadeia é
convertida na página de códigos padrão do banco de dados. Esta página de código padrão pode 
não reconhecer certos caracteres.
*/

DECLARE @vIdadeMax INT = 29;
DECLARE @vParam INT = 25;

IF @vIdadeMax >= @vParam
    SELECT nome, data_nascimento, DATEDIFF(year, data_nascimento, GETDATE()) Idade
        FROM TTEMP
    WHERE DATEDIFF(year, data_nascimento, GETDATE()) >= @vIdadeMax
    ORDER BY 3 ASC -- por Idade
ELSE
    SELECT nome, data_nascimento, DATEDIFF(year, data_nascimento, GETDATE()) Idade
        FROM TTEMP
    WHERE DATEDIFF(year, data_nascimento, GETDATE()) < @vIdadeMax
    ORDER BY 3 ASC -- por Idade

drop table TTEMP;