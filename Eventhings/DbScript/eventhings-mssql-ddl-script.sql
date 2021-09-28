USE [deveventhings]
GO
/****** Object:  Table [dbo].[tcoreapplicants]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreapplicants](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[job_id] [int] NOT NULL,
	[first_name] [varchar](128) NOT NULL,
	[last_name] [varchar](128) NOT NULL,
	[other_name] [varchar](128) NULL,
	[address] [varchar](256) NOT NULL,
	[phone] [varchar](128) NOT NULL,
	[email] [varchar](128) NOT NULL,
	[cover_letter] [varchar](max) NULL,
	[cv_ext] [varchar](50) NULL,
	[file_name] [varchar](128) NULL,
	[file_path] [varchar](512) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreapplication]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreapplication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](256) NOT NULL,
	[description] [varchar](256) NULL,
	[urltest] [varchar](256) NULL,
	[urllive] [varchar](256) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[createdby] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorecodestores]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcorecodestores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[batch_number] [varchar](128) NOT NULL,
	[batch_name] [varchar](128) NOT NULL,
	[code] [varchar](128) NOT NULL,
	[encrypted_code] [varchar](128) NULL,
	[active] [int] NOT NULL,
	[date_used] [datetime2](0) NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
 CONSTRAINT [PK__tmstrcod__3213E83FE864B319] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreevents]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreevents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[description] [varchar](256) NULL,
	[location] [varchar](256) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[duration] [int] NULL,
	[host_id] [int] NOT NULL,
	[active] [int] NOT NULL,
	[deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime] NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_tcoreevents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorehosts]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcorehosts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[description] [varchar](256) NULL,
	[phone] [varchar](128) NULL,
	[email] [varchar](128) NULL,
	[address] [varchar](256) NULL,
	[deleted] [int] NOT NULL,
	[active] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_tmstrhost] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreitempoints]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreitempoints](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_id] [varchar](128) NOT NULL,
	[unit_id] [int] NOT NULL,
	[cost] [decimal](19, 4) NOT NULL,
	[price] [decimal](19, 4) NULL,
	[point] [decimal](20, 6) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreitems]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreitems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[description] [varchar](512) NULL,
	[cost] [decimal](19, 4) NOT NULL,
	[price] [decimal](19, 4) NULL,
	[category] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorejobs]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcorejobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[job_title] [varchar](256) NOT NULL,
	[state] [varchar](256) NOT NULL,
	[address] [varchar](256) NOT NULL,
	[description] [varchar](max) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoremappedcodes]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoremappedcodes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[code_id] [int] NOT NULL,
	[date_mapped] [datetime] NULL,
	[event_id] [int] NOT NULL,
	[deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime] NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_tcoremappedcode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreroles]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreroles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[description] [varchar](128) NULL,
	[level] [int] NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoretransactions]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoretransactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ref_code] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[channel] [varchar](128) NULL,
	[tranx_amount] [decimal](20, 6) NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](256) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](256) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreunitmeasurements]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreunitmeasurements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreuserroles]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreuserroles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](256) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](256) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreusers]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreusers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_code] [varchar](128) NOT NULL,
	[email] [varchar](128) NOT NULL,
	[email_confirmed] [datetime2](0) NULL,
	[password_hash] [varchar](512) NULL,
	[require_password_change] [int] NOT NULL,
	[phone_number] [varchar](128) NOT NULL,
	[phone_number_confirmed] [datetime2](0) NULL,
	[two_factor_enabled] [int] NOT NULL,
	[first_name] [varchar](128) NOT NULL,
	[last_name] [varchar](128) NOT NULL,
	[other_name] [varchar](128) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorewallets]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcorewallets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](256) NOT NULL,
	[prev_balance] [decimal](19, 4) NULL,
	[amount_paid] [decimal](19, 4) NULL,
	[current_balance] [decimal](19, 4) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](256) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](256) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmstrcategories]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmstrcategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[parent] [int] NOT NULL,
	[description] [varchar](512) NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmstrtranxchannels]    Script Date: 9/27/2021 2:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmstrtranxchannels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[description] [varchar](512) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](256) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](256) NULL,
	[updated_at] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tcoreapplication] ON 
GO
INSERT [dbo].[tcoreapplication] ([Id], [name], [description], [urltest], [urllive], [active], [is_deleted], [createdby], [created_at], [updated_by], [updated_at]) VALUES (1, N'Eventi', N'Eventi web application', N'https://localhost:44329/admin/codelink.aspx?code=', N'https://www.eventi.ng/admin/codelink.aspx?code=', 1, 0, NULL, CAST(N'2021-09-16T15:07:03.0000000' AS DateTime2), NULL, CAST(N'2021-09-16T15:07:03.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tcoreapplication] OFF
GO
SET IDENTITY_INSERT [dbo].[tcorecodestores] ON 
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (163, N'BTCH - 4965681', N'Evening Batch 21-2021', N'0d6eab00-2c30-4fec-920a-0b9d46c566db', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (164, N'BTCH - 4965681', N'Evening Batch 21-2021', N'6ba799d5-62e4-4226-895c-50f3caf34185', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (170, N'BTCH - 8023861', N'Evening Batch 22-2021', N'132942f5-bbcd-44e9-9e56-802c7eafc6b4', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (171, N'BTCH - 8023861', N'Evening Batch 22-2021', N'acdb3d8f-1183-4c6a-a57b-d13ab0857614', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (172, N'BTCH - 510791', N'Evening Batch 23-2021', N'042f0164-718d-452d-a120-3d1d9bbf100e', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (173, N'BTCH - 510791', N'Evening Batch 23-2021', N'b6e89be7-961c-45dd-9101-0c4f948e483a', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (174, N'BTCH - 510791', N'Evening Batch 23-2021', N'078fe4d9-508f-474a-bf6b-8a8e8867009d', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (175, N'BTCH - 510791', N'Evening Batch 23-2021', N'f1353841-b322-4795-b96b-8f732a95c4fe', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (176, N'BTCH - 510791', N'Evening Batch 23-2021', N'8a402ce1-2dd7-4575-b222-70fed0a039cb', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (177, N'BTCH - 510791', N'Evening Batch 23-2021', N'e2a97185-a683-46e4-9fab-09ff4be6a19d', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (178, N'BTCH - 510791', N'Evening Batch 23-2021', N'033d5a00-e24f-47ea-a95c-79d28963517e', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (179, N'BTCH - 510791', N'Evening Batch 23-2021', N'13e70612-384c-4636-9fbf-1a70ee13b4a5', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (180, N'BTCH - 510791', N'Evening Batch 23-2021', N'28da332c-e0d3-41ac-b195-54010510ae4c', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
INSERT [dbo].[tcorecodestores] ([id], [batch_number], [batch_name], [code], [encrypted_code], [active], [date_used], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (181, N'BTCH - 510791', N'Evening Batch 23-2021', N'73a84618-a2bb-4286-b8f6-ca8495b98fdc', NULL, 1, NULL, 0, N'Admin', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tcorecodestores] OFF
GO
SET IDENTITY_INSERT [dbo].[tcoreevents] ON 
GO
INSERT [dbo].[tcoreevents] ([id], [name], [description], [location], [start_date], [end_date], [duration], [host_id], [active], [deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (4, N'Eventi (Default)', N'Eventi event is the default event', N'Lagos', NULL, NULL, 365, 1, 1, 0, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tcoreevents] OFF
GO
SET IDENTITY_INSERT [dbo].[tcorehosts] ON 
GO
INSERT [dbo].[tcorehosts] ([id], [name], [description], [phone], [email], [address], [deleted], [active], [created_by], [created_date], [updated_by], [updated_at]) VALUES (1, N'Eventi (Default)', N'Eventi default host', N'08144488577', N'ahmedfaruk888@gmail.com', N'Lagos', 0, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tcorehosts] OFF
GO
SET IDENTITY_INSERT [dbo].[tcoreitems] ON 
GO
INSERT [dbo].[tcoreitems] ([id], [name], [description], [cost], [price], [category], [quantity], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (1, N'Hennesey', N'Alcoholic drink', CAST(8000.0000 AS Decimal(19, 4)), CAST(15000.0000 AS Decimal(19, 4)), 1, 0, 1, 0, NULL, CAST(N'2021-09-12T13:12:02.0000000' AS DateTime2), NULL, CAST(N'2021-09-12T13:12:03.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tcoreitems] OFF
GO
SET IDENTITY_INSERT [dbo].[tcoreroles] ON 
GO
INSERT [dbo].[tcoreroles] ([id], [name], [description], [level], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (1, N'Customer', N'Customer role', 0, 1, 0, NULL, CAST(N'2021-09-23T14:39:08.0000000' AS DateTime2), NULL, CAST(N'2021-09-23T14:39:08.0000000' AS DateTime2))
GO
INSERT [dbo].[tcoreroles] ([id], [name], [description], [level], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (2, N'Administrator', N'Administrator role', 0, 1, 0, NULL, CAST(N'2021-09-23T14:39:23.0000000' AS DateTime2), NULL, CAST(N'2021-09-23T14:39:23.0000000' AS DateTime2))
GO
INSERT [dbo].[tcoreroles] ([id], [name], [description], [level], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (3, N'Attendant', N'Attendant role', 0, 1, 0, NULL, CAST(N'2021-09-23T14:39:48.0000000' AS DateTime2), NULL, CAST(N'2021-09-23T14:39:48.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tcoreroles] OFF
GO
SET IDENTITY_INSERT [dbo].[tcoreuserroles] ON 
GO
INSERT [dbo].[tcoreuserroles] ([id], [user_id], [role_id], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (1, 1, 2, 1, 0, NULL, CAST(N'2021-09-23T14:40:47.0000000' AS DateTime2), NULL, CAST(N'2021-09-23T14:40:47.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tcoreuserroles] OFF
GO
SET IDENTITY_INSERT [dbo].[tcoreusers] ON 
GO
INSERT [dbo].[tcoreusers] ([id], [user_code], [email], [email_confirmed], [password_hash], [require_password_change], [phone_number], [phone_number_confirmed], [two_factor_enabled], [first_name], [last_name], [other_name], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (1, N'UR-24242424', N'ahmedfaruk888@gmail.com', CAST(N'2021-09-06T00:00:00.0000000' AS DateTime2), N'Passw0rd', 0, N'08144488577', CAST(N'2021-09-05T00:00:00.0000000' AS DateTime2), 0, N'Farouq', N'Ahmed', N'Monkwo', 1, 0, NULL, CAST(N'2021-09-16T15:37:33.0000000' AS DateTime2), NULL, CAST(N'2021-09-16T15:37:33.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tcoreusers] OFF
GO
SET IDENTITY_INSERT [dbo].[tmstrcategories] ON 
GO
INSERT [dbo].[tmstrcategories] ([id], [name], [parent], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (1, N'Drinks', 0, N'General drinks, such as alcoholic drinks, carbonated drinks, water etc', 1, 0, NULL, CAST(N'2021-09-12T13:14:26.0000000' AS DateTime2), NULL, CAST(N'2021-09-12T13:14:27.0000000' AS DateTime2))
GO
INSERT [dbo].[tmstrcategories] ([id], [name], [parent], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (2, N'Alcoholic Drinks', 1, N'Alcoholic Drinks', 1, 0, NULL, CAST(N'2021-09-12T13:15:04.0000000' AS DateTime2), NULL, CAST(N'2021-09-12T13:15:04.0000000' AS DateTime2))
GO
INSERT [dbo].[tmstrcategories] ([id], [name], [parent], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (3, N'Non-alcoholic drinks', 1, N'Non-alcoholic drinks', 1, 0, NULL, CAST(N'2021-09-12T13:15:27.0000000' AS DateTime2), NULL, CAST(N'2021-09-12T13:15:27.0000000' AS DateTime2))
GO
INSERT [dbo].[tmstrcategories] ([id], [name], [parent], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (4, N'Carbonated Drinks', 1, N'Carbonated Drinks', 1, 0, NULL, CAST(N'2021-09-12T13:15:45.0000000' AS DateTime2), NULL, CAST(N'2021-09-12T13:15:45.0000000' AS DateTime2))
GO
INSERT [dbo].[tmstrcategories] ([id], [name], [parent], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (5, N'Gin', 2, N'Gin drinks', 1, 0, NULL, CAST(N'2021-09-12T13:16:45.0000000' AS DateTime2), NULL, CAST(N'2021-09-12T13:16:46.0000000' AS DateTime2))
GO
INSERT [dbo].[tmstrcategories] ([id], [name], [parent], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (6, N'Food', 0, N'Local and continental dishes', 1, 0, NULL, CAST(N'2021-09-12T13:18:27.0000000' AS DateTime2), NULL, CAST(N'2021-09-12T13:18:28.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tmstrcategories] OFF
GO
SET IDENTITY_INSERT [dbo].[tmstrtranxchannels] ON 
GO
INSERT [dbo].[tmstrtranxchannels] ([id], [name], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (1, N'Transfer', N'', 1, 0, NULL, CAST(N'2021-09-11T16:01:02.0000000' AS DateTime2), NULL, CAST(N'2021-09-11T16:01:03.0000000' AS DateTime2))
GO
INSERT [dbo].[tmstrtranxchannels] ([id], [name], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (2, N'Payment Gateway', N'', 1, 0, NULL, CAST(N'2021-09-11T16:02:05.0000000' AS DateTime2), NULL, CAST(N'2021-09-11T16:02:05.0000000' AS DateTime2))
GO
INSERT [dbo].[tmstrtranxchannels] ([id], [name], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (3, N'POS', N'', 1, 0, NULL, CAST(N'2021-09-11T16:02:40.0000000' AS DateTime2), NULL, CAST(N'2021-09-11T16:02:40.0000000' AS DateTime2))
GO
INSERT [dbo].[tmstrtranxchannels] ([id], [name], [description], [active], [is_deleted], [created_by], [created_at], [updated_by], [updated_at]) VALUES (4, N'Cash Payment', NULL, 1, 0, NULL, CAST(N'2021-09-11T16:02:55.0000000' AS DateTime2), NULL, CAST(N'2021-09-11T16:02:55.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tmstrtranxchannels] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unq_name]    Script Date: 9/27/2021 2:38:41 PM ******/
ALTER TABLE [dbo].[tcoreapplication] ADD  CONSTRAINT [unq_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [name]    Script Date: 9/27/2021 2:38:41 PM ******/
ALTER TABLE [dbo].[tcoreroles] ADD  CONSTRAINT [name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ref_code]    Script Date: 9/27/2021 2:38:41 PM ******/
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [ref_code] UNIQUE NONCLUSTERED 
(
	[ref_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unit_of_measurement]    Script Date: 9/27/2021 2:38:41 PM ******/
ALTER TABLE [dbo].[tcoreunitmeasurements] ADD  CONSTRAINT [unit_of_measurement] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [role_id]    Script Date: 9/27/2021 2:38:41 PM ******/
ALTER TABLE [dbo].[tcoreuserroles] ADD  CONSTRAINT [role_id] UNIQUE NONCLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [user_id]    Script Date: 9/27/2021 2:38:41 PM ******/
ALTER TABLE [dbo].[tcoreuserroles] ADD  CONSTRAINT [user_id] UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [category_name]    Script Date: 9/27/2021 2:38:41 PM ******/
ALTER TABLE [dbo].[tmstrcategories] ADD  CONSTRAINT [category_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [channel_name]    Script Date: 9/27/2021 2:38:41 PM ******/
ALTER TABLE [dbo].[tmstrtranxchannels] ADD  CONSTRAINT [channel_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT ('0') FOR [job_id]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT (NULL) FOR [other_name]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT (NULL) FOR [cv_ext]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT (NULL) FOR [file_name]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT (NULL) FOR [file_path]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreapplicants] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT (NULL) FOR [urltest]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT (NULL) FOR [urllive]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT (NULL) FOR [createdby]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreapplication] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcorecodestores] ADD  CONSTRAINT [DF__tmstrcode__encry__3B40CD36]  DEFAULT (NULL) FOR [encrypted_code]
GO
ALTER TABLE [dbo].[tcorecodestores] ADD  CONSTRAINT [DF__tmstrcode__activ__3C34F16F]  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcorecodestores] ADD  CONSTRAINT [DF__tmstrcode__date___3D2915A8]  DEFAULT (NULL) FOR [date_used]
GO
ALTER TABLE [dbo].[tcorecodestores] ADD  CONSTRAINT [DF__tmstrcode__is_de__3E1D39E1]  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcorecodestores] ADD  CONSTRAINT [DF__tmstrcode__creat__3F115E1A]  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcorecodestores] ADD  CONSTRAINT [DF__tmstrcode__creat__40058253]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcorecodestores] ADD  CONSTRAINT [DF__tmstrcode__updat__40F9A68C]  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcorecodestores] ADD  CONSTRAINT [DF__tmstrcode__updat__41EDCAC5]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoreevents] ADD  CONSTRAINT [DF_tcoreevents_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[tcoreevents] ADD  CONSTRAINT [DF_tcoreevents_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[tcorehosts] ADD  CONSTRAINT [DF_tmstrhost_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT ('0.0000') FOR [cost]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT ('0.0000') FOR [price]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT ('0.000000') FOR [point]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT ('0.0000') FOR [cost]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT ('0.0000') FOR [price]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT ('0') FOR [quantity]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT ('0') FOR [job_title]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT ('0') FOR [state]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT ('0') FOR [address]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcorejobs] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoremappedcodes] ADD  CONSTRAINT [DF_tcoremappedcode_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[tcoreroles] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[tcoreroles] ADD  DEFAULT ('0') FOR [level]
GO
ALTER TABLE [dbo].[tcoreroles] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreroles] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreroles] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreroles] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreroles] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreroles] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT ('0') FOR [ref_code]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT ('0') FOR [user_id]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT ('0') FOR [channel]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT ('0.000000') FOR [tranx_amount]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoreunitmeasurements] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreunitmeasurements] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreunitmeasurements] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreunitmeasurements] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreunitmeasurements] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreunitmeasurements] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoreuserroles] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreuserroles] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreuserroles] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreuserroles] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreuserroles] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreuserroles] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT (NULL) FOR [email_confirmed]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT (NULL) FOR [password_hash]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT ('0') FOR [require_password_change]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT (NULL) FOR [phone_number_confirmed]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT ('0') FOR [two_factor_enabled]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT (NULL) FOR [other_name]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT (NULL) FOR [prev_balance]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT (NULL) FOR [amount_paid]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT (NULL) FOR [current_balance]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tmstrcategories] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tmstrcategories] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tmstrcategories] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tmstrcategories] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tmstrcategories] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tmstrcategories] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tmstrtranxchannels] ADD  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[tmstrtranxchannels] ADD  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tmstrtranxchannels] ADD  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tmstrtranxchannels] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tmstrtranxchannels] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tmstrtranxchannels] ADD  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tmstrtranxchannels] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoreapplicants]  WITH CHECK ADD  CONSTRAINT [fk_jobid_tcorejobapplicants] FOREIGN KEY([job_id])
REFERENCES [dbo].[tcorejobs] ([id])
GO
ALTER TABLE [dbo].[tcoreapplicants] CHECK CONSTRAINT [fk_jobid_tcorejobapplicants]
GO
ALTER TABLE [dbo].[tcoreitempoints]  WITH CHECK ADD  CONSTRAINT [fk_unitid_tmstrunitmeasurement] FOREIGN KEY([unit_id])
REFERENCES [dbo].[tcoreunitmeasurements] ([id])
GO
ALTER TABLE [dbo].[tcoreitempoints] CHECK CONSTRAINT [fk_unitid_tmstrunitmeasurement]
GO
ALTER TABLE [dbo].[tcoremappedcodes]  WITH CHECK ADD  CONSTRAINT [FK_tcoremappedcode_tcoremappedcode] FOREIGN KEY([event_id])
REFERENCES [dbo].[tcoreevents] ([id])
GO
ALTER TABLE [dbo].[tcoremappedcodes] CHECK CONSTRAINT [FK_tcoremappedcode_tcoremappedcode]
GO
ALTER TABLE [dbo].[tcoreuserroles]  WITH CHECK ADD  CONSTRAINT [fk_roleid_tcoreuserrole] FOREIGN KEY([role_id])
REFERENCES [dbo].[tcoreroles] ([id])
GO
ALTER TABLE [dbo].[tcoreuserroles] CHECK CONSTRAINT [fk_roleid_tcoreuserrole]
GO
ALTER TABLE [dbo].[tcoreuserroles]  WITH CHECK ADD  CONSTRAINT [fk_user_id_tcoreuserrole] FOREIGN KEY([user_id])
REFERENCES [dbo].[tcoreusers] ([id])
GO
ALTER TABLE [dbo].[tcoreuserroles] CHECK CONSTRAINT [fk_user_id_tcoreuserrole]
GO
