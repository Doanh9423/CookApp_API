USE [master]
GO
CREATE DATABASE [CookingRecipeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CookingRecipeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CookingRecipeDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CookingRecipeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CookingRecipeDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CookingRecipeDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CookingRecipeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CookingRecipeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CookingRecipeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CookingRecipeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CookingRecipeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CookingRecipeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CookingRecipeDB] SET  MULTI_USER 
GO
ALTER DATABASE [CookingRecipeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CookingRecipeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CookingRecipeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CookingRecipeDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CookingRecipeDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CookingRecipeDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CookingRecipeDB', N'ON'
GO
ALTER DATABASE [CookingRecipeDB] SET QUERY_STORE = OFF
GO
USE [CookingRecipeDB]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[id] [nvarchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleid] [nvarchar](50) NOT NULL,
	[dob] [date] NULL,
	[isActive] [bit] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blacklist]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blacklist](
	[ref_user] [nvarchar](50) NOT NULL,
	[reason] [nvarchar](50) NOT NULL,
	[isBan] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[content] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [nvarchar](50) NOT NULL,
	[content] [nvarchar](50) NOT NULL,
	[create_time] [time](7) NOT NULL,
	[ref_user] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[ref_post] [nvarchar](50) NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [nvarchar](50) NOT NULL,
	[content] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingre_post]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingre_post](
	[ref_post] [nvarchar](50) NOT NULL,
	[ref_ingredient] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingredients]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[id] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[ref_post] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ingredients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nutri_post]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nutri_post](
	[ref_nutri] [nvarchar](50) NULL,
	[ref_post] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nutrition]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nutrition](
	[Id] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_nutri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipe_posts]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipe_posts](
	[id] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[ref_tag] [nvarchar](50) NOT NULL,
	[content] [nvarchar](50) NOT NULL,
	[create_time] [time](7) NOT NULL,
	[update_time] [time](7) NOT NULL,
	[ref_category] [nvarchar](50) NOT NULL,
	[location_id] [nvarchar](50) NULL,
	[ref_account] [nvarchar](50) NOT NULL,
	[ref_image] [nvarchar](50) NULL,
	[ref_video] [nvarchar](50) NULL,
 CONSTRAINT [PK_recipe_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleId] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_store]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_store](
	[id] [nvarchar](50) NOT NULL,
	[x] [float] NULL,
	[y] [float] NULL,
	[andress] [nvarchar](50) NOT NULL,
	[ref_account] [nvarchar](50) NULL,
 CONSTRAINT [PK_supplier_store] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tag_post]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tag_post](
	[ref_post] [nvarchar](50) NOT NULL,
	[ref_tag] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_post]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_post](
	[ref_post] [nvarchar](50) NOT NULL,
	[ref_type] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[videos]    Script Date: 05/06/2023 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videos](
	[id] [nvarchar](50) NOT NULL,
	[video] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_videos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'1', N'1234567890', N'password1', N'role1', CAST(N'2000-01-01' AS Date), 1, N'John Doe')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'11', N'1234567897', N'password17', N'role2', CAST(N'1990-07-07' AS Date), 1, N'Christopher Taylor')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'12', N'1234567898', N'password18', N'role2', CAST(N'1990-08-08' AS Date), 1, N'Jessica Anderson')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'13', N'1234567899', N'password19', N'role2', CAST(N'1990-09-09' AS Date), 1, N'Andrew Martinez')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'14', N'1234567900', N'password20', N'role2', CAST(N'1990-10-10' AS Date), 1, N'Olivia Hernandez')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'2', N'9876543210', N'password2', N'role2', CAST(N'1995-05-10' AS Date), 1, N'Jane Smith')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'3', N'5555555555', N'password3', N'role1', CAST(N'1988-12-25' AS Date), 0, N'Mike Johnson')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'4', N'1234567891', N'password11', N'role2', CAST(N'1990-01-01' AS Date), 1, N'John Doe')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'5', N'1234567892', N'password12', N'role2', CAST(N'1990-02-02' AS Date), 1, N'Jane Smith')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'6', N'1234567893', N'password13', N'role2', CAST(N'1990-03-03' AS Date), 1, N'Michael Johnson')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'7', N'1234567894', N'password14', N'role2', CAST(N'1990-04-04' AS Date), 1, N'Emily Davis')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'8', N'1234567895', N'password15', N'role2', CAST(N'1990-05-05' AS Date), 1, N'David Wilson')
