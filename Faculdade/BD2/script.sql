USE [master]
GO
/****** Object:  Database [BancoSangue]    Script Date: 17/10/2014 00:11:33 ******/
CREATE DATABASE [BancoSangue]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BancoSangue', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BancoSangue.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BancoSangue_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BancoSangue_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BancoSangue] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BancoSangue].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BancoSangue] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BancoSangue] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BancoSangue] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BancoSangue] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BancoSangue] SET ARITHABORT OFF 
GO
ALTER DATABASE [BancoSangue] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BancoSangue] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BancoSangue] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BancoSangue] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BancoSangue] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BancoSangue] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BancoSangue] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BancoSangue] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BancoSangue] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BancoSangue] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BancoSangue] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BancoSangue] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BancoSangue] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BancoSangue] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BancoSangue] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BancoSangue] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BancoSangue] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BancoSangue] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BancoSangue] SET  MULTI_USER 
GO
ALTER DATABASE [BancoSangue] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BancoSangue] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BancoSangue] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BancoSangue] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BancoSangue] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BancoSangue]
GO
/****** Object:  Table [dbo].[Tbl_BolsaSangue]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_BolsaSangue](
	[idBolsaSangue] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[dataArmazenamento] [date] NOT NULL,
	[datasaida] [date] NULL,
	[localizaçao] [int] NOT NULL,
	[idDoador] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_BolsaSangue] PRIMARY KEY CLUSTERED 
(
	[idBolsaSangue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Cidade]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Cidade](
	[idCidade] [int] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_Cidade] PRIMARY KEY CLUSTERED 
(
	[idCidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_DataDoacao]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DataDoacao](
	[idDataDoaçao] [int] NOT NULL,
	[dataDoacao] [date] NOT NULL,
	[dataProxima] [date] NOT NULL,
	[idDoador] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_DataDoacao] PRIMARY KEY CLUSTERED 
(
	[idDataDoaçao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Doador]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Doador](
	[idDoador] [int] NOT NULL,
	[dataNascimento] [date] NOT NULL,
	[cpf] [char](11) NOT NULL,
	[rg] [varchar](15) NULL,
	[idDoacao] [int] NULL,
	[idEndereco] [int] NOT NULL,
	[idTipoSangue] [int] NOT NULL,
	[idRestricoes] [int] NOT NULL,
	[idTelefone] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Doador] PRIMARY KEY CLUSTERED 
(
	[idDoador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Endereco]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Endereco](
	[idEndereco] [int] NOT NULL,
	[rua] [varchar](50) NOT NULL,
	[numero] [int] NOT NULL,
	[idCidade] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
	[idDoador] [int] NULL,
	[idRecepitor] [int] NULL,
 CONSTRAINT [PK_Tbl_Endereco] PRIMARY KEY CLUSTERED 
(
	[idEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Estado]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Estado](
	[idEstado] [int] NOT NULL,
	[Estado] [char](2) NOT NULL,
 CONSTRAINT [PK_Tbl_Estado] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Recepitor]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Recepitor](
	[idRecepitor] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[dataNascimento] [date] NOT NULL,
	[cpf] [char](11) NOT NULL,
	[rg] [char](15) NULL,
	[idEndereco] [int] NOT NULL,
	[idTipoSangue] [int] NOT NULL,
	[idTelefone] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Recepitor] PRIMARY KEY CLUSTERED 
(
	[idRecepitor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Restricoes]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Restricoes](
	[idRetricoes] [int] NOT NULL,
	[Restriçoes] [varchar](50) NOT NULL,
	[idDoador] [int] NOT NULL,
	[idBolsaSangue] [int] NOT NULL,
	[inicioRestricao] [date] NOT NULL,
	[fimResticao] [date] NOT NULL,
 CONSTRAINT [PK_Tbl_Restricoes] PRIMARY KEY CLUSTERED 
(
	[idRetricoes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Telefone]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Telefone](
	[idTelefone] [int] NOT NULL,
	[numero] [char](9) NOT NULL,
	[ddd] [char](3) NOT NULL,
 CONSTRAINT [PK_Tbl_Telefone] PRIMARY KEY CLUSTERED 
(
	[idTelefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_TipoSangue]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_TipoSangue](
	[idTipoSangue] [int] NOT NULL,
	[tipoSangue] [char](3) NOT NULL,
	[idDoador] [int] NOT NULL,
	[idRecepitor] [int] NULL,
 CONSTRAINT [PK_Tbl_TipoSangue] PRIMARY KEY CLUSTERED 
(
	[idTipoSangue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Transfusao]    Script Date: 17/10/2014 00:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Transfusao](
	[idTransfu] [int] NOT NULL,
	[idRecepitor] [int] NOT NULL,
	[idDoador] [int] NOT NULL,
	[dataTranfu] [date] NOT NULL,
	[motivo] [varchar](50) NOT NULL,
	[obs] [text] NOT NULL,
 CONSTRAINT [PK_Tbl_Transfusao] PRIMARY KEY CLUSTERED 
(
	[idTransfu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [BancoSangue] SET  READ_WRITE 
GO
