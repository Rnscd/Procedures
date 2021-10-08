	
USE dbProcedures
GO


IF (OBJECT_ID('sp_Exemplo_IF', 'P') IS NOT NULL)
  DROP PROCEDURE sp_Exemplo_IF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE sp_Exemplo_IF
( 
	@FaixaComissao char
)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @NovaComissao decimal(4,2);

	SET @NovaComissao = 0;

	IF(@FaixaComissao = 'A')
	BEGIN
	
		PRINT ' FAIXA DE COMISSAO A'
		
		SET @NovaComissao = 10.5
	END
	ELSE IF(@FaixaComissao = 'B')
	BEGIN
	
		PRINT ' FAIXA DE COMISSAO B'
	
		SET @NovaComissao = 11.5
	END
	ELSE IF(@FaixaComissao = 'C')
	BEGIN
	
		PRINT ' FAIXA DE COMISSAO C'
	
		SET @NovaComissao = 12.5
	END
	ELSE
	BEGIN
		SET @NovaComissao = 8
	END
	UPDATE tbVendedores
		SET ValorComissao = @NovaComissao

END
GO
