
USE dbProcedures
GO
/* -- TESTAR A PROC sp_Exemplo_IF

USE dbProcedures
GO

EXEC sp_Exemplo_IF 'A'

SELECT * FROM tbVendedores
*/

/* -- TESTAR A PROC sp_Exemplo_SIMPLES_DE_CURSOR_COM_WHILE

USE dbProcedures
GO

EXEC sp_Exemplo_SIMPLES_DE_CURSOR_COM_WHILE

SELECT * FROM tbVendedores

*/

/* -- TESTAR A PROC sp_Exemplo_Transacao_Simples
USE dbProcedures
GO

EXEC sp_Exemplo_Transacao_Simples

SELECT * FROM tbVendedores
*/

/*  -- TESTAR A PROC sp_ExemploTryCach_TratarErro

USE dbProcedures
GO
EXEC sp_ExemploTryCach_TratarErro

*/

/* TESTAR A PROC sp_Exemplo_Variaveis_OUT


USE dbProcedures
GO

DECLARE	@return_value int,
		@MensagemRetorno varchar(200),
		@TotalRetornado int

EXEC	@return_value = sp_Exemplo_Variaveis_OUT
		@FaixaComissao = 'A',
		@MensagemRetorno = @MensagemRetorno OUTPUT,
		@TotalRetornado = @TotalRetornado OUTPUT

SELECT	@MensagemRetorno as N'@MensagemRetorno',
		@TotalRetornado as N'@TotalRetornado'

SELECT	'Return Value' = @return_value

GO
*/