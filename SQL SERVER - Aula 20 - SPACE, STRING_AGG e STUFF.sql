--FUNÇÕES DE TEXTO NO SQL SERVER - Parte 04
--Aluna 20

--Funções: SPACE, STRING_AGG e STUFF

--SPACE

select 'Alessandro' + space(25);
select 'Alessandro' + space(25) + 'x';

declare @vNome varchar(50) = 'Alessandro Trovato'

select @vNome + space(50 - len(@vNome));

select A.nome + space(60 - len(A.nome)) + A.sexo
    from Alunos A

select A.nome + space(60 - len(A.nome)) + A.sexo, len(nome + space(60 - len(A.nome)) + A.sexo)
    from Alunos A

--Porque o resultado da query acima tem o tamanho de 61 caracteres?

select A.nome + space(60 - len(A.nome) -1) + A.sexo, len(nome + space(60 - len(A.nome)-1) + A.sexo)
    from Alunos A

--STRING_AGG
--Concatena os valores das expressões de cadeia de caracteres e coloca valores no separador
--entre eles.
--O separador não é adicionado ao final da cadeia de caracteres.
--OBS: Os valores Nulls não são exibidos.

select string_agg(convert(nvarchar(max), sexo), ',') as registro
    from Alunos;

select string_agg(convert(nvarchar(max), isnull(sexo, 'N')), '-') as registro
    from Alunos;

select datepart(year, data_nascimento) as ano,
        string_agg(convert(nvarchar(max), isnull(nome, '0')), '-') as registro
        from Alunos
        group by datepart(year, data_nascimento)
        order by 1;

--WITHIN

select datepart(year, data_nascimento) as ano,
        string_agg(convert(nvarchar(max), isnull(sexo, '0')), '-')
            within group (order by datepart(year, data_nascimento) asc) as registro
        from Alunos
        group by datepart(year, data_nascimento)

--STUFF

select stuff('abcdfghi',3,5,'12345');

declare @vProcura varchar(50);
declare @vSubstit varchar(30);
    set @vProcura = 'Eu, xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, autorizo ...'
    set @vSubstit = 'Edson Natalicio do Nascimento';

--select len('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
select stuff(@vProcura,5,30,@vSubstit + space(30 - len(@vSubstit)));
select stuff(@vProcura,5,30,trim(@vSubstit + space(30 - len(@vSubstit))));


