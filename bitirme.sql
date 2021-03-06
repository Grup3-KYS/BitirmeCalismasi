USE [KYS]
GO
/****** Object:  Table [dbo].[IzinTalebi]    Script Date: 16.05.2020 16:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IzinTalebi](
	[IzinID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[userFirstName] [nvarchar](30) NOT NULL,
	[userLastName] [nvarchar](30) NOT NULL,
	[userEmail] [nvarchar](20) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_IzinTalebi] PRIMARY KEY CLUSTERED 
(
	[IzinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 16.05.2020 16:26:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[menuID] [int] IDENTITY(1,1) NOT NULL,
	[parentMenuID] [nvarchar](50) NULL,
	[menuName] [nvarchar](30) NOT NULL,
	[menuURL] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[menuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menuRole]    Script Date: 16.05.2020 16:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menuRole](
	[menuRoleID] [int] IDENTITY(1,1) NOT NULL,
	[menuId] [int] NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_menuRole] PRIMARY KEY CLUSTERED 
(
	[menuRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 16.05.2020 16:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shift]    Script Date: 16.05.2020 16:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shift](
	[shiftID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[shiftDate] [date] NOT NULL,
	[shiftLogin] [time](7) NOT NULL,
	[shiftOut] [time](7) NOT NULL,
	[shiftSum] [int] NOT NULL,
 CONSTRAINT [PK_shift] PRIMARY KEY CLUSTERED 
(
	[shiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 16.05.2020 16:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[isActive] [bit] NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userPassword] [nvarchar](16) NOT NULL,
	[userEmail] [nvarchar](50) NOT NULL,
	[userFirstName] [nvarchar](20) NOT NULL,
	[userLastName] [nvarchar](20) NOT NULL,
	[userPhone] [nvarchar](13) NOT NULL,
	[userAddress] [text] NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([roleID], [roleName]) VALUES (1, N'IT')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (2, N'IK')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (3, N'Manager')
INSERT [dbo].[role] ([roleID], [roleName]) VALUES (4, N'Employee')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([userID], [isActive], [userName], [userPassword], [userEmail], [userFirstName], [userLastName], [userPhone], [userAddress], [roleID]) VALUES (4, 1, N'EMRE INAN', N'123', N'emreinan@gmail.com', N'Emre', N'İnan', N'4654654', N'sdasdf', 1)
INSERT [dbo].[user] ([userID], [isActive], [userName], [userPassword], [userEmail], [userFirstName], [userLastName], [userPhone], [userAddress], [roleID]) VALUES (1002, 1, N'bedirhankaplan', N'123', N'bedirhankaplan@gmail.com', N'Bedirhan', N'Kaplan', N'123456', N'asdasd', 2)
INSERT [dbo].[user] ([userID], [isActive], [userName], [userPassword], [userEmail], [userFirstName], [userLastName], [userPhone], [userAddress], [roleID]) VALUES (1003, 1, N'sumeyyeakay', N'123', N'sumeyyeakay@gmail.com', N'Sümeyye', N'Akay', N'123456', N'asdasd', 3)
INSERT [dbo].[user] ([userID], [isActive], [userName], [userPassword], [userEmail], [userFirstName], [userLastName], [userPhone], [userAddress], [roleID]) VALUES (1004, 1, N'hicranyelkenci', N'123', N'hicranyelkenci@gmail.com', N'Hicran', N'Yelkenci', N'12356', N'asdasd', 4)
INSERT [dbo].[user] ([userID], [isActive], [userName], [userPassword], [userEmail], [userFirstName], [userLastName], [userPhone], [userAddress], [roleID]) VALUES (1005, 1, N'cihanrasna', N'2442', N'cihanrasna@gmail.com', N'Cihan', N'Rasna', N'123456', N'asdad', 4)
INSERT [dbo].[user] ([userID], [isActive], [userName], [userPassword], [userEmail], [userFirstName], [userLastName], [userPhone], [userAddress], [roleID]) VALUES (2007, 0, N'sumeyyeakay@gmail.com', N'123', N'deneme@gmail.com', N'de', N'de', N'123', N'ss', 3)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[IzinTalebi]  WITH CHECK ADD  CONSTRAINT [FK_IzinTalebi_IzinTalebi] FOREIGN KEY([IzinID])
REFERENCES [dbo].[IzinTalebi] ([IzinID])
GO
ALTER TABLE [dbo].[IzinTalebi] CHECK CONSTRAINT [FK_IzinTalebi_IzinTalebi]
GO
ALTER TABLE [dbo].[IzinTalebi]  WITH CHECK ADD  CONSTRAINT [FK_IzinTalebi_user] FOREIGN KEY([UserID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[IzinTalebi] CHECK CONSTRAINT [FK_IzinTalebi_user]
GO
ALTER TABLE [dbo].[menuRole]  WITH CHECK ADD  CONSTRAINT [FK_menuRole_menuID] FOREIGN KEY([menuId])
REFERENCES [dbo].[menu] ([menuID])
GO
ALTER TABLE [dbo].[menuRole] CHECK CONSTRAINT [FK_menuRole_menuID]
GO
ALTER TABLE [dbo].[menuRole]  WITH CHECK ADD  CONSTRAINT [FK_menuRole_roleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[role] ([roleID])
GO
ALTER TABLE [dbo].[menuRole] CHECK CONSTRAINT [FK_menuRole_roleID]
GO
ALTER TABLE [dbo].[shift]  WITH CHECK ADD  CONSTRAINT [FK_shift_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[shift] CHECK CONSTRAINT [FK_shift_userID]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_roleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[role] ([roleID])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_roleID]
GO
