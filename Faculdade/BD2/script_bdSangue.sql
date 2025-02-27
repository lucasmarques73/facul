USE [master]
GO
/****** Object:  Database [bdSangue]    Script Date: 31/10/2014 18:11:21 ******/
CREATE DATABASE [bdSangue]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdSangue', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdSangue.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdSangue_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdSangue_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdSangue] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdSangue].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdSangue] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdSangue] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdSangue] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdSangue] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdSangue] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdSangue] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdSangue] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bdSangue] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdSangue] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdSangue] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdSangue] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdSangue] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdSangue] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdSangue] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdSangue] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdSangue] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdSangue] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdSangue] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdSangue] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdSangue] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdSangue] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdSangue] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdSangue] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdSangue] SET RECOVERY FULL 
GO
ALTER DATABASE [bdSangue] SET  MULTI_USER 
GO
ALTER DATABASE [bdSangue] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdSangue] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdSangue] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdSangue] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bdSangue', N'ON'
GO
USE [bdSangue]
GO
/****** Object:  Table [dbo].[tblBolsaSangue]    Script Date: 31/10/2014 18:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBolsaSangue](
	[codBolsa] [int] NOT NULL,
	[nomeBolsa] [varchar](50) NULL,
	[dtArmazenamento] [datetime] NULL,
	[dtLiberacao] [datetime] NULL,
	[codTipoSangue] [int] NOT NULL,
	[codEnd] [int] NOT NULL,
	[quantidade] [float] NOT NULL,
 CONSTRAINT [PK_tblBolsaSangue] PRIMARY KEY CLUSTERED 
(
	[codBolsa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDoacao]    Script Date: 31/10/2014 18:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDoacao](
	[codDoacao] [int] NOT NULL,
	[dataDoacao] [datetime] NULL,
	[codDoador] [int] NOT NULL,
	[codBolsa] [int] NOT NULL,
 CONSTRAINT [PK_tblDoacao] PRIMARY KEY CLUSTERED 
(
	[codDoacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEnd]    Script Date: 31/10/2014 18:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEnd](
	[codEnd] [int] NOT NULL,
	[logradouro] [varchar](300) NULL,
	[bairro] [varchar](100) NULL,
	[cidade] [varchar](100) NULL,
	[UF] [varchar](2) NULL,
	[Pais] [varchar](100) NULL,
	[CEP] [varchar](50) NULL,
 CONSTRAINT [PK_tblEnd] PRIMARY KEY CLUSTERED 
(
	[codEnd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPessoa]    Script Date: 31/10/2014 18:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPessoa](
	[codPessoa] [int] NOT NULL,
	[Nome] [varchar](300) NOT NULL,
	[CPF] [int] NOT NULL,
	[RG] [varchar](50) NULL,
	[dtNascimento] [date] NOT NULL,
	[dtCadastro] [datetime] NOT NULL,
	[codEnd] [int] NOT NULL,
	[codTel] [int] NOT NULL,
	[codTipoSangue] [int] NOT NULL,
	[codRestricao] [int] NULL,
 CONSTRAINT [PK_tblPessoa] PRIMARY KEY CLUSTERED 
(
	[codPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRestricao]    Script Date: 31/10/2014 18:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRestricao](
	[codRestricao] [int] NOT NULL,
	[qualificacao] [varchar](50) NULL,
	[dataRegistro] [datetime] NULL,
	[nomeRestricacao] [varchar](300) NULL,
	[codDoador] [int] NOT NULL,
 CONSTRAINT [PK_tblRestricao] PRIMARY KEY CLUSTERED 
(
	[codRestricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTelefone]    Script Date: 31/10/2014 18:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTelefone](
	[codTel] [int] NOT NULL,
	[tipo] [varchar](50) NULL,
	[DDD] [int] NULL,
	[numero] [int] NULL,
 CONSTRAINT [PK_tblTelefone] PRIMARY KEY CLUSTERED 
(
	[codTel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTipoSangue]    Script Date: 31/10/2014 18:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTipoSangue](
	[codTipoSangue] [int] NOT NULL,
	[nomeTipo] [varchar](2) NULL,
	[RH] [varchar](1) NULL,
 CONSTRAINT [PK_tblTipoSangue] PRIMARY KEY CLUSTERED 
(
	[codTipoSangue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTransfusao]    Script Date: 31/10/2014 18:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransfusao](
	[codTransfusao] [int] NOT NULL,
	[dataTransfusao] [datetime] NOT NULL,
	[motivo] [varchar](500) NULL,
	[OBS] [varchar](1000) NULL,
	[codDoador] [int] NOT NULL,
	[codReceptor] [int] NOT NULL,
	[codBolsa] [int] NOT NULL,
 CONSTRAINT [PK_tblTransfusao] PRIMARY KEY CLUSTERED 
(
	[codTransfusao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblBolsaSangue]  WITH CHECK ADD  CONSTRAINT [FK_tblBolsaSangue_tblEnd] FOREIGN KEY([codEnd])
REFERENCES [dbo].[tblEnd] ([codEnd])
GO
ALTER TABLE [dbo].[tblBolsaSangue] CHECK CONSTRAINT [FK_tblBolsaSangue_tblEnd]
GO
ALTER TABLE [dbo].[tblBolsaSangue]  WITH CHECK ADD  CONSTRAINT [FK_tblBolsaSangue_tblTipoSangue] FOREIGN KEY([codTipoSangue])
REFERENCES [dbo].[tblTipoSangue] ([codTipoSangue])
GO
ALTER TABLE [dbo].[tblBolsaSangue] CHECK CONSTRAINT [FK_tblBolsaSangue_tblTipoSangue]
GO
ALTER TABLE [dbo].[tblDoacao]  WITH CHECK ADD  CONSTRAINT [FK_tblDoacao_tblBolsaSangue] FOREIGN KEY([codBolsa])
REFERENCES [dbo].[tblBolsaSangue] ([codBolsa])
GO
ALTER TABLE [dbo].[tblDoacao] CHECK CONSTRAINT [FK_tblDoacao_tblBolsaSangue]
GO
ALTER TABLE [dbo].[tblDoacao]  WITH CHECK ADD  CONSTRAINT [FK_tblDoacao_tblPessoa] FOREIGN KEY([codDoador])
REFERENCES [dbo].[tblPessoa] ([codPessoa])
GO
ALTER TABLE [dbo].[tblDoacao] CHECK CONSTRAINT [FK_tblDoacao_tblPessoa]
GO
ALTER TABLE [dbo].[tblPessoa]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoa_tblEnd] FOREIGN KEY([codEnd])
REFERENCES [dbo].[tblEnd] ([codEnd])
GO
ALTER TABLE [dbo].[tblPessoa] CHECK CONSTRAINT [FK_tblPessoa_tblEnd]
GO
ALTER TABLE [dbo].[tblPessoa]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoa_tblRestricao] FOREIGN KEY([codRestricao])
REFERENCES [dbo].[tblRestricao] ([codRestricao])
GO
ALTER TABLE [dbo].[tblPessoa] CHECK CONSTRAINT [FK_tblPessoa_tblRestricao]
GO
ALTER TABLE [dbo].[tblPessoa]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoa_tblTelefone] FOREIGN KEY([codTel])
REFERENCES [dbo].[tblTelefone] ([codTel])
GO
ALTER TABLE [dbo].[tblPessoa] CHECK CONSTRAINT [FK_tblPessoa_tblTelefone]
GO
ALTER TABLE [dbo].[tblPessoa]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoa_tblTipoSangue] FOREIGN KEY([codTipoSangue])
REFERENCES [dbo].[tblTipoSangue] ([codTipoSangue])
GO
ALTER TABLE [dbo].[tblPessoa] CHECK CONSTRAINT [FK_tblPessoa_tblTipoSangue]
GO
ALTER TABLE [dbo].[tblTransfusao]  WITH CHECK ADD  CONSTRAINT [FK_tblTransfusao_tblBolsaSangue] FOREIGN KEY([codBolsa])
REFERENCES [dbo].[tblBolsaSangue] ([codBolsa])
GO
ALTER TABLE [dbo].[tblTransfusao] CHECK CONSTRAINT [FK_tblTransfusao_tblBolsaSangue]
GO
ALTER TABLE [dbo].[tblTransfusao]  WITH CHECK ADD  CONSTRAINT [FK_tblTransfusao_tblPessoa] FOREIGN KEY([codDoador])
REFERENCES [dbo].[tblPessoa] ([codPessoa])
GO
ALTER TABLE [dbo].[tblTransfusao] CHECK CONSTRAINT [FK_tblTransfusao_tblPessoa]
GO
ALTER TABLE [dbo].[tblTransfusao]  WITH CHECK ADD  CONSTRAINT [FK_tblTransfusao_tblPessoa1] FOREIGN KEY([codReceptor])
REFERENCES [dbo].[tblPessoa] ([codPessoa])
GO
ALTER TABLE [dbo].[tblTransfusao] CHECK CONSTRAINT [FK_tblTransfusao_tblPessoa1]
GO
USE [master]
GO
ALTER DATABASE [bdSangue] SET  READ_WRITE 
GO
