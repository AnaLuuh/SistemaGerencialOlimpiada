USE [master]
GO
/****** Object:  Database [Olimpiadas]    Script Date: 05/04/2016 22:54:55 ******/
CREATE DATABASE [Olimpiadas] ON  PRIMARY 
( NAME = N'Olimpiadas', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Olimpiadas.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Olimpiadas_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Olimpiadas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Olimpiadas] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Olimpiadas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Olimpiadas] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Olimpiadas] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Olimpiadas] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Olimpiadas] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Olimpiadas] SET ARITHABORT OFF
GO
ALTER DATABASE [Olimpiadas] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Olimpiadas] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Olimpiadas] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Olimpiadas] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Olimpiadas] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Olimpiadas] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Olimpiadas] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Olimpiadas] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Olimpiadas] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Olimpiadas] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Olimpiadas] SET  DISABLE_BROKER
GO
ALTER DATABASE [Olimpiadas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Olimpiadas] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Olimpiadas] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Olimpiadas] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Olimpiadas] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Olimpiadas] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Olimpiadas] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Olimpiadas] SET  READ_WRITE
GO
ALTER DATABASE [Olimpiadas] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Olimpiadas] SET  MULTI_USER
GO
ALTER DATABASE [Olimpiadas] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Olimpiadas] SET DB_CHAINING OFF
GO
USE [Olimpiadas]
GO
/****** Object:  Table [dbo].[Tutorial]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tutorial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NomeTutorial] [varchar](50) NOT NULL,
	[DescTutorial] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Tutorial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescPerfil] [varchar](50) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modalidade]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modalidade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescModalidade] [varchar](max) NOT NULL,
	[InfoModalidade] [varchar](max) NULL,
 CONSTRAINT [PK_Modalidade] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Local]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Local](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DescLocal] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Local] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InformacaoBH]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InformacaoBH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Informacao] [varchar](max) NOT NULL,
 CONSTRAINT [PK_InformacaoBH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NOT NULL,
	[CPF] [varchar](150) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Senha] [varchar](150) NOT NULL,
	[Logradouro] [varchar](150) NOT NULL,
	[Numero] [int] NOT NULL,
	[Bairro] [varchar](150) NOT NULL,
	[Cidade] [varchar](150) NOT NULL,
	[UF] [varchar](150) NOT NULL,
	[DataNascimento] [varchar](150) NOT NULL,
	[Perfil_ID] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evento](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Modalidade_ID] [int] NOT NULL,
	[Local_ID] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Horario] [varchar](50) NOT NULL,
	[NomeEvento] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventoUsuario]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoUsuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_ID] [int] NOT NULL,
	[Evento_ID] [int] NOT NULL,
 CONSTRAINT [PK_EventoUsuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingresso]    Script Date: 05/04/2016 22:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingresso](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Evento_ID] [int] NOT NULL,
	[Valor] [money] NOT NULL,
 CONSTRAINT [PK_Ingresso] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Usuario_Perfil]    Script Date: 05/04/2016 22:55:01 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Perfil] FOREIGN KEY([Perfil_ID])
REFERENCES [dbo].[Perfil] ([ID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Perfil]
GO
/****** Object:  ForeignKey [FK_Evento_Local]    Script Date: 05/04/2016 22:55:01 ******/
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Local] FOREIGN KEY([Local_ID])
REFERENCES [dbo].[Local] ([ID])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Local]
GO
/****** Object:  ForeignKey [FK_Evento_Modalidade]    Script Date: 05/04/2016 22:55:01 ******/
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Modalidade] FOREIGN KEY([Modalidade_ID])
REFERENCES [dbo].[Modalidade] ([ID])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Modalidade]
GO
/****** Object:  ForeignKey [FK_EventoUsuario_Evento]    Script Date: 05/04/2016 22:55:01 ******/
ALTER TABLE [dbo].[EventoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuario_Evento] FOREIGN KEY([Evento_ID])
REFERENCES [dbo].[Evento] ([ID])
GO
ALTER TABLE [dbo].[EventoUsuario] CHECK CONSTRAINT [FK_EventoUsuario_Evento]
GO
/****** Object:  ForeignKey [FK_EventoUsuario_Usuario]    Script Date: 05/04/2016 22:55:01 ******/
ALTER TABLE [dbo].[EventoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuario_Usuario] FOREIGN KEY([Usuario_ID])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[EventoUsuario] CHECK CONSTRAINT [FK_EventoUsuario_Usuario]
GO
/****** Object:  ForeignKey [FK_Ingresso_Evento]    Script Date: 05/04/2016 22:55:01 ******/
ALTER TABLE [dbo].[Ingresso]  WITH CHECK ADD  CONSTRAINT [FK_Ingresso_Evento] FOREIGN KEY([Evento_ID])
REFERENCES [dbo].[Evento] ([ID])
GO
ALTER TABLE [dbo].[Ingresso] CHECK CONSTRAINT [FK_Ingresso_Evento]
GO
