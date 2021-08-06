--FUNÇÕES DE TEXTO NO SQL SERVER - parte 2
--AULA 18

--Funções: FORMAT, LEFT, RIGHT, LEN, LOWER, UPPER
--Comentário em bloco

--FORMAT 
--Retorna um valor formatado e a cultura opcional (especificar)
--Para dados dos tipos gerais usar CAST ou CONVERT

select convert(char, getdate(), 103);

/*declare @dt DATETIME = GETDATE();

select  FORMAT(@dt, 'd', 'en-US') as Americano,
        FORMAT(@dt, 'd', 'zh-cn') as Chines_Simplificado,
        FORMAT(@dt, 'd', 'de-de') as Alemao,
        FORMAT(@dt, 'D', 'en-US') as Americano,
        FORMAT(@dt, 'D', 'zh-cn') as Chines_Simplificado,
        FORMAT(@dt, 'D', 'de-de') as Alemao;
*/

declare @dt DATETIME = GETDATE();

select FORMAT(1001500, '##-####-##') as cod_prod;

select FORMAT(at.valor, 'N', 'en-US') Formato_Americano,
       FORMAT(at.valor, 'G', 'en-US') Formato_Geral,
       FORMAT(at.valor, 'C', 'pt-BR') Formato_Monetario_BR,
       FORMAT(at.valor, 'C', 'en-US') Formato_Monetario_US,
       FORMAT(at.valor, 'C', 'de-de') Formato_Monetario_AL,
       FORMAT(at.valor, 'C', 'de-at') Formato_Monetario_AUS
    from AlunosxTurmas at

--LEFT
--Extrai caracteres a esquerda de um texto ou campo
select left('Alessandro Trovato', 10);
select left('Este é um curso de SQL', 18);

select distinct left(a.nome, 5)
    from Alunos a;

--RIGHT
--Extrai caracteres a direita de um texto
select right('Alessandro Trovato', 7);
select right('Este é um curso de SQL', 12);

select right(a.nome, 5)
    From Alunos a

select left(a.nome, 5) + right(a.nome, 5)
    from Alunos a 

--LEN
--Extrai o tamanho e caracteres

select len('Alessandro Trovato');
select len('Este é um curso de SQL');

select a.nome, len(a.nome) Tamanho
    from Alunos a;

select max(len(a.nome)) as Maior_nome
    from Alunos a;

select min(len(a.nome)) as Menor_nome
    from Alunos a;

--UPPER
-- Converte os caracteres para maiúsculo

select upper('Alessandro Trovato');

select upper(a.nome) Nome_Aluno
    from Alunos a

--LOWER
--Converte os caracteres para minúsculo

select lower('ALESSANDRO TROVATO');

select lower(a.nome) nome
    from alunos a

