	
USE dbProcedures
GO


IF (OBJECT_ID('sp_Exemplo_SIMPLES_DE_CURSOR_COM_WHILE', 'P') IS NOT NULL)
  DROP PROCEDURE sp_Exemplo_SIMPLES_DE_CURSOR_COM_WHILE
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE sp_Exemplo_SIMPLES_DE_CURSOR_COM_WHILE
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @NovaComissao DECIMAL(4,2);
	DECLARE @FaixaComissao CHAR(1)

	SET @NovaComissao = 0;

	-- O CURSOR PERCORRE REGISTRO A REGISTRO DO COMANDO SELECT 
	-- ASSOSSIADO AO CURSOR
	DECLARE Vendedores_Cursor CURSOR FOR  
		SELECT FaixaComissao
			FROM tbVendedores
			WHERE FaixaComissao IN ('A', 'B', 'C')


    -- ANTES DE USAR O CURSOR VOCE DEVE ABRIR O MESMO
	OPEN Vendedores_Cursor;
	 
	-- ESTA A PRIMEIRA CHAMADA AO CURSOR 
	-- ASSIM PREENCHEMOS A PRIMEIRA VEZ A VARIAVEL @FaixaComissao  
	FETCH NEXT FROM Vendedores_Cursor INTO @FaixaComissao
	
	-- TESTAMOS O STATUS DO CURSOR CASO SEJA ZERO
	-- NAO TEMOS MAIS REGISTROS PARA TRABALHAR	
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		
		PRINT ' EXECUTOU O CURSOR '
		
		IF(@FaixaComissao = 'A')
		BEGIN
			SET @NovaComissao = 10.5
		END
		ELSE IF(@FaixaComissao = 'B')
		BEGIN
			SET @NovaComissao = 11.5
		END
		ELSE IF(@FaixaComissao = 'C')
		BEGIN
			SET @NovaComissao = 12.5
		END
		ELSE
		BEGIN
			SET @NovaComissao = 8
		END

		UPDATE tbVendedores
			SET ValorComissao = @NovaComissao
			where FaixaComissao=@FaixaComissao OR @FaixaComissao NOT IN ('A','B','C');
 
        -- CHAMOS DE NOVO O CURSOR PARA PEGAR O PROXIMO REGISTRO O SELECT
		-- E VOLTAMOS AO INICIO DO LOOP
		FETCH NEXT FROM Vendedores_Cursor INTO @FaixaComissao;  
	END;  

	CLOSE Vendedores_Cursor;  
	
	DEALLOCATE Vendedores_Cursor;  
	  
END
GO