INSERT [dbo].[accounts] ([id], [phone], [password], [roleid], [dob], [isActive], [FullName]) VALUES (N'9', N'1234567896', N'password16', N'role2', CAST(N'1990-06-06' AS Date), 1, N'Sarah Brown')
GO
INSERT [dbo].[blacklist] ([ref_user], [reason], [isBan]) VALUES (N'1', N'Spamming', 1)
INSERT [dbo].[blacklist] ([ref_user], [reason], [isBan]) VALUES (N'2', N'Abusive behavior', 1)
INSERT [dbo].[blacklist] ([ref_user], [reason], [isBan]) VALUES (N'4', N'Violation of terms', 0)
INSERT [dbo].[blacklist] ([ref_user], [reason], [isBan]) VALUES (N'5', N'Spamming', 1)
INSERT [dbo].[blacklist] ([ref_user], [reason], [isBan]) VALUES (N'7', N'Violating community guidelines', 1)
INSERT [dbo].[blacklist] ([ref_user], [reason], [isBan]) VALUES (N'8', N'Harassment', 1)
INSERT [dbo].[blacklist] ([ref_user], [reason], [isBan]) VALUES (N'9', N'Inappropriate content', 1)
INSERT [dbo].[blacklist] ([ref_user], [reason], [isBan]) VALUES (N'11', N'Fake account', 1)
GO
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'1', N'Desserts', N'Delicious sweet treats')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'10', N'Grilling', N'Tasty recipes for outdoor grilling')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'11', N'Baking', N'Sweet and savory baked goods')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'12', N'Side Dishes', N'Complementing side dishes for any meal')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'13', N'Beverages', N'Refreshing drink recipes')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'2', N'Main Dishes', N'Hearty and flavorful meals')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'3', N'Appetizers', N'Small bites and finger foods')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'4', N'Salads', N'Fresh and healthy salad recipes')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'5', N'Soups', N'Warm and comforting soup dishes')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'6', N'Pasta', N'Delicious pasta recipes for all occasions')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'7', N'Vegetarian', N'Flavorful vegetarian dishes')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'8', N'Seafood', N'Delectable seafood recipes')
INSERT [dbo].[category] ([id], [title], [content]) VALUES (N'9', N'Breakfast', N'Delicious breakfast ideas to start your day')
GO
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'1', N'Great recipe!', CAST(N'12:30:00' AS Time), N'user1', N'Approved', N'1')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'10', N'I need some clarification on the instructions.', CAST(N'10:05:00' AS Time), N'user10', N'Pending', N'5')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'2', N'I tried this and it was amazing!', CAST(N'14:45:00' AS Time), N'user2', N'Approved', N'1')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'3', N'Could you provide an alternative ingredient?', CAST(N'09:20:00' AS Time), N'user3', N'Pending', N'2')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'4', N'Thanks for sharing!', CAST(N'18:10:00' AS Time), N'user4', N'Approved', N'2')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'5', N'I have a question about the cooking time.', CAST(N'11:55:00' AS Time), N'user5', N'Pending', N'2')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'6', N'This recipe is perfect for a special occasion!', CAST(N'19:30:00' AS Time), N'user6', N'Approved', N'1')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'7', N'I made some modifications and it turned out great!', CAST(N'08:15:00' AS Time), N'user7', N'Approved', N'1')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'8', N'Im excited to try this!', CAST(N'16:50:00' AS Time), N'user8', N'Approved', N'2')
INSERT [dbo].[comments] ([id], [content], [create_time], [ref_user], [status], [ref_post]) VALUES (N'9', N'The flavors in this dish are incredible!', CAST(N'13:25:00' AS Time), N'user9', N'Approved', N'4')
GO
INSERT [dbo].[images] ([id], [content]) VALUES (N'1', N'image1.jpg')
INSERT [dbo].[images] ([id], [content]) VALUES (N'10', N'image_content_16')
INSERT [dbo].[images] ([id], [content]) VALUES (N'11', N'image_content_17')
INSERT [dbo].[images] ([id], [content]) VALUES (N'12', N'image_content_18')
INSERT [dbo].[images] ([id], [content]) VALUES (N'13', N'image_content_19')
INSERT [dbo].[images] ([id], [content]) VALUES (N'14', N'image_content_20')
INSERT [dbo].[images] ([id], [content]) VALUES (N'2', N'image2.jpg')
INSERT [dbo].[images] ([id], [content]) VALUES (N'3', N'image3.jpg')
INSERT [dbo].[images] ([id], [content]) VALUES (N'5', N'image_content_11')
INSERT [dbo].[images] ([id], [content]) VALUES (N'6', N'image_content_12')
INSERT [dbo].[images] ([id], [content]) VALUES (N'7', N'image_content_13')
INSERT [dbo].[images] ([id], [content]) VALUES (N'8', N'image_content_14')
INSERT [dbo].[images] ([id], [content]) VALUES (N'9', N'image_content_15')
GO
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'1', N'2')
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'1', N'3')
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'2', N'4')
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'3', N'5')
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'3', N'6')
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'4', N'7')
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'4', N'8')
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'5', N'9')
INSERT [dbo].[ingre_post] ([ref_post], [ref_ingredient]) VALUES (N'5', N'10')
GO
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'1', N'Type X', N'1', N'Ingredient 1')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'10', N'Type X', N'5', N'Ingredient 10')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'2', N'Type Y', N'1', N'Ingredient 2')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'3', N'Type Z', N'2', N'Ingredient 3')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'4', N'Type X', N'2', N'Ingredient 4')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'5', N'Type Y', N'3', N'Ingredient 5')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'6', N'Type Z', N'3', N'Ingredient 6')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'7', N'Type X', N'4', N'Ingredient 7')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'8', N'Type Y', N'4', N'Ingredient 8')
INSERT [dbo].[ingredients] ([id], [type], [ref_post], [name]) VALUES (N'9', N'Type Z', N'5', N'Ingredient 9')
GO
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'1', N'1')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'2', N'1')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'3', N'2')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'4', N'2')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'5', N'3')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'6', N'3')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'7', N'4')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'8', N'4')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'9', N'5')
INSERT [dbo].[nutri_post] ([ref_nutri], [ref_post]) VALUES (N'10', N'5')
GO
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'1', N'Type X', N'Nutrition 1')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'10', N'Type G', N'Nutrition 10')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'11', N'Type H', N'Nutrition 11')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'12', N'Type I', N'Nutrition 12')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'13', N'Type J', N'Nutrition 13')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'14', N'Type K', N'Nutrition 14')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'2', N'Type Y', N'Nutrition 2')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'3', N'Type Z', N'Nutrition 3')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'4', N'Type A', N'Nutrition 4')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'5', N'Type B', N'Nutrition 5')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'6', N'Type C', N'Nutrition 6')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'7', N'Type D', N'Nutrition 7')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'8', N'Type E', N'Nutrition 8')
INSERT [dbo].[nutrition] ([Id], [type], [name]) VALUES (N'9', N'Type F', N'Nutrition 9')
GO
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'1', N'Chocolate Cake', N'tag1', N'Delicious and moist chocolate cake recipe.', CAST(N'12:00:00' AS Time), CAST(N'14:30:00' AS Time), N'1', NULL, N'1', N'1', N'1')
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'10', N'Chocolate Chip Cookies', N'tag10', N'Classic homemade chocolate chip cookies.', CAST(N'09:00:00' AS Time), CAST(N'11:15:00' AS Time), N'1', NULL, N'1', N'1', N'2')
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'2', N'Grilled Chicken', N'tag2', N'Juicy grilled chicken with a flavorful marinade.', CAST(N'16:45:00' AS Time), CAST(N'19:15:00' AS Time), N'2', NULL, N'2', N'5', N'2')
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'3', N'Spinach Dip', N'tag3', N'Creamy spinach dip perfect for parties and ', CAST(N'10:30:00' AS Time), CAST(N'12:45:00' AS Time), N'3', NULL, N'1', N'6', N'3')
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'4', N'Pasta Carbonara', N'tag4', N'Classic Italian pasta dish with bacon and eggs.', CAST(N'14:20:00' AS Time), CAST(N'17:10:00' AS Time), N'2', NULL, N'2', N'5', N'4')
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'5', N'Banana Bread', N'tag5', N'Moist and delicious homemade banana bread.', CAST(N'09:15:00' AS Time), CAST(N'11:30:00' AS Time), N'1', NULL, N'5', N'1', N'6')
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'7', N'Cheesecake', N'tag7', N'Test content 123 alo ', CAST(N'18:00:00' AS Time), CAST(N'20:20:00' AS Time), N'1', NULL, N'1', N'2', N'8')
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'8', N'Roasted Vegetables', N'tag8', N'Colorful and flavorful roasted vegetables.', CAST(N'11:30:00' AS Time), CAST(N'13:40:00' AS Time), N'2', NULL, N'2', N'5', N'9')
INSERT [dbo].[recipe_posts] ([id], [title], [ref_tag], [content], [create_time], [update_time], [ref_category], [location_id], [ref_account], [ref_image], [ref_video]) VALUES (N'9', N'Chicken Alfredo', N'tag9', N'Creamy and indulgent chicken alfredo pasta.', CAST(N'15:10:00' AS Time), CAST(N'17:25:00' AS Time), N'2', NULL, N'3', N'1', N'10')
GO
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role1', N'Admin')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role10', N'Developer')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role11', N'Tester')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role12', N'Designer')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role2', N'User')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role3', N'Editor')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role4', N'Moderator')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role5', N'Guest')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role6', N'Contributor')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role7', N'Subscriber')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role8', N'Manager')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (N'role9', N'Supervisor')
GO
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'1', 123.456, 789.123, N'Address 1', N'1')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'10', 321.987, 987.654, N'Address 10', N'2')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'2', 456.789, 321.987, N'Address 2', N'2')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'3', 789.123, 654.321, N'Address 3', N'3')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'4', 321.987, 987.654, N'Address 4', N'4')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'5', 654.321, 123.456, N'Address 5', N'5')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'6', 987.654, 456.789, N'Address 6', N'6')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'7', 123.456, 789.123, N'Address 7', N'7')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'8', 456.789, 321.987, N'Address 8', N'8')
INSERT [dbo].[supplier_store] ([id], [x], [y], [andress], [ref_account]) VALUES (N'9', 789.123, 654.321, N'Address 9', N'3')
GO
INSERT [dbo].[tag_post] ([ref_post], [ref_tag]) VALUES (N'1', N'1')
INSERT [dbo].[tag_post] ([ref_post], [ref_tag]) VALUES (N'1', N'2')
INSERT [dbo].[tag_post] ([ref_post], [ref_tag]) VALUES (N'2', N'3')
INSERT [dbo].[tag_post] ([ref_post], [ref_tag]) VALUES (N'2', N'4')
INSERT [dbo].[tag_post] ([ref_post], [ref_tag]) VALUES (N'3', N'5')
INSERT [dbo].[tag_post] ([ref_post], [ref_tag]) VALUES (N'3', N'6')
INSERT [dbo].[tag_post] ([ref_post], [ref_tag]) VALUES (N'4', N'7')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (N'1', N'Tag 1')
INSERT [dbo].[tags] ([id], [name]) VALUES (N'2', N'Tag 2')
INSERT [dbo].[tags] ([id], [name]) VALUES (N'3', N'Tag ABC')
INSERT [dbo].[tags] ([id], [name]) VALUES (N'4', N'Tag CDE')
INSERT [dbo].[tags] ([id], [name]) VALUES (N'5', N'Tag EDSF')
INSERT [dbo].[tags] ([id], [name]) VALUES (N'6', N'Tag ALOOO')
INSERT [dbo].[tags] ([id], [name]) VALUES (N'7', N'Tag AAA')
GO
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'1', N'1')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'1', N'3')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'2', N'4')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'2', N'5')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'3', N'3')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'3', N'2')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'4', N'1')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'4', N'2')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'5', N'3')
INSERT [dbo].[type_post] ([ref_post], [ref_type]) VALUES (N'5', N'5')
GO
INSERT [dbo].[videos] ([id], [video]) VALUES (N'1', N'video1.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'10', N'videoAA3.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'2', N'video222.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'3', N'video333.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'4', N'video344.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'5', N'video355.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'6', N'video223.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'7', N'video366.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'8', N'videoVV3.mp4')
INSERT [dbo].[videos] ([id], [video]) VALUES (N'9', N'videoCC3.mp4')
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_account_role] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleId])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_account_role]
GO
ALTER TABLE [dbo].[blacklist]  WITH CHECK ADD  CONSTRAINT [FK_blacklist_accounts] FOREIGN KEY([ref_user])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[blacklist] CHECK CONSTRAINT [FK_blacklist_accounts]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_recipe_posts] FOREIGN KEY([ref_post])
REFERENCES [dbo].[recipe_posts] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_recipe_posts]
GO
ALTER TABLE [dbo].[ingre_post]  WITH CHECK ADD  CONSTRAINT [FK_ingre_post_ingredients] FOREIGN KEY([ref_ingredient])
REFERENCES [dbo].[ingredients] ([id])
GO
ALTER TABLE [dbo].[ingre_post] CHECK CONSTRAINT [FK_ingre_post_ingredients]
GO
ALTER TABLE [dbo].[ingre_post]  WITH CHECK ADD  CONSTRAINT [FK_ingre_post_recipe_post] FOREIGN KEY([ref_post])
REFERENCES [dbo].[recipe_posts] ([id])
GO
ALTER TABLE [dbo].[ingre_post] CHECK CONSTRAINT [FK_ingre_post_recipe_post]
GO
ALTER TABLE [dbo].[nutri_post]  WITH CHECK ADD  CONSTRAINT [FK_nutri_post_nutrition] FOREIGN KEY([ref_nutri])
REFERENCES [dbo].[nutrition] ([Id])
GO
ALTER TABLE [dbo].[nutri_post] CHECK CONSTRAINT [FK_nutri_post_nutrition]
GO
ALTER TABLE [dbo].[nutri_post]  WITH CHECK ADD  CONSTRAINT [FK_nutri_post_recipe_posts] FOREIGN KEY([ref_post])
REFERENCES [dbo].[recipe_posts] ([id])
GO
ALTER TABLE [dbo].[nutri_post] CHECK CONSTRAINT [FK_nutri_post_recipe_posts]
GO
ALTER TABLE [dbo].[recipe_posts]  WITH CHECK ADD  CONSTRAINT [FK_recipe_posts_accounts] FOREIGN KEY([ref_account])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[recipe_posts] CHECK CONSTRAINT [FK_recipe_posts_accounts]
GO
ALTER TABLE [dbo].[recipe_posts]  WITH CHECK ADD  CONSTRAINT [FK_recipe_posts_images] FOREIGN KEY([ref_image])
REFERENCES [dbo].[images] ([id])
GO
ALTER TABLE [dbo].[recipe_posts] CHECK CONSTRAINT [FK_recipe_posts_images]
GO
ALTER TABLE [dbo].[recipe_posts]  WITH CHECK ADD  CONSTRAINT [FK_recipe_posts_supplier_store] FOREIGN KEY([location_id])
REFERENCES [dbo].[supplier_store] ([id])
GO
ALTER TABLE [dbo].[recipe_posts] CHECK CONSTRAINT [FK_recipe_posts_supplier_store]
GO
ALTER TABLE [dbo].[recipe_posts]  WITH CHECK ADD  CONSTRAINT [FK_recipe_posts_videos] FOREIGN KEY([ref_video])
REFERENCES [dbo].[videos] ([id])
GO
ALTER TABLE [dbo].[recipe_posts] CHECK CONSTRAINT [FK_recipe_posts_videos]
GO
ALTER TABLE [dbo].[supplier_store]  WITH CHECK ADD  CONSTRAINT [FK_supplier_store_accounts] FOREIGN KEY([ref_account])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[supplier_store] CHECK CONSTRAINT [FK_supplier_store_accounts]
GO
ALTER TABLE [dbo].[tag_post]  WITH CHECK ADD  CONSTRAINT [FK_tag_post_recipe_posts] FOREIGN KEY([ref_post])
REFERENCES [dbo].[recipe_posts] ([id])
GO
ALTER TABLE [dbo].[tag_post] CHECK CONSTRAINT [FK_tag_post_recipe_posts]
GO
ALTER TABLE [dbo].[tag_post]  WITH CHECK ADD  CONSTRAINT [FK_tag_post_tags] FOREIGN KEY([ref_tag])
REFERENCES [dbo].[tags] ([id])
GO
ALTER TABLE [dbo].[tag_post] CHECK CONSTRAINT [FK_tag_post_tags]
GO
ALTER TABLE [dbo].[type_post]  WITH CHECK ADD  CONSTRAINT [FK_type_post_recipe_posts] FOREIGN KEY([ref_post])
REFERENCES [dbo].[recipe_posts] ([id])
GO
ALTER TABLE [dbo].[type_post] CHECK CONSTRAINT [FK_type_post_recipe_posts]
GO
ALTER TABLE [dbo].[type_post]  WITH CHECK ADD  CONSTRAINT [FK_type_post_type] FOREIGN KEY([ref_type])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[type_post] CHECK CONSTRAINT [FK_type_post_type]
GO
USE [master]
GO
ALTER DATABASE [CookingRecipeDB] SET  READ_WRITE 
GO
