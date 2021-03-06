USE [MiniErp]
GO
/****** Object:  UserDefinedFunction [dbo].[ZerosEsquerda]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ZerosEsquerda]
(
	@Tamanho INT,
	@Valor Varchar (MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN

	DECLARE @Retorno AS VARCHAR (MAX)

		IF (LEN(@Valor) <= @Tamanho )

		SET @Retorno = REPLICATE('0', @Tamanho - LEN(@Valor)) + @Valor

		ELSE

		SET @Retorno = @Valor

	RETURN @Retorno

END
GO
/****** Object:  Table [dbo].[tbPessoa]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPessoa](
	[idPessoa] [int] IDENTITY(1,1) NOT NULL,
	[dataCadastro] [datetime] NULL,
	[situacao] [varchar](50) NULL,
	[endereco] [varchar](200) NULL,
	[numero] [varchar](200) NULL,
	[complemento] [varchar](200) NULL,
	[bairro] [varchar](200) NULL,
	[cidade] [varchar](200) NULL,
	[estado] [varchar](200) NULL,
	[cep] [varchar](50) NULL,
	[telefone] [varchar](50) NULL,
	[email] [varchar](200) NULL,
	[observacao] [varchar](500) NULL,
 CONSTRAINT [PK_tbPessoa] PRIMARY KEY CLUSTERED 
(
	[idPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPessoaFisica]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPessoaFisica](
	[idPessoaFisica] [int] IDENTITY(1,1) NOT NULL,
	[idPessoa] [int] NULL,
	[nome] [varchar](200) NULL,
	[cpf] [varchar](20) NULL,
	[rg] [varchar](20) NULL,
	[sexo] [varchar](20) NULL,
	[limite] [decimal](18, 4) NULL,
 CONSTRAINT [PK_tbPessoaFisica] PRIMARY KEY CLUSTERED 
(
	[idPessoaFisica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPessoaJuridica]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPessoaJuridica](
	[idPessoaJuridica] [int] NOT NULL,
	[idPessoa] [int] NULL,
	[cnpj] [varchar](14) NULL,
	[razaoSocial] [varchar](200) NULL,
	[nomeFantasia] [varchar](200) NULL,
	[inscEstadual] [varchar](20) NULL,
	[inscMunicipal] [varchar](20) NULL,
 CONSTRAINT [PK_tbPessoaJuridica] PRIMARY KEY CLUSTERED 
(
	[idPessoaJuridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbTipoPessoa]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbTipoPessoa](
	[idTipoPessoa] [int] NOT NULL,
	[descTipoPessoa] [varchar](200) NULL,
 CONSTRAINT [PK_tbTipoPessoa] PRIMARY KEY CLUSTERED 
(
	[idTipoPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbPessoaFisica]  WITH CHECK ADD  CONSTRAINT [FK_tbPessoaFisica_tbPessoa] FOREIGN KEY([idPessoa])
REFERENCES [dbo].[tbPessoa] ([idPessoa])
GO
ALTER TABLE [dbo].[tbPessoaFisica] CHECK CONSTRAINT [FK_tbPessoaFisica_tbPessoa]
GO
ALTER TABLE [dbo].[tbPessoaJuridica]  WITH CHECK ADD  CONSTRAINT [FK_tbPessoaJuridica_tbPessoa] FOREIGN KEY([idPessoa])
REFERENCES [dbo].[tbPessoa] ([idPessoa])
GO
ALTER TABLE [dbo].[tbPessoaJuridica] CHECK CONSTRAINT [FK_tbPessoaJuridica_tbPessoa]
GO
/****** Object:  StoredProcedure [dbo].[spPessoaFisica_ProcurarCodigo]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaFisica_ProcurarCodigo]
	@TextoProcurar VARCHAR (50)
AS
BEGIN

	SELECT * FROM tbPessoaFisica WITH (NOLOCK)
	WHERE idPessoaFisica LIKE @TextoProcurar + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaFisica_ProcurarNome]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaFisica_ProcurarNome]
	@TextoProcurar VARCHAR (50)
AS
BEGIN

	SELECT * FROM tbPessoaFisica WITH (NOLOCK)
	WHERE nome LIKE @TextoProcurar + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaFisicaAlterar]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaFisicaAlterar]
	@idPessoa int,
	@dataCadastro DateTime,
	@situacao varchar(50),
	@endereco varchar(200),
	@numero varchar(200),
	@complemento varchar(200),
	@bairro varchar(200),
	@cidade varchar(200),
	@estado varchar(200),
	@cep varchar(50),
	@telefone varchar(50),
	@email varchar(200),
	@observacao varchar(500),

	@idPessoaFisica int,
	@nome varchar(200),
	@cpf varchar(20),
	@rg varchar(20),
	@sexo varchar(20),
	@limite decimal(18, 4)

AS
BEGIN
	
	BEGIN TRY
		BEGIN TRAN

			UPDATE tbPessoa SET
				dataCadastro = @dataCadastro,
				situacao = @situacao,
				endereco = @endereco,
				numero = @numero,
				complemento = @complemento,
				bairro= @bairro,
				cidade = @cidade,
				estado = @estado,
				cep = @cep,
				telefone = @telefone,
				email = @email,
				observacao = @observacao
			WHERE idPessoa = @idPessoa

			UPDATE tbPessoaFisica SET
				nome = @nome,
				cpf = @cpf,
				rg = @rg,
				sexo = @sexo,
				limite = @limite
			WHERE idPessoaFisica = @idPessoaFisica

			SELECT @idPessoa AS Retorno;

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaFisicaExcluir]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaFisicaExcluir]
	@idPessoa int

AS
BEGIN

	BEGIN TRY
		BEGIN TRAN
			DELETE FROM tbPessoa
			WHERE idPessoa = @idPessoa
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaFisicaInserir]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaFisicaInserir]
	@dataCadastro DateTime,
	@situacao varchar(50),
	@endereco varchar(200),
	@numero varchar(200),
	@complemento varchar(200),
	@bairro varchar(200),
	@cidade varchar(200),
	@estado varchar(200),
	@cep varchar(50),
	@telefone varchar(50),
	@email varchar(200),
	@observacao varchar(500),

	@cpf varchar(20),
	@rg varchar(20),
	@sexo varchar(20),
	@limite decimal(18, 4)

AS
BEGIN

	BEGIN TRY
		BEGIN TRAN
			
			IF (EXISTS (SELECT idPessoa FROM tbPessoa WHERE @cpf = @cpf))
			RAISERROR ('Já existe um cadastro com este CPF', 14, 1)

			INSERT INTO tbPessoa(
				dataCadastro, situacao, endereco, numero, complemento, bairro, cidade, estado, cep, telefone,
				email, observacao
			)
			VALUES(
				@dataCadastro, @situacao, @endereco, @numero, @complemento, @bairro, @cidade, @estado, @cep,
				@telefone, @email, @observacao			
			)

			INSERT INTO tbPessoaFisica(
				cpf, rg, sexo, limite
			)
			VALUES(
				@cpf, @rg, @sexo, @limite
			)

			SELECT @@IDENTITY AS Retorno;

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaFisicaMostrar]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaFisicaMostrar]

AS
BEGIN

	SELECT * FROM tbPessoa as P
	INNER JOIN tbPessoaFisica as PF on P.idPessoa = PF.idPessoa

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaJuridica_ProcurarCodigo]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaJuridica_ProcurarCodigo]
	@TextoProcurar VARCHAR (50)
AS
BEGIN

	SELECT * FROM tbPessoaJuridica WITH (NOLOCK)
	WHERE idPessoaJuridica LIKE @TextoProcurar + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaJuridica_ProcurarNome]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaJuridica_ProcurarNome]
	@TextoProcurar VARCHAR (50)
AS
BEGIN

	SELECT * FROM tbPessoaJuridica WITH (NOLOCK)
	WHERE razaoSocial LIKE @TextoProcurar + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaJuridicaAlterar]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaJuridicaAlterar]
	@idPessoa int,
	@dataCadastro DateTime,
	@situacao varchar(50),
	@endereco varchar(200),
	@numero varchar(200),
	@complemento varchar(200),
	@bairro varchar(200),
	@cidade varchar(200),
	@estado varchar(200),
	@cep varchar(50),
	@telefone varchar(50),
	@email varchar(200),
	@observacao varchar(500),

	@idPessoaJuridica int,
	@cnpj varchar(124),
	@razaoSocial varchar(200),
	@nomeFantasia varchar(200),
	@inscEstadual varchar(20),
	@inscMunicipal varchar(20)

AS
BEGIN
	
	BEGIN TRY
		BEGIN TRAN

			UPDATE tbPessoa SET
				dataCadastro = @dataCadastro,
				situacao = @situacao,
				endereco = @endereco,
				numero = @numero,
				complemento = @complemento,
				bairro= @bairro,
				cidade = @cidade,
				estado = @estado,
				cep = @cep,
				telefone = @telefone,
				email = @email,
				observacao = @observacao
			WHERE idPessoa = @idPessoa

			UPDATE tbPessoaJuridica SET
				cnpj = @cnpj,
				razaoSocial = @razaoSocial,
				nomeFantasia = @nomeFantasia,
				inscEstadual = @inscEstadual,
				inscMunicipal = @inscMunicipal
			WHERE idPessoaJuridica = @idPessoaJuridica

			SELECT @idPessoa AS Retorno;

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaJuridicaExcluir]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaJuridicaExcluir]
	@idPessoa int

AS
BEGIN

	BEGIN TRY
		BEGIN TRAN
			DELETE FROM tbPessoa
			WHERE idPessoa = @idPessoa
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaJuridicaInserir]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaJuridicaInserir]
	@dataCadastro DateTime,
	@situacao varchar(50),
	@endereco varchar(200),
	@numero varchar(200),
	@complemento varchar(200),
	@bairro varchar(200),
	@cidade varchar(200),
	@estado varchar(200),
	@cep varchar(50),
	@telefone varchar(50),
	@email varchar(200),
	@observacao varchar(500),

	@cnpj varchar(14),
	@razaoSocial varchar(200),
	@nomeFantasia varchar(200),
	@inscEstadual varchar(20),
	@inscMunicipal varchar(20)

AS
BEGIN

	BEGIN TRY
		BEGIN TRAN
			
			IF (EXISTS (SELECT idPessoaJuridica FROM tbPessoaJuridica WHERE cnpj = @cnpj))
			RAISERROR ('Já existe um cadastro com este CNPJ', 14, 1)

			INSERT INTO tbPessoa(
				dataCadastro, situacao, endereco, numero, complemento, bairro, cidade, estado, cep, telefone,
				email, observacao
			)
			VALUES(
				@dataCadastro, @situacao, @endereco, @numero, @complemento, @bairro, @cidade, @estado, @cep,
				@telefone, @email, @observacao			
			)

			INSERT INTO tbPessoaJuridica(
				cnpj, razaoSocial, inscEstadual, inscMunicipal
			)
			VALUES(
				@cnpj, @razaoSocial, @inscEstadual, @inscMunicipal
			)

			SELECT @@IDENTITY AS Retorno;

		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spPessoaJuridicaMostrar]    Script Date: 21/08/2018 22:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPessoaJuridicaMostrar]

AS
BEGIN

	SELECT * FROM tbPessoa AS P
	INNER JOIN tbPessoaJuridica AS PJ ON P.idPessoa = PJ.idPessoa

END
GO
