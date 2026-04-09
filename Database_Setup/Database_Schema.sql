USE [master]
GO
/****** Object:  Database [VehicleMakesDB]    Script Date: 4/9/2026 6:15:44 PM ******/
CREATE DATABASE [VehicleMakesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'T1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\T1.mdf' , SIZE = 335872KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'T1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\T1_log.ldf' , SIZE = 1122304KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VehicleMakesDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VehicleMakesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VehicleMakesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VehicleMakesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VehicleMakesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VehicleMakesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VehicleMakesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET RECOVERY FULL 
GO
ALTER DATABASE [VehicleMakesDB] SET  MULTI_USER 
GO
ALTER DATABASE [VehicleMakesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VehicleMakesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VehicleMakesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VehicleMakesDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VehicleMakesDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VehicleMakesDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VehicleMakesDB', N'ON'
GO
ALTER DATABASE [VehicleMakesDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [VehicleMakesDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VehicleMakesDB]
GO
/****** Object:  Table [dbo].[Makes]    Script Date: 4/9/2026 6:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makes](
	[MakeID] [int] IDENTITY(1,1) NOT NULL,
	[Make] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Make] PRIMARY KEY CLUSTERED 
(
	[MakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MakeModels]    Script Date: 4/9/2026 6:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakeModels](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[MakeID] [int] NOT NULL,
	[ModelName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_MakeModels] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubModels]    Script Date: 4/9/2026 6:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubModels](
	[SubModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[SubModelName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SubModels] PRIMARY KEY CLUSTERED 
(
	[SubModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelTypes]    Script Date: 4/9/2026 6:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelTypes](
	[FuelTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FuelTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FuleTypes] PRIMARY KEY CLUSTERED 
(
	[FuelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriveTypes]    Script Date: 4/9/2026 6:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriveTypes](
	[DriveTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DriveTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DriveTypes] PRIMARY KEY CLUSTERED 
(
	[DriveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bodies]    Script Date: 4/9/2026 6:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodies](
	[BodyID] [int] IDENTITY(1,1) NOT NULL,
	[BodyName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bodies] PRIMARY KEY CLUSTERED 
(
	[BodyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleDetails]    Script Date: 4/9/2026 6:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleDetails](
	[ID] [int] NOT NULL,
	[MakeID] [int] NULL,
	[ModelID] [int] NULL,
	[SubModelID] [int] NULL,
	[BodyID] [int] NULL,
	[Vehicle_Display_Name] [nvarchar](150) NULL,
	[Year] [smallint] NULL,
	[DriveTypeID] [int] NULL,
	[Engine] [nvarchar](100) NULL,
	[Engine_CC] [smallint] NULL,
	[Engine_Cylinders] [tinyint] NULL,
	[Engine_Liter_Display] [money] NULL,
	[FuelTypeID] [int] NULL,
	[NumDoors] [tinyint] NULL,
 CONSTRAINT [PK_CarDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VehicleMasterVeiw]    Script Date: 4/9/2026 6:15:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VehicleMasterVeiw]
AS
SELECT dbo.Makes.Make AS Expr6, dbo.FuelTypes.FuelTypeName AS Expr2, dbo.VehicleDetails.MakeID AS Expr7, dbo.VehicleDetails.ModelID, dbo.SubModels.SubModelName, dbo.VehicleDetails.SubModelID, dbo.Bodies.BodyName, 
                  dbo.DriveTypes.DriveTypeName, dbo.MakeModels.ModelName, dbo.VehicleDetails.BodyID, dbo.VehicleDetails.Vehicle_Display_Name, dbo.VehicleDetails.Year, dbo.VehicleDetails.DriveTypeID AS Expr1, dbo.VehicleDetails.Engine, 
                  dbo.VehicleDetails.Engine_CC, dbo.VehicleDetails.Engine_Cylinders, dbo.VehicleDetails.Engine_Liter_Display, dbo.VehicleDetails.FuelTypeID, dbo.VehicleDetails.NumDoors
FROM     dbo.FuelTypes INNER JOIN
                  dbo.Bodies INNER JOIN
                  dbo.Makes INNER JOIN
                  dbo.MakeModels ON dbo.Makes.MakeID = dbo.MakeModels.MakeID INNER JOIN
                  dbo.SubModels ON dbo.MakeModels.ModelID = dbo.SubModels.ModelID INNER JOIN
                  dbo.VehicleDetails ON dbo.SubModels.SubModelID = dbo.VehicleDetails.SubModelID ON dbo.Bodies.BodyID = dbo.VehicleDetails.BodyID INNER JOIN
                  dbo.DriveTypes ON dbo.VehicleDetails.DriveTypeID = dbo.DriveTypes.DriveTypeID ON dbo.FuelTypes.FuelTypeID = dbo.VehicleDetails.FuelTypeID
GO
ALTER TABLE [dbo].[MakeModels]  WITH CHECK ADD  CONSTRAINT [FK_MakeModels_Makes] FOREIGN KEY([MakeID])
REFERENCES [dbo].[Makes] ([MakeID])
GO
ALTER TABLE [dbo].[MakeModels] CHECK CONSTRAINT [FK_MakeModels_Makes]
GO
ALTER TABLE [dbo].[SubModels]  WITH CHECK ADD  CONSTRAINT [FK_SubModels_MakeModels] FOREIGN KEY([ModelID])
REFERENCES [dbo].[MakeModels] ([ModelID])
GO
ALTER TABLE [dbo].[SubModels] CHECK CONSTRAINT [FK_SubModels_MakeModels]
GO
ALTER TABLE [dbo].[VehicleDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehicleDetails_Bodies] FOREIGN KEY([BodyID])
REFERENCES [dbo].[Bodies] ([BodyID])
GO
ALTER TABLE [dbo].[VehicleDetails] CHECK CONSTRAINT [FK_VehicleDetails_Bodies]
GO
ALTER TABLE [dbo].[VehicleDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehicleDetails_DriveTypes] FOREIGN KEY([DriveTypeID])
REFERENCES [dbo].[DriveTypes] ([DriveTypeID])
GO
ALTER TABLE [dbo].[VehicleDetails] CHECK CONSTRAINT [FK_VehicleDetails_DriveTypes]
GO
ALTER TABLE [dbo].[VehicleDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehicleDetails_FuelTypes] FOREIGN KEY([FuelTypeID])
REFERENCES [dbo].[FuelTypes] ([FuelTypeID])
GO
ALTER TABLE [dbo].[VehicleDetails] CHECK CONSTRAINT [FK_VehicleDetails_FuelTypes]
GO
ALTER TABLE [dbo].[VehicleDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehicleDetails_SubModels] FOREIGN KEY([SubModelID])
REFERENCES [dbo].[SubModels] ([SubModelID])
GO
ALTER TABLE [dbo].[VehicleDetails] CHECK CONSTRAINT [FK_VehicleDetails_SubModels]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[13] 2[14] 3) )"
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
         Begin Table = "Bodies"
            Begin Extent = 
               Top = 71
               Left = 61
               Bottom = 190
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DriveTypes"
            Begin Extent = 
               Top = 224
               Left = 57
               Bottom = 343
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FuelTypes"
            Begin Extent = 
               Top = 2
               Left = 283
               Bottom = 121
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MakeModels"
            Begin Extent = 
               Top = 57
               Left = 1115
               Bottom = 198
               Right = 1309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Makes"
            Begin Extent = 
               Top = 29
               Left = 844
               Bottom = 148
               Right = 1038
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SubModels"
            Begin Extent = 
               Top = 254
               Left = 875
               Bottom = 395
               Right = 1078
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VehicleDetails"
            Begin Extent = 
               Top = 44
               Left = 519
               Bottom = 379
               Right = 763
            End
            Di' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VehicleMasterVeiw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'splayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VehicleMasterVeiw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VehicleMasterVeiw'
GO
USE [master]
GO
ALTER DATABASE [VehicleMakesDB] SET  READ_WRITE 
GO
