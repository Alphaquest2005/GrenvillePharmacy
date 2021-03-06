USE [master]
GO
/****** Object:  Database [GP-QuickSales-Enterprise]    Script Date: 6/23/2017 9:39:32 AM ******/

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GP-QuickSales-Enterprise].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET ARITHABORT OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET  MULTI_USER 
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET DB_CHAINING OFF 
GO
USE [GP-QuickSales-Enterprise]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [GP-QuickSales-Enterprise]
GO
/****** Object:  Table [dbo].[Batches]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[BatchId] [int] IDENTITY(1,1) NOT NULL,
	[OpeningCash] [float] NOT NULL,
	[EndingCash] [float] NULL,
	[OpeningTime] [datetime] NOT NULL,
	[ClosingTime] [datetime] NULL,
	[TotalTender] [float] NULL,
	[TotalChange] [float] NULL,
	[Status] [nvarchar](max) NOT NULL,
	[StationId] [int] NOT NULL,
	[OpeningCashier] [int] NOT NULL,
	[ClosingCashier] [int] NULL,
	[Sales] [float] NOT NULL,
	[OpenTransactions] [int] NOT NULL,
	[CloseTransactions] [int] NOT NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Batches] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashierLogs]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashierLogs](
	[CashierLogId] [int] IDENTITY(1,1) NOT NULL,
	[MachineName] [nvarchar](max) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LogoutTime] [datetime] NULL,
	[Status] [nvarchar](max) NOT NULL,
	[PersonId] [int] NOT NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_CashierLogs] PRIMARY KEY CLUSTERED 
(
	[CashierLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Address1] [nvarchar](max) NULL,
	[SoftwareName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Motto] [nvarchar](max) NOT NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Description] [nvarchar](1000) NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemNumber] [nvarchar](50) NULL,
	[ItemNotDiscountable] [bit] NULL,
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemLookupCode] [nvarchar](1000) NULL,
	[Department] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[Price] [float] NOT NULL,
	[Cost] [float] NULL,
	[Quantity] [float] NOT NULL,
	[ExtendedDescription] [nvarchar](max) NULL,
	[Inactive] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[SalesTax] [float] NULL,
	[QBItemListID] [nvarchar](max) NULL,
	[UnitOfMeasure] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item_Medicine]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Medicine](
	[SuggestedDosage] [nvarchar](max) NULL,
	[ItemId] [int] NOT NULL,
	[ExpiryDate] [date] NULL,
 CONSTRAINT [PK_Item_Medicine] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item_StockItem]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_StockItem](
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_Item_StockItem] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
	[Salutation] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[InActive] [bit] NULL,
	[DOB] [datetime] NULL,
	[Sex] [bit] NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons_Cashier]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons_Cashier](
	[SPassword] [nvarchar](max) NULL,
	[LoginName] [nvarchar](max) NULL,
	[Id] [int] NOT NULL,
	[Role] [nvarchar](50) NULL,
	[Initials] [nvarchar](3) NULL,
 CONSTRAINT [PK_Persons_Cashier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons_Doctor]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons_Doctor](
	[Code] [nvarchar](max) NOT NULL,
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_Persons_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons_Patient]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons_Patient](
	[Id] [int] NOT NULL,
	[Allergies] [nvarchar](max) NULL,
	[Guardian] [nvarchar](max) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Persons_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QBInventoryItems]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QBInventoryItems](
	[ListID] [nvarchar](50) NOT NULL,
	[ItemDesc2] [nvarchar](max) NULL,
	[ItemName] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[DepartmentCode] [nvarchar](max) NULL,
	[ItemNumber] [int] NOT NULL,
	[TaxCode] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Quantity] [float] NULL,
	[UnitOfMeasure] [nvarchar](50) NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_QBInventoryItems] PRIMARY KEY CLUSTERED 
(
	[ListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Repeats]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repeats](
	[OldTransactionId] [int] NOT NULL,
	[NewTransactionId] [int] NOT NULL,
 CONSTRAINT [PK_Repeats_1] PRIMARY KEY CLUSTERED 
(
	[OldTransactionId] ASC,
	[NewTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stations]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[StationId] [int] IDENTITY(1,1) NOT NULL,
	[StationCode] [nvarchar](max) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ReceiptPrinterName] [nvarchar](max) NOT NULL,
	[MachineName] [nvarchar](max) NOT NULL,
	[PrintServer] [nvarchar](max) NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Stations] PRIMARY KEY CLUSTERED 
(
	[StationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stores]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreCode] [nvarchar](max) NOT NULL,
	[StoreAddress] [nvarchar](max) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[TransactionSeed] [int] NOT NULL,
	[SeedTransaction] [int] NOT NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionBase]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionBase](
	[StationId] [int] NOT NULL,
	[BatchId] [int] NOT NULL,
	[CloseBatchId] [int] NULL,
	[Time] [datetime] NOT NULL,
	[CustomerId] [int] NULL,
	[PharmacistId] [int] NULL,
	[CashierId] [int] NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[StoreCode] [varchar](30) NULL,
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[OpenClose] [bit] NOT NULL,
	[Status] [varchar](50) NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_TransactionBase] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionBase_Prescription]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionBase_Prescription](
	[DoctorId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[TransactionId] [int] NOT NULL,
 CONSTRAINT [PK_TransactionBase_Prescription] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionBase_QuickPrescription]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionBase_QuickPrescription](
	[TransactionId] [int] NOT NULL,
 CONSTRAINT [PK_TransactionBase_QuickPrescription] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionEntryBase]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionEntryBase](
	[StoreID] [int] NOT NULL,
	[TransactionEntryId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Taxable] [bit] NOT NULL,
	[Comment] [nvarchar](255) NULL,
	[TransactionTime] [datetime] NULL,
	[SalesTaxPercent] [float] NOT NULL,
	[Discount] [float] NULL,
	[EntryNumber] [smallint] NULL,
	[EntryTimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_TransactionEntryBase] PRIMARY KEY CLUSTERED 
(
	[TransactionEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionEntryBase_PrescriptionEntry]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionEntryBase_PrescriptionEntry](
	[Dosage] [nvarchar](max) NULL,
	[ExpiryDate] [date] NULL,
	[TransactionEntryId] [int] NOT NULL,
	[Repeat] [int] NULL,
 CONSTRAINT [PK_TransactionEntryBase_PrescriptionEntry] PRIMARY KEY CLUSTERED 
(
	[TransactionEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionEntryItem]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionEntryItem](
	[TransactionEntryId] [int] NOT NULL,
	[QBItemListID] [varchar](50) NOT NULL,
	[ItemNumber] [varchar](50) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ItemId] [int] NULL,
 CONSTRAINT [PK_TransactionEntryItem] PRIMARY KEY CLUSTERED 
(
	[TransactionEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[DoctorsView]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DoctorsView]
AS
SELECT dbo.Persons.FirstName + N' ' + dbo.Persons.LastName AS Name, dbo.Persons_Doctor.Code, dbo.Persons_Doctor.Id AS DoctorId
FROM   dbo.Persons_Doctor INNER JOIN
             dbo.Persons ON dbo.Persons_Doctor.Id = dbo.Persons.Id

GO
/****** Object:  View [dbo].[PatientView]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PatientView]
AS
SELECT dbo.Persons.FirstName + N' ' + dbo.Persons.LastName AS Name, dbo.Persons.PhoneNumber, dbo.Persons.Address, dbo.Persons.Id AS PatientId
FROM   dbo.Persons INNER JOIN
             dbo.Persons_Patient ON dbo.Persons.Id = dbo.Persons_Patient.Id

GO
/****** Object:  View [dbo].[SearchView]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SearchView]
AS
SELECT dbo.TransactionBase.Time, dbo.TransactionBase.TransactionId, dbo.Item.ItemId, ISNULL(dbo.Item.ItemName, N'') + N' | ' + ISNULL(dbo.Item.Description, N'') AS ItemInfo, dbo.PatientView.PatientId, ISNULL(dbo.PatientView.Name, N'') 
             + N' | ' + ISNULL(dbo.PatientView.Address, N'') + N'|' + ISNULL(dbo.PatientView.PhoneNumber, N'') AS PatientInfo, dbo.DoctorsView.DoctorId, ISNULL(dbo.DoctorsView.Name, N'') + N'|' + ISNULL(dbo.DoctorsView.Code, N'') AS DoctorInfo, ISNULL(dbo.PatientView.Name, 
             N'') + N' | ' + ISNULL(dbo.PatientView.Address, N'') + N'|' + ISNULL(dbo.PatientView.PhoneNumber, N'') + N' | ' + ISNULL(dbo.Item.ItemName, N'') + N' | ' + ISNULL(dbo.Item.Description, N'') + '|' + CAST(dbo.TransactionBase.TransactionId AS nvarchar(50)) 
             AS SearchInfo
FROM   dbo.PatientView INNER JOIN
             dbo.DoctorsView INNER JOIN
             dbo.TransactionBase_Prescription INNER JOIN
             dbo.TransactionBase ON dbo.TransactionBase_Prescription.TransactionId = dbo.TransactionBase.TransactionId INNER JOIN
             dbo.TransactionEntryBase ON dbo.TransactionBase.TransactionId = dbo.TransactionEntryBase.TransactionId ON dbo.DoctorsView.DoctorId = dbo.TransactionBase_Prescription.DoctorId ON 
             dbo.PatientView.PatientId = dbo.TransactionBase_Prescription.PatientId INNER JOIN
             dbo.TransactionEntryBase_PrescriptionEntry ON dbo.TransactionEntryBase.TransactionEntryId = dbo.TransactionEntryBase_PrescriptionEntry.TransactionEntryId INNER JOIN
             dbo.TransactionEntryItem ON dbo.TransactionEntryBase.TransactionEntryId = dbo.TransactionEntryItem.TransactionEntryId INNER JOIN
             dbo.Item ON dbo.TransactionEntryItem.ItemId = dbo.Item.ItemId

GO
/****** Object:  View [dbo].[ItemDosage]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ItemDosage]
AS
SELECT TOP (100) PERCENT dbo.TransactionEntryItem.ItemId, dbo.TransactionEntryBase_PrescriptionEntry.Dosage, COUNT(dbo.TransactionEntryBase_PrescriptionEntry.Dosage) AS Count
FROM   dbo.TransactionEntryBase_PrescriptionEntry INNER JOIN
             dbo.TransactionEntryItem ON dbo.TransactionEntryBase_PrescriptionEntry.TransactionEntryId = dbo.TransactionEntryItem.TransactionEntryId
GROUP BY dbo.TransactionEntryItem.ItemId, dbo.TransactionEntryBase_PrescriptionEntry.Dosage
ORDER BY Count DESC

GO
/****** Object:  View [dbo].[TransactionsView]    Script Date: 6/23/2017 9:39:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TransactionsView]
AS
SELECT dbo.TransactionBase.TransactionId, dbo.TransactionBase.Time, dbo.TransactionBase.ReferenceNumber, dbo.TransactionEntryBase.Price * dbo.TransactionEntryBase.Quantity AS TotalSales, dbo.TransactionBase.CustomerId
FROM   dbo.TransactionBase INNER JOIN
             dbo.TransactionEntryBase ON dbo.TransactionBase.TransactionId = dbo.TransactionEntryBase.TransactionId
GROUP BY dbo.TransactionBase.TransactionId, dbo.TransactionBase.Time, dbo.TransactionBase.ReferenceNumber, dbo.TransactionEntryBase.Price * dbo.TransactionEntryBase.Quantity, dbo.TransactionBase.CustomerId

GO
SET IDENTITY_INSERT [dbo].[Batches] ON 

INSERT [dbo].[Batches] ([BatchId], [OpeningCash], [EndingCash], [OpeningTime], [ClosingTime], [TotalTender], [TotalChange], [Status], [StationId], [OpeningCashier], [ClosingCashier], [Sales], [OpenTransactions], [CloseTransactions]) VALUES (1, 100, NULL, CAST(N'2016-07-22T11:44:33.237' AS DateTime), NULL, NULL, NULL, N'Open', 6, 1, NULL, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Batches] OFF
SET IDENTITY_INSERT [dbo].[CashierLogs] ON 

INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (1, N'ALPHAQUEST-PC', CAST(N'2016-07-22T11:44:23.393' AS DateTime), CAST(N'2016-07-22T11:44:44.673' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (2, N'ALPHAQUEST-PC', CAST(N'2016-07-22T16:26:41.403' AS DateTime), CAST(N'2016-07-22T19:01:59.827' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (3, N'ALPHAQUEST-PC', CAST(N'2016-07-22T19:02:00.157' AS DateTime), CAST(N'2016-07-22T19:08:11.097' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (4, N'ALPHAQUEST-PC', CAST(N'2016-07-22T19:08:11.167' AS DateTime), CAST(N'2016-07-22T19:17:19.457' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (5, N'ALPHAQUEST-PC', CAST(N'2016-07-22T19:17:19.537' AS DateTime), CAST(N'2016-07-22T19:21:02.280' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (6, N'ALPHAQUEST-PC', CAST(N'2016-07-22T19:21:02.340' AS DateTime), CAST(N'2016-07-22T19:23:56.907' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (7, N'ALPHAQUEST-PC', CAST(N'2016-07-22T19:23:56.990' AS DateTime), CAST(N'2016-07-22T19:24:45.293' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (8, N'ALPHAQUEST-PC', CAST(N'2016-07-22T19:36:07.080' AS DateTime), CAST(N'2016-07-22T19:45:23.773' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (9, N'ALPHAQUEST-PC', CAST(N'2016-07-22T19:45:23.853' AS DateTime), CAST(N'2016-07-22T20:07:35.687' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (10, N'ALPHAQUEST-PC', CAST(N'2016-07-22T20:07:35.790' AS DateTime), CAST(N'2016-07-22T20:16:30.330' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (11, N'ALPHAQUEST-PC', CAST(N'2016-07-22T20:16:30.430' AS DateTime), CAST(N'2016-07-22T20:17:37.220' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (1002, N'ALPHAQUEST-PC', CAST(N'2016-07-25T11:03:37.420' AS DateTime), CAST(N'2016-07-25T12:41:59.463' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (1003, N'ALPHAQUEST-PC', CAST(N'2016-07-25T12:41:59.657' AS DateTime), CAST(N'2016-07-25T12:51:05.813' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (1004, N'ALPHAQUEST-PC', CAST(N'2016-07-25T12:51:06.023' AS DateTime), CAST(N'2016-07-25T12:52:21.547' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (2002, N'ALPHAQUEST-PC', CAST(N'2016-08-02T11:10:56.497' AS DateTime), CAST(N'2016-08-02T11:12:01.637' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (2003, N'ALPHAQUEST-PC', CAST(N'2016-08-02T11:12:01.873' AS DateTime), CAST(N'2016-08-02T11:14:29.420' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (3002, N'ALPHAQUEST-PC', CAST(N'2017-05-12T07:03:26.347' AS DateTime), CAST(N'2017-05-12T07:03:53.083' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (3003, N'ALPHAQUEST-PC', CAST(N'2017-06-22T11:39:22.140' AS DateTime), CAST(N'2017-06-22T11:39:37.710' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (3004, N'ALPHAQUEST-PC', CAST(N'2017-06-22T13:42:31.413' AS DateTime), CAST(N'2017-06-22T17:56:34.727' AS DateTime), N'LogOut', 1)
INSERT [dbo].[CashierLogs] ([CashierLogId], [MachineName], [LoginTime], [LogoutTime], [Status], [PersonId]) VALUES (3005, N'ALPHAQUEST-PC', CAST(N'2017-06-22T17:56:34.837' AS DateTime), CAST(N'2017-06-22T17:56:59.567' AS DateTime), N'LogOut', 1)
SET IDENTITY_INSERT [dbo].[CashierLogs] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [CompanyName], [Address], [Address1], [SoftwareName], [PhoneNumber], [Motto]) VALUES (1, N'St. David''s Pharmacy', N'Petite Esperance', N'St. Davids''s', N'QicTick', N'444-6177', N'We care about you the most')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson B Complex Plus 100''s', NULL, N'55', NULL, 1, N'064642020154', NULL, NULL, 37.85, NULL, 1, NULL, 0, NULL, 0, N'55', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson Vitamin B6 100mg ', NULL, N'59', NULL, 2, N'064642020222', NULL, NULL, 24.91, NULL, 3, NULL, 0, NULL, 0, N'59', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson Vitamin C 1000mg ', NULL, N'61', NULL, 3, N'064642020789', NULL, NULL, 51.38, NULL, 3, NULL, 0, NULL, 0, N'61', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson Yeast-Free Selenium', NULL, N'62', NULL, 4, N'064642021694', NULL, NULL, 38.64, NULL, 3, NULL, 0, NULL, 0, N'62', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson B 100 Complex 60''s', NULL, N'54', NULL, 5, N'064642021700', NULL, NULL, 47.41, NULL, 3, NULL, 0, NULL, 0, N'54', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson Stamina 100''s', NULL, N'58', NULL, 6, N'064642022066', NULL, NULL, 48.27, NULL, 3, NULL, 0, NULL, 0, N'58', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson Power Vitamins 90''s', NULL, N'57', NULL, 7, N'064642027665', NULL, NULL, 80.5, NULL, 3, NULL, 0, NULL, 0, N'57', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson GL/CHOND MSM', NULL, N'56', NULL, 8, N'064642040367', NULL, NULL, 174.14, NULL, 2, NULL, 0, NULL, 0, N'56', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Hydrocortisone 0.5% Cream', NULL, N'65', NULL, 9, N'805358035625', NULL, NULL, 7.6, NULL, 3, NULL, 0, NULL, 0, N'65', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Ice Analesic Gel', NULL, N'68', NULL, 10, N'805358171439', NULL, NULL, 8.29, NULL, 3, NULL, 0, NULL, 0, N'68', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Hydrocortisone 0.5% Oint ', NULL, N'66', NULL, 11, N'805358235629', NULL, NULL, 9.49, NULL, 3, NULL, 0, NULL, 0, N'66', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Hydrocortisone 1% Oint ', NULL, N'70', NULL, 12, N'805358823567', NULL, NULL, 8.94, NULL, 3, NULL, 0, NULL, 0, N'70', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Acyclovir 5% Cream 12g', NULL, N'73', NULL, 13, N'805358032563', NULL, NULL, 15.67, NULL, 3, NULL, 0, NULL, 0, N'73', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Diclofenac Gel 20g', NULL, N'74', NULL, 14, N'805358356232', NULL, NULL, 5.87, NULL, 6, NULL, 0, NULL, 0, N'74', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Diclofenac Plus Gel 20g', NULL, N'75', NULL, 15, N'805358062355', NULL, NULL, 6.65, NULL, 6, NULL, 0, NULL, 0, N'75', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Diclofenac Plus Gel 50g', NULL, N'77', NULL, 16, N'805358132560', NULL, NULL, 17.68, NULL, 6, NULL, 0, NULL, 0, N'77', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Corsodyl Mint Mouthwash', NULL, N'78', NULL, 17, N'5000347078859', NULL, NULL, 29.95, NULL, 3, NULL, 0, NULL, 0, N'78', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Corsodyl Original Mouthwash', NULL, N'79', NULL, 18, N'5000347078842', NULL, NULL, 29.95, NULL, 3, NULL, 0, NULL, 0, N'79', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lactulose 3.3g/5ml 300ml', NULL, N'80', NULL, 19, N'5015915832030', NULL, NULL, 22.61, NULL, 2, NULL, 0, NULL, 0, N'80', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cetirizine 5mg/5ml Oral Sol', NULL, N'81', NULL, 20, N'5099186003610', NULL, NULL, 15.72, NULL, 2, NULL, 0, NULL, 0, N'81', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bismatrol (bismuth) Liq 8oz', NULL, N'83', NULL, 21, N'309041313095', NULL, NULL, 12.23, NULL, 3, NULL, 0, NULL, 0, N'83', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Piriton 2mg/5ml Syrup', NULL, N'84', NULL, 22, N'5000198522501', NULL, NULL, 31.68, NULL, 3, NULL, 0, NULL, 0, N'84', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Cotton Wool Balls200''s', NULL, N'85', NULL, 23, N'5020061001186', NULL, NULL, 8.95, NULL, 3, NULL, 0, NULL, 0, N'85', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Calamine D Cream 30g', NULL, N'90', NULL, 24, N'805358635627', NULL, NULL, 5.25, NULL, 3, NULL, 0, NULL, 0, N'90', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Lorazepam 2mg ', NULL, N'53', NULL, 25, N'001L', NULL, NULL, 0.5, NULL, 75, NULL, 0, NULL, 0, N'53', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Azithromycin 500mg Caps ', NULL, N'72', NULL, 26, N'002A', NULL, NULL, 7.95, NULL, 50, NULL, 0, NULL, 0, N'72', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Levothyroxine 25mcg Tablets', NULL, N'87', NULL, 27, N'004L', NULL, NULL, 0.8, NULL, 84, NULL, 0, NULL, 0, N'87', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sertraline (Zoloft) 50mg Tab', NULL, N'88', NULL, 28, N'005S', NULL, NULL, 1, NULL, 56, NULL, 0, NULL, 0, N'88', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ranitidine 300mg Tabs 30''s', NULL, N'93', NULL, 29, N'008R', NULL, NULL, 0.6, NULL, 60, NULL, 0, NULL, 0, N'93', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Savlon Antiseptic Cream 15g', NULL, N'94', NULL, 30, N'5010518000015', NULL, NULL, 10.66, NULL, 2, NULL, 0, NULL, 0, N'94', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Milk of Magnesia Mint ', NULL, N'82', NULL, 31, N'805358371433', NULL, NULL, 12.59, NULL, 3, NULL, 0, NULL, 0, N'82', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Hydrocortisone 30g Cream', NULL, N'69', NULL, 32, N'805358214730', NULL, NULL, 8.5, NULL, 3, NULL, 0, NULL, 0, N'69', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Hydrocortisone 1% Cream ', NULL, N'67', NULL, 33, N'805358723560', NULL, NULL, 6.84, NULL, 3, NULL, 0, NULL, 0, N'67', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Calamine Anti-itch Cream', NULL, N'64', NULL, 34, N'805358735624', NULL, NULL, 5, NULL, 3, NULL, 0, NULL, 0, N'64', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Diclofenac Gel 50g', NULL, N'76', NULL, 35, N'805358962358', NULL, NULL, 14.76, NULL, 6, NULL, 0, NULL, 0, N'76', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jamieson Vitamin B12 Tab 100''s', NULL, N'60', NULL, 36, N'064642020444', NULL, NULL, 16.44, NULL, 3, NULL, 0, NULL, 0, N'60', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Logynon ED OCP 28''s', NULL, N'86', NULL, 37, N'003L', NULL, NULL, 15.8, NULL, 6, NULL, 0, NULL, 0, N'86', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Candepin (Clotrimazole) Cream', NULL, N'63', NULL, 38, N'805358835621', NULL, NULL, 12.86, NULL, 3, NULL, 0, NULL, 0, N'63', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Checkpoint Pregnancy Tests 3''s', NULL, N'96', NULL, 39, N'5060100933955', NULL, NULL, 10, NULL, 12, NULL, 0, NULL, 0, N'96', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Contiflo XL Tamsulosin 400mcg', NULL, N'97', NULL, 40, N'0010C', NULL, NULL, 1.45, NULL, 60, NULL, 0, NULL, 0, N'97', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Checkpoint Ovulation Tests', NULL, N'95', NULL, 41, N'009O', NULL, NULL, 15, NULL, 3, NULL, 0, NULL, 0, N'95', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Metformin (Glucophage) 500mg ', NULL, N'100', NULL, 42, N'0012M', NULL, NULL, 0.1, NULL, 504, NULL, 0, NULL, 0, N'100', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Piroxicam Capsules 20mg 28''s', NULL, N'103', NULL, 43, N'0015P', NULL, NULL, 1, NULL, 56, NULL, 0, NULL, 0, N'103', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Metformin (Zanza) 500mg 500''s', NULL, N'99', NULL, 44, N'0011M', NULL, NULL, 0.1, NULL, 500, NULL, 0, NULL, 0, N'99', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Indometacin 25mg Capsules', NULL, N'105', NULL, 45, N'0016I', NULL, NULL, 0.5, NULL, 84, NULL, 0, NULL, 0, N'105', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lisinopril 5mg Tablets', NULL, N'106', NULL, 46, N'0017L', NULL, NULL, 0.25, NULL, 168, NULL, 0, NULL, 0, N'106', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lisinopril 10mg Tablets', NULL, N'107', NULL, 47, N'0018L', NULL, NULL, 0.25, NULL, 168, NULL, 0, NULL, 0, N'107', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lisinopril 20mg Tabs Milpharm', NULL, N'108', NULL, 48, N'0019L', NULL, NULL, 0.3, NULL, 168, NULL, 0, NULL, 0, N'108', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Loratidine (Claritine) 10mg ', NULL, N'109', NULL, 49, N'0020L', NULL, NULL, 0.4, NULL, 90, NULL, 0, NULL, 0, N'109', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Meloxicam (Mobic) 15mg Tabs', NULL, N'110', NULL, 50, N'0021M', NULL, NULL, 0.75, NULL, 30, NULL, 0, NULL, 0, N'110', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cetirizine (Zyrtec) 10mg Tabs', NULL, N'111', NULL, 51, N'0022C', NULL, NULL, 0.4, NULL, 60, NULL, 0, NULL, 0, N'111', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Doxycycline 100mg Capsules', NULL, N'112', NULL, 52, N'0023', NULL, NULL, 0.6, NULL, 100, NULL, 0, NULL, 0, N'112', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'E45 Cream 50g', NULL, N'113', NULL, 53, N'5000167017571', NULL, NULL, 19.56, NULL, 3, NULL, 0, NULL, 0, N'113', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Glyceryl Trinitrate 500mcg Tab', NULL, N'115', NULL, 54, N'0025G', NULL, NULL, 30, NULL, 100, NULL, 0, NULL, 0, N'115', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Macs Albentel 200mg/5ml Susp', NULL, N'116', NULL, 55, N'805358436521', NULL, NULL, 7.22, NULL, 6, NULL, 0, NULL, 0, N'116', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Amlodipine 10mg Tabs', NULL, N'117', NULL, 56, N'0026A', NULL, NULL, 0.3, NULL, 168, NULL, 0, NULL, 0, N'117', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Amoxicillin 125mg/5ml Susp', NULL, N'118', NULL, 57, N'5060292740171', NULL, NULL, 6.95, NULL, 6, NULL, 0, NULL, 0, N'118', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Atenolol 100mg Tablets Bristol', NULL, N'119', NULL, 58, N'0027A', NULL, NULL, 0.3, NULL, 168, NULL, 0, NULL, 0, N'119', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bisoprolol Fumarate 2.5mg Tab', NULL, N'121', NULL, 59, N'0029B', NULL, NULL, 0.35, NULL, 28, NULL, 0, NULL, 0, N'121', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Becoplex with iron Caps 500''s', NULL, N'122', NULL, 60, N'0030b', NULL, NULL, 0.45, NULL, 500, NULL, 0, NULL, 0, N'122', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Micospec BV Cream', NULL, N'124', NULL, 61, N'091595252257', NULL, NULL, 14.82, NULL, 3, NULL, 0, NULL, 0, N'124', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Econaderm HC Cream 15g', NULL, N'123', NULL, 62, N'091595252264', NULL, NULL, 21.06, NULL, 3, NULL, 0, NULL, 0, N'123', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'BNT Ointment 15g', NULL, N'125', NULL, 63, N'091595950122', NULL, NULL, 19.84, NULL, 6, NULL, 0, NULL, 0, N'125', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ketozal 2% Shampoo', NULL, N'127', NULL, 64, N'091595252202', NULL, NULL, 34.02, NULL, 3, NULL, 0, NULL, 0, N'127', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Econaderm 1% Solution', NULL, N'128', NULL, 65, N'091595252295', NULL, NULL, 15.26, NULL, 3, NULL, 0, NULL, 0, N'128', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Predcort DS10mg/5ml Liq 125ml', NULL, N'129', NULL, 66, N'091595860391', NULL, NULL, 53.42, NULL, 2, NULL, 0, NULL, 0, N'129', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Diphenel DM Liquid', NULL, N'130', NULL, 67, N'091595650206', NULL, NULL, 19.11, NULL, 6, NULL, 0, NULL, 0, N'130', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Diphenel Expectorant Liquid', NULL, N'131', NULL, 68, N'091595350106', NULL, NULL, 15.87, NULL, 6, NULL, 0, NULL, 0, N'131', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Histal DC Syrup', NULL, N'132', NULL, 69, N'091595600102', NULL, NULL, 16.35, NULL, 6, NULL, 0, NULL, 0, N'132', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Histal DM Non-Drowsy Syrup', NULL, N'133', NULL, 70, N'091595650107', NULL, NULL, 21.37, NULL, 6, NULL, 0, NULL, 0, N'133', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Histal Allergy Relief Syrup', NULL, N'134', NULL, 71, N'091595450103', NULL, NULL, 15.75, NULL, 6, NULL, 0, NULL, 0, N'134', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Histal EX Cough Syrup', NULL, N'135', NULL, 72, N'091595351103', NULL, NULL, 17.71, NULL, 6, NULL, 0, NULL, 0, N'135', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Histatussin Liquid', NULL, N'136', NULL, 73, N'091595352100', NULL, NULL, 22.9, NULL, 6, NULL, 0, NULL, 0, N'136', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ifa Syrup 125ml', NULL, N'137', NULL, 74, N'091595700109', NULL, NULL, 20.45, NULL, 6, NULL, 0, NULL, 0, N'137', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Paramol Aspirin-free Liquid', NULL, N'138', NULL, 75, N'091595201200', NULL, NULL, 12.2, NULL, 6, NULL, 0, NULL, 0, N'138', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tuscosed Linctus Supressant', NULL, N'139', NULL, 76, N'091595850101', NULL, NULL, 19.84, NULL, 6, NULL, 0, NULL, 0, N'139', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dulcolax 5mg Laxative Tabs', NULL, N'142', NULL, 77, N'0031D', NULL, NULL, 0.46, NULL, 100, NULL, 0, NULL, 0, N'142', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zopiclone (Imigran) 7.5mg Tab', NULL, N'89', NULL, 78, N'006Z', NULL, NULL, 1, NULL, 56, NULL, 0, NULL, 0, N'89', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Micardis 80mg ', NULL, N'144', NULL, 79, N'0033M', NULL, NULL, 4.18, NULL, 84, NULL, 0, NULL, 0, N'144', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Micardis Plus 80mg/12.5mg Tab', NULL, N'143', NULL, 80, N'0032M', NULL, NULL, 4.18, NULL, 84, NULL, 0, NULL, 0, N'143', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Mobic 7.5mg Tablet 30''s', NULL, N'145', NULL, 81, N'0034M', NULL, NULL, 3.7, NULL, 30, NULL, 0, NULL, 0, N'145', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Mobic 15mg Tablet 30''s', NULL, N'146', NULL, 82, N'0035M', NULL, NULL, 4.3, NULL, 30, NULL, 0, NULL, 0, N'146', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Kiddi Pharmaton Syrup 200ml', NULL, N'147', NULL, 83, N'7610939002735', NULL, NULL, 40.99, NULL, 3, NULL, 0, NULL, 0, N'147', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Pharmaton Capsules 100''s', NULL, N'148', NULL, 84, N'0036P', NULL, NULL, 1.65, NULL, 200, NULL, 0, NULL, 0, N'148', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Menthodex Cough Mixture', NULL, N'149', NULL, 85, N'5017848248032', NULL, NULL, 10.76, NULL, 3, NULL, 0, NULL, 0, N'149', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sulphur Ointment B.P 25g', NULL, N'150', NULL, 86, N'0037S', NULL, NULL, 6.9, NULL, 3, NULL, 0, NULL, 0, N'150', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aggrenox 200mg/25mg Capsules ', NULL, N'151', NULL, 87, N'0038A', NULL, NULL, 4.42, NULL, 60, NULL, 0, NULL, 0, N'151', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bisolvon Adult 8mg/5ml Elixir', NULL, N'153', NULL, 88, N'058341620012', NULL, NULL, 47.69, NULL, 3, NULL, 0, NULL, 0, N'153', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bisolvon Pediatric 4mg/5ml ', NULL, N'154', NULL, 89, N'058341620036', NULL, NULL, 38.94, NULL, 3, NULL, 0, NULL, 0, N'154', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Buscopan 5mg Tablets', NULL, N'155', NULL, 90, N'0040B', NULL, NULL, 1.1, NULL, 100, NULL, 0, NULL, 0, N'155', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Buscopan Plus 10/500mg 20''s', NULL, N'156', NULL, 91, N'0041B', NULL, NULL, 1.45, NULL, 60, NULL, 0, NULL, 0, N'156', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Paracetamol 500mg Tabs 100''s', NULL, N'157', NULL, 92, N'5024071210125', NULL, NULL, 7.2, NULL, 6, NULL, 0, NULL, 0, N'157', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Touch and Go Solution', NULL, N'158', NULL, 93, N'0042T', NULL, NULL, 10.45, NULL, 3, NULL, 0, NULL, 0, N'158', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cloxacillin 125mg/5ml Susp', NULL, N'159', NULL, 94, N'0043C', NULL, NULL, 16, NULL, 3, NULL, 0, NULL, 0, N'159', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Griseofulvin 125mg Tabs 100''s', NULL, N'160', NULL, 95, N'0044G', NULL, NULL, 0.25, NULL, 1000, NULL, 0, NULL, 0, N'160', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Glycerin 28ml', NULL, N'161', NULL, 96, N'5017848250714', NULL, NULL, 7.19, NULL, 3, NULL, 0, NULL, 0, N'161', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Baby Gripe Mixture 100ml', NULL, N'163', NULL, 97, N'5017848249022', NULL, NULL, 9.25, NULL, 3, NULL, 0, NULL, 0, N'163', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Baby Cough Syrup', NULL, N'164', NULL, 98, N'5017848249053', NULL, NULL, 12.1, NULL, 3, NULL, 0, NULL, 0, N'164', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Children''s Cough Syrup', NULL, N'165', NULL, 99, N'5017848250455', NULL, NULL, 11.5, NULL, 3, NULL, 0, NULL, 0, N'165', NULL, NULL)
GO
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Castor Oil 70ml', NULL, N'166', NULL, 100, N'5017848250387', NULL, NULL, 7.84, NULL, 3, NULL, 0, NULL, 0, N'166', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bell''s Nerve & Bone Liniment', NULL, N'171', NULL, 101, N'5017848249589', NULL, NULL, 9.75, NULL, 3, NULL, 0, NULL, 0, N'171', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Clove Oil', NULL, N'172', NULL, 102, N'50621903', NULL, NULL, 10.99, NULL, 3, NULL, 0, NULL, 0, N'172', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Paracetamol 120mg Elixir', NULL, N'173', NULL, 103, N'5017848250622', NULL, NULL, 6.92, NULL, 6, NULL, 0, NULL, 0, N'173', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Vitamin C 100mg Syrup', NULL, N'174', NULL, 104, N'5017848249091', NULL, NULL, 11.92, NULL, 3, NULL, 0, NULL, 0, N'174', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'WATE-ON Emulsion 450ml', NULL, N'176', NULL, 105, N'0045W', NULL, NULL, 25.73, NULL, 3, NULL, 0, NULL, 0, N'176', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dentiplus Original M/Wash 500m', NULL, N'177', NULL, 106, N'5020535003081', NULL, NULL, 9.63, NULL, 3, NULL, 0, NULL, 0, N'177', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dentiplus Cool Burst M/wash ', NULL, N'178', NULL, 107, N'5020535003067', NULL, NULL, 9.63, NULL, 3, NULL, 0, NULL, 0, N'178', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Salve Antiseptic Liquid', NULL, N'180', NULL, 108, N'701929019073', NULL, NULL, 6.37, NULL, 3, NULL, 0, NULL, 0, N'180', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Olbas for Children 10ml', NULL, N'181', NULL, 109, N'5000477894084', NULL, NULL, 10.56, NULL, 3, NULL, 0, NULL, 0, N'181', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dica Antacid Tablets 30''s', NULL, N'183', NULL, 110, N'091595300231', NULL, NULL, 25.25, NULL, 3, NULL, 0, NULL, 0, N'183', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Medigel 15g', NULL, N'184', NULL, 111, N'5011784030126', NULL, NULL, 13.12, NULL, 3, NULL, 0, NULL, 0, N'184', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Major-Prep Hemorrhoidal Oint', NULL, N'185', NULL, 112, N'309046319023', NULL, NULL, 16.47, NULL, 3, NULL, 0, NULL, 0, N'185', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'MajoTriple Antibiotic Ointment', NULL, N'186', NULL, 113, N'309040734365', NULL, NULL, 12.83, NULL, 3, NULL, 0, NULL, 0, N'186', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zinc Oxide Ointment', NULL, N'187', NULL, 114, N'616784119014', NULL, NULL, 7.6, NULL, 3, NULL, 0, NULL, 0, N'187', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Major Opti-Clear Eye Drops', NULL, N'188', NULL, 115, N'309046334354', NULL, NULL, 11.67, NULL, 3, NULL, 0, NULL, 0, N'188', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Major 12-Hr Nasal Decon Spray', NULL, N'189', NULL, 116, N'309045711309', NULL, NULL, 10.84, NULL, 3, NULL, 0, NULL, 0, N'189', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Digital Thermometer', NULL, N'190', NULL, 117, N'767056156913', NULL, NULL, 19.4, NULL, 3, NULL, 0, NULL, 0, N'190', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bottles CRC 2oz', NULL, N'193', NULL, 118, N'0048B', NULL, NULL, 1.36, NULL, 6, NULL, 0, NULL, 0, N'193', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bottles CRC 4oz', NULL, N'194', NULL, 119, N'0049B', NULL, NULL, 1.5, NULL, 6, NULL, 0, NULL, 0, N'194', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Major Loperamide 2mg Tablets', NULL, N'195', NULL, 120, N'309047725120', NULL, NULL, 9.5, NULL, 3, NULL, 0, NULL, 0, N'195', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Citrate of Magnesium Cherry', NULL, N'196', NULL, 121, N'079068001090', NULL, NULL, 9.3, NULL, 3, NULL, 0, NULL, 0, N'196', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sterile Gauze Pad 4x4 100''s', NULL, N'198', NULL, 122, N'616784335414', NULL, NULL, 0.45, NULL, 100, NULL, 0, NULL, 0, N'198', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ferrous Sulphate 325mg Tabs', NULL, N'197', NULL, 123, N'0050F', NULL, NULL, 0.15, NULL, 1000, NULL, 0, NULL, 0, N'197', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Major Aspirin singles 81mg Tab', NULL, N'200', NULL, 124, N'0051A', NULL, NULL, 0.1, NULL, 1000, NULL, 0, NULL, 0, N'200', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Banophen  Cream 2%      ', NULL, N'201', NULL, 125, N'309045354315', NULL, NULL, 12.17, NULL, 3, NULL, 0, NULL, 0, N'201', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Banophen  25mg Capsules', NULL, N'202', NULL, 126, N'309042035248', NULL, NULL, 8.38, NULL, 3, NULL, 0, NULL, 0, N'202', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bismatrol 262mg Chewables', NULL, N'203', NULL, 127, N'309041315464', NULL, NULL, 14.67, NULL, 3, NULL, 0, NULL, 0, N'203', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Banophen 12.5mg Allergy Liquid', NULL, N'204', NULL, 128, N'309041228009', NULL, NULL, 7.67, NULL, 3, NULL, 0, NULL, 0, N'204', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Major Bisacodyl 5mg Tablets', NULL, N'205', NULL, 129, N'309047927173', NULL, NULL, 7.84, NULL, 3, NULL, 0, NULL, 0, N'205', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Olbas Oil 28ml', NULL, N'206', NULL, 130, N'5000477000102', NULL, NULL, 18.58, NULL, 3, NULL, 0, NULL, 0, N'206', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Galpharm Cytocalm  Granules', NULL, N'207', NULL, 131, N'5017353504937', NULL, NULL, 14.17, NULL, 3, NULL, 0, NULL, 0, N'207', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Flu-Max All in One Sachets', NULL, N'208', NULL, 132, N'0052F', NULL, NULL, 1.75, NULL, 10, NULL, 0, NULL, 0, N'208', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Flu-Max all in One Sachets', NULL, N'209', NULL, 133, N'5017353504951', NULL, NULL, 17.51, NULL, 2, NULL, 0, NULL, 0, N'209', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Galpharm Nightcalm 50mg Tabs', NULL, N'210', NULL, 134, N'5017353504104', NULL, NULL, 28.82, NULL, 3, NULL, 0, NULL, 0, N'210', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Galpharm Paracetamol 500mg Tab', NULL, N'211', NULL, 135, N'5017353500809', NULL, NULL, 2.17, NULL, 3, NULL, 0, NULL, 0, N'211', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Galpharm Cleansing Eye Wash', NULL, N'212', NULL, 136, N'5017353503336', NULL, NULL, 14.06, NULL, 3, NULL, 0, NULL, 0, N'212', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Olbas oil 10ml', NULL, N'182', NULL, 137, N'5000477893087', NULL, NULL, 11.08, NULL, 3, NULL, 0, NULL, 0, N'182', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ibuprofen 200mg Tablets', NULL, N'213', NULL, 138, N'5017353502469', NULL, NULL, 8, NULL, 3, NULL, 0, NULL, 0, N'213', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cefadroxil 500mg Caps 100''s', NULL, N'214', NULL, 139, N'0053C', NULL, NULL, 2, NULL, 100, NULL, 0, NULL, 0, N'214', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Histatussin DM Sugar Free', NULL, N'215', NULL, 140, N'091595352247', NULL, NULL, 22.9, NULL, 6, NULL, 0, NULL, 0, N'215', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Valsartan HCl 160/25mg ', NULL, N'217', NULL, 141, N'0055S', NULL, NULL, 1.3, NULL, 56, NULL, 0, NULL, 0, N'217', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Simvastatin 20mg Tablets', NULL, N'216', NULL, 142, N'0054S', NULL, NULL, 0.35, NULL, 84, NULL, 0, NULL, 0, N'216', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Simvastatin 40mg Tablets', NULL, N'218', NULL, 143, N'0056S', NULL, NULL, 0.5, NULL, 84, NULL, 0, NULL, 0, N'218', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Valsartan HCl 160/12.5mg Tabs', NULL, N'219', NULL, 144, N'0057V', NULL, NULL, 1.05, NULL, 56, NULL, 0, NULL, 0, N'219', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Spironolactone 100mg Tablets', NULL, N'220', NULL, 145, N'0058S', NULL, NULL, 0.8, NULL, 56, NULL, 0, NULL, 0, N'220', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Stilnoct 5mg (Zolpidem) Tab', NULL, N'221', NULL, 146, N'0059S', NULL, NULL, 1.76, NULL, 28, NULL, 0, NULL, 0, N'221', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Stilnoct 10mg (Zolpidem) Tab', NULL, N'222', NULL, 147, N'0060S', NULL, NULL, 2.56, NULL, 28, NULL, 0, NULL, 0, N'222', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vicks Sinex Nasal Spray', NULL, N'223', NULL, 148, N'5011321365261', NULL, NULL, 26.35, NULL, 3, NULL, 0, NULL, 0, N'223', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Meloxicam (Mobic)  7.5mg Tab', NULL, N'224', NULL, 149, N'0061M', NULL, NULL, 0.5, NULL, 30, NULL, 0, NULL, 0, N'224', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Furosemide 40mg Tab Bristol', NULL, N'225', NULL, 150, N'5060013940606', NULL, NULL, 4.2, NULL, 2, NULL, 0, NULL, 0, N'225', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ibuprofen 800mg Tab 500''s', NULL, N'227', NULL, 151, N'0062I', NULL, NULL, 0.5, NULL, 500, NULL, 0, NULL, 0, N'227', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ibuprofen 600mg Tab 500''s', NULL, N'226', NULL, 152, N'0064I', NULL, NULL, 0.35, NULL, 500, NULL, 0, NULL, 0, N'226', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ibuprofen 400mg Tab 500''s', NULL, N'228', NULL, 153, N'0063I', NULL, NULL, 0.35, NULL, 500, NULL, 0, NULL, 0, N'228', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sterile Latex Gloves Small 100', NULL, N'229', NULL, 154, N'616784233628', NULL, NULL, 34.16, NULL, 2, NULL, 0, NULL, 0, N'229', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sterile Latex Gloves Med 100''s', NULL, N'230', NULL, 155, N'616784233727', NULL, NULL, 34.16, NULL, 2, NULL, 0, NULL, 0, N'230', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sterile Latex Gloves Lg 100''s', NULL, N'231', NULL, 156, N'616784233826', NULL, NULL, 34.16, NULL, 2, NULL, 0, NULL, 0, N'231', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vitamin  A&D Ointment 2oz', NULL, N'232', NULL, 157, N'354162000027', NULL, NULL, 12.18, NULL, 3, NULL, 0, NULL, 0, N'232', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Losartan Potassium 100mg Tab', NULL, N'233', NULL, 158, N'0065L', NULL, NULL, 0.6, NULL, 84, NULL, 0, NULL, 0, N'233', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Prochlorperazine Stemetil 5mg ', NULL, N'234', NULL, 159, N'0066P', NULL, NULL, 0.5, NULL, 84, NULL, 0, NULL, 0, N'234', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Prozac 20mg Capsules', NULL, N'235', NULL, 160, N'5014602300616', NULL, NULL, 1.5, NULL, 30, NULL, 0, NULL, 0, N'235', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Oral rehydration Salts 100''s', NULL, N'236', NULL, 161, N'0068O', NULL, NULL, 1, NULL, 100, NULL, 0, NULL, 0, N'236', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Betnovate Scalp Application ', NULL, N'237', NULL, 162, N'5000123103614', NULL, NULL, 65.66, NULL, 1, NULL, 0, NULL, 0, N'237', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Simvastin 40mg Tablets', NULL, N'238', NULL, 163, N'0067S', NULL, NULL, 0.25, NULL, 84, NULL, 0, NULL, 0, N'238', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Betnovate Ointment 0.1% 30g', NULL, N'239', NULL, 164, N'5099211004452', NULL, NULL, 28.56, NULL, 3, NULL, 0, NULL, 0, N'239', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Adult Swim Plugs 2pr', NULL, N'241', NULL, 165, N'5010058039223', NULL, NULL, 16.95, NULL, 3, NULL, 0, NULL, 0, N'241', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'3M EARfit Earplugs Soft 1pr', NULL, N'240', NULL, 166, N'4046719512034', NULL, NULL, 13.34, NULL, 3, NULL, 0, NULL, 0, N'240', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Enalapril 20mg Tablets', NULL, N'243', NULL, 167, N'0074E', NULL, NULL, 0.2, NULL, 84, NULL, 0, NULL, 0, N'243', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gliclazide 80mg Tablets 28''s', NULL, N'244', NULL, 168, N'0070G', NULL, NULL, 0.35, NULL, 84, NULL, 0, NULL, 0, N'244', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lansoprazole 30mg Capsules', NULL, N'245', NULL, 169, N'0071L', NULL, NULL, 1, NULL, 84, NULL, 0, NULL, 0, N'245', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Losartan Potassium 25mg Tabs', NULL, N'246', NULL, 170, N'0072L', NULL, NULL, 0.4, NULL, 84, NULL, 0, NULL, 0, N'246', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Losartan Potassium 50mg Tabs', NULL, N'247', NULL, 171, N'0073L', NULL, NULL, 0.5, NULL, 84, NULL, 0, NULL, 0, N'247', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vagisil Medicated Creme 2%', NULL, N'248', NULL, 172, N'5010934002471', NULL, NULL, 33.93, NULL, 3, NULL, 0, NULL, 0, N'248', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Normal Saline Nose Drops', NULL, N'249', NULL, 173, N'50678853', NULL, NULL, 5.5, NULL, 3, NULL, 0, NULL, 0, N'249', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Waxsol Ear Drops', NULL, N'250', NULL, 174, N'5060035247424', NULL, NULL, 24.7, NULL, 3, NULL, 0, NULL, 0, N'250', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cerumol Ear Drops 11ml', NULL, N'251', NULL, 175, N'5012778001412', NULL, NULL, 22.93, NULL, 3, NULL, 0, NULL, 0, N'251', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Genticin Eye/ear Drops', NULL, N'252', NULL, 176, N'5060064171677', NULL, NULL, 29.26, NULL, 3, NULL, 0, NULL, 0, N'252', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Abidec M/V Drops 25ml', NULL, N'253', NULL, 177, N'5012616173004', NULL, NULL, 31.8, NULL, 3, NULL, 0, NULL, 0, N'253', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dicloflex 50mg (diclofenac) ', NULL, N'254', NULL, 178, N'0075D', NULL, NULL, 0.5, NULL, 84, NULL, 0, NULL, 0, N'254', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Allopurinol 300mg Tablets', NULL, N'255', NULL, 179, N'0076A', NULL, NULL, 0.2, NULL, 84, NULL, 0, NULL, 0, N'255', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ramipril 10mg Capsules', NULL, N'257', NULL, 180, N'0078R', NULL, NULL, 0.45, NULL, 84, NULL, 0, NULL, 0, N'257', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Clarithromycin 250mg Tablets', NULL, N'258', NULL, 181, N'0079C', NULL, NULL, 1.3, NULL, 42, NULL, 0, NULL, 0, N'258', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Betnovate 0.1% Cream 30g', NULL, N'261', NULL, 182, N'5099211002472', NULL, NULL, 31.3, NULL, 3, NULL, 0, NULL, 0, N'261', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Clotrimazole 1% Cream 20g', NULL, N'262', NULL, 183, N'5016695290089', NULL, NULL, 9.17, NULL, 3, NULL, 0, NULL, 0, N'262', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Itraconazole 100mg Capsules', NULL, N'256', NULL, 184, N'0077I', NULL, NULL, 3.9, NULL, 45, NULL, 0, NULL, 0, N'256', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Clopidogrel 75mg F/C Tablets', NULL, N'260', NULL, 185, N'0081C', NULL, NULL, 1, NULL, 84, NULL, 0, NULL, 0, N'260', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Cloxacillin 250mg Caps', NULL, N'264', NULL, 186, N'0083C', NULL, NULL, 0.5, NULL, 100, NULL, 0, NULL, 0, N'264', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Diazepam 5mg Tabs 1000''s', NULL, N'265', NULL, 187, N'0084D', NULL, NULL, 0.25, NULL, 1000, NULL, 0, NULL, 0, N'265', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Doxycycline 100mg Capsules', NULL, N'267', NULL, 188, N'0086D', NULL, NULL, 0.6, NULL, 100, NULL, 0, NULL, 0, N'267', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Erythromycin 500mg Tablets', NULL, N'269', NULL, 189, N'0089E', NULL, NULL, 1.1, NULL, 100, NULL, 0, NULL, 0, N'269', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Folic Acid 5mg Tablets', NULL, N'270', NULL, 190, N'0086F', NULL, NULL, 0.1, NULL, 1000, NULL, 0, NULL, 0, N'270', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Erythromycin 250mg Tablets', NULL, N'268', NULL, 191, N'0088E', NULL, NULL, 1, NULL, 100, NULL, 0, NULL, 0, N'268', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tenormin 50mg Tablets', NULL, N'272', NULL, 192, N'0090T', NULL, NULL, 1.3, NULL, 56, NULL, 0, NULL, 0, N'272', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zestoretic 20 Tablet', NULL, N'273', NULL, 193, N'0091Z', NULL, NULL, 2.3, NULL, 56, NULL, 0, NULL, 0, N'273', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zestril 10mg Tablets', NULL, N'274', NULL, 194, N'0092Z', NULL, NULL, 1.05, NULL, 84, NULL, 0, NULL, 0, N'274', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zestril 20mg Tablets', NULL, N'275', NULL, 195, N'0093Z', NULL, NULL, 1.36, NULL, 84, NULL, 0, NULL, 0, N'275', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Cotton Buds 100''s', NULL, N'276', NULL, 196, N'5020061000059', NULL, NULL, 3.45, NULL, 3, NULL, 0, NULL, 0, N'276', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Koff & Kold Syrup', NULL, N'277', NULL, 197, N'5020061000271', NULL, NULL, 9.45, NULL, 3, NULL, 0, NULL, 0, N'277', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tears Naturale Forte Eye Drops', NULL, N'278', NULL, 198, N'300650426220', NULL, NULL, 22.86, NULL, 2, NULL, 0, NULL, 0, N'278', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Naphcon A Eye Drops 15ml', NULL, N'279', NULL, 199, N'300650085151', NULL, NULL, 26.16, NULL, 2, NULL, 0, NULL, 0, N'279', NULL, NULL)
GO
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Optifree Express Solution', NULL, N'280', NULL, 200, N'300652132044', NULL, NULL, 27.95, NULL, 3, NULL, 0, NULL, 0, N'280', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nasonex 0.05%  Nasal Spray ', NULL, N'281', NULL, 201, N'0093N', NULL, NULL, 75, NULL, 2, NULL, 0, NULL, 0, N'281', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vermox Suspension 20mg/ml', NULL, N'282', NULL, 202, N'7501109910168', NULL, NULL, 23.6, NULL, 3, NULL, 0, NULL, 0, N'282', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Claritine Loratidine 10mg Tab', NULL, N'283', NULL, 203, N'0094C', NULL, NULL, 2.65, NULL, 60, NULL, 0, NULL, 0, N'283', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nexium 20mg (Esomeprazole) Tab', NULL, N'285', NULL, 204, N'0096N', NULL, NULL, 7.35, NULL, 28, NULL, 0, NULL, 0, N'285', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Crestor 20mg RosuvastatinTab', NULL, N'284', NULL, 205, N'0095C', NULL, NULL, 6.67, NULL, 28, NULL, 0, NULL, 0, N'284', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Plendil 5mg (Felodipine) Tab', NULL, N'286', NULL, 206, N'0097P', NULL, NULL, 1.56, NULL, 30, NULL, 0, NULL, 0, N'286', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tenoretic 100/25mg Tablets', NULL, N'287', NULL, 207, N'0098T', NULL, NULL, 3.85, NULL, 28, NULL, 0, NULL, 0, N'287', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Crestor 5mg (Rosuvastatin) Tab', NULL, N'288', NULL, 208, N'0099C', NULL, NULL, 4.52, NULL, 28, NULL, 0, NULL, 0, N'288', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nezium 40mg (Esomeprazole) Tab', NULL, N'289', NULL, 209, N'0100N', NULL, NULL, 9.85, NULL, 28, NULL, 0, NULL, 0, N'289', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Plendil 10mg (Felodipine) Tab', NULL, N'290', NULL, 210, N'0101P', NULL, NULL, 2.26, NULL, 30, NULL, 0, NULL, 0, N'290', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Daflon 500mg Tablets', NULL, N'291', NULL, 211, N'0102D', NULL, NULL, 1.3, NULL, 90, NULL, 0, NULL, 0, N'291', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Natrilix SR (Indapamide) 1.5mg', NULL, N'292', NULL, 212, N'0103N', NULL, NULL, 1, NULL, 60, NULL, 0, NULL, 0, N'292', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Diamicron MR (Gliclazide 60mg ', NULL, N'293', NULL, 213, N'0104D', NULL, NULL, 1.2, NULL, 90, NULL, 0, NULL, 0, N'293', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Glucotrol XL (glipizide) 5mg', NULL, N'294', NULL, 214, N'0105G', NULL, NULL, 1.5, NULL, 100, NULL, 0, NULL, 0, N'294', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dilantin 100mg Capsules', NULL, N'295', NULL, 215, N'0106D', NULL, NULL, 1.3, NULL, 100, NULL, 0, NULL, 0, N'295', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lipitor (Atorvastatin) 10mg ', NULL, N'296', NULL, 216, N'0107L', NULL, NULL, 4.2, NULL, 20, NULL, 0, NULL, 0, N'296', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Glucotrol XL (glipizide) 10mg', NULL, N'297', NULL, 217, N'0108G', NULL, NULL, 2.75, NULL, 100, NULL, 0, NULL, 0, N'297', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vermox 100mg Tablets 6''s', NULL, N'298', NULL, 218, N'7501109910076 ', NULL, NULL, 15.6, NULL, 3, NULL, 0, NULL, 0, N'298', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vermox 500mg Tablet 1pc', NULL, N'299', NULL, 219, N'7501109910069', NULL, NULL, 20.43, NULL, 6, NULL, 0, NULL, 0, N'299', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sporasec Capsules 12''s', NULL, N'300', NULL, 220, N'0109S', NULL, NULL, 8.75, NULL, 24, NULL, 0, NULL, 0, N'300', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Carvedilol 6.25mg Tablets', NULL, N'302', NULL, 221, N'0111C', NULL, NULL, 0.45, NULL, 56, NULL, 0, NULL, 0, N'302', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Carvedilol 12.5mg Tablets', NULL, N'303', NULL, 222, N'0112C', NULL, NULL, 0.5, NULL, 56, NULL, 0, NULL, 0, N'303', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Candid B Cream 15g', NULL, N'304', NULL, 223, N'8904091100217', NULL, NULL, 15.28, NULL, 6, NULL, 0, NULL, 0, N'304', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Acetazolamide 250mg Tab', NULL, N'305', NULL, 224, N'0113A', NULL, NULL, 0.3, NULL, 100, NULL, 0, NULL, 0, N'305', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Timolol 0.5% Eye Drops', NULL, N'306', NULL, 225, N'0114T', NULL, NULL, 7, NULL, 6, NULL, 0, NULL, 0, N'306', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Xalatan 0.05% Eye Drops', NULL, N'307', NULL, 226, N'0115X', NULL, NULL, 85, NULL, 3, NULL, 0, NULL, 0, N'307', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Xalacom Eye Drops', NULL, N'308', NULL, 227, N'0116X', NULL, NULL, 118, NULL, 3, NULL, 0, NULL, 0, N'308', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ventolin Evohaler 100mcg', NULL, N'309', NULL, 228, N'5000124439750', NULL, NULL, 18.76, NULL, 6, NULL, 0, NULL, 0, N'309', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ventolin S/F Syrup 2mg/5ml', NULL, N'310', NULL, 229, N'5000124430832', NULL, NULL, 14, NULL, 3, NULL, 0, NULL, 0, N'310', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Steroply 15cmx4m conf/band', NULL, N'311', NULL, 230, N'5020581244902', NULL, NULL, 3.35, NULL, 3, NULL, 0, NULL, 0, N'311', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sterocrepe 15x4.5m Crepe/band', NULL, N'312', NULL, 231, N'5020581244735', NULL, NULL, 5.95, NULL, 3, NULL, 0, NULL, 0, N'312', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sterocrepe 5x4.5m Crepe/ band', NULL, N'313', NULL, 232, N'5020581244704', NULL, NULL, 4.6, NULL, 3, NULL, 0, NULL, 0, N'313', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Trusopt 2% Eye Drops', NULL, N'314', NULL, 233, N'5013945165302', NULL, NULL, 87.3, NULL, 3, NULL, 0, NULL, 0, N'314', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Betoptic S 0.25% Eye Drops ', NULL, N'315', NULL, 234, N'300650246101', NULL, NULL, 38.95, NULL, 3, NULL, 0, NULL, 0, N'315', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lotrisone Cream', NULL, N'317', NULL, 235, N'0122L', NULL, NULL, 57.3, NULL, 3, NULL, 0, NULL, 0, N'317', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Elocon 0.1% Cream ', NULL, N'316', NULL, 236, N'5012376019710', NULL, NULL, 31.4, NULL, 1, NULL, 0, NULL, 0, N'316', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Warfarin 5mg Tablets', NULL, N'319', NULL, 237, N'0117W', NULL, NULL, 0.2, NULL, 84, NULL, 0, NULL, 0, N'319', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Warfarin 1mg Tablets', NULL, N'321', NULL, 238, N'0119W', NULL, NULL, 0.15, NULL, 84, NULL, 0, NULL, 0, N'321', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Celebrex 200mg Capsules', NULL, N'322', NULL, 239, N'0120C', NULL, NULL, 5.87, NULL, 30, NULL, 0, NULL, 0, N'322', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Warfarin 3mg Tablets', NULL, N'323', NULL, 240, N'0121W', NULL, NULL, 0.15, NULL, 84, NULL, 0, NULL, 0, N'323', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sulphur Powder 20g', NULL, N'325', NULL, 241, N'638368121206', NULL, NULL, 4.85, NULL, 6, NULL, 0, NULL, 0, N'325', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Levothyroxine 50mcg Tablets', NULL, N'326', NULL, 242, N'0124L', NULL, NULL, 13.15, NULL, 6, NULL, 0, NULL, 0, N'326', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Trental 400mg Tablet', NULL, N'327', NULL, 243, N'0125T', NULL, NULL, 1.4, NULL, 100, NULL, 0, NULL, 0, N'327', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Trihemic 600mg tablet', NULL, N'328', NULL, 244, N'0126T', NULL, NULL, 0.86, NULL, 180, NULL, 0, NULL, 0, N'328', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tritace 2.5mg (Ramipril) Tab', NULL, N'329', NULL, 245, N'0127T', NULL, NULL, 0.85, NULL, 60, NULL, 0, NULL, 0, N'329', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tritace 5mg (Ramipril) Tab', NULL, N'330', NULL, 246, N'0128T', NULL, NULL, 1.25, NULL, 120, NULL, 0, NULL, 0, N'330', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tums Extra Strength 750 Fruit', NULL, N'331', NULL, 247, N'307660739234', NULL, NULL, 14.55, NULL, 3, NULL, 0, NULL, 0, N'331', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tylenol Extra Strength Caplets', NULL, N'332', NULL, 248, N'300450449054', NULL, NULL, 24.1, NULL, 3, NULL, 0, NULL, 0, N'332', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ventolin Inhaler 100mcg 200ds', NULL, N'333', NULL, 249, N'0129V', NULL, NULL, 17.95, NULL, 24, NULL, 0, NULL, 0, N'333', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Levothyroxine 100mcg Tablets', NULL, N'324', NULL, 250, N'0123L', NULL, NULL, 17.85, NULL, 6, NULL, 0, NULL, 0, N'324', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sensodyne Cool Gel 4oz', NULL, N'334', NULL, 251, N'310158082040', NULL, NULL, 18.4, NULL, 3, NULL, 0, NULL, 0, N'334', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sensodyne Fresh Mint', NULL, N'336', NULL, 252, N'310158081111', NULL, NULL, 23.6, NULL, 3, NULL, 0, NULL, 0, N'336', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sensodyne Original Flavour 4oz', NULL, N'335', NULL, 253, N'310158077046', NULL, NULL, 18.4, NULL, 6, NULL, 0, NULL, 0, N'335', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sensodyne Extra Whitening 4oz', NULL, N'337', NULL, 254, N'310158084044', NULL, NULL, 20.95, NULL, 3, NULL, 0, NULL, 0, N'337', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aquafresh Flex T''brush Soft', NULL, N'338', NULL, 255, N'7501065012029', NULL, NULL, 6.15, NULL, 6, NULL, 0, NULL, 0, N'338', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aquafresh Flex T''brush Kid Sft', NULL, N'339', NULL, 256, N'6001424130308', NULL, NULL, 6.15, NULL, 6, NULL, 0, NULL, 0, N'339', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Septol Soap', NULL, N'340', NULL, 257, N'024602000534', NULL, NULL, 4.75, NULL, 12, NULL, 0, NULL, 0, N'340', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sexovit Fort Tablets 30''s', NULL, N'342', NULL, 258, N'5019781015405', NULL, NULL, 63.1, NULL, 2, NULL, 0, NULL, 0, N'342', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sofradex Eye/Ear Drops', NULL, N'343', NULL, 259, N'3582910050490', NULL, NULL, 25.2, NULL, 3, NULL, 0, NULL, 0, N'343', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'St.Agnes Soft Candle Jar Menth', NULL, N'344', NULL, 260, N'617888000185', NULL, NULL, 2.5, NULL, 12, NULL, 0, NULL, 0, N'344', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'St.Agnes Soft Candle Orig Jar', NULL, N'345', NULL, 261, N'617888206044', NULL, NULL, 2.5, NULL, 12, NULL, 0, NULL, 0, N'345', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Spirit of Ammonia 30ml', NULL, N'346', NULL, 262, N'638368123712', NULL, NULL, 5.1, NULL, 3, NULL, 0, NULL, 0, N'346', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sudafed Blocked N&Headache Cap', NULL, N'347', NULL, 263, N'3574660593150', NULL, NULL, 28.2, NULL, 3, NULL, 0, NULL, 0, N'347', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'D.P.H Expectorant Regular', NULL, N'348', NULL, 264, N'083276238841', NULL, NULL, 9.6, NULL, 6, NULL, 0, NULL, 0, N'348', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dermovate 0.05% Cream 30g', NULL, N'349', NULL, 265, N'7896269903298', NULL, NULL, 46.05, NULL, 2, NULL, 0, NULL, 0, N'349', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dermovate 0.05% Ointment 30g', NULL, N'350', NULL, 266, N'7896269903021', NULL, NULL, 46.05, NULL, 2, NULL, 0, NULL, 0, N'350', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Desitin Creamy Zinc Oxide 13% ', NULL, N'351', NULL, 267, N'074300003009', NULL, NULL, 17.47, NULL, 3, NULL, 0, NULL, 0, N'351', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Desitin Max Str Original Paste', NULL, N'352', NULL, 268, N'074300000701', NULL, NULL, 18.77, NULL, 3, NULL, 0, NULL, 0, N'352', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Diovol Plus Chews 50''s', NULL, N'353', NULL, 269, N'058738194560', NULL, NULL, 28.96, NULL, 6, NULL, 0, NULL, 0, N'353', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Eno Lemon Sachets 12''s', NULL, N'354', NULL, 270, N'7441026000941', NULL, NULL, 16.26, NULL, 6, NULL, 0, NULL, 0, N'354', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'E Cream Lidocaine', NULL, N'356', NULL, 271, N'5034593030200', NULL, NULL, 25.6, NULL, 2, NULL, 0, NULL, 0, N'356', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'E Spray 14ml', NULL, N'357', NULL, 272, N'5034593041008', NULL, NULL, 42.86, NULL, 1, NULL, 0, NULL, 0, N'357', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bengay rub Greaseless 20z Gr', NULL, N'359', NULL, 273, N'074300005300', NULL, NULL, 23.12, NULL, 2, NULL, 0, NULL, 0, N'359', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bengay Rub Ultra 2oz Red', NULL, N'358', NULL, 274, N'074300005355', NULL, NULL, 28.1, NULL, 2, NULL, 0, NULL, 0, N'358', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjies Arthritis Balm 30g', NULL, N'360', NULL, 275, N'638368124542', NULL, NULL, 15.26, NULL, 3, NULL, 0, NULL, 0, N'360', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjie''s Bay Chest Rub', NULL, N'361', NULL, 276, N'638368123545', NULL, NULL, 6.65, NULL, 6, NULL, 0, NULL, 0, N'361', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjie''s Balm 15g', NULL, N'362', NULL, 277, N'638368121251', NULL, NULL, 8.95, NULL, 3, NULL, 0, NULL, 0, N'362', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjie''s Balm 30g', NULL, N'363', NULL, 278, N'638268973646', NULL, NULL, 13.3, NULL, 3, NULL, 0, NULL, 0, N'363', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjamin''s Calamine Lotion 4oz', NULL, N'367', NULL, 279, N'083276248444', NULL, NULL, 7.07, NULL, 3, NULL, 0, NULL, 0, N'367', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zyrtec 10mg Tablets 20''s', NULL, N'368', NULL, 280, N'0130Z', NULL, NULL, 2.53, NULL, 120, NULL, 0, NULL, 0, N'368', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ovol Drops A/free 15ml', NULL, N'369', NULL, 281, N'058738666715', NULL, NULL, 24.95, NULL, 3, NULL, 0, NULL, 0, N'369', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol Advance Tabs 16''s', NULL, N'371', NULL, 282, N'7451079002908', NULL, NULL, 13.85, NULL, 3, NULL, 0, NULL, 0, N'371', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol Allergy Sinus Disp 50', NULL, N'372', NULL, 283, N'7451079002465', NULL, NULL, 2.6, NULL, 25, NULL, 0, NULL, 0, N'372', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Children Panadol Chews 100''s', NULL, N'373', NULL, 284, N'7451079000126', NULL, NULL, 0.65, NULL, 100, NULL, 0, NULL, 0, N'373', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Children''s Panadol Chews 20''s', NULL, N'374', NULL, 285, N'7451079001987', NULL, NULL, 14.1, NULL, 6, NULL, 0, NULL, 0, N'374', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Children''s Panadol Syrup 160mg', NULL, N'375', NULL, 286, N'7441026000354', NULL, NULL, 18.1, NULL, 12, NULL, 0, NULL, 0, N'375', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Children''s Panadol Syrup 120ml', NULL, N'376', NULL, 287, N'7441026000712', NULL, NULL, 29.95, NULL, 6, NULL, 0, NULL, 0, N'376', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Co Aprovel 150/12.5mg 14''s', NULL, N'379', NULL, 288, N'0133C', NULL, NULL, 3.6, NULL, 84, NULL, 0, NULL, 0, N'379', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Co Aprovel 300/32mg Tab 14''s', NULL, N'378', NULL, 289, N'0132C', NULL, NULL, 3.6, NULL, 84, NULL, 0, NULL, 0, N'378', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cutivate 0.05% Cream 15g', NULL, N'380', NULL, 290, N'7896269905520', NULL, NULL, 32.15, NULL, 3, NULL, 0, NULL, 0, N'380', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'D.P.H Elixir 12.5mg/5ml', NULL, N'383', NULL, 291, N'083276238742', NULL, NULL, 9.6, NULL, 6, NULL, 0, NULL, 0, N'383', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'D.P.H Exp Cherry S/F & A/F', NULL, N'382', NULL, 292, N'083276236144', NULL, NULL, 9.6, NULL, 6, NULL, 0, NULL, 0, N'382', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'D.P.H Exp Grape 4oz S/F A/F', NULL, N'381', NULL, 293, N'083276236342', NULL, NULL, 9.6, NULL, 6, NULL, 0, NULL, 0, N'381', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ciprofloxacin 500mg Tablet ', NULL, N'377', NULL, 294, N'0131C', NULL, NULL, 1, NULL, 120, NULL, 0, NULL, 0, N'377', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Atenolol 100mg Tablets', NULL, N'384', NULL, 295, N'0134A', NULL, NULL, 0.4, NULL, 280, NULL, 0, NULL, 0, N'384', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Listerine Original M/Wash 1L', NULL, N'386', NULL, 296, N'312547701525', NULL, NULL, 30.48, NULL, 3, NULL, 0, NULL, 0, N'386', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Listerine Original M/Wash 500m', NULL, N'385', NULL, 297, N'312547701310', NULL, NULL, 22.05, NULL, 3, NULL, 0, NULL, 0, N'385', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nystatin Ointment 10,000 IU ', NULL, N'388', NULL, 298, N'0135N', NULL, NULL, 9.95, NULL, 6, NULL, 0, NULL, 0, N'388', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gum Aloes 15g', NULL, N'389', NULL, 299, N'638368122388', NULL, NULL, 4.35, NULL, 3, NULL, 0, NULL, 0, N'389', NULL, NULL)
GO
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Epsom Salts 115g', NULL, N'355', NULL, 300, N'638368122357', NULL, NULL, 2.2, NULL, 12, NULL, 0, NULL, 0, N'355', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Boric Acid Powder V&S 15g', NULL, N'366', NULL, 301, N'638368121558', NULL, NULL, 4.95, NULL, 6, NULL, 0, NULL, 0, N'366', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Omega H3 Tonic Capsules 30''s', NULL, N'387', NULL, 302, N'5021265228027', NULL, NULL, 41.47, NULL, 8, NULL, 0, NULL, 0, N'387', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fucicort 20mg/1mg Cream', NULL, N'393', NULL, 303, N'5702191007039', NULL, NULL, 51.52, NULL, 6, NULL, 0, NULL, 0, N'393', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Glucophage 500mg Tablets', NULL, N'394', NULL, 304, N'0137G', NULL, NULL, 0.25, NULL, 1200, NULL, 0, NULL, 0, N'394', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gentian Violet Sloution', NULL, N'395', NULL, 305, N'083276248413', NULL, NULL, 3.65, NULL, 6, NULL, 0, NULL, 0, N'395', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Glucophage XR 500mg Tabs', NULL, N'390', NULL, 306, N'0136G', NULL, NULL, 2.05, NULL, 60, NULL, 0, NULL, 0, N'390', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Glycerin (Benjamin''s) 2oz', NULL, N'397', NULL, 307, N'083276259525', NULL, NULL, 70.25, NULL, 6, NULL, 0, NULL, 0, N'397', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gravol Adult Suppositories', NULL, N'398', NULL, 308, N'058738325612', NULL, NULL, 33.1, NULL, 3, NULL, 0, NULL, 0, N'398', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gravol Infant Suppositories ', NULL, N'399', NULL, 309, N'058738325919', NULL, NULL, 35.2, NULL, 3, NULL, 0, NULL, 0, N'399', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'White Lavender V&S 15ml', NULL, N'400', NULL, 310, N'638368121367', NULL, NULL, 4.55, NULL, 3, NULL, 0, NULL, 0, N'400', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Whitfield''s Ointment DS', NULL, N'401', NULL, 311, N'638368121541', NULL, NULL, 6.85, NULL, 6, NULL, 0, NULL, 0, N'401', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Whitfield''s Reg Ointment', NULL, N'402', NULL, 312, N'638368121213', NULL, NULL, 4.7, NULL, 6, NULL, 0, NULL, 0, N'402', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zentel 4% Suspension 10ml', NULL, N'403', NULL, 313, N'7501043198875', NULL, NULL, 11.6, NULL, 12, NULL, 0, NULL, 0, N'403', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zentel 400mg Tablets', NULL, N'404', NULL, 314, N'7707172680483', NULL, NULL, 10.95, NULL, 12, NULL, 0, NULL, 0, N'404', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zinnat 125mg/5ml Susp', NULL, N'405', NULL, 315, N'0138Z', NULL, NULL, 88, NULL, 1, NULL, 0, NULL, 0, N'405', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zinnat 500mg Tablet 50''s', NULL, N'406', NULL, 316, N'0139Z', NULL, NULL, 6.5, NULL, 50, NULL, 0, NULL, 0, N'406', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zyrtec D 5/120mg Tablets', NULL, N'407', NULL, 317, N'0140Z', NULL, NULL, 4.7, NULL, 30, NULL, 0, NULL, 0, N'407', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zyrtec 1mg/ml Solution 60ml', NULL, N'408', NULL, 318, N'7441026001924', NULL, NULL, 31.8, NULL, 3, NULL, 0, NULL, 0, N'408', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Allegra Pediatric 30mg/5ml Sus', NULL, N'409', NULL, 319, N'7795312100090', NULL, NULL, 53.85, NULL, 1, NULL, 0, NULL, 0, N'409', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'A&H Advance Gel Fresh Deo 113g', NULL, N'410', NULL, 320, N'065333007621', NULL, NULL, 17.42, NULL, 3, NULL, 0, NULL, 0, N'410', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'A&H Advance Sport Deo Gel 113g', NULL, N'411', NULL, 321, N'065333007638', NULL, NULL, 17.42, NULL, 6, NULL, 0, NULL, 0, N'411', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bactroban Ointment 15g', NULL, N'412', NULL, 322, N'0141B', NULL, NULL, 32.2, NULL, 3, NULL, 0, NULL, 0, N'412', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Histergan 2% Cream ', NULL, N'413', NULL, 323, N'5034593027200', NULL, NULL, 20.74, NULL, 3, NULL, 0, NULL, 0, N'413', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bayer Aspirin Low Dose 81mg ', NULL, N'415', NULL, 324, N'312843536371', NULL, NULL, 44.75, NULL, 3, NULL, 0, NULL, 0, N'415', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bendroflumethiazide Bezide 2.5', NULL, N'120', NULL, 325, N'0028B', NULL, NULL, 0.15, NULL, 840, NULL, 0, NULL, 0, N'120', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Atenolol 25mg Tablets', NULL, N'416', NULL, 326, N'0142A', NULL, NULL, 0.12, NULL, 280, NULL, 0, NULL, 0, N'416', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'First Response Early Result 1p', NULL, N'417', NULL, 327, N'061700900267', NULL, NULL, 37.95, NULL, 3, NULL, 0, NULL, 0, N'417', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Eucalyptus Oil', NULL, N'418', NULL, 328, N'638368121794', NULL, NULL, 5.8, NULL, 3, NULL, 0, NULL, 0, N'418', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Kananga Water 4oz', NULL, N'419', NULL, 329, N'083276264543', NULL, NULL, 7, NULL, 3, NULL, 0, NULL, 0, N'419', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lubriderm Adv Therapy 6oz', NULL, N'420', NULL, 330, N'052800482319', NULL, NULL, 11.95, NULL, 3, NULL, 0, NULL, 0, N'420', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dr. Chase Nerve & Blood Tonic ', NULL, N'421', NULL, 331, N'059097902018', NULL, NULL, 40.6, NULL, 3, NULL, 0, NULL, 0, N'421', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nerve & Blood Tonic Tablets 28', NULL, N'422', NULL, 332, N'059097902100', NULL, NULL, 21.12, NULL, 3, NULL, 0, NULL, 0, N'422', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Mag-Trisil Antacid Liquid', NULL, N'423', NULL, 333, N'638368127406', NULL, NULL, 10.8, NULL, 3, NULL, 0, NULL, 0, N'423', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Menthol Crystals V&S 12g', NULL, N'425', NULL, 334, N'638368121787', NULL, NULL, 10.6, NULL, 6, NULL, 0, NULL, 0, N'425', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Mineral Oil 120ml', NULL, N'426', NULL, 335, N'083276259648', NULL, NULL, 7.16, NULL, 3, NULL, 0, NULL, 0, N'426', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Crepe Bandage 10x4.5m', NULL, N'427', NULL, 336, N'5020061001087', NULL, NULL, 5.75, NULL, 3, NULL, 0, NULL, 0, N'427', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Crepe Bandage 7.5x4.5m', NULL, N'428', NULL, 337, N'5020061001063', NULL, NULL, 5.15, NULL, 3, NULL, 0, NULL, 0, N'428', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Crepe Bandage 15x4.5m', NULL, N'429', NULL, 338, N'5020061001100', NULL, NULL, 6.7, NULL, 3, NULL, 0, NULL, 0, N'429', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Elastic Band 7.5x4.5m', NULL, N'430', NULL, 339, N'5020061000905', NULL, NULL, 8.1, NULL, 3, NULL, 0, NULL, 0, N'430', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Feroglobin B12 Tonic', NULL, N'431', NULL, 340, N'5021265231102', NULL, NULL, 38.4, NULL, 6, NULL, 0, NULL, 0, N'431', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'WellKid Smart Chews M/Vitamin', NULL, N'436', NULL, 341, N'5021265223800', NULL, NULL, 52.35, NULL, 3, NULL, 0, NULL, 0, N'436', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'MacKenzies Smelling Salts 17ml', NULL, N'424', NULL, 342, N'5012617000101', NULL, NULL, 30.1, NULL, 3, NULL, 0, NULL, 0, N'424', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vitamin E 400IU Gels 100''s', NULL, N'435', NULL, 343, N'039442047144', NULL, NULL, 34.5, NULL, 3, NULL, 0, NULL, 0, N'435', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vikonon Tablets for Men 30''s', NULL, N'432', NULL, 344, N'5034593003709', NULL, NULL, 36.9, NULL, 3, NULL, 0, NULL, 0, N'432', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'VitaliNova Tonic 250ml', NULL, N'433', NULL, 345, N'5707990129012', NULL, NULL, 45.9, NULL, 3, NULL, 0, NULL, 0, N'433', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vitamin C 500mg tabs 100''s', NULL, N'434', NULL, 346, N'039442047120', NULL, NULL, 22.95, NULL, 3, NULL, 0, NULL, 0, N'434', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Wellman 50+ Capsules 30''s', NULL, N'437', NULL, 347, N'5021265223510', NULL, NULL, 56.2, NULL, 3, NULL, 0, NULL, 0, N'437', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Wellwoman Otiginal Caps 30''s', NULL, N'438', NULL, 348, N'5021265222001', NULL, NULL, 42.42, NULL, 3, NULL, 0, NULL, 0, N'438', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Wellwoman 50+ Caps 30''s', NULL, N'439', NULL, 349, N'5021265223602', NULL, NULL, 56.2, NULL, 3, NULL, 0, NULL, 0, N'439', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Wellman Capsules 30''s', NULL, N'440', NULL, 350, N'5021265220090', NULL, NULL, 42.42, NULL, 1000, NULL, 0, NULL, 0, N'440', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vitamin B Compund 1000''s', NULL, N'441', NULL, 351, N'00143B', NULL, NULL, 0.25, NULL, 1000, NULL, 0, NULL, 0, N'441', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fritzroy ankle Support Lg', NULL, N'442', NULL, 352, N'5020061001582', NULL, NULL, 13.1, NULL, 3, NULL, 0, NULL, 0, N'442', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Ankle Support Med', NULL, N'443', NULL, 353, N'5020061001568', NULL, NULL, 13.1, NULL, 3, NULL, 0, NULL, 0, N'443', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fritzroy Knee Support Lg', NULL, N'444', NULL, 354, N'5020061001506', NULL, NULL, 15.65, NULL, 3, NULL, 0, NULL, 0, N'444', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Microporous Tape 1.25x10m', NULL, N'445', NULL, 355, N'5020061000608', NULL, NULL, 6.7, NULL, 3, NULL, 0, NULL, 0, N'445', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Microporous Tape 5x10m', NULL, N'447', NULL, 356, N'5020061000806', NULL, NULL, 19.5, NULL, 3, NULL, 0, NULL, 0, N'447', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zinc Oxide Strapping 2.5x5m', NULL, N'448', NULL, 357, N'5020061000035', NULL, NULL, 10, NULL, 3, NULL, 0, NULL, 0, N'448', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zinc Oxide Strapping 5x5m', NULL, N'449', NULL, 358, N'5020061000042', NULL, NULL, 19.95, NULL, 3, NULL, 0, NULL, 0, N'449', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Flixonase 50mcg Nasal Spray', NULL, N'451', NULL, 359, N'5033439011281', NULL, NULL, 67.55, NULL, 2, NULL, 0, NULL, 0, N'451', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Flagyl 400mg Tablets 14''s', NULL, N'450', NULL, 360, N'0144F', NULL, NULL, 1.5, NULL, 84, NULL, 0, NULL, 0, N'450', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'A&H Adv S/Original Deo', NULL, N'452', NULL, 361, N'065333007553', NULL, NULL, 17.42, NULL, 3, NULL, 0, NULL, 0, N'452', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'A&H Baking Soda 227g', NULL, N'453', NULL, 362, N'033200011309', NULL, NULL, 3.35, NULL, 3, NULL, 0, NULL, 0, N'453', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'A&H Baking Soda 454g', NULL, N'454', NULL, 363, N'033200011101', NULL, NULL, 4.95, NULL, 3, NULL, 0, NULL, 0, N'454', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aim Tpaste 100ml', NULL, N'456', NULL, 364, N'065333909284', NULL, NULL, 5.9, NULL, 6, NULL, 0, NULL, 0, N'456', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aleve 220mg Tablets 24''s', NULL, N'457', NULL, 365, N'325866105028', NULL, NULL, 29.95, NULL, 6, NULL, 0, NULL, 0, N'457', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bay Rum 300ml', NULL, N'459', NULL, 366, N'638368124726', NULL, NULL, 5.8, NULL, 3, NULL, 0, NULL, 0, N'459', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo Furosemide 40mg 1000''s', NULL, N'458', NULL, 367, N'0145F', NULL, NULL, 0.15, NULL, 1000, NULL, 0, NULL, 0, N'458', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bayer  Aspirin 325mg EC Tab ', NULL, N'460', NULL, 368, N'312843103498', NULL, NULL, 41, NULL, 3, NULL, 0, NULL, 0, N'460', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Zinnat 250mg Tabs 50''s', NULL, N'461', NULL, 369, N'0146z', NULL, NULL, 4.95, NULL, 50, NULL, 0, NULL, 0, N'461', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jergens Skin Firm lotion 8oz', NULL, N'464', NULL, 370, N'019100110076', NULL, NULL, 14.45, NULL, 3, NULL, 0, NULL, 0, N'464', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Jergens Sooth Aloe lotion 8oz', NULL, N'465', NULL, 371, N'019100110038', NULL, NULL, 14.45, NULL, 3, NULL, 0, NULL, 0, N'465', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'KY Jely Personal Lubricant 4oz', NULL, N'466', NULL, 372, N'381370089124', NULL, NULL, 17.62, NULL, 3, NULL, 0, NULL, 0, N'466', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Iodine 1/2oz ', NULL, N'467', NULL, 373, N'083276248208', NULL, NULL, 5.55, NULL, 6, NULL, 0, NULL, 0, N'467', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjamins Florida Water 2oz', NULL, N'468', NULL, 374, N'083276264420', NULL, NULL, 4.8, NULL, 3, NULL, 0, NULL, 0, N'468', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjamins Florida Water 2oz', NULL, N'469', NULL, 375, N'083276264529', NULL, NULL, 4.8, NULL, 3, NULL, 0, NULL, 0, N'469', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjamins Florida Water 4oz', NULL, N'470', NULL, 376, N'083276264444', NULL, NULL, 7, NULL, 3, NULL, 0, NULL, 0, N'470', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Imodim A-D 1mg 6+ Suspension', NULL, N'463', NULL, 377, N'300450134448', NULL, NULL, 30.3, NULL, 2, NULL, 0, NULL, 0, N'463', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Kolik Gripe Water 150ml', NULL, N'462', NULL, 378, N'059097000165', NULL, NULL, 24.5, NULL, 6, NULL, 0, NULL, 0, N'462', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ammens Powder Fresh 250g', NULL, N'471', NULL, 379, N'789849940424', NULL, NULL, 21.95, NULL, 3, NULL, 0, NULL, 0, N'471', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ammens Powder Original 150g', NULL, N'472', NULL, 380, N'789849940417', NULL, NULL, 13.45, NULL, 3, NULL, 0, NULL, 0, N'472', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ammens Powder Original 250g', NULL, N'473', NULL, 381, N'789849940400', NULL, NULL, 21.95, NULL, 3, NULL, 0, NULL, 0, N'473', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Andrew''s Lemon Salts 12''s', NULL, N'474', NULL, 382, N'7441026000200', NULL, NULL, 14.75, NULL, 3, NULL, 0, NULL, 0, N'474', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Andrew''s Liver Salts 50''s', NULL, N'475', NULL, 383, N'74410187', NULL, NULL, 1.25, NULL, 50, NULL, 0, NULL, 0, N'475', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjamins Antacid 150ml', NULL, N'476', NULL, 384, N'083276259075', NULL, NULL, 11.05, NULL, 6, NULL, 0, NULL, 0, N'476', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjamins Antacid 360ml', NULL, N'477', NULL, 385, N'083276259068', NULL, NULL, 20.5, NULL, 6, NULL, 0, NULL, 0, N'477', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Glyburide 5mg 500''s', NULL, N'478', NULL, 386, N'0147G', NULL, NULL, 0.15, NULL, 500, NULL, 0, NULL, 0, N'478', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Amoxilicilin 250/5ml Susp', NULL, N'479', NULL, 387, N'0148A', NULL, NULL, 18.95, NULL, 6, NULL, 0, NULL, 0, N'479', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ammens Powder Baby 250g', NULL, N'480', NULL, 388, N'789849940448', NULL, NULL, 21.95, NULL, 3, NULL, 0, NULL, 0, N'480', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ammens Powder Baby 150g', NULL, N'481', NULL, 389, N'789849940455', NULL, NULL, 13.45, NULL, 3, NULL, 0, NULL, 0, N'481', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Calpol 3+months 120mg/5ml', NULL, N'482', NULL, 390, N'4028685015115', NULL, NULL, 23.9, NULL, 3, NULL, 0, NULL, 0, N'482', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Camphor Blocks 64''s', NULL, N'483', NULL, 391, N'0149C', NULL, NULL, 4.15, NULL, 16, NULL, 0, NULL, 0, N'483', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Camphorated Oil 15ml ', NULL, N'484', NULL, 392, N'638368122845', NULL, NULL, 4.8, NULL, 3, NULL, 0, NULL, 0, N'484', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Canesten (clotrimazole) 1% Cr', NULL, N'485', NULL, 393, N'5010605106026', NULL, NULL, 15.7, NULL, 6, NULL, 0, NULL, 0, N'485', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Carbagen 200mg Tablets ', NULL, N'486', NULL, 394, N'0143C', NULL, NULL, 1.65, NULL, 56, NULL, 0, NULL, 0, N'486', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Castor Oil V&S 30ml', NULL, N'488', NULL, 395, N'638368121466', NULL, NULL, 5.55, NULL, 6, NULL, 0, NULL, 0, N'488', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Children Fever/Pain 125mg grap', NULL, N'489', NULL, 396, N'083276241643', NULL, NULL, 9.6, NULL, 3, NULL, 0, NULL, 0, N'489', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Children Fever/Pain 125mg Cher', NULL, N'490', NULL, 397, N'083276241346', NULL, NULL, 9.6, NULL, 3, NULL, 0, NULL, 0, N'490', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bendroflumethiazide 5mg Tabs', NULL, N'487', NULL, 398, N'0150B', NULL, NULL, 0.1, NULL, 560, NULL, 0, NULL, 0, N'487', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Peppermint Oil 15ml', NULL, N'491', NULL, 399, N'638368121442', NULL, NULL, 9.02, NULL, 6, NULL, 0, NULL, 0, N'491', NULL, NULL)
GO
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Perfectil Capsule 30''s', NULL, N'492', NULL, 400, N'5021265226085', NULL, NULL, 42.4, NULL, 3, NULL, 0, NULL, 0, N'492', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Postinor Tablet ', NULL, N'493', NULL, 401, N'0151P', NULL, NULL, 20, NULL, 20, NULL, 0, NULL, 0, N'493', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Pregnacare W/Folic Acid Caps', NULL, N'494', NULL, 402, N'5021265225026', NULL, NULL, 29.3, NULL, 6, NULL, 0, NULL, 0, N'494', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjamins Rose Water ', NULL, N'495', NULL, 403, N'083276217549', NULL, NULL, 5.8, NULL, 3, NULL, 0, NULL, 0, N'495', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benjamins Red Lavener ', NULL, N'496', NULL, 404, N'083276243616', NULL, NULL, 5.55, NULL, 6, NULL, 0, NULL, 0, N'496', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Primasulf Suspension 100ml', NULL, N'497', NULL, 405, N'0152S', NULL, NULL, 7.95, NULL, 6, NULL, 0, NULL, 0, N'497', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nerve Food 50''s', NULL, N'498', NULL, 406, N'059097902513', NULL, NULL, 18.65, NULL, 3, NULL, 0, NULL, 0, N'498', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Neutrogena T/Sal Shampoo 4.5oz', NULL, N'499', NULL, 407, N'070501096505', NULL, NULL, 25.62, NULL, 3, NULL, 0, NULL, 0, N'499', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nystatin Oral 100,000 IU Susp', NULL, N'500', NULL, 408, N'0153N', NULL, NULL, 12, NULL, 3, NULL, 0, NULL, 0, N'500', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Omeprazole 20mg Caps 28''s', NULL, N'501', NULL, 409, N'0154O', NULL, NULL, 0.5, NULL, 280, NULL, 0, NULL, 0, N'501', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'OneTouch Ultra Lancets 100''s', NULL, N'502', NULL, 410, N'0155L', NULL, NULL, 0.8, NULL, 2, NULL, 0, NULL, 0, N'502', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'OneTouch Ultra Strips 50''s', NULL, N'503', NULL, 411, N'0156O', NULL, NULL, 87.5, NULL, 4, NULL, 0, NULL, 0, N'503', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Osteocare Calcium Liquid 200ml', NULL, N'504', NULL, 412, N'5021265220250', NULL, NULL, 25.8, NULL, 3, NULL, 0, NULL, 0, N'504', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aquafresh T''brush Firm ', NULL, N'505', NULL, 413, N'7501065012227', NULL, NULL, 6.15, NULL, 6, NULL, 0, NULL, 0, N'505', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aquafresh T''paste 6.4oz', NULL, N'506', NULL, 414, N'053100320561', NULL, NULL, 10.95, NULL, 6, NULL, 0, NULL, 0, N'506', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aquafresh T''paste 4.6oz', NULL, N'507', NULL, 415, N'053100320554', NULL, NULL, 8.62, NULL, 6, NULL, 0, NULL, 0, N'507', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aquafresh T''brush 3+', NULL, N'508', NULL, 416, N'5000347001123', NULL, NULL, 10.2, NULL, 6, NULL, 0, NULL, 0, N'508', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aprovel 150mg Tabs 14''s', NULL, N'509', NULL, 417, N'0167A', NULL, NULL, 3.6, NULL, 84, NULL, 0, NULL, 0, N'509', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Augmentin 228mg/5ml Susp', NULL, N'511', NULL, 418, N'0158A', NULL, NULL, 39.95, NULL, 2, NULL, 0, NULL, 0, N'511', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Augmentin 625mg Tablets 14''s', NULL, N'512', NULL, 419, N'0157A', NULL, NULL, 3.1, NULL, 84, NULL, 0, NULL, 0, N'512', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Avamys Nasal Spray', NULL, N'513', NULL, 420, N'5033439032965', NULL, NULL, 70.67, NULL, 2, NULL, 0, NULL, 0, N'513', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aprovel 300mg Tabs 14''s', NULL, N'510', NULL, 421, N'0168A', NULL, NULL, 3.6, NULL, 84, NULL, 0, NULL, 0, N'510', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aquafresh T''brush Medium', NULL, N'514', NULL, 422, N'7501065012128', NULL, NULL, 6.15, NULL, 5, NULL, 0, NULL, 0, N'514', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Isosorbide Dinitrate 10mg', NULL, N'515', NULL, 423, N'0165I', NULL, NULL, 0.15, NULL, 100, NULL, 0, NULL, 0, N'515', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Sulfatrim 400-80mg Tablets', NULL, N'517', NULL, 424, N'0169S', NULL, NULL, 0.4, NULL, 1000, NULL, 0, NULL, 0, N'517', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Propranolol 10mg 100''s', NULL, N'516', NULL, 425, N'0166P', NULL, NULL, 0.15, NULL, 100, NULL, 0, NULL, 0, N'516', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Allegra 120mg Tablets 10''s', NULL, N'518', NULL, 426, N'0161A', NULL, NULL, 2.22, NULL, 20, NULL, 0, NULL, 0, N'518', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alllegra 180mg Tabs 10''s', NULL, N'519', NULL, 427, N'0162A', NULL, NULL, 3.7, NULL, 20, NULL, 0, NULL, 0, N'519', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alum Crystals 20g', NULL, N'520', NULL, 428, N'638368121749', NULL, NULL, 5.6, NULL, 6, NULL, 0, NULL, 0, N'520', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Amaryl 4.0mg Tablets 20''s', NULL, N'522', NULL, 429, N'0163A', NULL, NULL, 1.33, NULL, 40, NULL, 0, NULL, 0, N'522', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Amlodipine 5mg Tablets 28''s', NULL, N'523', NULL, 430, N'0159A', NULL, NULL, 0.2, NULL, 560, NULL, 0, NULL, 0, N'523', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Amlodipine 10mg Talets 28''s', NULL, N'524', NULL, 431, N'0160A', NULL, NULL, 0.3, NULL, 560, NULL, 0, NULL, 0, N'524', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Amaryl 2.0mg Tablets 20''s', NULL, N'521', NULL, 432, N'0164A', NULL, NULL, 0.78, NULL, 40, NULL, 0, NULL, 0, N'521', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Antiseptic 250ml', NULL, N'525', NULL, 433, N'5020061002312', NULL, NULL, 6.9, NULL, 3, NULL, 0, NULL, 0, N'525', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fitzroy Antiseptic 500ml', NULL, N'526', NULL, 434, N'5020061002305', NULL, NULL, 9.65, NULL, 3, NULL, 0, NULL, 0, N'526', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Citronella Oil V&S 15ml', NULL, N'527', NULL, 435, N'638368121534', NULL, NULL, 7.7, NULL, 6, NULL, 0, NULL, 0, N'527', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol E/S Tablets 16''s', NULL, N'528', NULL, 436, N'7451079003073', NULL, NULL, 11.6, NULL, 6, NULL, 0, NULL, 0, N'528', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol Extra Strength  50''s', NULL, N'529', NULL, 437, N'7451079000133', NULL, NULL, 1.4, NULL, 100, NULL, 0, NULL, 0, N'529', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol M/S Tablets 50''s', NULL, N'530', NULL, 438, N'7451079002588', NULL, NULL, 2.3, NULL, 150, NULL, 0, NULL, 0, N'530', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol Cold M/S 16''s Tablets', NULL, N'531', NULL, 439, N'7451079002564', NULL, NULL, 17.53, NULL, 12, NULL, 0, NULL, 0, N'531', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol M/S N/D Tablets 50''s', NULL, N'532', NULL, 440, N'7451079002540', NULL, NULL, 2.3, NULL, 150, NULL, 0, NULL, 0, N'532', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol PM Caplets 20''s', NULL, N'533', NULL, 441, N'7451079000300', NULL, NULL, 19.75, NULL, 3, NULL, 0, NULL, 0, N'533', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Panadol Ultra Tablets 50''s', NULL, N'534', NULL, 442, N'7451079002298', NULL, NULL, 1.45, NULL, 150, NULL, 0, NULL, 0, N'534', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Paracetamol 125mg Supp ', NULL, N'535', NULL, 443, N'4031571049491', NULL, NULL, 24.95, NULL, 3, NULL, 0, NULL, 0, N'535', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Paracetamol 250mg Supp', NULL, N'536', NULL, 444, N'4031571049507', NULL, NULL, 30.1, NULL, 3, NULL, 0, NULL, 0, N'536', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Paregoric Tincture', NULL, N'537', NULL, 445, N'638368124740', NULL, NULL, 12.67, NULL, 3, NULL, 0, NULL, 0, N'537', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Norethisterone 5mg Tablets', NULL, N'538', NULL, 446, N'0170N', NULL, NULL, 1.5, NULL, 180, NULL, 0, NULL, 0, N'538', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ribena B/Currant 227ml', NULL, N'539', NULL, 447, N'7441026002785', NULL, NULL, 3.25, NULL, 27, NULL, 0, NULL, 0, N'539', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ribena B/Currant 500ml', NULL, N'540', NULL, 448, N'5010006101583', NULL, NULL, 6, NULL, 12, NULL, 0, NULL, 0, N'540', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lucozade original 300ml', NULL, N'541', NULL, 449, N'5010006105017', NULL, NULL, 5.25, NULL, 24, NULL, 0, NULL, 0, N'541', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lucozade Orange Drink 300ml', NULL, N'542', NULL, 450, N'5010006105024', NULL, NULL, 5.25, NULL, 24, NULL, 0, NULL, 0, N'542', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aquafresh Coolmint T''paste', NULL, N'543', NULL, 451, N'053100322107', NULL, NULL, 10.95, NULL, 6, NULL, 0, NULL, 0, N'543', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Whitfield''s & Sulphur Oint 30g', NULL, N'71', NULL, 452, N'805358034710', NULL, NULL, 4.6, NULL, 3, NULL, 0, NULL, 0, N'71', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Genethics Baby Chest Rub 1oz', NULL, N'544', NULL, 453, N'701925004011', NULL, NULL, 9.35, NULL, 3, NULL, 0, NULL, 0, N'544', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Calamine Lotion', NULL, N'167', NULL, 454, N'5017848249046', NULL, NULL, 8.7, NULL, 3, NULL, 0, NULL, 0, N'167', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Olive Oil 70ml', NULL, N'545', NULL, 455, N'5017848249213', NULL, NULL, 12.7, NULL, 3, NULL, 0, NULL, 0, N'545', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'SSS Tonic Iron B-Vitamins', NULL, N'546', NULL, 456, N'012258111100', NULL, NULL, 33.05, NULL, 3, NULL, 0, NULL, 0, N'546', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'SSS Tonic Iron B Tonic 20fl oz', NULL, N'547', NULL, 457, N'012258111209', NULL, NULL, 52.55, NULL, 3, NULL, 0, NULL, 0, N'547', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tisane De Durbon Original 200m', NULL, N'548', NULL, 458, N'059097002503', NULL, NULL, 35.35, NULL, 6, NULL, 0, NULL, 0, N'548', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bubbaloo Strawberry', NULL, N'549', NULL, 459, N'0171BS', NULL, NULL, 0.25, NULL, 50, NULL, 0, NULL, 0, N'549', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bubbaloo Bubblegum', NULL, N'551', NULL, 460, N'0173BB', NULL, NULL, 0.25, NULL, 50, NULL, 0, NULL, 0, N'551', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dentyne Ice Spearmint', NULL, N'552', NULL, 461, N'012546315012', NULL, NULL, 4.75, NULL, 9, NULL, 0, NULL, 0, N'552', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dentyne Ice Artic Chill', NULL, N'553', NULL, 462, N'012546312417', NULL, NULL, 4.75, NULL, 9, NULL, 0, NULL, 0, N'553', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dentyne Ice Peppermint', NULL, N'554', NULL, 463, N'012546312554', NULL, NULL, 4.75, NULL, 9, NULL, 0, NULL, 0, N'554', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Trident white Cool Rush', NULL, N'555', NULL, 464, N'012546676397', NULL, NULL, 4.75, NULL, 9, NULL, 0, NULL, 0, N'555', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Trident White Spearmint', NULL, N'556', NULL, 465, N'012546676113', NULL, NULL, 4.75, NULL, 9, NULL, 0, NULL, 0, N'556', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Trident White Peppermint', NULL, N'557', NULL, 466, N'012546676090', NULL, NULL, 4.75, NULL, 9, NULL, 0, NULL, 0, N'557', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cadbury Bournville Dark ', NULL, N'561', NULL, 467, N'5034660516170', NULL, NULL, 4, NULL, 4, NULL, 0, NULL, 0, N'561', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cadbury Dairy Milk 45g', NULL, N'559', NULL, 468, N'7622300743574', NULL, NULL, 4, NULL, 16, NULL, 0, NULL, 0, N'559', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cadbury Dairy Milk Whole Nut ', NULL, N'560', NULL, 469, N'50312597', NULL, NULL, 4, NULL, 12, NULL, 0, NULL, 0, N'560', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cadbury Dair MilkCaramel 45g', NULL, N'558', NULL, 470, N'7622300743727', NULL, NULL, 4, NULL, 4, NULL, 0, NULL, 0, N'558', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cadbury Dairy Milk Fruit & Nut', NULL, N'562', NULL, 471, N'50312610', NULL, NULL, 4, NULL, 12, NULL, 0, NULL, 0, N'562', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Halls Watermelon Hard Candies', NULL, N'564', NULL, 472, N'0175HW', NULL, NULL, 0.25, NULL, 100, NULL, 0, NULL, 0, N'564', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Halls Strong-Lyptus Black', NULL, N'565', NULL, 473, N'0176HS', NULL, NULL, 0.25, NULL, 100, NULL, 0, NULL, 0, N'565', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Halls Mento-Lyptus Blue', NULL, N'563', NULL, 474, N'0174HM', NULL, NULL, 0.25, NULL, 100, NULL, 0, NULL, 0, N'563', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alcolado Menth/Lotion 125ml ', NULL, N'566', NULL, 475, N'036409000013', NULL, NULL, 9.65, NULL, 3, NULL, 0, NULL, 0, N'566', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alcolado Menth/Lotion 250ml', NULL, N'567', NULL, 476, N'036409000020', NULL, NULL, 14.7, NULL, 3, NULL, 0, NULL, 0, N'567', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Impact Laundry Detergent 200g', NULL, N'568', NULL, 477, N'815468000024', NULL, NULL, 2, NULL, 25, NULL, 0, NULL, 0, N'568', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Soft Weave Bathroom Tissue ', NULL, N'569', NULL, 478, N'793136400270', NULL, NULL, 1.65, NULL, 48, NULL, 0, NULL, 0, N'569', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Impact Laundry Detergent 400g', NULL, N'570', NULL, 479, N'815468000031', NULL, NULL, 3.95, NULL, 12, NULL, 0, NULL, 0, N'570', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Laser Razor Blades 5''s', NULL, N'571', NULL, 480, N'0177L', NULL, NULL, 1.25, NULL, 20, NULL, 0, NULL, 0, N'571', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ibuprofen 100mg/5m Suspension', NULL, N'572', NULL, 481, N'5099186002934', NULL, NULL, 9.95, NULL, 6, NULL, 0, NULL, 0, N'572', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Diclofenac SR 75mg Tabs 28''s', NULL, N'573', NULL, 482, N'0178D', NULL, NULL, 0.6, NULL, 280, NULL, 0, NULL, 0, N'573', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Atenolol 50mg Tablets', NULL, N'574', NULL, 483, N'0179A', NULL, NULL, 0.25, NULL, 280, NULL, 0, NULL, 0, N'574', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Insulin Syringes 31G 10''s', NULL, N'575', NULL, 484, N'786227651033', NULL, NULL, 1, NULL, 100, NULL, 0, NULL, 0, N'575', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Loratidine 5mg/5ml Syrup 100ml', NULL, N'576', NULL, 485, N'5016695001135', NULL, NULL, 23.95, NULL, 3, NULL, 0, NULL, 0, N'576', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dispersible Aspirin 300mg 32''s', NULL, N'577', NULL, 486, N'5024071230130', NULL, NULL, 3.5, NULL, 3, NULL, 0, NULL, 0, N'577', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bacitracin Antibiotic Ointment', NULL, N'578', NULL, 487, N'616784116228', NULL, NULL, 10.5, NULL, 6, NULL, 0, NULL, 0, N'578', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ranitidine 150mg Tabs 60''s', NULL, N'92', NULL, 488, N'007R', NULL, NULL, 0.35, NULL, 300, NULL, 0, NULL, 0, N'92', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Canesten Clotrimazole 6 Cream', NULL, N'579', NULL, 489, N'7415100411206', NULL, NULL, 34.5, NULL, 3, NULL, 0, NULL, 0, N'579', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Canesten Clotrimazole 6 Tablet', NULL, N'580', NULL, 490, N'7415100411190', NULL, NULL, 34.5, NULL, 3, NULL, 0, NULL, 0, N'580', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Canesten Clotrimazole 1 Tablet', NULL, N'581', NULL, 491, N'7415100411213', NULL, NULL, 23.95, NULL, 3, NULL, 0, NULL, 0, N'581', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Canesten Clotrimazole 3 Cream', NULL, N'582', NULL, 492, N'7415100411244', NULL, NULL, 34.5, NULL, 3, NULL, 0, NULL, 0, N'582', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Canesten Clotrimazole 3 Tablet', NULL, N'583', NULL, 493, N'7415100411237', NULL, NULL, 34.5, NULL, 3, NULL, 0, NULL, 0, N'583', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Canesten Clotrimazole 2% Sol', NULL, N'584', NULL, 494, N'7415100411169', NULL, NULL, 21.5, NULL, 3, NULL, 0, NULL, 0, N'584', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Augmentin 457mg/5ml Suspension', NULL, N'585', NULL, 495, N'0180A', NULL, NULL, 34.7, NULL, 2, NULL, 0, NULL, 0, N'585', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alcohol Prep Pads 200''s', NULL, N'586', NULL, 496, N'616784111322', NULL, NULL, 16.1, NULL, 3, NULL, 0, NULL, 0, N'586', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Unna Boot Bandage N/S 3x10yds', NULL, N'588', NULL, 497, N'616784345314', NULL, NULL, 40, NULL, 3, NULL, 0, NULL, 0, N'588', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gauze Pads 2x2 Sterile', NULL, N'589', NULL, 498, N'616784332215', NULL, NULL, 0.25, NULL, 150, NULL, 0, NULL, 0, N'589', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gynotran Ovules 7''s', NULL, N'590', NULL, 499, N'7501303437003', NULL, NULL, 49.95, NULL, 3, NULL, 0, NULL, 0, N'590', NULL, NULL)
GO
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gynotran Vaginal Cream ', NULL, N'591', NULL, 500, N'7795320051056', NULL, NULL, 49.95, NULL, 3, NULL, 0, NULL, 0, N'591', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Scheriproct Suppositories 12''s', NULL, N'593', NULL, 501, N'7501303482874', NULL, NULL, 24.7, NULL, 3, NULL, 0, NULL, 0, N'593', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Schederma Cream', NULL, N'594', NULL, 502, N'7795320000580', NULL, NULL, 27.5, NULL, 6, NULL, 0, NULL, 0, N'594', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Betnesol N Eye,Ear,Nose Drops', NULL, N'595', NULL, 503, N'5060064791677', NULL, NULL, 31.7, NULL, 3, NULL, 0, NULL, 0, N'595', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tears NaturaleII Lub Eye Drops', NULL, N'596', NULL, 504, N'300650418157', NULL, NULL, 24.3, NULL, 3, NULL, 0, NULL, 0, N'596', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aldomet 250mg Tablets 30''s', NULL, N'597', NULL, 505, N'0182A', NULL, NULL, 0.4, NULL, 90, NULL, 0, NULL, 0, N'597', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Norgesic 35mg/450mg Tablets', NULL, N'598', NULL, 506, N'0182N', NULL, NULL, 1.5, NULL, 100, NULL, 0, NULL, 0, N'598', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Locorten Vioform Ear Drops', NULL, N'599', NULL, 507, N'5060064170366', NULL, NULL, 29.6, NULL, 3, NULL, 0, NULL, 0, N'599', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Stud 1000 Spray', NULL, N'600', NULL, 508, N'0183S', NULL, NULL, 25, NULL, 3, NULL, 0, NULL, 0, N'600', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aldomet 500mg Tablet 30''s', NULL, N'601', NULL, 509, N'0184A', NULL, NULL, 0.75, NULL, 90, NULL, 0, NULL, 0, N'601', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Micardis Plus 80mg/25mg Tablet', NULL, N'602', NULL, 510, N'0185M', NULL, NULL, 4.18, NULL, 84, NULL, 0, NULL, 0, N'602', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Travatan 40mcg Eye Drops', NULL, N'603', NULL, 511, N'5413895121500', NULL, NULL, 90, NULL, 2, NULL, 0, NULL, 0, N'603', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Microgynon 30 Tablets 21''s', NULL, N'606', NULL, 512, N'0188M', NULL, NULL, 13.95, NULL, 6, NULL, 0, NULL, 0, N'606', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Major Aspirin 81mg Tabets', NULL, N'199', NULL, 513, N'309047704187', NULL, NULL, 10.12, NULL, 9, NULL, 0, NULL, 0, N'199', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Brozedex Syrup', NULL, N'607', NULL, 514, N'8901067000373', NULL, NULL, 16.95, NULL, 3, NULL, 0, NULL, 0, N'607', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Permethrin 5% Cream', NULL, N'608', NULL, 515, N'0190P', NULL, NULL, 14.95, NULL, 3, NULL, 0, NULL, 0, N'608', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Logynon 21 Tablets', NULL, N'609', NULL, 516, N'0191L', NULL, NULL, 15, NULL, 6, NULL, 0, NULL, 0, N'609', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Azopt 1% Eye Drops', NULL, N'610', NULL, 517, N'300650275101', NULL, NULL, 80, NULL, 2, NULL, 0, NULL, 0, N'610', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alphagan 0.2% Eye Drops', NULL, N'611', NULL, 518, N'5016007908091', NULL, NULL, 70, NULL, 3, NULL, 0, NULL, 0, N'611', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'DuoTrav Eye Drops', NULL, N'612', NULL, 519, N'5413895121562', NULL, NULL, 102.3, NULL, 2, NULL, 0, NULL, 0, N'612', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'TobraDex eye Drops', NULL, N'613', NULL, 520, N'300650647052', NULL, NULL, 60, NULL, 2, NULL, 0, NULL, 0, N'613', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nevanac 0.1% Eye Drops', NULL, N'614', NULL, 521, N'300650002035', NULL, NULL, 66.6, NULL, 2, NULL, 0, NULL, 0, N'614', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Becotide Inhaler 200mcg', NULL, N'616', NULL, 522, N'3393370030638', NULL, NULL, 19.5, NULL, 6, NULL, 0, NULL, 0, N'616', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Chloramphenicol 1% Eye Oint', NULL, N'617', NULL, 523, N'0192C', NULL, NULL, 10.5, NULL, 3, NULL, 0, NULL, 0, N'617', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tetracycline 1% eye Ointment', NULL, N'618', NULL, 524, N'0193T', NULL, NULL, 16, NULL, 3, NULL, 0, NULL, 0, N'618', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Permethrin Soap ', NULL, N'619', NULL, 525, N'0194P', NULL, NULL, 9.95, NULL, 3, NULL, 0, NULL, 0, N'619', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fluconazole 150mg Capsules', NULL, N'114', NULL, 526, N'0024F', NULL, NULL, 7.5, NULL, 6, NULL, 0, NULL, 0, N'114', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Hyzaar 100/25mg Tablets', NULL, N'620', NULL, 527, N'0195H', NULL, NULL, 3, NULL, 60, NULL, 0, NULL, 0, N'620', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nifedipine MR30mg Tablets', NULL, N'621', NULL, 528, N'0196N', NULL, NULL, 1.75, NULL, 84, NULL, 0, NULL, 0, N'621', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cozaar 50mg tablets', NULL, N'622', NULL, 529, N'0198C', NULL, NULL, 1, NULL, 60, NULL, 0, NULL, 0, N'622', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sildenafil 100mg Tablets', NULL, N'624', NULL, 530, N'0201S', NULL, NULL, 15, NULL, 24, NULL, 0, NULL, 0, N'624', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Calcium Carbonate 600mg', NULL, N'625', NULL, 531, N'0201C', NULL, NULL, 0.4, NULL, 150, NULL, 0, NULL, 0, N'625', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Precision Xtra Strips 50''s', NULL, N'626', NULL, 532, N'093815997283', NULL, NULL, 130, NULL, 2, NULL, 0, NULL, 0, N'626', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Norflex 100mg Tablets', NULL, N'605', NULL, 533, N'0187N', NULL, NULL, 1.5, NULL, 100, NULL, 0, NULL, 0, N'605', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tadalafil 20mg Tabs 4''s', NULL, N'623', NULL, 534, N'0200T', NULL, NULL, 15, NULL, 12, NULL, 0, NULL, 0, N'623', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Specimen containers', NULL, N'628', NULL, 535, N'0197S', NULL, NULL, 2.5, NULL, 6, NULL, 0, NULL, 0, N'628', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ceftriaxone 1G Injection', NULL, N'587', NULL, 536, N'0181C', NULL, NULL, 12, NULL, 6, NULL, 0, NULL, 0, N'587', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Miconazole 2% Cream 30g', NULL, N'627', NULL, 537, N'0189M', NULL, NULL, 8.35, NULL, 3, NULL, 0, NULL, 0, N'627', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Stayfree Maxi Super 10''s', NULL, N'629', NULL, 538, N'380040956001', NULL, NULL, 6.6, NULL, 6, NULL, 0, NULL, 0, N'629', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Close Up Red Hot 130g', NULL, N'630', NULL, 539, N'7891037002647', NULL, NULL, 7.5, NULL, 6, NULL, 0, NULL, 0, N'630', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Stayfree Maxi Regular 10''s', NULL, N'631', NULL, 540, N'380040901001', NULL, NULL, 6.6, NULL, 6, NULL, 0, NULL, 0, N'631', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Stayfree Maxi w/Wings 10''s', NULL, N'632', NULL, 541, N'380041003018', NULL, NULL, 6.6, NULL, 6, NULL, 0, NULL, 0, N'632', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alpen S/Berry Yog 5''s', NULL, N'633', NULL, 542, N'5010029203905', NULL, NULL, 1.65, NULL, 5, NULL, 0, NULL, 0, N'633', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alpen Fruit & Nut Bar 5''s', NULL, N'634', NULL, 543, N'5010029203875', NULL, NULL, 1.65, NULL, 5, NULL, 0, NULL, 0, N'634', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Alpen Coconut/Choc Bars 5''s', NULL, N'635', NULL, 544, N'5010029213102', NULL, NULL, 1.65, NULL, 5, NULL, 0, NULL, 0, N'635', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Breeze Lemon 375g Detergent', NULL, N'636', NULL, 545, N'749016051162', NULL, NULL, 4.9, NULL, 3, NULL, 0, NULL, 0, N'636', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Breeze lemon 900g Detergent', NULL, N'637', NULL, 546, N'749016051131', NULL, NULL, 9, NULL, 3, NULL, 0, NULL, 0, N'637', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teddies Diapers 1/28''s', NULL, N'638', NULL, 547, N'7441008157045', NULL, NULL, 22.45, NULL, 8, NULL, 0, NULL, 0, N'638', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'PediaSure Strawberry Shake', NULL, N'640', NULL, 548, N'070074580562', NULL, NULL, 8.95, NULL, 6, NULL, 0, NULL, 0, N'640', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ensure Milk Chocolate Shake', NULL, N'642', NULL, 549, N'070074407012', NULL, NULL, 8.5, NULL, 6, NULL, 0, NULL, 0, N'642', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Axe Deodorant Anarchy 50gm', NULL, N'645', NULL, 550, N'75038977', NULL, NULL, 15.3, NULL, 3, NULL, 0, NULL, 0, N'645', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Axe Roll-On Dktemp 50ml', NULL, N'646', NULL, 551, N'78924574', NULL, NULL, 15.3, NULL, 3, NULL, 0, NULL, 0, N'646', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Axe Deodorant Spray B/Chill ', NULL, N'647', NULL, 552, N'079400334602', NULL, NULL, 13.9, NULL, 3, NULL, 0, NULL, 0, N'647', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cif Cream Cleaner 250ml', NULL, N'648', NULL, 553, N'7791290000513', NULL, NULL, 5.5, NULL, 3, NULL, 0, NULL, 0, N'648', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Comfort Classic 475ml', NULL, N'649', NULL, 554, N'749016010305', NULL, NULL, 6.7, NULL, 3, NULL, 0, NULL, 0, N'649', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cif Lavender Disinfectant ', NULL, N'650', NULL, 555, N'7460069503011', NULL, NULL, 7.3, NULL, 3, NULL, 0, NULL, 0, N'650', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lux Soft Touch Pink', NULL, N'653', NULL, 556, N'8999999006259', NULL, NULL, 1.75, NULL, 6, NULL, 0, NULL, 0, N'653', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lux White Impress Soap', NULL, N'654', NULL, 557, N'8999999006457', NULL, NULL, 1.75, NULL, 6, NULL, 0, NULL, 0, N'654', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lux Velvet Touch White', NULL, N'655', NULL, 558, N'8999999006389', NULL, NULL, 1.75, NULL, 6, NULL, 0, NULL, 0, N'655', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Huggies Wipes Pack 56''s', NULL, N'656', NULL, 559, N'036000318678', NULL, NULL, 15.65, NULL, 1, NULL, 0, NULL, 0, N'656', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ensure Strawbery Shake', NULL, N'644', NULL, 560, N'070074407050', NULL, NULL, 8.5, NULL, 6, NULL, 0, NULL, 0, N'644', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Huggies Shea Butter wipes 64''s', NULL, N'657', NULL, 561, N'036000189766', NULL, NULL, 17.99, NULL, 3, NULL, 0, NULL, 0, N'657', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Huggies Diapers 1/50''s', NULL, N'658', NULL, 562, N'036000342093', NULL, NULL, 50.52, NULL, 1, NULL, 0, NULL, 0, N'658', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Huggies Diapers 2/42''s', NULL, N'659', NULL, 563, N'036000555028', NULL, NULL, 50.52, NULL, 1, NULL, 0, NULL, 0, N'659', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tampico Island Punch Drink ', NULL, N'660', NULL, 564, N'095188015861', NULL, NULL, 3.5, NULL, 12, NULL, 0, NULL, 0, N'660', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tampico Tropical Punch Drink', NULL, N'661', NULL, 565, N'095188015885', NULL, NULL, 3.5, NULL, 12, NULL, 0, NULL, 0, N'661', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fruta Guava/Pin 250ml', NULL, N'662', NULL, 566, N'033613411062', NULL, NULL, 2.5, NULL, 12, NULL, 0, NULL, 0, N'662', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'M&M''s Peanut Chocolate Candies', NULL, N'663', NULL, 567, N'04003207', NULL, NULL, 2.75, NULL, 48, NULL, 0, NULL, 0, N'663', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Snickers Peanut Chocolate', NULL, N'664', NULL, 568, N'040000424314', NULL, NULL, 2.75, NULL, 48, NULL, 0, NULL, 0, N'664', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Go Ahead Orange', NULL, N'665', NULL, 569, N'0202GO', NULL, NULL, 1.45, NULL, 5, NULL, 0, NULL, 0, N'665', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Go Ahead Orange & Sultana', NULL, N'666', NULL, 570, N'5000396028478', NULL, NULL, 6.95, NULL, 2, NULL, 0, NULL, 0, N'666', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fruta Guava/Pine 1L', NULL, N'667', NULL, 571, N'033613110682', NULL, NULL, 5.95, NULL, 10, NULL, 0, NULL, 0, N'667', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fruta Apple Juice 1L', NULL, N'668', NULL, 572, N'033613345787', NULL, NULL, 5.95, NULL, 10, NULL, 0, NULL, 0, N'668', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Breeze Comfort Detergent 375g', NULL, N'669', NULL, 573, N'749016051186', NULL, NULL, 4.9, NULL, 3, NULL, 0, NULL, 0, N'669', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Radiante Detergent 400g', NULL, N'670', NULL, 574, N'749016001310', NULL, NULL, 4.15, NULL, 3, NULL, 0, NULL, 0, N'670', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Breeze Comfort Detergent 900g', NULL, N'671', NULL, 575, N'749016000665', NULL, NULL, 11.75, NULL, 3, NULL, 0, NULL, 0, N'671', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Radiante Detergent 875g', NULL, N'672', NULL, 576, N'749016001327', NULL, NULL, 9.1, NULL, 3, NULL, 0, NULL, 0, N'672', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Elle&Vire Fruits S/berry Yog', NULL, N'673', NULL, 577, N'3451790397509', NULL, NULL, 2.6, NULL, 4, NULL, 0, NULL, 0, N'673', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Elle&Vire Fruits ApricotYog', NULL, N'674', NULL, 578, N'3451790397622', NULL, NULL, 2.6, NULL, 4, NULL, 0, NULL, 0, N'674', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Elle&Vire Mango Yog', NULL, N'675', NULL, 579, N'3451790872051', NULL, NULL, 2.6, NULL, 4, NULL, 0, NULL, 0, N'675', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tampico Citrus Punch Drink ', NULL, N'676', NULL, 580, N'095188015694', NULL, NULL, 3.5, NULL, 1, NULL, 0, NULL, 0, N'676', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Glutapak R Sachets', NULL, N'677', NULL, 581, N'0203G', NULL, NULL, 22.1, NULL, 2, NULL, 0, NULL, 0, N'677', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Rough Tops Biscuits Large', NULL, N'678', NULL, 582, N'054315122841', NULL, NULL, 3, NULL, 12, NULL, 0, NULL, 0, N'678', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Rough Tops Coconut Drops Lg', NULL, N'679', NULL, 583, N'054315122896', NULL, NULL, 3, NULL, 12, NULL, 0, NULL, 0, N'679', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nibbles Chocolate Chips 60g', NULL, N'680', NULL, 584, N'054315210296', NULL, NULL, 2, NULL, 6, NULL, 0, NULL, 0, N'680', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nibbles Rainbow Chip Cookies', NULL, N'681', NULL, 585, N'054315210302', NULL, NULL, 2, NULL, 6, NULL, 0, NULL, 0, N'681', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nibbles Chocolate Fudge 60g', NULL, N'682', NULL, 586, N'054315211354', NULL, NULL, 2, NULL, 6, NULL, 0, NULL, 0, N'682', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nibbles Oatmeal & Raisin 60g', NULL, N'683', NULL, 587, N'054315223395', NULL, NULL, 2, NULL, 6, NULL, 0, NULL, 0, N'683', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Rough Tops Coconut Drops 50g', NULL, N'684', NULL, 588, N'054315122872', NULL, NULL, 1, NULL, 12, NULL, 0, NULL, 0, N'684', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Rough Tops Biscuits 50g', NULL, N'685', NULL, 589, N'054315122889', NULL, NULL, 1, NULL, 12, NULL, 0, NULL, 0, N'685', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Big Foot Snack 25g', NULL, N'686', NULL, 590, N'098493221767', NULL, NULL, 1, NULL, 24, NULL, 0, NULL, 0, N'686', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Big Foot Spicy Cheese Snack', NULL, N'687', NULL, 591, N'098493291777', NULL, NULL, 1, NULL, 24, NULL, 0, NULL, 0, N'687', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Cheese Stiks Cheese Snack', NULL, N'688', NULL, 592, N'098493031892', NULL, NULL, 1.25, NULL, 24, NULL, 0, NULL, 0, N'688', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Exotica Morning Medley', NULL, N'689', NULL, 593, N'098493420009', NULL, NULL, 4, NULL, 12, NULL, 0, NULL, 0, N'689', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Exotica Fruit & Nut Fusion', NULL, N'690', NULL, 594, N'098493280108', NULL, NULL, 4, NULL, 12, NULL, 0, NULL, 0, N'690', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Hot Nuts 43g', NULL, N'691', NULL, 595, N'098493210488', NULL, NULL, 1.5, NULL, 12, NULL, 0, NULL, 0, N'691', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dixie Snack Crackers 100g', NULL, N'692', NULL, 596, N'054315431219', NULL, NULL, 2, NULL, 24, NULL, 0, NULL, 0, N'692', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Wheat Crisps Salted Crackers', NULL, N'693', NULL, 597, N'054315012708', NULL, NULL, 0.75, NULL, 18, NULL, 0, NULL, 0, N'693', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Shirley Wheat Crunch 37g', NULL, N'694', NULL, 598, N'064396544852', NULL, NULL, 0.5, NULL, 16, NULL, 0, NULL, 0, N'694', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Shirley Original 37g', NULL, N'695', NULL, 599, N'064396543305', NULL, NULL, 0.5, NULL, 16, NULL, 0, NULL, 0, N'695', NULL, NULL)
GO
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teatime Double Chocolate 40g', NULL, N'697', NULL, 600, N'064396544647', NULL, NULL, 0.5, NULL, 70, NULL, 0, NULL, 0, N'697', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teatime Chocolate 40g', NULL, N'696', NULL, 601, N'064396544548', NULL, NULL, 0.5, NULL, 70, NULL, 0, NULL, 0, N'696', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teatime Vanilla Biscuits', NULL, N'698', NULL, 602, N'064396544562', NULL, NULL, 0.5, NULL, 70, NULL, 0, NULL, 0, N'698', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Domino Vanilla Cream Cookies', NULL, N'699', NULL, 603, N'054315228369', NULL, NULL, 1, NULL, 12, NULL, 0, NULL, 0, N'699', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Domino Chocolate Cream Cookies', NULL, N'700', NULL, 604, N'054315228178', NULL, NULL, 1, NULL, 12, NULL, 0, NULL, 0, N'700', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Digestive Biscuits 42g', NULL, N'701', NULL, 605, N'064396544500', NULL, NULL, 0.75, NULL, 24, NULL, 0, NULL, 0, N'701', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dixie Cheese Crackers', NULL, N'702', NULL, 606, N'054315031037', NULL, NULL, 1.5, NULL, 12, NULL, 0, NULL, 0, N'702', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dixie Guava Crackers', NULL, N'703', NULL, 607, N'054315431233', NULL, NULL, 1.5, NULL, 12, NULL, 0, NULL, 0, N'703', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dixie Peanut Butter Crackers', NULL, N'704', NULL, 608, N'054315230997', NULL, NULL, 1.5, NULL, 12, NULL, 0, NULL, 0, N'704', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Potato Chipz Original', NULL, N'705', NULL, 609, N'098493050428', NULL, NULL, 1.5, NULL, 24, NULL, 0, NULL, 0, N'705', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Potato Chipz Cream & Onion', NULL, N'706', NULL, 610, N'098493050435', NULL, NULL, 1.5, NULL, 12, NULL, 0, NULL, 0, N'706', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tortillaz Spicy Cheese Chips', NULL, N'707', NULL, 611, N'098493452000', NULL, NULL, 1.25, NULL, 12, NULL, 0, NULL, 0, N'707', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Tortillaz Nacho Cheese', NULL, N'708', NULL, 612, N'098493450204', NULL, NULL, 1.25, NULL, 12, NULL, 0, NULL, 0, N'708', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Shirley Biscuits Original 105g', NULL, N'709', NULL, 613, N'064396543237', NULL, NULL, 2, NULL, 12, NULL, 0, NULL, 0, N'709', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Shirley Coconut Biscuits', NULL, N'710', NULL, 614, N'064396543992', NULL, NULL, 2, NULL, 12, NULL, 0, NULL, 0, N'710', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sodabix Cheese & Herb Crackers', NULL, N'711', NULL, 615, N'064396544838', NULL, NULL, 1.5, NULL, 24, NULL, 0, NULL, 0, N'711', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Crix Crackers 5oz', NULL, N'712', NULL, 616, N'054315011152', NULL, NULL, 3, NULL, 24, NULL, 0, NULL, 0, N'712', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Crix Multigrain Crackers', NULL, N'713', NULL, 617, N'054315111913', NULL, NULL, 6, NULL, 15, NULL, 0, NULL, 0, N'713', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Crix WholeWheat Crackers 5oz', NULL, N'714', NULL, 618, N'054315011756', NULL, NULL, 3.5, NULL, 24, NULL, 0, NULL, 0, N'714', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teatime Double Chocolate Lg', NULL, N'715', NULL, 619, N'064396544227', NULL, NULL, 1.75, NULL, 12, NULL, 0, NULL, 0, N'715', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teatime Chocolate Biscuits Lg', NULL, N'716', NULL, 620, N'064396543329', NULL, NULL, 2, NULL, 12, NULL, 0, NULL, 0, N'716', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teatime Vanilla Biscuits Lg', NULL, N'717', NULL, 621, N'064396543312', NULL, NULL, 2, NULL, 12, NULL, 0, NULL, 0, N'717', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teatime Chocolate S/Berry Lg', NULL, N'718', NULL, 622, N'064396545071', NULL, NULL, 2, NULL, 12, NULL, 0, NULL, 0, N'718', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Clomid 50mg Tablets', NULL, N'259', NULL, 623, N'0080C', NULL, NULL, 3.95, NULL, 20, NULL, 0, NULL, 0, N'259', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fungactin (Tolnaftate) Cr 15g', NULL, N'91', NULL, 624, N'805358647132', NULL, NULL, 8.75, NULL, 3, NULL, 0, NULL, 0, N'91', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Terbinafine (Lamisil) 1% Cream', NULL, N'98', NULL, 625, N'5060020122170', NULL, NULL, 18.09, NULL, 2, NULL, 0, NULL, 0, N'98', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Nifedipine MR 20mg 56''s', NULL, N'101', NULL, 626, N'0013N', NULL, NULL, 0.4, NULL, 112, NULL, 0, NULL, 0, N'101', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Piriton 4mg Tablets 500''s', NULL, N'102', NULL, 627, N'0014P', NULL, NULL, 0.15, NULL, 500, NULL, 0, NULL, 0, N'102', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Pred Forte 1% Eye Drops', NULL, N'104', NULL, 628, N'50942787', NULL, NULL, 25.39, NULL, 1, NULL, 0, NULL, 0, N'104', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'BNT Antibiotic Powder 15g', NULL, N'126', NULL, 629, N'091595950146', NULL, NULL, 19.11, NULL, 6, NULL, 0, NULL, 0, N'126', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dentinox Teething Toothpaste', NULL, N'141', NULL, 630, N'5011784000853', NULL, NULL, 14.8, NULL, 3, NULL, 0, NULL, 0, N'141', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Berotec 100mcg Puff', NULL, N'152', NULL, 631, N'0039B', NULL, NULL, 38.93, NULL, 1, NULL, 0, NULL, 0, N'152', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Almond Oil B.P 70ml', NULL, N'162', NULL, 632, N'5017848251056', NULL, NULL, 8.79, NULL, 3, NULL, 0, NULL, 0, N'162', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Antiseptic Cream 0.5%', NULL, N'168', NULL, 633, N'5017848250554', NULL, NULL, 10.1, NULL, 3, NULL, 0, NULL, 0, N'168', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'KILKOF Oral Solution', NULL, N'169', NULL, 634, N'5017848249060', NULL, NULL, 9.35, NULL, 3, NULL, 0, NULL, 0, N'169', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Muscle & Joint Rub', NULL, N'170', NULL, 635, N'5017848251889', NULL, NULL, 11, NULL, 3, NULL, 0, NULL, 0, N'170', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bells Nowax Ear Drops', NULL, N'175', NULL, 636, N'5017848250820', NULL, NULL, 19.6, NULL, 3, NULL, 0, NULL, 0, N'175', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Atacand 16mg Candesartan Tab', NULL, N'263', NULL, 637, N'0082A', NULL, NULL, 3.6, NULL, 56, NULL, 0, NULL, 0, N'263', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Enalapril 5mg Tablets', NULL, N'242', NULL, 638, N'0069E', NULL, NULL, 0.15, NULL, 84, NULL, 0, NULL, 0, N'242', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Allopurinol 100mg Tablets Bris', NULL, N'192', NULL, 639, N'0047A', NULL, NULL, 0.15, NULL, 84, NULL, 0, NULL, 0, N'192', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gravol Liquid A/free 15mg 75ml', NULL, N'396', NULL, 640, N'058738325438', NULL, NULL, 22.3, NULL, 3, NULL, 0, NULL, 0, N'396', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Benadryl CH Allergy Cherry 4oz', NULL, N'414', NULL, 641, N'350580534045', NULL, NULL, 30.86, NULL, 3, NULL, 0, NULL, 0, N'414', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Microporous Tape 2.5x10m', NULL, N'446', NULL, 642, N'5020061000707', NULL, NULL, 11.2, NULL, 3, NULL, 0, NULL, 0, N'446', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ovol Simethicone Gas Tablets ', NULL, N'370', NULL, 643, N'058738666845', NULL, NULL, 19.95, NULL, 2, NULL, 0, NULL, 0, N'370', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Betnovate 0.1% Ointment', NULL, N'365', NULL, 644, N'7896269903113', NULL, NULL, 22.5, NULL, 3, NULL, 0, NULL, 0, N'365', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Betnovate 0.1% Cream 15g', NULL, N'364', NULL, 645, N'7896269903106', NULL, NULL, 22.5, NULL, 3, NULL, 0, NULL, 0, N'364', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Lifebuoy Herbal Soap 125g', NULL, N'652', NULL, 646, N'749016062106', NULL, NULL, 3.6, NULL, 6, NULL, 0, NULL, 0, N'652', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Quix 450ml', NULL, N'651', NULL, 647, N'749016040180', NULL, NULL, 6.4, NULL, 3, NULL, 0, NULL, 0, N'651', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ensure Butter Pecan Shake', NULL, N'643', NULL, 648, N'070074517858', NULL, NULL, 8.5, NULL, 6, NULL, 0, NULL, 0, N'643', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ponstan Forte 500mg Tablets', NULL, N'301', NULL, 649, N'0110P', NULL, NULL, 1.1, NULL, 50, NULL, 0, NULL, 0, N'301', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fucidin Antibiotic 2% Cream ', NULL, N'391', NULL, 650, N'5702191005400', NULL, NULL, 31.4, NULL, 6, NULL, 0, NULL, 0, N'391', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fucidin Antibiotic 2% Oint', NULL, N'392', NULL, 651, N'5702191005455', NULL, NULL, 28.9, NULL, 6, NULL, 0, NULL, 0, N'392', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Dentinox Infant Colic Drops', NULL, N'140', NULL, 652, N'5011784050414', NULL, NULL, 16.52, NULL, 3, NULL, 0, NULL, 0, N'140', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Arthritis Plus 2 30g', NULL, N'179', NULL, 653, N'701929033031', NULL, NULL, 9.75, NULL, 3, NULL, 0, NULL, 0, N'179', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'GynoTravogen Ovules', NULL, N'615', NULL, 654, N'7501303435214', NULL, NULL, 30, NULL, 2, NULL, 0, NULL, 0, N'615', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Travogen 1% Cream 20g', NULL, N'592', NULL, 655, N'0181T', NULL, NULL, 21.85, NULL, 3, NULL, 0, NULL, 0, N'592', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Daktarin Miconazole 2% Cream', NULL, N'318', NULL, 656, N'7501109900404', NULL, NULL, 42.7, NULL, 3, NULL, 0, NULL, 0, N'318', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Stugeron Forte 75mg Tablets', NULL, N'320', NULL, 657, N'0118S', NULL, NULL, 1.9, NULL, 60, NULL, 0, NULL, 0, N'320', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Septol Lightening Cream', NULL, N'341', NULL, 658, N'024602000565', NULL, NULL, 7.8, NULL, 12, NULL, 0, NULL, 0, N'341', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Bubbaloo Peppermint', NULL, N'550', NULL, 659, N'0172BP', NULL, NULL, 0.25, NULL, 50, NULL, 0, NULL, 0, N'550', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Proviron 25mg Tablets 20''s', NULL, N'604', NULL, 660, N'0186P', NULL, NULL, 2.95, NULL, 60, NULL, 0, NULL, 0, N'604', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Teddies Diapers 2/24''s', NULL, N'639', NULL, 661, N'7441008157052', NULL, NULL, 22.45, NULL, 8, NULL, 0, NULL, 0, N'639', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Atacand 8mg Candesartan Tabs', NULL, N'266', NULL, 662, N'0085A', NULL, NULL, 3.6, NULL, 56, NULL, 0, NULL, 0, N'266', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Salvent 4mg Tablets 100''s', NULL, N'271', NULL, 663, N'0087S', NULL, NULL, 0.2, NULL, 100, NULL, 0, NULL, 0, N'271', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aeroflux 2mg-7.5mg/5ml 120ml', NULL, N'455', NULL, 664, N'7501046463215', NULL, NULL, 26.85, NULL, 3, NULL, 0, NULL, 0, N'455', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'PediaSure Vanilla Shake', NULL, N'641', NULL, 665, N'070074580500', NULL, NULL, 8.95, NULL, 6, NULL, 0, NULL, 0, N'641', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Motrin IB 200mg Caplets 300''s', NULL, N'719', NULL, 666, N'0204M', NULL, NULL, 0.5, NULL, 300, NULL, 0, NULL, 0, N'719', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Advil Liqui-Gels 120''s', NULL, N'720', NULL, 667, N'0205A', NULL, NULL, 1, NULL, 240, NULL, 0, NULL, 0, N'720', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vitamin E 400 I.U Softgels', NULL, N'721', NULL, 668, N'0206E', NULL, NULL, 0.4, NULL, 700, NULL, 0, NULL, 0, N'721', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Glucosamine,MSM,Vit D Tablets', NULL, N'722', NULL, 669, N'0207G', NULL, NULL, 1, NULL, 300, NULL, 0, NULL, 0, N'722', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Aleve Liqui-Gels 220mg 160''s', NULL, N'723', NULL, 670, N'0208A', NULL, NULL, 1, NULL, 320, NULL, 0, NULL, 0, N'723', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Gummy Vites Lil Critters 275''s', NULL, N'724', NULL, 671, N'0209G', NULL, NULL, 0.5, NULL, 275, NULL, 0, NULL, 0, N'724', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vitamin C 1000mg &Tablets ', NULL, N'725', NULL, 672, N'0210C', NULL, NULL, 0.5, NULL, 375, NULL, 0, NULL, 0, N'725', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Omega-3 Super Strength Gels', NULL, N'726', NULL, 673, N'0211O', NULL, NULL, 0.75, NULL, 300, NULL, 0, NULL, 0, N'726', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'New Choice PT', NULL, N'727', NULL, 674, N'667742001100', NULL, NULL, 10, NULL, 3, NULL, 0, NULL, 0, N'727', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Coca-Cola Drink', NULL, N'736', NULL, 675, N'049000000443', NULL, NULL, 3.5, NULL, 24, NULL, 0, NULL, 0, N'736', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Sprite Drink', NULL, N'737', NULL, 676, N'049000007640', NULL, NULL, 3.5, NULL, 24, NULL, 0, NULL, 0, N'737', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'FANTA ORANGE DRINK', NULL, N'738', NULL, 677, N'049000019162', NULL, NULL, 3.5, NULL, 7, NULL, 0, NULL, 0, N'738', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'FANTA GRAPE DRINK', NULL, N'739', NULL, 678, N'049000026276', NULL, NULL, 3.5, NULL, 4, NULL, 0, NULL, 0, N'739', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'FANTA RED CREAM SODA', NULL, N'740', NULL, 679, N'049000030525', NULL, NULL, 3.5, NULL, 13, NULL, 0, NULL, 0, N'740', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Chloramphenicol Eye Drops', NULL, N'745', NULL, 680, N'5026468744077', NULL, NULL, 12.95, NULL, 6, NULL, 0, NULL, 0, N'745', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Goodtime Nacho Rings Snack', NULL, N'747', NULL, 681, N'075419519856', NULL, NULL, 1, NULL, 12, NULL, 0, NULL, 0, N'747', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Goodtime Cheese Twist Snack', NULL, N'746', NULL, 682, N'075419519863', NULL, NULL, 1, NULL, 12, NULL, 0, NULL, 0, N'746', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fish Oil with D3 1200mg', NULL, N'728', NULL, 683, N'078742095486', NULL, NULL, 28.95, NULL, 6, NULL, 0, NULL, 0, N'728', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Major Vitamin C 500mg 300''s', NULL, N'191', NULL, 684, N'0046C', NULL, NULL, 0.25, NULL, 300, NULL, 0, NULL, 0, N'191', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Amoxicillin 250mg Caps ', NULL, N'748', NULL, 685, N'0212A', NULL, NULL, 0.5, NULL, 1000, NULL, 0, NULL, 0, N'748', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'One A Day Women''s 60''s', NULL, N'749', NULL, 686, N'016500074069', NULL, NULL, 42.45, NULL, 3, NULL, 0, NULL, 0, N'749', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ginseng Up Lemon Lime Drink', NULL, N'750', NULL, 687, N'0213GL', NULL, NULL, 4, NULL, 12, NULL, 0, NULL, 0, N'750', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Ginseng Up Original Drink', NULL, N'751', NULL, 688, N'0214GU', NULL, NULL, 4, NULL, 12, NULL, 0, NULL, 0, N'751', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Vita Malt Classic Drink', NULL, N'744', NULL, 689, N'798713540011', NULL, NULL, 4.5, NULL, 24, NULL, 0, NULL, 0, N'744', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Suave 24hr Invisible Solid', NULL, N'730', NULL, 690, N'079400763808', NULL, NULL, 0, NULL, 5, NULL, 0, NULL, 0, N'730', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Old Spice Deodorant', NULL, N'731', NULL, 691, N'012044038918', NULL, NULL, 0, NULL, 3, NULL, 0, NULL, 0, N'731', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Etang Apple Flavoured Water', NULL, N'734', NULL, 692, N'857543002929', NULL, NULL, 3.25, NULL, 12, NULL, 0, NULL, 0, N'734', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Etang Tangerine Water', NULL, N'733', NULL, 693, N'857543002905', NULL, NULL, 3.25, NULL, 6, NULL, 0, NULL, 0, N'733', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Etang Kiwi Strawberry Drink', NULL, N'735', NULL, 694, N'857543002912', NULL, NULL, 3.25, NULL, 6, NULL, 0, NULL, 0, N'735', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Shandy Carib Sorrel Drink', NULL, N'743', NULL, 695, N'798713220012', NULL, NULL, 4, NULL, 8, NULL, 0, NULL, 0, N'743', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Shandy Carib Lime Drink', NULL, N'741', NULL, 696, N'798713210013', NULL, NULL, 4, NULL, 8, NULL, 0, NULL, 0, N'741', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Shandy Carib Ginger Drink', NULL, N'742', NULL, 697, N'798713200014', NULL, NULL, 4, NULL, 8, NULL, 0, NULL, 0, N'742', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Twin Blade Plus Razor Blades', NULL, N'732', NULL, 698, N'Twin Blades ', NULL, NULL, 1.5, NULL, 65, NULL, 0, NULL, 0, N'732', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Fixodent Original 2.4oz', NULL, N'729', NULL, 699, N'076660008663', NULL, NULL, 23.95, NULL, 6, NULL, 0, NULL, 0, N'729', NULL, NULL)
GO
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Polident Denture Cleanser ', NULL, N'752', NULL, 700, N'0215P', NULL, NULL, 0.5, NULL, 96, NULL, 0, NULL, 0, N'752', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo Slow-K 600mg Tablets', NULL, N'754', NULL, 701, N'0217SK', NULL, NULL, 0.4, NULL, 100, NULL, 0, NULL, 0, N'754', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Apo-Metronidazole 250mg', NULL, N'753', NULL, 702, N'0216M', NULL, NULL, 0.45, NULL, 200, NULL, 0, NULL, 0, N'753', NULL, NULL)
INSERT [dbo].[Item] ([Description], [ItemName], [ItemNumber], [ItemNotDiscountable], [ItemId], [ItemLookupCode], [Department], [Category], [Price], [Cost], [Quantity], [ExtendedDescription], [Inactive], [DateCreated], [SalesTax], [QBItemListID], [UnitOfMeasure], [Size]) VALUES (N'Prescription Fee', NULL, N'755', NULL, 703, N'', NULL, NULL, 1, NULL, 0, NULL, 0, NULL, 0, N'755', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Item] OFF
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 1, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 2, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 3, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 4, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 5, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 6, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 7, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 8, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 9, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 10, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 11, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 12, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 13, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 14, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 15, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 16, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 17, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 18, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 19, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 20, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 21, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 22, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 23, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 24, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 25, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 26, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 27, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 28, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 29, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 30, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 31, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 32, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 33, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 34, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 35, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 36, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 37, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 38, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 39, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 40, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 41, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 42, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 43, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 44, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 45, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 46, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 47, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 48, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 49, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 50, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 51, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 52, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 53, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 54, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 55, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 56, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 57, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 58, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 59, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 60, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 61, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 62, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 63, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 64, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 65, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 66, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 67, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 68, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 69, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 70, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 71, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 72, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 73, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 74, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 75, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 76, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 77, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 78, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 79, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 80, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 81, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 82, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 83, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 84, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 85, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 86, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 87, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 88, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 89, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 90, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 91, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 92, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 93, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 94, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 95, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 96, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 97, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 98, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 99, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 100, NULL)
GO
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 101, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 102, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 103, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 104, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 105, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 106, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 107, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 108, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 109, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 110, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 111, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 112, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 113, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 114, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 115, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 116, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 117, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 118, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 119, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 120, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 121, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 122, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 123, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 124, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 125, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 126, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 127, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 128, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 129, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 130, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 131, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 132, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 133, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 134, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 135, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 136, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 137, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 138, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 139, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 140, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 141, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 142, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 143, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 144, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 145, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 146, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 147, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 148, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 149, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 150, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 151, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 152, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 153, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 154, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 155, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 156, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 157, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 158, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 159, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 160, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 161, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 162, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 163, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 164, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 165, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 166, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 167, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 168, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 169, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 170, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 171, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 172, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 173, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 174, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 175, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 176, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 177, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 178, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 179, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 180, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 181, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 182, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 183, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 184, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 185, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 186, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 187, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 188, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 189, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 190, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 191, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 192, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 193, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 194, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 195, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 196, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 197, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 198, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 199, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 200, NULL)
GO
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 201, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 202, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 203, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 204, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 205, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 206, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 207, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 208, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 209, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 210, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 211, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 212, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 213, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 214, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 215, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 216, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 217, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 218, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 219, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 220, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 221, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 222, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 223, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 224, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 225, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 226, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 227, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 228, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 229, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 230, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 231, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 232, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 233, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 234, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 235, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 236, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 237, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 238, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 239, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 240, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 241, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 242, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 243, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 244, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 245, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 246, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 247, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 248, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 249, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 250, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 251, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 252, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 253, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 254, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 255, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 256, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 257, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 258, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 259, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 260, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 261, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 262, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 263, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 264, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 265, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 266, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 267, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 268, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 269, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 270, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 271, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 272, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 273, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 274, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 275, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 276, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 277, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 278, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 279, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 280, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 281, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 282, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 283, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 284, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 285, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 286, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 287, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 288, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 289, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 290, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 291, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 292, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 293, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 294, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 295, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 296, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 297, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 298, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 299, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 300, NULL)
GO
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 301, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 302, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 303, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 304, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 305, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 306, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 307, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 308, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 309, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 310, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 311, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 312, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 313, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 314, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 315, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 316, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 317, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 318, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 319, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 320, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 321, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 322, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 323, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 324, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 325, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 326, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 327, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 328, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 329, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 330, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 331, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 332, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 333, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 334, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 335, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 336, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 337, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 338, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 339, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 340, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 341, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 342, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 343, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 344, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 345, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 346, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 347, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 348, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 349, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 350, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 351, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 352, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 353, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 354, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 355, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 356, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 357, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 358, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 359, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 360, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 361, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 362, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 363, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 364, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 365, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 366, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 367, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 368, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 369, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 370, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 371, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 372, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 373, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 374, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 375, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 376, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 377, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 378, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 379, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 380, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 381, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 382, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 383, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 384, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 385, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 386, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 387, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 388, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 389, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 390, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 391, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 392, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 393, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 394, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 395, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 396, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 397, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 398, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 399, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 400, NULL)
GO
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 401, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 402, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 403, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 404, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 405, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 406, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 407, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 408, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 409, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 410, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 411, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 412, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 413, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 414, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 415, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 416, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 417, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 418, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 419, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 420, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 421, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 422, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 423, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 424, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 425, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 426, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 427, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 428, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 429, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 430, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 431, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 432, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 433, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 434, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 435, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 436, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 437, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 438, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 439, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 440, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 441, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 442, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 443, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 444, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 445, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 446, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 447, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 448, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 449, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 450, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 451, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 452, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 453, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 454, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 455, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 456, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 457, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 458, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 459, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 460, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 461, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 462, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 463, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 464, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 465, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 466, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 467, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 468, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 469, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 470, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 471, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 472, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 473, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 474, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 475, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 476, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 477, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 478, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 479, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 480, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 481, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 482, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 483, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 484, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 485, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 486, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 487, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 488, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 489, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 490, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 491, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 492, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 493, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 494, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 495, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 496, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 497, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 498, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 499, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 500, NULL)
GO
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 501, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 502, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 503, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 504, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 505, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 506, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 507, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 508, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 509, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 510, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 511, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 512, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 513, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 514, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 515, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 516, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 517, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 518, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 519, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 520, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 521, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 522, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 523, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 524, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 525, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 526, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 527, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 528, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 529, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 530, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 531, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 532, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 533, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 534, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 535, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 536, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 537, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 538, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 539, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 540, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 541, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 542, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 543, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 544, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 545, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 546, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 547, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 548, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 549, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 550, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 551, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 552, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 553, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 554, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 555, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 556, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 557, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 558, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 559, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 560, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 561, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 562, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 563, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 564, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 565, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 566, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 567, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 568, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 569, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 570, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 571, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 572, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 573, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 574, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 575, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 576, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 577, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 578, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 579, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 580, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 581, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 582, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 583, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 584, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 585, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 586, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 587, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 588, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 589, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 590, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 591, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 592, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 593, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 594, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 595, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 596, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 597, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 598, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 599, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 600, NULL)
GO
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 601, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 602, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 603, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 604, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 605, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 606, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 607, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 608, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 609, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 610, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 611, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 612, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 613, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 614, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 615, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 616, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 617, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 618, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 619, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 620, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 621, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 622, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 623, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 624, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 625, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 626, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 627, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 628, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 629, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 630, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 631, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 632, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 633, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 634, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 635, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 636, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 637, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 638, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 639, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 640, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 641, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 642, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 643, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 644, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 645, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 646, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 647, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 648, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 649, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 650, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 651, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 652, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 653, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 654, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 655, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 656, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 657, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 658, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 659, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 660, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 661, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 662, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 663, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 664, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 665, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 666, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 667, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 668, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 669, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 670, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 671, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 672, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 673, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 674, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 675, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 676, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 677, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 678, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 679, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 680, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 681, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 682, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 683, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 684, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 685, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 686, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 687, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 688, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 689, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 690, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 691, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 692, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 693, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 694, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 695, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 696, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 697, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 698, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 699, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 700, NULL)
GO
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 701, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 702, NULL)
INSERT [dbo].[Item_Medicine] ([SuggestedDosage], [ItemId], [ExpiryDate]) VALUES (NULL, 703, NULL)
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [CompanyName], [Salutation], [Address], [PhoneNumber], [InActive], [DOB], [Sex]) VALUES (1, N'Joseph', N'Bartholomew', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [CompanyName], [Salutation], [Address], [PhoneNumber], [InActive], [DOB], [Sex]) VALUES (67852, N'Louis', N'Clyne', NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [CompanyName], [Salutation], [Address], [PhoneNumber], [InActive], [DOB], [Sex]) VALUES (67853, N'Keshia', N'Thomas', NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [CompanyName], [Salutation], [Address], [PhoneNumber], [InActive], [DOB], [Sex]) VALUES (67854, N'Keshia', N'Thomas', NULL, NULL, NULL, NULL, 0, NULL, 1)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [CompanyName], [Salutation], [Address], [PhoneNumber], [InActive], [DOB], [Sex]) VALUES (68852, N'test', N'test', NULL, NULL, NULL, NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Persons] OFF
INSERT [dbo].[Persons_Cashier] ([SPassword], [LoginName], [Id], [Role], [Initials]) VALUES (N'test', N'Alpha', 1, N'Pharmacist', N'A')
INSERT [dbo].[Persons_Doctor] ([Code], [Id]) VALUES (N'192', 67852)
INSERT [dbo].[Persons_Patient] ([Id], [Allergies], [Guardian], [Discount]) VALUES (67853, NULL, NULL, NULL)
INSERT [dbo].[Persons_Patient] ([Id], [Allergies], [Guardian], [Discount]) VALUES (67854, NULL, NULL, NULL)
INSERT [dbo].[Persons_Patient] ([Id], [Allergies], [Guardian], [Discount]) VALUES (68852, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Stations] ON 

INSERT [dbo].[Stations] ([StationId], [StationCode], [StoreId], [ReceiptPrinterName], [MachineName], [PrintServer]) VALUES (1, N'QuickSales', 1, N'Brother QL-700', N'DISP-1', N'\\Alphaquest-pc')
INSERT [dbo].[Stations] ([StationId], [StationCode], [StoreId], [ReceiptPrinterName], [MachineName], [PrintServer]) VALUES (6, N'Alpha', 1, N'Brother QL-700', N'Alphaquest-pc', N'\\Alphaquest-pc')
SET IDENTITY_INSERT [dbo].[Stations] OFF
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([StoreId], [StoreCode], [StoreAddress], [CompanyId], [TransactionSeed], [SeedTransaction]) VALUES (1, N'G2', N'Gate 2', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Stores] OFF
SET IDENTITY_INSERT [dbo].[TransactionBase] ON 

INSERT [dbo].[TransactionBase] ([StationId], [BatchId], [CloseBatchId], [Time], [CustomerId], [PharmacistId], [CashierId], [Comment], [ReferenceNumber], [StoreCode], [TransactionId], [OpenClose], [Status]) VALUES (6, 1, 1, CAST(N'2016-07-22T19:03:07.170' AS DateTime), NULL, 1, 1, NULL, N'10', N'G2', 1, 0, N'Posted')
INSERT [dbo].[TransactionBase] ([StationId], [BatchId], [CloseBatchId], [Time], [CustomerId], [PharmacistId], [CashierId], [Comment], [ReferenceNumber], [StoreCode], [TransactionId], [OpenClose], [Status]) VALUES (6, 1, 1, CAST(N'2016-07-22T19:38:54.633' AS DateTime), NULL, NULL, 1, NULL, N'13', N'G2', 2, 0, N'Posted')
INSERT [dbo].[TransactionBase] ([StationId], [BatchId], [CloseBatchId], [Time], [CustomerId], [PharmacistId], [CashierId], [Comment], [ReferenceNumber], [StoreCode], [TransactionId], [OpenClose], [Status]) VALUES (6, 1, NULL, CAST(N'2017-06-22T13:43:11.777' AS DateTime), NULL, NULL, 1, NULL, NULL, N'G2', 1001, 0, NULL)
SET IDENTITY_INSERT [dbo].[TransactionBase] OFF
INSERT [dbo].[TransactionBase_Prescription] ([DoctorId], [PatientId], [TransactionId]) VALUES (67852, 67854, 2)
INSERT [dbo].[TransactionBase_Prescription] ([DoctorId], [PatientId], [TransactionId]) VALUES (67852, 68852, 1001)
INSERT [dbo].[TransactionBase_QuickPrescription] ([TransactionId]) VALUES (1)
SET IDENTITY_INSERT [dbo].[TransactionEntryBase] ON 

INSERT [dbo].[TransactionEntryBase] ([StoreID], [TransactionEntryId], [TransactionId], [Price], [Quantity], [Taxable], [Comment], [TransactionTime], [SalesTaxPercent], [Discount], [EntryNumber]) VALUES (1, 32, 1, 41, 1, 0, NULL, CAST(N'2016-07-22T19:03:07.337' AS DateTime), 0, NULL, 0)
INSERT [dbo].[TransactionEntryBase] ([StoreID], [TransactionEntryId], [TransactionId], [Price], [Quantity], [Taxable], [Comment], [TransactionTime], [SalesTaxPercent], [Discount], [EntryNumber]) VALUES (1, 33, 2, 41, 1, 0, NULL, CAST(N'2016-07-22T19:39:03.457' AS DateTime), 0, NULL, 0)
INSERT [dbo].[TransactionEntryBase] ([StoreID], [TransactionEntryId], [TransactionId], [Price], [Quantity], [Taxable], [Comment], [TransactionTime], [SalesTaxPercent], [Discount], [EntryNumber]) VALUES (0, 1032, 1001, 41, 1, 1, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TransactionEntryBase] OFF
INSERT [dbo].[TransactionEntryBase_PrescriptionEntry] ([Dosage], [ExpiryDate], [TransactionEntryId], [Repeat]) VALUES (NULL, NULL, 32, 0)
INSERT [dbo].[TransactionEntryBase_PrescriptionEntry] ([Dosage], [ExpiryDate], [TransactionEntryId], [Repeat]) VALUES (N'take 1', NULL, 33, 0)
INSERT [dbo].[TransactionEntryBase_PrescriptionEntry] ([Dosage], [ExpiryDate], [TransactionEntryId], [Repeat]) VALUES (N'take 1', NULL, 1032, 0)
INSERT [dbo].[TransactionEntryItem] ([TransactionEntryId], [QBItemListID], [ItemNumber], [ItemName], [ItemId]) VALUES (32, N'460', N'460', N'Bayer  Aspirin 325mg EC Tab ', 368)
INSERT [dbo].[TransactionEntryItem] ([TransactionEntryId], [QBItemListID], [ItemNumber], [ItemName], [ItemId]) VALUES (33, N'460', N'460', N'Bayer  Aspirin 325mg EC Tab ', 368)
INSERT [dbo].[TransactionEntryItem] ([TransactionEntryId], [QBItemListID], [ItemNumber], [ItemName], [ItemId]) VALUES (1032, N'460', N'460', N'Bayer  Aspirin 325mg EC Tab ', 368)
/****** Object:  Index [IX_FK_BatchCashier]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BatchCashier] ON [dbo].[Batches]
(
	[OpeningCashier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_BatchCashier1]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BatchCashier1] ON [dbo].[Batches]
(
	[ClosingCashier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StationBatch]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_StationBatch] ON [dbo].[Batches]
(
	[StationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CashierCashierLog]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CashierCashierLog] ON [dbo].[CashierLogs]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StoreStation]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_StoreStation] ON [dbo].[Stations]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CompanyStore]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CompanyStore] ON [dbo].[Stores]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_BatchTransactionBase]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BatchTransactionBase] ON [dbo].[TransactionBase]
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_BatchTransactionBase1]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BatchTransactionBase1] ON [dbo].[TransactionBase]
(
	[CloseBatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CashierTransactionBase]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CashierTransactionBase] ON [dbo].[TransactionBase]
(
	[CashierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CustomerTransaction]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CustomerTransaction] ON [dbo].[TransactionBase]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StationTransactionBase]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_StationTransactionBase] ON [dbo].[TransactionBase]
(
	[StationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DoctorPrescription]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DoctorPrescription] ON [dbo].[TransactionBase_Prescription]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PatientPrescription]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PatientPrescription] ON [dbo].[TransactionBase_Prescription]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TransactionTransactionEntry]    Script Date: 6/23/2017 9:39:32 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_TransactionTransactionEntry] ON [dbo].[TransactionEntryBase]
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD  CONSTRAINT [FK_BatchCashier] FOREIGN KEY([OpeningCashier])
REFERENCES [dbo].[Persons_Cashier] ([Id])
GO
ALTER TABLE [dbo].[Batches] CHECK CONSTRAINT [FK_BatchCashier]
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD  CONSTRAINT [FK_BatchCashier1] FOREIGN KEY([ClosingCashier])
REFERENCES [dbo].[Persons_Cashier] ([Id])
GO
ALTER TABLE [dbo].[Batches] CHECK CONSTRAINT [FK_BatchCashier1]
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD  CONSTRAINT [FK_StationBatch] FOREIGN KEY([StationId])
REFERENCES [dbo].[Stations] ([StationId])
GO
ALTER TABLE [dbo].[Batches] CHECK CONSTRAINT [FK_StationBatch]
GO
ALTER TABLE [dbo].[CashierLogs]  WITH CHECK ADD  CONSTRAINT [FK_CashierCashierLog] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons_Cashier] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashierLogs] CHECK CONSTRAINT [FK_CashierCashierLog]
GO
ALTER TABLE [dbo].[Item_Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_inherits_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Item_Medicine] CHECK CONSTRAINT [FK_Medicine_inherits_Item]
GO
ALTER TABLE [dbo].[Item_StockItem]  WITH CHECK ADD  CONSTRAINT [FK_StockItem_inherits_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Item_StockItem] CHECK CONSTRAINT [FK_StockItem_inherits_Item]
GO
ALTER TABLE [dbo].[Persons_Cashier]  WITH CHECK ADD  CONSTRAINT [FK_Cashier_inherits_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Persons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Persons_Cashier] CHECK CONSTRAINT [FK_Cashier_inherits_Person]
GO
ALTER TABLE [dbo].[Persons_Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_inherits_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Persons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Persons_Doctor] CHECK CONSTRAINT [FK_Doctor_inherits_Person]
GO
ALTER TABLE [dbo].[Persons_Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_inherits_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Persons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Persons_Patient] CHECK CONSTRAINT [FK_Patient_inherits_Person]
GO
ALTER TABLE [dbo].[Repeats]  WITH CHECK ADD  CONSTRAINT [FK_Repeats_TransactionBase] FOREIGN KEY([OldTransactionId])
REFERENCES [dbo].[TransactionBase] ([TransactionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Repeats] CHECK CONSTRAINT [FK_Repeats_TransactionBase]
GO
ALTER TABLE [dbo].[Repeats]  WITH CHECK ADD  CONSTRAINT [FK_Repeats_TransactionBase1] FOREIGN KEY([NewTransactionId])
REFERENCES [dbo].[TransactionBase] ([TransactionId])
GO
ALTER TABLE [dbo].[Repeats] CHECK CONSTRAINT [FK_Repeats_TransactionBase1]
GO
ALTER TABLE [dbo].[Stations]  WITH CHECK ADD  CONSTRAINT [FK_StoreStation] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
GO
ALTER TABLE [dbo].[Stations] CHECK CONSTRAINT [FK_StoreStation]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_CompanyStore] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_CompanyStore]
GO
ALTER TABLE [dbo].[TransactionBase]  WITH CHECK ADD  CONSTRAINT [FK_BatchTransactionBase] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[TransactionBase] CHECK CONSTRAINT [FK_BatchTransactionBase]
GO
ALTER TABLE [dbo].[TransactionBase]  WITH CHECK ADD  CONSTRAINT [FK_BatchTransactionBase1] FOREIGN KEY([CloseBatchId])
REFERENCES [dbo].[Batches] ([BatchId])
GO
ALTER TABLE [dbo].[TransactionBase] CHECK CONSTRAINT [FK_BatchTransactionBase1]
GO
ALTER TABLE [dbo].[TransactionBase]  WITH CHECK ADD  CONSTRAINT [FK_CashierTransactionBase] FOREIGN KEY([CashierId])
REFERENCES [dbo].[Persons_Cashier] ([Id])
GO
ALTER TABLE [dbo].[TransactionBase] CHECK CONSTRAINT [FK_CashierTransactionBase]
GO
ALTER TABLE [dbo].[TransactionBase]  WITH CHECK ADD  CONSTRAINT [FK_CustomerTransaction] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[TransactionBase] CHECK CONSTRAINT [FK_CustomerTransaction]
GO
ALTER TABLE [dbo].[TransactionBase]  WITH CHECK ADD  CONSTRAINT [FK_StationTransactionBase] FOREIGN KEY([StationId])
REFERENCES [dbo].[Stations] ([StationId])
GO
ALTER TABLE [dbo].[TransactionBase] CHECK CONSTRAINT [FK_StationTransactionBase]
GO
ALTER TABLE [dbo].[TransactionBase_Prescription]  WITH CHECK ADD  CONSTRAINT [FK_DoctorPrescription] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Persons_Doctor] ([Id])
GO
ALTER TABLE [dbo].[TransactionBase_Prescription] CHECK CONSTRAINT [FK_DoctorPrescription]
GO
ALTER TABLE [dbo].[TransactionBase_Prescription]  WITH CHECK ADD  CONSTRAINT [FK_PatientPrescription] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Persons_Patient] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionBase_Prescription] CHECK CONSTRAINT [FK_PatientPrescription]
GO
ALTER TABLE [dbo].[TransactionBase_Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_inherits_TransactionBase] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[TransactionBase] ([TransactionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionBase_Prescription] CHECK CONSTRAINT [FK_Prescription_inherits_TransactionBase]
GO
ALTER TABLE [dbo].[TransactionBase_QuickPrescription]  WITH CHECK ADD  CONSTRAINT [FK_QuickPrescription_inherits_TransactionBase] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[TransactionBase] ([TransactionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionBase_QuickPrescription] CHECK CONSTRAINT [FK_QuickPrescription_inherits_TransactionBase]
GO
ALTER TABLE [dbo].[TransactionEntryBase]  WITH CHECK ADD  CONSTRAINT [FK_TransactionTransactionEntry] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[TransactionBase] ([TransactionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionEntryBase] CHECK CONSTRAINT [FK_TransactionTransactionEntry]
GO
ALTER TABLE [dbo].[TransactionEntryBase_PrescriptionEntry]  WITH CHECK ADD  CONSTRAINT [FK_PrescriptionEntry_inherits_TransactionEntryBase] FOREIGN KEY([TransactionEntryId])
REFERENCES [dbo].[TransactionEntryBase] ([TransactionEntryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionEntryBase_PrescriptionEntry] CHECK CONSTRAINT [FK_PrescriptionEntry_inherits_TransactionEntryBase]
GO
ALTER TABLE [dbo].[TransactionEntryItem]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEntryItem_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TransactionEntryItem] CHECK CONSTRAINT [FK_TransactionEntryItem_Item]
GO
ALTER TABLE [dbo].[TransactionEntryItem]  WITH CHECK ADD  CONSTRAINT [FK_TransactionEntryItem_TransactionEntryBase] FOREIGN KEY([TransactionEntryId])
REFERENCES [dbo].[TransactionEntryBase] ([TransactionEntryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionEntryItem] CHECK CONSTRAINT [FK_TransactionEntryItem_TransactionEntryBase]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Persons_Doctor"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 152
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Persons"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 564
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1760
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DoctorsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DoctorsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[27] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TransactionEntryBase_PrescriptionEntry"
            Begin Extent = 
               Top = 3
               Left = 44
               Bottom = 200
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactionEntryItem"
            Begin Extent = 
               Top = 9
               Left = 1060
               Bottom = 206
               Right = 1326
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 2730
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3280
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ItemDosage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ItemDosage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Persons"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Persons_Patient"
            Begin Extent = 
               Top = 9
               Left = 342
               Bottom = 206
               Right = 564
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2040
         Width = 1670
         Width = 1890
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PatientView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PatientView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 10
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -288
      End
      Begin Tables = 
         Begin Table = "PatientView"
            Begin Extent = 
               Top = 352
               Left = 1400
               Bottom = 549
               Right = 1622
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DoctorsView"
            Begin Extent = 
               Top = 9
               Left = 1291
               Bottom = 179
               Right = 1513
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactionBase_Prescription"
            Begin Extent = 
               Top = 0
               Left = 957
               Bottom = 170
               Right = 1299
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactionBase"
            Begin Extent = 
               Top = 0
               Left = 598
               Bottom = 224
               Right = 896
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactionEntryBase"
            Begin Extent = 
               Top = 340
               Left = 671
               Bottom = 537
               Right = 971
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "Item"
            Begin Extent = 
               Top = 134
               Left = 20
               Bottom = 331
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactionEntryBase_PrescriptionEntry"
            Begin Extent = 
               Top = 0
               Left = 128
               Bottom' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 220
               Right = 590
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TransactionEntryItem"
            Begin Extent = 
               Top = 247
               Left = 1086
               Bottom = 444
               Right = 1336
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 3030
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 9270
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TransactionBase"
            Begin Extent = 
               Top = 1
               Left = 34
               Bottom = 277
               Right = 281
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "TransactionEntryBase"
            Begin Extent = 
               Top = 3
               Left = 442
               Bottom = 200
               Right = 692
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TransactionsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TransactionsView'
GO
USE [master]
GO
ALTER DATABASE [GP-QuickSales-Enterprise] SET  READ_WRITE 
GO
