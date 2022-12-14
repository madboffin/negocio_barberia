USE [master]
GO
/****** Object:  Database [barberia]    Script Date: 9/2/2022 6:23:20 PM ******/
CREATE DATABASE [barberia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'barberia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\barberia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'barberia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\barberia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [barberia] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [barberia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [barberia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [barberia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [barberia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [barberia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [barberia] SET ARITHABORT OFF 
GO
ALTER DATABASE [barberia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [barberia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [barberia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [barberia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [barberia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [barberia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [barberia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [barberia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [barberia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [barberia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [barberia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [barberia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [barberia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [barberia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [barberia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [barberia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [barberia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [barberia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [barberia] SET  MULTI_USER 
GO
ALTER DATABASE [barberia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [barberia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [barberia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [barberia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [barberia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [barberia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [barberia] SET QUERY_STORE = OFF
GO
USE [barberia]
GO
/****** Object:  Table [dbo].[barberos]    Script Date: 9/2/2022 6:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[barberos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_documento] [varchar](50) NOT NULL,
	[documento] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[correo] [varchar](50) NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_barberos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_productos]    Script Date: 9/2/2022 6:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[id_productos] [int] NOT NULL,
 CONSTRAINT [PK_detalle_productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_servicios]    Script Date: 9/2/2022 6:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_servicios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[id_servicios] [int] NOT NULL,
	[id_ventas] [int] NOT NULL,
 CONSTRAINT [PK_detalle_servicios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 9/2/2022 6:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [int] NOT NULL,
	[disponible] [int] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 9/2/2022 6:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tipos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicios]    Script Date: 9/2/2022 6:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [int] NOT NULL,
 CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 9/2/2022 6:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[contrasena] [varchar](50) NOT NULL,
	[id_rol] [int] NOT NULL,
	[estado] [int] NOT NULL,
	[correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 9/2/2022 6:23:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valor] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_barberos] [int] NOT NULL,
	[id_usuarios] [int] NOT NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[barberos]  WITH CHECK ADD  CONSTRAINT [FK_barberos_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[barberos] CHECK CONSTRAINT [FK_barberos_usuarios]
GO
ALTER TABLE [dbo].[detalle_productos]  WITH CHECK ADD  CONSTRAINT [FK_detalle_productos_productos] FOREIGN KEY([id_productos])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[detalle_productos] CHECK CONSTRAINT [FK_detalle_productos_productos]
GO
ALTER TABLE [dbo].[detalle_servicios]  WITH CHECK ADD  CONSTRAINT [FK_detalle_servicios_servicios] FOREIGN KEY([id_servicios])
REFERENCES [dbo].[servicios] ([id])
GO
ALTER TABLE [dbo].[detalle_servicios] CHECK CONSTRAINT [FK_detalle_servicios_servicios]
GO
ALTER TABLE [dbo].[detalle_servicios]  WITH CHECK ADD  CONSTRAINT [FK_detalle_servicios_ventas] FOREIGN KEY([id_ventas])
REFERENCES [dbo].[ventas] ([id])
GO
ALTER TABLE [dbo].[detalle_servicios] CHECK CONSTRAINT [FK_detalle_servicios_ventas]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_tipos] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_tipos]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_barberos] FOREIGN KEY([id_barberos])
REFERENCES [dbo].[barberos] ([id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_barberos]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_usuarios] FOREIGN KEY([id_usuarios])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_usuarios]
GO
USE [master]
GO
ALTER DATABASE [barberia] SET  READ_WRITE 
GO
