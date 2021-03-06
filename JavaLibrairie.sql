USE [master]
GO
/****** Object:  Database [Librairie]    Script Date: 10/06/2021 20:39:00 ******/
CREATE DATABASE [Librairie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Librairie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Librairie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Librairie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Librairie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Librairie] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Librairie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Librairie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Librairie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Librairie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Librairie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Librairie] SET ARITHABORT OFF 
GO
ALTER DATABASE [Librairie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Librairie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Librairie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Librairie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Librairie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Librairie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Librairie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Librairie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Librairie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Librairie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Librairie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Librairie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Librairie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Librairie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Librairie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Librairie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Librairie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Librairie] SET RECOVERY FULL 
GO
ALTER DATABASE [Librairie] SET  MULTI_USER 
GO
ALTER DATABASE [Librairie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Librairie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Librairie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Librairie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Librairie] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Librairie', N'ON'
GO
ALTER DATABASE [Librairie] SET QUERY_STORE = OFF
GO
USE [Librairie]
GO
/****** Object:  User [Admin]    Script Date: 10/06/2021 20:39:00 ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_02_ListeClient]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
 Author:		<Author,,Name>
 Create date: <Create Date,,>
 Description:	<Description,,>
 =============================================*/
CREATE VIEW [dbo].[V_02_ListeClient]
AS
SELECT dbo.Personne.id, dbo.Personne.Nom, dbo.Personne.Prénom
FROM     dbo.Client INNER JOIN
                  dbo.Personne ON dbo.Client.id = dbo.Personne.id
GO
/****** Object:  View [dbo].[V_01_ListeEmploye]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
 Author:		<Author,,Name>
 Create date: <Create Date,,>
 Description:	<Description,,>*/
CREATE VIEW [dbo].[V_01_ListeEmploye]
AS
SELECT dbo.Vendeur.id, dbo.Personne.Nom, dbo.Personne.Prénom
FROM     dbo.Vendeur INNER JOIN
                  dbo.Personne ON dbo.Vendeur.id = dbo.Personne.id
GO
/****** Object:  View [dbo].[V_03_PersonneCategorie]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_03_PersonneCategorie] AS
SELECT
Personne.Nom,Personne.Prénom, Personne.Adresse,Personne.CP, Personne.Ville, Personne.Age, Personne.Téléphone, Vendeur.id

FROM
Personne INNER JOIN Vendeur ON Personne.id = Vendeur.id
GO
/****** Object:  Table [dbo].[Auteur]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auteur](
	[Id_Auteur] [int] NOT NULL,
	[Nom_Auteur] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Auteur] PRIMARY KEY CLUSTERED 
(
	[Id_Auteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editeur]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editeur](
	[Id_Editeur] [int] NOT NULL,
	[Nom_Editeur] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Editeur] PRIMARY KEY CLUSTERED 
(
	[Id_Editeur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employe]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employe](
	[id_employe] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Employe] PRIMARY KEY CLUSTERED 
(
	[id_employe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livre]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livre](
	[Id_Livre] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Livre] [varchar](50) NOT NULL,
	[Prix] [money] NOT NULL,
	[Auteur] [varchar](50) NOT NULL,
	[Editeur] [varchar](50) NOT NULL,
	[Quantité] [varchar](50) NOT NULL,
	[Rayon] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Livre] PRIMARY KEY CLUSTERED 
(
	[Id_Livre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 10/06/2021 20:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[nom_user] [varchar](50) NOT NULL,
	[prenom_user] [varchar](max) NOT NULL,
	[mail_user] [varchar](50) NOT NULL,
	[id_client] [int] NOT NULL,
	[id_employe] [int] NOT NULL,
 CONSTRAINT [PK_Utilisateur] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Utilisateur]  WITH CHECK ADD  CONSTRAINT [FK_Utilisateur_Client] FOREIGN KEY([id_client])
REFERENCES [dbo].[Client] ([id_client])
GO
ALTER TABLE [dbo].[Utilisateur] CHECK CONSTRAINT [FK_Utilisateur_Client]
GO
ALTER TABLE [dbo].[Utilisateur]  WITH CHECK ADD  CONSTRAINT [FK_Utilisateur_Employe] FOREIGN KEY([id_employe])
REFERENCES [dbo].[Employe] ([id_employe])
GO
ALTER TABLE [dbo].[Utilisateur] CHECK CONSTRAINT [FK_Utilisateur_Employe]
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
         Begin Table = "Vendeur"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personne"
            Begin Extent = 
               Top = 126
               Left = 48
               Bottom = 289
               Right = 242
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_01_ListeEmploye'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_01_ListeEmploye'
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
         Begin Table = "Client"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 104
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personne"
            Begin Extent = 
               Top = 105
               Left = 48
               Bottom = 268
               Right = 242
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_02_ListeClient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_02_ListeClient'
GO
USE [master]
GO
ALTER DATABASE [Librairie] SET  READ_WRITE 
GO
