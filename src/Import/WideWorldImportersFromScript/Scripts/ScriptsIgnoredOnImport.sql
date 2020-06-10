
USE [master]
GO

/****** Object:  Database [WideWorldImporters]    Script Date: 10/06/2020 18:14:16 ******/
CREATE DATABASE [WideWorldImporters]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WideWorldImporters_Data', FILENAME = N's:\Data\WWI\WideWorldImporters.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [USERDATA] 
( NAME = N'USERDATA_46D4DF5B', FILENAME = N'F:\Data\WideWorldImporters_USERDATA_46D4DF5B.mdf' , SIZE = 598016KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WideWorldImporters_Log', FILENAME = N's:\Data\WWI\WideWorldImporters.ldf' , SIZE = 67904KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Latin1_General_100_CI_AS
GO

ALTER DATABASE [WideWorldImporters] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WideWorldImporters].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [WideWorldImporters] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [WideWorldImporters] SET ANSI_NULLS OFF
GO

ALTER DATABASE [WideWorldImporters] SET ANSI_PADDING OFF
GO

ALTER DATABASE [WideWorldImporters] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [WideWorldImporters] SET ARITHABORT OFF
GO

ALTER DATABASE [WideWorldImporters] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [WideWorldImporters] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [WideWorldImporters] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [WideWorldImporters] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [WideWorldImporters] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [WideWorldImporters] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [WideWorldImporters] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [WideWorldImporters] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [WideWorldImporters] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [WideWorldImporters] SET  DISABLE_BROKER
GO

ALTER DATABASE [WideWorldImporters] SET AUTO_UPDATE_STATISTICS_ASYNC ON
GO

ALTER DATABASE [WideWorldImporters] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [WideWorldImporters] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [WideWorldImporters] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [WideWorldImporters] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [WideWorldImporters] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [WideWorldImporters] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [WideWorldImporters] SET RECOVERY SIMPLE
GO

ALTER DATABASE [WideWorldImporters] SET  MULTI_USER
GO

ALTER DATABASE [WideWorldImporters] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [WideWorldImporters] SET DB_CHAINING OFF
GO

ALTER DATABASE [WideWorldImporters] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [WideWorldImporters] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

ALTER DATABASE [WideWorldImporters] SET DELAYED_DURABILITY = DISABLED
GO

EXEC sys.sp_db_vardecimal_storage_format N'WideWorldImporters', N'ON'
GO

ALTER DATABASE [WideWorldImporters] SET QUERY_STORE = ON
GO

ALTER DATABASE [WideWorldImporters] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 3000, INTERVAL_LENGTH_MINUTES = 15, MAX_STORAGE_SIZE_MB = 500, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO

ALTER AUTHORIZATION ON DATABASE::[WideWorldImporters] TO [DEV19\Administrator]
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON ROLE::[Southwest Sales] TO [dbo]
GO

ALTER AUTHORIZATION ON ROLE::[Southeast Sales] TO [dbo]
GO

ALTER AUTHORIZATION ON ROLE::[Rocky Mountain Sales] TO [dbo]
GO

ALTER AUTHORIZATION ON ROLE::[Plains Sales] TO [dbo]
GO

ALTER AUTHORIZATION ON ROLE::[New England Sales] TO [dbo]
GO

ALTER AUTHORIZATION ON ROLE::[Mideast Sales] TO [dbo]
GO

ALTER AUTHORIZATION ON ROLE::[Great Lakes Sales] TO [dbo]
GO

ALTER AUTHORIZATION ON ROLE::[Far West Sales] TO [dbo]
GO

