--TRANSACTION
--AULA 30

--BEGIN TRANSACTION
--ROLLBACK TRANSACTION
--COMMIT;
---------------------------------------------------------------------------------

SELECT *
    INTO TTEMP 
    FROM Alunos;

SELECT * FROM TTEMP;

BEGIN TRANSACTION;
    UPDATE TTEMP
    SET sexo = LOWER(sexo);
COMMIT;

BEGIN TRANSACTION;
    UPDATE TTEMP SET sexo = UPPER(sexo);
ROLLBACK;

BEGIN TRANSACTION;
    DROP TABLE TTEMP;
ROLLBACK;

----------------------------------------------------------------------------
DECLARE @TR1 VARCHAR(20);
    SELECT @TR1 = 'Transação Delete';

BEGIN TRANSACTION @TR1;

    DELETE from ttemp 
        WHERE nome LIKE 'A%';

COMMIT TRANSACTION @TR1;

SELECT * FROM TTEMP;

/*
O exemplo a seguir cria uma tabela, gera três níveis de transações aninhadas 
em seguida, confirma a transação aninhada. Embora cada instrução COMMIT TRANSACTION
tenha um parâmetro transaction_name, não há nenhuma relação entre as instruções
COMMIT TRANSACTION E BEGIN TRANSACTION. Os parâmetros transaction_name ajudam
o programador a assegurar que o número correto de confirmações se codificado
para decrementar @@TRANCOUNT para 0 e, assim, confirmar a transação externa.
*/
------------------------------------

IF OBJECT_id('TabelaTeste', 'U') is NOT NULL
    DROP TABLE TabelaTeste;
GO

CREATE TABLE TabelaTeste (ID int primary key, letra char(1));
GO

--Iniciar a variável de controle de transctions @@TRANCOUNT para 1

BEGIN TRANSACTION TR1;
    PRINT 'transaction : contador depois do BEGIN = ' +Cast(@@TRANCOUNT as nvarchar(10));
    INSERT INTO TabelaTeste VALUES (1, 'A');


BEGIN TRANSACTION TR2;
    PRINT 'transaction : contador depois do 2º BEGIN = ' +Cast(@@TRANCOUNT as nvarchar(10));
    INSERT INTO TabelaTeste VALUES (2, 'B');

BEGIN TRANSACTION TR3;
    PRINT 'transaction : contador depois do 3º BEGIN = ' +Cast(@@TRANCOUNT as nvarchar(10));
    INSERT INTO TabelaTeste VALUES (3, 'C');

COMMIT TRANSACTION TR2;
    PRINT 'Transaction : contador depois do COMMIT TR2 = ' +CAST(@@TRANCOUNT as nvarchar(10));

COMMIT TRANSACTION TR1;
    PRINT 'Transaction : contador depois do COMMIT TR3 = ' +CAST(@@TRANCOUNT as nvarchar(10));

COMMIT TRANSACTION TR3;
    PRINT 'Transaction : contador depois do COMMIT TR3 = ' +CAST(@@TRANCOUNT as nvarchar(10));
