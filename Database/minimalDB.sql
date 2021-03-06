USE [master]
GO
/****** Object:  Database [Minimal]    Script Date: 12/9/2021 1:59:59 PM ******/
CREATE DATABASE [Minimal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Minimal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Minimal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Minimal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Minimal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Minimal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Minimal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Minimal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Minimal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Minimal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Minimal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Minimal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Minimal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Minimal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Minimal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Minimal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Minimal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Minimal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Minimal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Minimal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Minimal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Minimal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Minimal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Minimal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Minimal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Minimal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Minimal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Minimal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Minimal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Minimal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Minimal] SET  MULTI_USER 
GO
ALTER DATABASE [Minimal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Minimal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Minimal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Minimal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Minimal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Minimal] SET QUERY_STORE = OFF
GO
USE [Minimal]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/9/2021 1:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [uniqueidentifier] NOT NULL,
	[userId] [uniqueidentifier] NOT NULL,
	[categoryName] [varchar](50) NOT NULL,
	[categoryDescription] [varchar](200) NOT NULL,
	[totalCategoryItems] [int] NOT NULL,
	[totalCategoryItemsRemoved] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryItem]    Script Date: 12/9/2021 1:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryItem](
	[categoryItemId] [uniqueidentifier] NOT NULL,
	[categoryId] [uniqueidentifier] NOT NULL,
	[itemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CategoryItem] PRIMARY KEY CLUSTERED 
(
	[categoryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 12/9/2021 1:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[itemId] [uniqueidentifier] NOT NULL,
	[userId] [uniqueidentifier] NOT NULL,
	[itemName] [varchar](50) NOT NULL,
	[itemDescription] [varchar](200) NOT NULL,
	[timeOwned] [date] NULL,
	[quantity] [int] NOT NULL,
	[isDuplicate] [bit] NOT NULL,
	[isRemoved] [bit] NOT NULL,
	[necessityRank] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/9/2021 1:59:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [uniqueidentifier] NOT NULL,
	[firebaseKey] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[userGoalTier] [int] NOT NULL,
	[totalItemsOwned] [int] NOT NULL,
	[totalItemsRemoved] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'0f617582-f381-4e80-934f-07bf530ac31b', N'454626d6-6345-492d-ac6b-2abe7c41c949', N'Kitchen', N'Stuff', 53, 12, CAST(N'2021-12-09T17:41:44.830' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'9d2a9f4d-b838-4e27-9042-182e064a977a', N'f43419a3-0e9c-4ca8-a7bc-7f429c935897', N'Garage', N'Wheels and Stuff', 32, 23, CAST(N'2021-12-09T17:43:52.790' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'6aeddbad-9f6b-45cb-8083-2273990d2aaf', N'454626d6-6345-492d-ac6b-2abe7c41c949', N'Bedroom', N'Clothing', 60, 43, CAST(N'2021-12-09T17:41:14.103' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'c5f50c67-d115-4b77-953f-514b307b16bd', N'bd6e3c74-e8bd-490e-a854-0989d3fa5631', N'Bedroom', N'Bedroom Related Items', 23, 1, CAST(N'2021-12-09T17:39:20.253' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'6a85e19d-49b8-427c-a9c2-7982328eb384', N'f2685713-8da8-4f99-99ca-a3aeb2ed08b8', N'Bedrrom', N'Bedroom Stuff', 45, 12, CAST(N'2021-12-09T17:46:53.900' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'ff5bbd95-99e4-4893-bbca-82a05606d184', N'bd6e3c74-e8bd-490e-a854-0989d3fa5631', N'Kitchen', N'Kitchen Appliances', 26, 3, CAST(N'2021-12-09T17:39:41.703' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'80af2dc8-d056-4969-81de-92dbd75aa59f', N'f43419a3-0e9c-4ca8-a7bc-7f429c935897', N'Kitchen', N'Yard', 12, 1, CAST(N'2021-12-09T17:43:30.310' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'd33cb717-d1f6-4f98-ab7b-9321994d7ddf', N'30ac3ae3-4f49-4473-803b-4d5de3deb58f', N'Bedroom', N'Clothing related stuff', 34, 13, CAST(N'2021-12-09T17:42:56.243' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'047f7043-c3b5-4260-a738-a4738280ee46', N'30ac3ae3-4f49-4473-803b-4d5de3deb58f', N'Laundry Room', N'Detergent', 12, 2, CAST(N'2021-12-09T17:42:24.853' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'505d7946-5127-4adb-97e7-e5be3016b637', N'bd6e3c74-e8bd-490e-a854-0989d3fa5631', N'Garage', N'Stuff in the Garage', 56, 45, CAST(N'2021-12-09T17:39:58.740' AS DateTime))
INSERT [dbo].[Category] ([categoryId], [userId], [categoryName], [categoryDescription], [totalCategoryItems], [totalCategoryItemsRemoved], [createdAt]) VALUES (N'fb7ca301-a0c9-41b2-b31b-f0428f09d955', N'f2685713-8da8-4f99-99ca-a3aeb2ed08b8', N'Living Room', N'Stuff', 45, 32, CAST(N'2021-12-09T17:45:53.383' AS DateTime))
GO
INSERT [dbo].[CategoryItem] ([categoryItemId], [categoryId], [itemId]) VALUES (N'8453b28c-0d1b-46e2-9970-1a67b1a0f3bb', N'fb7ca301-a0c9-41b2-b31b-f0428f09d955', N'52d23a8f-faec-4d4d-b97c-eff49212ece2')
INSERT [dbo].[CategoryItem] ([categoryItemId], [categoryId], [itemId]) VALUES (N'231fd1e7-6ecc-4280-b8ec-7e6b1eebc707', N'9d2a9f4d-b838-4e27-9042-182e064a977a', N'e3396faa-4e9f-4204-a565-d32f2bc398ed')
INSERT [dbo].[CategoryItem] ([categoryItemId], [categoryId], [itemId]) VALUES (N'783254ef-41cd-4094-b5de-9ea7afd75d9e', N'6aeddbad-9f6b-45cb-8083-2273990d2aaf', N'6e94f9b9-a09c-4e18-b921-e2d8821bd497')
INSERT [dbo].[CategoryItem] ([categoryItemId], [categoryId], [itemId]) VALUES (N'bce42092-4eea-4195-9229-b299574900a4', N'0f617582-f381-4e80-934f-07bf530ac31b', N'6e94f9b9-a09c-4e18-b921-e2d8821bd497')
INSERT [dbo].[CategoryItem] ([categoryItemId], [categoryId], [itemId]) VALUES (N'423161b8-216f-4a9a-89d6-e16b3e6f4021', N'd33cb717-d1f6-4f98-ab7b-9321994d7ddf', N'bb4326fd-bda3-4626-9c70-a3d7e15763de')
GO
INSERT [dbo].[Item] ([itemId], [userId], [itemName], [itemDescription], [timeOwned], [quantity], [isDuplicate], [isRemoved], [necessityRank], [createdAt]) VALUES (N'61a91b27-818b-42f7-a5de-6d0206b6e746', N'bd6e3c74-e8bd-490e-a854-0989d3fa5631', N'Shirt', N'Band T shirt', CAST(N'2005-09-10' AS Date), 1, 0, 0, 5, CAST(N'2021-12-09T17:57:03.453' AS DateTime))
INSERT [dbo].[Item] ([itemId], [userId], [itemName], [itemDescription], [timeOwned], [quantity], [isDuplicate], [isRemoved], [necessityRank], [createdAt]) VALUES (N'bb4326fd-bda3-4626-9c70-a3d7e15763de', N'30ac3ae3-4f49-4473-803b-4d5de3deb58f', N'Rake', N'Large rake for leaves', CAST(N'2000-11-13' AS Date), 1, 0, 1, 12, CAST(N'2021-12-09T17:58:13.990' AS DateTime))
INSERT [dbo].[Item] ([itemId], [userId], [itemName], [itemDescription], [timeOwned], [quantity], [isDuplicate], [isRemoved], [necessityRank], [createdAt]) VALUES (N'e3396faa-4e9f-4204-a565-d32f2bc398ed', N'f43419a3-0e9c-4ca8-a7bc-7f429c935897', N'Small Hose', N'hose for garden', CAST(N'2012-08-31' AS Date), 12, 0, 1, 45, CAST(N'2021-12-09T17:59:06.690' AS DateTime))
INSERT [dbo].[Item] ([itemId], [userId], [itemName], [itemDescription], [timeOwned], [quantity], [isDuplicate], [isRemoved], [necessityRank], [createdAt]) VALUES (N'6e94f9b9-a09c-4e18-b921-e2d8821bd497', N'454626d6-6345-492d-ac6b-2abe7c41c949', N'Shirt', N'Small T Shirt', CAST(N'1998-11-12' AS Date), 1, 1, 0, 3, CAST(N'2021-12-09T17:57:36.760' AS DateTime))
INSERT [dbo].[Item] ([itemId], [userId], [itemName], [itemDescription], [timeOwned], [quantity], [isDuplicate], [isRemoved], [necessityRank], [createdAt]) VALUES (N'52d23a8f-faec-4d4d-b97c-eff49212ece2', N'f2685713-8da8-4f99-99ca-a3aeb2ed08b8', N'Table', N'Kitchen Table', CAST(N'2021-09-13' AS Date), 1, 0, 0, 12, CAST(N'2021-12-09T17:59:42.450' AS DateTime))
GO
INSERT [dbo].[Users] ([userId], [firebaseKey], [firstName], [lastName], [email], [userGoalTier], [totalItemsOwned], [totalItemsRemoved], [createdAt]) VALUES (N'bd6e3c74-e8bd-490e-a854-0989d3fa5631', NULL, N'Sean', N'Rossettie', N'seancrossettie@gmail.com', 1, 100, 0, CAST(N'2021-12-09T17:13:41.097' AS DateTime))
INSERT [dbo].[Users] ([userId], [firebaseKey], [firstName], [lastName], [email], [userGoalTier], [totalItemsOwned], [totalItemsRemoved], [createdAt]) VALUES (N'454626d6-6345-492d-ac6b-2abe7c41c949', NULL, N'Caroline', N'Rossettie', N'carolinegrossettie@gmail.com', 2, 50, 24, CAST(N'2021-12-09T17:14:03.787' AS DateTime))
INSERT [dbo].[Users] ([userId], [firebaseKey], [firstName], [lastName], [email], [userGoalTier], [totalItemsOwned], [totalItemsRemoved], [createdAt]) VALUES (N'30ac3ae3-4f49-4473-803b-4d5de3deb58f', NULL, N'John', N'Rossettie', N'john.rossettie@gmail.com', 3, 54, 3, CAST(N'2021-12-09T17:15:05.803' AS DateTime))
INSERT [dbo].[Users] ([userId], [firebaseKey], [firstName], [lastName], [email], [userGoalTier], [totalItemsOwned], [totalItemsRemoved], [createdAt]) VALUES (N'f43419a3-0e9c-4ca8-a7bc-7f429c935897', NULL, N'Maria', N'Malafronte', N'maria.m.malafronte@gmail.com', 3, 34, 1, CAST(N'2021-12-09T17:14:25.753' AS DateTime))
INSERT [dbo].[Users] ([userId], [firebaseKey], [firstName], [lastName], [email], [userGoalTier], [totalItemsOwned], [totalItemsRemoved], [createdAt]) VALUES (N'f2685713-8da8-4f99-99ca-a3aeb2ed08b8', NULL, N'Aaron', N'Young', N'ayoung@gmail.com', 2, 56, 23, CAST(N'2021-12-09T17:14:45.717' AS DateTime))
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_categoryId]  DEFAULT (newid()) FOR [categoryId]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_createdAt]  DEFAULT (getutcdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[CategoryItem] ADD  CONSTRAINT [DF_CategoryItem_categoryItemId]  DEFAULT (newid()) FOR [categoryItemId]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_itemId]  DEFAULT (newid()) FOR [itemId]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_createdAt]  DEFAULT (getutcdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_userId]  DEFAULT (newid()) FOR [userId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_createdAt]  DEFAULT (getutcdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Users]
GO
ALTER TABLE [dbo].[CategoryItem]  WITH CHECK ADD  CONSTRAINT [FK_CategoryItem_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[CategoryItem] CHECK CONSTRAINT [FK_CategoryItem_Category]
GO
ALTER TABLE [dbo].[CategoryItem]  WITH CHECK ADD  CONSTRAINT [FK_CategoryItem_Item] FOREIGN KEY([itemId])
REFERENCES [dbo].[Item] ([itemId])
GO
ALTER TABLE [dbo].[CategoryItem] CHECK CONSTRAINT [FK_CategoryItem_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Users]
GO
USE [master]
GO
ALTER DATABASE [Minimal] SET  READ_WRITE 
GO
