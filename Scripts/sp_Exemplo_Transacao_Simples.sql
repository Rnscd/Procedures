	
USE dbProcedures
GO


IF (OBJECT_ID('sp_Exemplo_Transacao_Simples', 'P') IS NOT NULL)
  DROP PROCEDURE sp_Exemplo_Transacao_Simples
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE sp_Exemplo_Transacao_Simples
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @CONTROLE_ERRO INT

    -- AQUI E INICIADA UMA TRANSACAO
    -- QUANDO E REALIZADA A AOLTERACAO EM DOIS 
    -- OU MAIS REGISTROS DA BASE
	BEGIN TRANSACTION

    -- ALTERCAO DE UM REGISTRO
	UPDATE tbVendedores
	SET ValorComissao = 5.3
	where FaixaComissao='A';

    -- ALTERCAO DE UM REGISTRO
	UPDATE tbVendedores
	SET ValorComissao = 7.3
	where FaixaComissao='B';
	
	-- ALTERCAO DE UM REGISTRO
	UPDATE tbVendedores
	SET ValorComissao = 9.3
	where FaixaComissao='C';

    -- UM SIMPLES TRATAMENTO DE ERRO
    -- O BANCO POSSUI ALGUMAS VARIAVES/FUNCOES 
    -- INTERNAS DE CONTROLE 
    -- (CLARO QUE VARIAM DE BANCO PARA BANCO)
    

    -- A fun��o de sistema @@ERROR retorna 0
    -- se a �ltima instru��o Transact-SQL 
    -- foi executada com �xito
    
    -- A MESMA DEVE SER TESTADA IMEDIATAMENTE APOS
    -- AS INSTRUCOES PARA VERIFICAR O ERRO
    
    
    SET @CONTROLE_ERRO = @@ERROR
    --SET @CONTROLE_ERRO = 1
    
	IF @CONTROLE_ERRO = 0
	BEGIN
	    -- SE NAO HOUVE ERRO
	    -- REALIZA-SE O COMMIT
	    -- PARA EFETIVAR AS ALTERACOES 
	    -- NA BASE
		COMMIT
		
		PRINT ' FOI REALIZADO O COMMIT' 
	END
	ELSE
	BEGIN
	    -- SE HOUVEE ERRO
	    -- REALIZA-SE O ROLLBACK PARA 
	    -- DESFAZER AS ALTERACOE 
	    -- NA BASE
	    
	    PRINT ' FOI REALIZADO O ROLLBACK'
	    
		ROLLBACK
	END
	 
END