ALTER AUTHORIZATION ON ROLE::[External Sales] TO [dbo]
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[BuyingGroupID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[CityID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[ColorID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[CountryID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[CustomerCategoryID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[CustomerID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[DeliveryMethodID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[InvoiceID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[InvoiceLineID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[OrderID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[OrderLineID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[PackageTypeID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[PaymentMethodID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[PersonID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[PurchaseOrderID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[PurchaseOrderLineID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[SpecialDealID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[StateProvinceID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[StockGroupID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[StockItemID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[StockItemStockGroupID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[SupplierCategoryID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[SupplierID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[SystemParameterID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[TransactionID] TO  SCHEMA OWNER
GO

USE [WideWorldImporters]
GO

ALTER AUTHORIZATION ON [Sequences].[TransactionTypeID] TO  SCHEMA OWNER
GO

ALTER AUTHORIZATION ON TYPE::[Website].[OrderIDList] TO  SCHEMA OWNER
GO

ALTER AUTHORIZATION ON TYPE::[Website].[OrderLineList] TO  SCHEMA OWNER
GO

ALTER AUTHORIZATION ON TYPE::[Website].[OrderList] TO  SCHEMA OWNER
GO

ALTER AUTHORIZATION ON TYPE::[Website].[SensorDataList] TO  SCHEMA OWNER
GO

/****** Object:  UserDefinedFunction [Website].[CalculateCustomerPrice]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[CalculateCustomerPrice] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[Cities_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Cities_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[Cities]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Cities] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[Countries_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Countries_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[Countries]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Countries] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[DeliveryMethods_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[DeliveryMethods_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[DeliveryMethods]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[DeliveryMethods] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[PaymentMethods_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[PaymentMethods_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[PaymentMethods]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[PaymentMethods] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[People_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[People_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[People]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[People] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[StateProvinces_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[StateProvinces_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[StateProvinces]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[StateProvinces] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[TransactionTypes_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[TransactionTypes_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[TransactionTypes]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[TransactionTypes] TO  SCHEMA OWNER
GO

/****** Object:  Table [Purchasing].[SupplierCategories_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Purchasing].[SupplierCategories_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Purchasing].[SupplierCategories]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Purchasing].[SupplierCategories] TO  SCHEMA OWNER
GO

/****** Object:  Table [Purchasing].[Suppliers_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Purchasing].[Suppliers_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Purchasing].[Suppliers]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Purchasing].[Suppliers] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[BuyingGroups_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[BuyingGroups_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[BuyingGroups]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[BuyingGroups] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[CustomerCategories_Archive]    Script Date: 10/06/2020 18:14:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[CustomerCategories_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[CustomerCategories]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[CustomerCategories] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[Customers_Archive]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[Customers_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[Customers]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[Customers] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[ColdRoomTemperatures_Archive]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[ColdRoomTemperatures_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[ColdRoomTemperatures]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[ColdRoomTemperatures] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[Colors_Archive]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[Colors_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[Colors]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[Colors] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[PackageTypes_Archive]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[PackageTypes_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[PackageTypes]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[PackageTypes] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[StockGroups_Archive]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[StockGroups_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[StockGroups]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[StockGroups] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[StockItems_Archive]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[StockItems_Archive] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[StockItems]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[StockItems] TO  SCHEMA OWNER
GO

/****** Object:  View [Website].[Customers]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[Customers] TO  SCHEMA OWNER
GO

/****** Object:  View [Website].[Suppliers]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[Suppliers] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[VehicleTemperatures]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[VehicleTemperatures] TO  SCHEMA OWNER
GO

/****** Object:  View [Website].[VehicleTemperatures]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[VehicleTemperatures] TO  SCHEMA OWNER
GO

/****** Object:  Table [Application].[SystemParameters]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[SystemParameters] TO  SCHEMA OWNER
GO

/****** Object:  Table [Purchasing].[PurchaseOrderLines]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Purchasing].[PurchaseOrderLines] TO  SCHEMA OWNER
GO

/****** Object:  Table [Purchasing].[PurchaseOrders]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Purchasing].[PurchaseOrders] TO  SCHEMA OWNER
GO

/****** Object:  Table [Purchasing].[SupplierTransactions]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Purchasing].[SupplierTransactions] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[CustomerTransactions]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[CustomerTransactions] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[InvoiceLines]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[InvoiceLines] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[Invoices]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[Invoices] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[OrderLines]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[OrderLines] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[Orders]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[Orders] TO  SCHEMA OWNER
GO

/****** Object:  Table [Sales].[SpecialDeals]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sales].[SpecialDeals] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[StockItemHoldings]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[StockItemHoldings] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[StockItemStockGroups]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[StockItemStockGroups] TO  SCHEMA OWNER
GO

/****** Object:  Table [Warehouse].[StockItemTransactions]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Warehouse].[StockItemTransactions] TO  SCHEMA OWNER
GO

SET ANSI_PADDING ON
GO

SET ANSI_PADDING ON
GO

SET ARITHABORT ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_WARNINGS ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET ARITHABORT ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_WARNINGS ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET ARITHABORT ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO

SET ANSI_PADDING ON
GO

SET ANSI_WARNINGS ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

/****** Object:  StoredProcedure [Application].[AddRoleMemberIfNonexistent]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[AddRoleMemberIfNonexistent] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_ApplyAuditing]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_ApplyAuditing] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_ApplyColumnstoreIndexing]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_ApplyColumnstoreIndexing] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_ApplyFullTextIndexing]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_ApplyFullTextIndexing] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_ApplyPartitioning]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_ApplyPartitioning] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_ApplyRowLevelSecurity]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_ApplyRowLevelSecurity] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_ConfigureForEnterpriseEdition]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_ConfigureForEnterpriseEdition] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_EnableInMemory]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_EnableInMemory] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_RemoveAuditing]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_RemoveAuditing] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[Configuration_RemoveRowLevelSecurity]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[Configuration_RemoveRowLevelSecurity] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Application].[CreateRoleIfNonexistent]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Application].[CreateRoleIfNonexistent] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [DataLoadSimulation].[Configuration_ApplyDataLoadSimulationProcedures]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [DataLoadSimulation].[Configuration_ApplyDataLoadSimulationProcedures] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [DataLoadSimulation].[Configuration_RemoveDataLoadSimulationProcedures]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [DataLoadSimulation].[Configuration_RemoveDataLoadSimulationProcedures] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [DataLoadSimulation].[DeactivateTemporalTablesBeforeDataLoad]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [DataLoadSimulation].[DeactivateTemporalTablesBeforeDataLoad] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [DataLoadSimulation].[PopulateDataToCurrentDate]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [DataLoadSimulation].[PopulateDataToCurrentDate] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [DataLoadSimulation].[ReactivateTemporalTablesAfterDataLoad]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [DataLoadSimulation].[ReactivateTemporalTablesAfterDataLoad] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetCityUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetCityUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetCustomerUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetCustomerUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetEmployeeUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetEmployeeUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetMovementUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetMovementUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetOrderUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetOrderUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetPaymentMethodUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetPaymentMethodUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetPurchaseUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetPurchaseUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetSaleUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetSaleUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetStockHoldingUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetStockHoldingUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetStockItemUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetStockItemUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetSupplierUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetSupplierUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetTransactionTypeUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetTransactionTypeUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Integration].[GetTransactionUpdates]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Integration].[GetTransactionUpdates] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Sequences].[ReseedAllSequences]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sequences].[ReseedAllSequences] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Sequences].[ReseedSequenceBeyondTableValues]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Sequences].[ReseedSequenceBeyondTableValues] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[ActivateWebsiteLogon]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[ActivateWebsiteLogon] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[ChangePassword]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[ChangePassword] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[InsertCustomerOrders]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[InsertCustomerOrders] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[InvoiceCustomerOrders]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[InvoiceCustomerOrders] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[RecordColdRoomTemperatures]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[RecordColdRoomTemperatures] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[RecordVehicleTemperature]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[RecordVehicleTemperature] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[SearchForCustomers]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[SearchForCustomers] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[SearchForPeople]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[SearchForPeople] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[SearchForStockItems]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[SearchForStockItems] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[SearchForStockItemsByTags]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[SearchForStockItemsByTags] TO  SCHEMA OWNER
GO

/****** Object:  StoredProcedure [Website].[SearchForSuppliers]    Script Date: 10/06/2020 18:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER AUTHORIZATION ON [Website].[SearchForSuppliers] TO  SCHEMA OWNER
GO

USE [master]
GO

ALTER DATABASE [WideWorldImporters] SET  READ_WRITE
GO
