USE [dbProcedures]
GO

/****** Object:  Table [dbo].[tbVendedores]    Script Date: 10/23/2017 18:39:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbVendedores](
	[Cod] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[FaixaComissao] [char](1) NOT NULL,
	[ValorComissao] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_tbVendedores] PRIMARY KEY CLUSTERED 
(
	[Cod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


