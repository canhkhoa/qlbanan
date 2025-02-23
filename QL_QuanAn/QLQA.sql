USE [QLQA]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/13/2023 2:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[catID] [int] IDENTITY(1,1) NOT NULL,
	[catName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/13/2023 2:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[pID] [int] IDENTITY(1,1) NOT NULL,
	[pName] [nvarchar](50) NULL,
	[pPrice] [float] NULL,
	[CategoryID] [int] NULL,
	[pImage] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[pID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 6/13/2023 2:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[staffID] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](40) NULL,
	[sPhone] [nvarchar](50) NULL,
	[sRole] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[staffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tables]    Script Date: 6/13/2023 2:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tables](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[tname] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetails]    Script Date: 6/13/2023 2:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetails](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[MainID] [int] NULL,
	[proID] [int] NULL,
	[qty] [int] NULL,
	[price] [float] NULL,
	[amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMain]    Script Date: 6/13/2023 2:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMain](
	[MainID] [int] IDENTITY(1,1) NOT NULL,
	[aDate] [date] NULL,
	[aTime] [varchar](15) NULL,
	[TableName] [nvarchar](20) NULL,
	[WaiterName] [nvarchar](40) NULL,
	[status] [nvarchar](30) NULL,
	[orderType] [nvarchar](40) NULL,
	[total] [float] NULL,
	[received] [float] NULL,
	[change] [float] NULL,
	[driverID] [int] NULL,
	[custName] [nvarchar](50) NULL,
	[custPhone] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/13/2023 2:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[upass] [varchar](20) NOT NULL,
	[uName] [nvarchar](50) NULL,
	[uphone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[category] ([catID])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_category]
GO
ALTER TABLE [dbo].[tblDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblDetails_products] FOREIGN KEY([proID])
REFERENCES [dbo].[products] ([pID])
GO
ALTER TABLE [dbo].[tblDetails] CHECK CONSTRAINT [FK_tblDetails_products]
GO
ALTER TABLE [dbo].[tblDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblDetails_tblMain] FOREIGN KEY([MainID])
REFERENCES [dbo].[tblMain] ([MainID])
GO
ALTER TABLE [dbo].[tblDetails] CHECK CONSTRAINT [FK_tblDetails_tblMain]
GO
