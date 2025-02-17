USE [master]
GO
/****** Object:  Database [projee]    Script Date: 20.07.2024 16:50:06 ******/
CREATE DATABASE [projee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\projee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\projee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [projee] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projee] SET ARITHABORT OFF 
GO
ALTER DATABASE [projee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [projee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [projee] SET  MULTI_USER 
GO
ALTER DATABASE [projee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [projee] SET QUERY_STORE = ON
GO
ALTER DATABASE [projee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [projee]
GO
/****** Object:  Table [dbo].[kategoriler]    Script Date: 20.07.2024 16:50:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategoriler](
	[kategori_id] [int] IDENTITY(1,1) NOT NULL,
	[kategori_adi] [nvarchar](50) NOT NULL,
	[aciklama] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_kategoriler] PRIMARY KEY CLUSTERED 
(
	[kategori_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kullanıcılar]    Script Date: 20.07.2024 16:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanıcılar](
	[kullanici_id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NOT NULL,
	[soyad] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[sifre] [nvarchar](50) NOT NULL,
	[adres] [nvarchar](max) NOT NULL,
	[telefon_numarasi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_kullanıcılar] PRIMARY KEY CLUSTERED 
(
	[kullanici_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siparisler]    Script Date: 20.07.2024 16:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparisler](
	[siparis_id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_id] [int] NOT NULL,
	[siparis_tarihi] [nvarchar](50) NOT NULL,
	[tutar] [nvarchar](50) NOT NULL,
	[teslimat_adresi] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_siparisler] PRIMARY KEY CLUSTERED 
(
	[siparis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siparisögeleri]    Script Date: 20.07.2024 16:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparisögeleri](
	[siparis_ögesi_id] [int] IDENTITY(1,1) NOT NULL,
	[siparis_id] [int] NOT NULL,
	[urun_id] [int] NOT NULL,
	[miktar] [nvarchar](50) NOT NULL,
	[fiyat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_siparisögeleri] PRIMARY KEY CLUSTERED 
(
	[siparis_ögesi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ürünekleme]    Script Date: 20.07.2024 16:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ürünekleme](
	[urun_ekleme_id] [int] IDENTITY(1,1) NOT NULL,
	[urun_id] [int] NOT NULL,
	[kullanici_id] [int] NOT NULL,
	[aciklama] [nvarchar](50) NOT NULL,
	[ekleme_tarihi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ürünekleme] PRIMARY KEY CLUSTERED 
(
	[urun_ekleme_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ürünler]    Script Date: 20.07.2024 16:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ürünler](
	[urun_id] [int] IDENTITY(1,1) NOT NULL,
	[kategori_id] [int] NOT NULL,
	[urun_adi] [nvarchar](50) NOT NULL,
	[aciklama] [nvarchar](max) NOT NULL,
	[fiyat] [nvarchar](50) NOT NULL,
	[stok_miktari] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ürünler] PRIMARY KEY CLUSTERED 
(
	[urun_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ürünözellikleri]    Script Date: 20.07.2024 16:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ürünözellikleri](
	[ozellik_id] [int] IDENTITY(1,1) NOT NULL,
	[urun_id] [int] NOT NULL,
	[ozellik_adi] [nvarchar](50) NOT NULL,
	[ozellik_tipi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ürünözellikleri] PRIMARY KEY CLUSTERED 
(
	[ozellik_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD  CONSTRAINT [FK_siparisler_kullanıcılar] FOREIGN KEY([kullanici_id])
REFERENCES [dbo].[kullanıcılar] ([kullanici_id])
GO
ALTER TABLE [dbo].[siparisler] CHECK CONSTRAINT [FK_siparisler_kullanıcılar]
GO
ALTER TABLE [dbo].[siparisögeleri]  WITH CHECK ADD  CONSTRAINT [FK_siparisögeleri_siparisler] FOREIGN KEY([siparis_id])
REFERENCES [dbo].[siparisler] ([siparis_id])
GO
ALTER TABLE [dbo].[siparisögeleri] CHECK CONSTRAINT [FK_siparisögeleri_siparisler]
GO
ALTER TABLE [dbo].[siparisögeleri]  WITH CHECK ADD  CONSTRAINT [FK_siparisögeleri_ürünler] FOREIGN KEY([urun_id])
REFERENCES [dbo].[ürünler] ([urun_id])
GO
ALTER TABLE [dbo].[siparisögeleri] CHECK CONSTRAINT [FK_siparisögeleri_ürünler]
GO
ALTER TABLE [dbo].[ürünekleme]  WITH CHECK ADD  CONSTRAINT [FK_ürünekleme_kullanıcılar] FOREIGN KEY([kullanici_id])
REFERENCES [dbo].[kullanıcılar] ([kullanici_id])
GO
ALTER TABLE [dbo].[ürünekleme] CHECK CONSTRAINT [FK_ürünekleme_kullanıcılar]
GO
ALTER TABLE [dbo].[ürünekleme]  WITH CHECK ADD  CONSTRAINT [FK_ürünekleme_ürünler] FOREIGN KEY([urun_id])
REFERENCES [dbo].[ürünler] ([urun_id])
GO
ALTER TABLE [dbo].[ürünekleme] CHECK CONSTRAINT [FK_ürünekleme_ürünler]
GO
ALTER TABLE [dbo].[ürünler]  WITH CHECK ADD  CONSTRAINT [FK_ürünler_kategoriler] FOREIGN KEY([kategori_id])
REFERENCES [dbo].[kategoriler] ([kategori_id])
GO
ALTER TABLE [dbo].[ürünler] CHECK CONSTRAINT [FK_ürünler_kategoriler]
GO
ALTER TABLE [dbo].[ürünözellikleri]  WITH CHECK ADD  CONSTRAINT [FK_ürünözellikleri_ürünler] FOREIGN KEY([urun_id])
REFERENCES [dbo].[ürünler] ([urun_id])
GO
ALTER TABLE [dbo].[ürünözellikleri] CHECK CONSTRAINT [FK_ürünözellikleri_ürünler]
GO
USE [master]
GO
ALTER DATABASE [projee] SET  READ_WRITE 
GO
