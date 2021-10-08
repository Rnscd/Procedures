USE dbProcedures
GO


-- EXEMPLO BASEADO NO SITE 
-- https://technet.microsoft.com/pt-br/library/ms179296(v=sql.105).aspx


IF OBJECT_ID ('sp_ExemploTryCach_TratarErro', 'P') IS NOT NULL
    DROP PROCEDURE sp_ExemploTryCach_TratarErro;
GO

CREATE PROCEDURE sp_ExemploTryCach_TratarErro
AS
    -- BLOCO TRY/CATCH SEMELHANTE
    -- AO USADO NO C# PARA CAPTURAR 
    -- ERROS(EXCEPTIONS) NO CODIGO
	BEGIN TRY
		-- GERA ERRO DE DIVISAO POR ZERO
		SELECT 1/0;
				
	END TRY
	BEGIN CATCH
		-- CHAMA A PROPRIA PROC PARA MOSTAR OS ERROS.
		
		-- FUNCOES QUE RETORNAM INFORMACOES SOBRE OS ERROS OCORRIDO
		-- DENTRO DA PROC
		SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() as ErrorState,
			ERROR_PROCEDURE() as ErrorProcedure,
			ERROR_LINE() as ErrorLine,
			ERROR_MESSAGE() as ErrorMessage;
			
	END CATCH;
GO