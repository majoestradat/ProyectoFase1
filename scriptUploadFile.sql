USE [master]
GO
/****** Object:  Database [ManagerFiles]    Script Date: 10/04/2023 12:00:20 p. m. ******/
CREATE DATABASE [ManagerFiles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ManagerFiles', FILENAME = N'D:\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\ManagerFiles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ManagerFiles_log', FILENAME = N'D:\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\ManagerFiles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManagerFiles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManagerFiles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ManagerFiles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ManagerFiles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ManagerFiles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ManagerFiles] SET ARITHABORT OFF 
GO
ALTER DATABASE [ManagerFiles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ManagerFiles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ManagerFiles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ManagerFiles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ManagerFiles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ManagerFiles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ManagerFiles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ManagerFiles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ManagerFiles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ManagerFiles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ManagerFiles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ManagerFiles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ManagerFiles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ManagerFiles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ManagerFiles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ManagerFiles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ManagerFiles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ManagerFiles] SET RECOVERY FULL 
GO
ALTER DATABASE [ManagerFiles] SET  MULTI_USER 
GO
ALTER DATABASE [ManagerFiles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ManagerFiles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ManagerFiles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ManagerFiles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [ManagerFiles]
GO
/****** Object:  User [brenda.estrada]    Script Date: 10/04/2023 12:00:21 p. m. ******/
CREATE USER [brenda.estrada] FOR LOGIN [brenda.estrada] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Archivos]    Script Date: 10/04/2023 12:00:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archivos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Archivo] [varchar](150) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[FolderId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Extension] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Archivos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacoras]    Script Date: 10/04/2023 12:00:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacoras](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FolderId] [int] NOT NULL,
	[ArchivoId] [int] NULL,
	[Fecha] [datetime] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Eliminar] [bit] NOT NULL,
	[Movimiento] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Bitacoras] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folders]    Script Date: 10/04/2023 12:00:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Folder] [varchar](150) NOT NULL,
	[PathFolder] [varchar](1250) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
	[Activo] [bit] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[FolderPadreId] [int] NULL,
 CONSTRAINT [PK_Folders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/04/2023 12:00:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](150) NOT NULL,
	[Contrasena] [varchar](150) NOT NULL,
	[Nombre] [varchar](80) NOT NULL,
	[Apellidos] [varchar](150) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioIdPadre] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Archivos]  WITH CHECK ADD  CONSTRAINT [FK_Archivos_Folders] FOREIGN KEY([FolderId])
REFERENCES [dbo].[Folders] ([Id])
GO
ALTER TABLE [dbo].[Archivos] CHECK CONSTRAINT [FK_Archivos_Folders]
GO
ALTER TABLE [dbo].[Archivos]  WITH CHECK ADD  CONSTRAINT [FK_Archivos_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Archivos] CHECK CONSTRAINT [FK_Archivos_Usuarios]
GO
ALTER TABLE [dbo].[Bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_Bitacoras_Archivos] FOREIGN KEY([ArchivoId])
REFERENCES [dbo].[Archivos] ([Id])
GO
ALTER TABLE [dbo].[Bitacoras] CHECK CONSTRAINT [FK_Bitacoras_Archivos]
GO
ALTER TABLE [dbo].[Bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_Bitacoras_Folders] FOREIGN KEY([FolderId])
REFERENCES [dbo].[Folders] ([Id])
GO
ALTER TABLE [dbo].[Bitacoras] CHECK CONSTRAINT [FK_Bitacoras_Folders]
GO
ALTER TABLE [dbo].[Bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_Bitacoras_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Bitacoras] CHECK CONSTRAINT [FK_Bitacoras_Usuarios]
GO
ALTER TABLE [dbo].[Folders]  WITH CHECK ADD  CONSTRAINT [FK_Folders_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Folders] CHECK CONSTRAINT [FK_Folders_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [ManagerFiles] SET  READ_WRITE 
GO
