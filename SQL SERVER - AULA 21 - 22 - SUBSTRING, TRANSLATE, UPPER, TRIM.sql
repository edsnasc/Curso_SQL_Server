--FUNÇÕES DE TEXTO NO SQL SERVER - PARTE 05
--Aula 22

--Funções: SUBSTRING, TRANSLATE, UPPER, TRIM
--EXTRAS; CASE, IIF, WHILE, REPLACE

--SUBSTRING
select substring('Alessandro Trovato',1, 10) as Nome;

select a.nome, substring(a.nome, 1, 20) nome_parcial
    from Alunos a;

--DOIS PRIMEIROS NOMES
--CASE / WHEN
select a.nome,
    case substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome)+1))
        when '' then
            a.nome
        else
           substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome)+1))
    end as nome_extraido
from Alunos a

--IIF
select a.nome,
    iif(substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome) +1)) = '',
        a.nome,
        substring(a.nome, 1, charindex(' ', a.nome, charindex(' ', a.nome)+1)))
from Alunos a;

--TRANSLATE
select translate('2*[3+4]/{7-2}','[]{}','()()');
select translate('abcdefghi', 'abc', '123');

-- REPLACE
declare @vOperacao varchar(13) = '2*[3+4]/{7-2}';

select replace(
            replace(
                replace(
                    replace(@vOperacao, '[', '('),
                ']', ')'),
            '{', '('),
        '}', ')');

--TRIM
select trim('Alessandro Trovato        ');
select trim('     Alessandro     Trovato    ');
select trim('       SQL       SERVER     |');

--WHILE
declare @vString varchar(100) = 'SQL       SERVER      |';

while charindex('  ', @vString) > 0
begin 
    set @vString = replace(@vString, '  ', '')
end

select @vString;

--UPPER / LOWER
select a.nome, upper(a.nome) as Maiusculo, lower(a.nome) as Minusculo
    from Alunos a