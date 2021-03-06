USE [master]
GO
/****** Object:  Database [test]    Script Date: 09.11.2019 3:54:00 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test] SET QUERY_STORE = OFF
GO
USE [test]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 09.11.2019 3:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[name] [varchar](100) NULL,
	[code] [varchar](100) NULL,
	[symbol] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 09.11.2019 3:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[id] [int] NOT NULL,
	[csv] [nchar](20) NOT NULL,
	[xml] [nchar](20) NOT NULL,
	[output] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 09.11.2019 3:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [nvarchar](50) NOT NULL,
	[Amount] [float] NOT NULL,
	[CurrencyCode] [nchar](3) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Status] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Leke', N'ALL', N'Lek')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'USD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Afghanis', N'AFN', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pesos', N'ARS', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Guilders', N'AWG', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'AUD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'New Manats', N'AZN', N'ман')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'BSD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'BBD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rubles', N'BYR', N'p.')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Euro', N'EUR', N'€')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'BZD', N'BZ$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'BMD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Bolivianos', N'BOB', N'$b')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Convertible Marka', N'BAM', N'KM')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pula', N'BWP', N'P')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Leva', N'BGN', N'лв')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Reais', N'BRL', N'R$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'GBP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'BND', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Riels', N'KHR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'CAD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'KYD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pesos', N'CLP', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Yuan Renminbi', N'CNY', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pesos', N'COP', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Colon', N'CRC', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Kuna', N'HRK', N'kn')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pesos', N'CUP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Koruny', N'CZK', N'Kc')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Kroner', N'DKK', N'kr')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pesos', N'DOP ', N'RD$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'XCD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'EGP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Colones', N'SVC', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'FKP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'FJD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Cedis', N'GHC', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'GIP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Quetzales', N'GTQ', N'Q')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'GGP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'GYD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Lempiras', N'HNL', N'L')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'HKD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Forint', N'HUF', N'Ft')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Kronur', N'ISK', N'kr')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rupees', N'INR', N'Rp')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rupiahs', N'IDR', N'Rp')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rials', N'IRR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'IMP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'New Shekels', N'ILS', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'JMD', N'J$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Yen', N'JPY', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'JEP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Tenge', N'KZT', N'лв')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Won', N'KPW', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Won', N'KRW', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Soms', N'KGS', N'лв')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Kips', N'LAK', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Lati', N'LVL', N'Ls')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'LBP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'LRD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Switzerland Francs', N'CHF', N'CHF')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Litai', N'LTL', N'Lt')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Denars', N'MKD', N'ден')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Ringgits', N'MYR', N'RM')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rupees', N'MUR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pesos', N'MXN', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Tugriks', N'MNT', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Meticais', N'MZN', N'MT')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'NAD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rupees', N'NPR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Guilders', N'ANG', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'NZD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Cordobas', N'NIO', N'C$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Nairas', N'NGN', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Krone', N'NOK', N'kr')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rials', N'OMR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rupees', N'PKR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Balboa', N'PAB', N'B/.')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Guarani', N'PYG', N'Gs')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Nuevos Soles', N'PEN', N'S/.')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pesos', N'PHP', N'Php')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Zlotych', N'PLN', N'zl')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rials', N'QAR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'New Lei', N'RON', N'lei')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rubles', N'RUB', N'руб')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'SHP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Riyals', N'SAR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dinars', N'RSD', N'Дин.')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rupees', N'SCR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'SGD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'SBD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Shillings', N'SOS', N'S')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rand', N'ZAR', N'R')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rupees', N'LKR', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Kronor', N'SEK', N'kr')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'SRD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pounds', N'SYP', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'New Dollars', N'TWD', N'NT$')
GO
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Baht', N'THB', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'TTD', N'TT$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Lira', N'TRY', N'TL')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Liras', N'TRL', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dollars', N'TVD', N'$')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Hryvnia', N'UAH', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Pesos', N'UYU', N'$U')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Sums', N'UZS', N'лв')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Bolivares Fuertes', N'VEF', N'Bs')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Dong', N'VND', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Rials', N'YER', N'?')
INSERT [dbo].[Currencies] ([name], [code], [symbol]) VALUES (N'Zimbabwe Dollars', N'ZWD', N'Z$')
INSERT [dbo].[Statuses] ([id], [csv], [xml], [output]) VALUES (1, N'Approved            ', N'Approved            ', N'A')
INSERT [dbo].[Statuses] ([id], [csv], [xml], [output]) VALUES (2, N'Failed              ', N'Rejected            ', N'R')
INSERT [dbo].[Statuses] ([id], [csv], [xml], [output]) VALUES (3, N'Finished            ', N'Done                ', N'D')
INSERT [dbo].[Transactions] ([Id], [Amount], [CurrencyCode], [Date], [Status]) VALUES (N'Inv00001', 200, N'USD', CAST(N'2019-01-23T13:45:10.0000000' AS DateTime2), N'D')
INSERT [dbo].[Transactions] ([Id], [Amount], [CurrencyCode], [Date], [Status]) VALUES (N'Inv00002', 10000, N'EUR', CAST(N'2019-01-24T16:09:15.0000000' AS DateTime2), N'R')
INSERT [dbo].[Transactions] ([Id], [Amount], [CurrencyCode], [Date], [Status]) VALUES (N'Invoice0000001', 1000, N'USD', CAST(N'2019-02-20T12:33:16.0000000' AS DateTime2), N'A')
INSERT [dbo].[Transactions] ([Id], [Amount], [CurrencyCode], [Date], [Status]) VALUES (N'Invoice0000002', 300, N'USD', CAST(N'2019-02-21T02:04:59.0000000' AS DateTime2), N'R')
INSERT [dbo].[Transactions] ([Id], [Amount], [CurrencyCode], [Date], [Status]) VALUES (N'Invoice000000A', 1.5, N'RUB', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'A')
INSERT [dbo].[Transactions] ([Id], [Amount], [CurrencyCode], [Date], [Status]) VALUES (N'Invoice000000B', 5.2, N'USD', CAST(N'2003-03-03T00:00:00.0000000' AS DateTime2), N'R')
INSERT [dbo].[Transactions] ([Id], [Amount], [CurrencyCode], [Date], [Status]) VALUES (N'Invoice000000C', 45.8, N'EUR', CAST(N'2002-02-02T00:00:00.0000000' AS DateTime2), N'D')
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
