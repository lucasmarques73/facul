USE [aulaSouza]
GO
/****** Object:  Table [dbo].[tblCategorias]    Script Date: 03/09/2014 19:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategorias](
	[codCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [char](1) NOT NULL,
	[IdadeInicial] [int] NOT NULL,
	[IdadeFinal] [int] NOT NULL,
	[codEvento] [int] NOT NULL,
 CONSTRAINT [PK_tblCategorias] PRIMARY KEY CLUSTERED 
(
	[codCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEnderecos]    Script Date: 03/09/2014 19:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEnderecos](
	[codEndereco] [int] IDENTITY(1,1) NOT NULL,
	[Logradouro] [varchar](300) NOT NULL,
	[Numero] [int] NOT NULL,
	[Complemento] [varchar](50) NULL,
	[Bairro] [varchar](300) NOT NULL,
	[Cidade] [varchar](300) NOT NULL,
	[Estado] [char](2) NOT NULL,
	[CEP] [char](8) NOT NULL,
	[codPessoa] [int] NOT NULL,
 CONSTRAINT [PK_tblEnderecos] PRIMARY KEY CLUSTERED 
(
	[codEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEventos]    Script Date: 03/09/2014 19:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEventos](
	[codEvento] [int] IDENTITY(1,1) NOT NULL,
	[nomeEvento] [varchar](300) NOT NULL,
	[descricaoEvento] [varchar](max) NULL,
	[dataEvento] [datetime] NOT NULL,
	[valorInscricao] [money] NULL,
	[dataInicioInsc] [datetime] NULL,
	[dataFimInsc] [datetime] NULL,
	[localEvento] [varchar](300) NULL,
 CONSTRAINT [PK_tblEventos] PRIMARY KEY CLUSTERED 
(
	[codEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInscricao]    Script Date: 03/09/2014 19:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInscricao](
	[codInscricao] [int] IDENTITY(1,1) NOT NULL,
	[codPessoa] [int] NOT NULL,
	[codEvento] [int] NOT NULL,
	[dtInscricao] [datetime] NOT NULL,
	[vlPago] [money] NULL,
	[codCategoria] [int] NOT NULL,
	[numInscricao] [char](5) NOT NULL,
 CONSTRAINT [PK_tblInscricao] PRIMARY KEY CLUSTERED 
(
	[codInscricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPessoa]    Script Date: 03/09/2014 19:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPessoa](
	[codPessoa] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](300) NOT NULL,
	[dtNascimento] [date] NULL,
	[rg] [varchar](30) NULL,
	[mae] [varchar](300) NULL,
	[pai] [varchar](300) NULL,
	[cpf] [char](11) NULL,
	[dtCadastro] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPessoa] PRIMARY KEY CLUSTERED 
(
	[codPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTelefones]    Script Date: 03/09/2014 19:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTelefones](
	[codTelefone] [int] IDENTITY(1,1) NOT NULL,
	[DDD] [char](2) NOT NULL,
	[Fone] [nchar](9) NOT NULL,
	[Tipo] [int] NOT NULL,
	[codPessoa] [int] NOT NULL,
 CONSTRAINT [PK_tblTelefones] PRIMARY KEY CLUSTERED 
(
	[codTelefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTempo]    Script Date: 03/09/2014 19:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTempo](
	[codTempo] [int] IDENTITY(1,1) NOT NULL,
	[codInscricao] [int] NOT NULL,
	[TempoInicio] [datetime] NOT NULL,
	[TempoFinal] [datetime] NOT NULL,
 CONSTRAINT [PK_tblTempo] PRIMARY KEY CLUSTERED 
(
	[codTempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblCategorias]  WITH CHECK ADD  CONSTRAINT [FK_tblCategorias_tblEventos] FOREIGN KEY([codEvento])
REFERENCES [dbo].[tblEventos] ([codEvento])
GO
ALTER TABLE [dbo].[tblCategorias] CHECK CONSTRAINT [FK_tblCategorias_tblEventos]
GO
ALTER TABLE [dbo].[tblEnderecos]  WITH CHECK ADD  CONSTRAINT [FK_tblEnderecos_tblPessoa] FOREIGN KEY([codPessoa])
REFERENCES [dbo].[tblPessoa] ([codPessoa])
GO
ALTER TABLE [dbo].[tblEnderecos] CHECK CONSTRAINT [FK_tblEnderecos_tblPessoa]
GO
ALTER TABLE [dbo].[tblInscricao]  WITH CHECK ADD  CONSTRAINT [FK_tblInscricao_tblCategorias] FOREIGN KEY([codCategoria])
REFERENCES [dbo].[tblCategorias] ([codCategoria])
GO
ALTER TABLE [dbo].[tblInscricao] CHECK CONSTRAINT [FK_tblInscricao_tblCategorias]
GO
ALTER TABLE [dbo].[tblInscricao]  WITH CHECK ADD  CONSTRAINT [FK_tblInscricao_tblEventos] FOREIGN KEY([codEvento])
REFERENCES [dbo].[tblEventos] ([codEvento])
GO
ALTER TABLE [dbo].[tblInscricao] CHECK CONSTRAINT [FK_tblInscricao_tblEventos]
GO
ALTER TABLE [dbo].[tblInscricao]  WITH CHECK ADD  CONSTRAINT [FK_tblInscricao_tblPessoa] FOREIGN KEY([codPessoa])
REFERENCES [dbo].[tblPessoa] ([codPessoa])
GO
ALTER TABLE [dbo].[tblInscricao] CHECK CONSTRAINT [FK_tblInscricao_tblPessoa]
GO
ALTER TABLE [dbo].[tblTelefones]  WITH CHECK ADD  CONSTRAINT [FK_tblTelefones_tblPessoa] FOREIGN KEY([codPessoa])
REFERENCES [dbo].[tblPessoa] ([codPessoa])
GO
ALTER TABLE [dbo].[tblTelefones] CHECK CONSTRAINT [FK_tblTelefones_tblPessoa]
GO
ALTER TABLE [dbo].[tblTempo]  WITH CHECK ADD  CONSTRAINT [FK_tblTempo_tblInscricao] FOREIGN KEY([codInscricao])
REFERENCES [dbo].[tblInscricao] ([codInscricao])
GO
ALTER TABLE [dbo].[tblTempo] CHECK CONSTRAINT [FK_tblTempo_tblInscricao]
GO
