	
USE dbProcedures
GO


IF (OBJECT_ID('sp_Exemplo_Variaveis_OUT', 'P') IS NOT NULL)
  DROP PROCEDURE sp_Exemplo_Variaveis_OUT
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- AS PROCEDURES PODEM TER VARIAVEIS DE
-- ENTRADA IN
-- SAIDA OUT
-- E DE ENTRADA E SAIDA IN OUT

CREATE PROCEDURE sp_Exemplo_Variaveis_OUT
( 
	@FaixaComissao char
	,@MensagemRetorno varchar(200) out
	,@TotalRetornado int out
)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @Quantidade int;

	SET @Quantidade = 0;

	SET @Quantidade = 
	(
		SELECT COUNT(*) FROM tbVendedores
		WHERE FaixaComissao = @FaixaComissao
	)	

    SET @TotalRetornado = @Quantidade

	SET @MensagemRetorno = 
	(
		SELECT 'O TOTAL DA FAIXA DE COMISSAO' + 
			@FaixaComissao  +
			CAST(@Quantidade AS VARCHAR)
	)

	PRINT @MensagemRetorno

END
GO
