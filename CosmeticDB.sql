USE [master]
GO
/****** Object:  Database [CosmeticDb]    Script Date: 10.06.2022 18:06:54 ******/
CREATE DATABASE [CosmeticDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CosmeticDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CosmeticDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CosmeticDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CosmeticDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CosmeticDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CosmeticDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CosmeticDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CosmeticDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CosmeticDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CosmeticDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CosmeticDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CosmeticDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CosmeticDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CosmeticDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CosmeticDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CosmeticDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CosmeticDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CosmeticDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CosmeticDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CosmeticDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CosmeticDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CosmeticDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CosmeticDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CosmeticDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CosmeticDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CosmeticDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CosmeticDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CosmeticDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CosmeticDb] SET RECOVERY FULL 
GO
ALTER DATABASE [CosmeticDb] SET  MULTI_USER 
GO
ALTER DATABASE [CosmeticDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CosmeticDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CosmeticDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CosmeticDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CosmeticDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CosmeticDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CosmeticDb', N'ON'
GO
ALTER DATABASE [CosmeticDb] SET QUERY_STORE = OFF
GO
USE [CosmeticDb]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 10.06.2022 18:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10.06.2022 18:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[NameSurname] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10.06.2022 18:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.06.2022 18:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[Price] [varchar](50) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (1, N'Ruj')
INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (2, N'Maskara')
INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (3, N'Pudra')
INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (4, N'Kontur')
INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (8, N'Far')
INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (11, N'Roll on')
INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (12, N'Rimel')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Phone], [Adress]) VALUES (13, N'Şule Akça', N'sule@gmail.com', N'12312435255', N'İstanbul')
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Phone], [Adress]) VALUES (14, N'Sinem Kurt', N'sinem12@gmail.com', N'24235235354', N'Ankara')
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Phone], [Adress]) VALUES (15, N'Ayşe Cantürk', N'ays@hotmail.com', N'24235235325', N'Muş')
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Phone], [Adress]) VALUES (16, N'Ebru  Ersoy', N'ebru@gmail.com', N'23564654756', N'Urfa')
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Phone], [Adress]) VALUES (17, N'Meltem Gül', N'meltem@hotmail.com', N'58456353453', N'Adana')
INSERT [dbo].[Customers] ([CustomerId], [NameSurname], [Mail], [Phone], [Adress]) VALUES (18, N'İrem ', N'irem@gmail.com', N'3435', N'İst')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CustomerId], [ProductId]) VALUES (1, 13, 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [ProductId]) VALUES (3, 15, 3)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [ProductId]) VALUES (4, 16, 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [ProductId]) VALUES (5, 17, 1)
INSERT [dbo].[Orders] ([OrderId], [CustomerId], [ProductId]) VALUES (6, 13, 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [CategoryId]) VALUES (1, N'Dark Ruj', N'125', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [CategoryId]) VALUES (2, N'Nude Pudra', N'56', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [CategoryId]) VALUES (3, N'Farmasi Roll On', N'43', 11)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [CategoryId]) VALUES (4, N'Mac Far Paleti', N'65', 8)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [CategoryId]) VALUES (5, N'Avon Rimel', N'34', 12)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_FK_Orders_Customers]    Script Date: 10.06.2022 18:06:55 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Orders_Customers] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Orders_Products]    Script Date: 10.06.2022 18:06:55 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Orders_Products] ON [dbo].[Orders]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_Categorys]    Script Date: 10.06.2022 18:06:55 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_Categorys] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categorys] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categorys] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categorys]
GO
USE [master]
GO
ALTER DATABASE [CosmeticDb] SET  READ_WRITE 
GO
