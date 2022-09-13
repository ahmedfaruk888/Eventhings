/****** Object:  Table [dbo].[tcoreapplicants]    Script Date: 9/11/2022 5:39:55 PM ******/
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
/****** Object:  Table [dbo].[tcoreapplication]    Script Date: 9/11/2022 5:39:55 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unq_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorebasesettings]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcorebasesettings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[description] [varchar](512) NULL,
	[value] [int] NOT NULL,
	[active] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime] NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_tcorebasesettings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_tcorebasesettings_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorecodestores]    Script Date: 9/11/2022 5:39:55 PM ******/
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
/****** Object:  Table [dbo].[tcoreeventpayment]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreeventpayment](
	[user_id] [int] NOT NULL,
	[event_id] [int] NOT NULL,
	[tranx_ref_id] [varchar](128) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime] NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreevents]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreevents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](128) NOT NULL,
	[description] [varchar](max) NULL,
	[location] [varchar](256) NULL,
	[gate_fee] [decimal](18, 2) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[duration] [int] NULL,
	[host_id] [int] NOT NULL,
	[is_live] [int] NULL,
	[active] [int] NOT NULL,
	[deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime] NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime] NULL,
	[payment_currency] [int] NULL,
	[payment_currency_description] [varchar](256) NULL,
 CONSTRAINT [PK_tcoreevents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorehosts]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcorehosts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](128) NOT NULL,
	[description] [varchar](256) NULL,
	[phone] [varchar](128) NULL,
	[email] [varchar](128) NULL,
	[address] [varchar](256) NULL,
	[deleted] [int] NOT NULL,
	[active] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime] NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_tmstrhost] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreitempoints]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreitempoints](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_id] [int] NULL,
	[item_name] [varchar](128) NOT NULL,
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
 CONSTRAINT [PK__tcoreite__3213E83FECAC62E6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreitems]    Script Date: 9/11/2022 5:39:55 PM ******/
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
	[category] [varchar](128) NOT NULL,
	[quantity] [int] NOT NULL,
	[point] [decimal](19, 4) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
 CONSTRAINT [PK__tcoreite__3213E83F90D1E198] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorejobs]    Script Date: 9/11/2022 5:39:55 PM ******/
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
/****** Object:  Table [dbo].[tcoremappedcodes]    Script Date: 9/11/2022 5:39:55 PM ******/
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
/****** Object:  Table [dbo].[tcoreroles]    Script Date: 9/11/2022 5:39:55 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoresales]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoresales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itempoint_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[vendor_id] [int] NULL,
	[event_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](19, 4) NOT NULL,
	[point] [decimal](19, 4) NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](128) NULL,
	[updated_at] [datetime2](0) NULL,
 CONSTRAINT [PK_tcoresales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoretransactions]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoretransactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ref_code] [int] NOT NULL,
	[event_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[channel] [varchar](128) NULL,
	[tranx_amount] [decimal](20, 6) NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](256) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](256) NULL,
	[updated_at] [datetime2](0) NULL,
 CONSTRAINT [PK__tcoretra__3213E83F10F418FB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ref_code] UNIQUE NONCLUSTERED 
(
	[ref_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreunitmeasurements]    Script Date: 9/11/2022 5:39:55 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [unit_of_measurement] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreuserroles]    Script Date: 9/11/2022 5:39:55 PM ******/
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
/****** Object:  Table [dbo].[tcoreusers]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreusers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_code] [varchar](128) NOT NULL,
	[verification_token] [varchar](258) NULL,
	[verification_code] [varchar](50) NULL,
	[email] [varchar](128) NULL,
	[email_confirmed] [datetime2](0) NULL,
	[password_hash] [varchar](512) NULL,
	[require_password_change] [int] NOT NULL,
	[phone_number] [varchar](128) NULL,
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
 CONSTRAINT [PK__tcoreuse__3213E83FFB2BABB2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorevendoritems]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcorevendoritems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](128) NULL,
	[created_date] [datetime] NULL,
	[updated_by] [varbinary](128) NULL,
	[updated_date] [datetime] NULL,
 CONSTRAINT [PK_tcorevendoritems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcoreverification]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcoreverification](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[verification_code] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tcorewallets]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tcorewallets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](256) NOT NULL,
	[point] [decimal](19, 4) NOT NULL,
	[payment_channel] [varchar](256) NULL,
	[prev_balance] [decimal](19, 4) NULL,
	[amount_paid] [decimal](19, 4) NULL,
	[current_balance] [decimal](19, 4) NULL,
	[active] [int] NOT NULL,
	[is_deleted] [int] NOT NULL,
	[created_by] [varchar](256) NULL,
	[created_at] [datetime2](0) NULL,
	[updated_by] [varchar](256) NULL,
	[updated_at] [datetime2](0) NULL,
 CONSTRAINT [PK__tcorewal__3213E83FC229EDFD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmstrcategories]    Script Date: 9/11/2022 5:39:55 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [category_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmstrtranxchannels]    Script Date: 9/11/2022 5:39:55 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [channel_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_event_user_mapped]    Script Date: 9/11/2022 5:39:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_event_user_mapped]
AS
SELECT        dbo.tcoreusers.id, dbo.tcoreusers.first_name, dbo.tcoreusers.last_name, dbo.tcoreusers.phone_number, dbo.tcoreusers.email, dbo.tcoreevents.id AS event_id, dbo.tcoreevents.name, dbo.tcoreevents.gate_fee, 
                         dbo.tcoreevents.is_live, dbo.tcoreevents.active, dbo.tcoremappedcodes.code_id, dbo.tcorecodestores.batch_number, dbo.tcorecodestores.batch_name, dbo.tcorecodestores.code, dbo.tcorecodestores.encrypted_code
FROM            dbo.tcoreusers INNER JOIN
                         dbo.tcoreuserroles ON dbo.tcoreusers.id = dbo.tcoreuserroles.user_id AND dbo.tcoreuserroles.role_id = 1 LEFT OUTER JOIN
                         dbo.tcoremappedcodes ON dbo.tcoreusers.id = dbo.tcoremappedcodes.user_id LEFT OUTER JOIN
                         dbo.tcoreevents ON dbo.tcoreevents.id = dbo.tcoremappedcodes.event_id AND dbo.tcoreevents.is_live = 1 LEFT OUTER JOIN
                         dbo.tcorecodestores ON dbo.tcoremappedcodes.code_id = dbo.tcorecodestores.id
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
ALTER TABLE [dbo].[tcorebasesettings] ADD  CONSTRAINT [DF_tcorebasesettings_value]  DEFAULT ((0)) FOR [value]
GO
ALTER TABLE [dbo].[tcorebasesettings] ADD  CONSTRAINT [DF_tcorebasesettings_active]  DEFAULT ((1)) FOR [active]
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
ALTER TABLE [dbo].[tcoreeventpayment] ADD  CONSTRAINT [DF_tcoreeventpayment_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[tcoreeventpayment] ADD  CONSTRAINT [DF_tcoreeventpayment_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreevents] ADD  CONSTRAINT [DF_tcoreevents_gate_fee]  DEFAULT ((0)) FOR [gate_fee]
GO
ALTER TABLE [dbo].[tcoreevents] ADD  CONSTRAINT [DF_tcoreevents_is_live]  DEFAULT ((0)) FOR [is_live]
GO
ALTER TABLE [dbo].[tcoreevents] ADD  CONSTRAINT [DF_tcoreevents_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[tcoreevents] ADD  CONSTRAINT [DF_tcoreevents_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[tcoreevents] ADD  CONSTRAINT [DF__tcoreeven__payme__515009E6]  DEFAULT ((1)) FOR [payment_currency]
GO
ALTER TABLE [dbo].[tcorehosts] ADD  CONSTRAINT [DF_tmstrhost_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitemp__cost__5F492382]  DEFAULT ('0.0000') FOR [cost]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitem__price__603D47BB]  DEFAULT ('0.0000') FOR [price]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitem__point__61316BF4]  DEFAULT ('0.000000') FOR [point]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitem__activ__6225902D]  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitem__is_de__6319B466]  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitem__creat__640DD89F]  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitem__creat__6501FCD8]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitem__updat__65F62111]  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreitempoints] ADD  CONSTRAINT [DF__tcoreitem__updat__66EA454A]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__descr__3EDC53F0]  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitems__cost__3FD07829]  DEFAULT ('0.0000') FOR [cost]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__price__40C49C62]  DEFAULT ('0.0000') FOR [price]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__quant__41B8C09B]  DEFAULT ('0') FOR [quantity]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__activ__42ACE4D4]  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__is_de__43A1090D]  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__creat__44952D46]  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__creat__4589517F]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__updat__467D75B8]  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreitems] ADD  CONSTRAINT [DF__tcoreitem__updat__477199F1]  DEFAULT (getdate()) FOR [updated_at]
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
ALTER TABLE [dbo].[tcoresales] ADD  CONSTRAINT [DF_tcoresales_is_deleted]  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoresales] ADD  CONSTRAINT [DF_tcoresales_created_by]  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoresales] ADD  CONSTRAINT [DF_tcoresales_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoresales] ADD  CONSTRAINT [DF_tcoresales_updated_by]  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoresales] ADD  CONSTRAINT [DF_tcoresales_updated_at]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__ref_c__1B9317B3]  DEFAULT ('0') FOR [ref_code]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__user___1C873BEC]  DEFAULT ('0') FOR [user_id]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__chann__1D7B6025]  DEFAULT ('0') FOR [channel]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__tranx__1E6F845E]  DEFAULT ('0.000000') FOR [tranx_amount]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__activ__1F63A897]  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__is_de__2057CCD0]  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__creat__214BF109]  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__creat__22401542]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__updat__2334397B]  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoretransactions] ADD  CONSTRAINT [DF__tcoretran__updat__24285DB4]  DEFAULT (getdate()) FOR [updated_at]
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
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__email__17F790F9]  DEFAULT (NULL) FOR [email_confirmed]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__passw__18EBB532]  DEFAULT (NULL) FOR [password_hash]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__requi__19DFD96B]  DEFAULT ('0') FOR [require_password_change]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__phone__1AD3FDA4]  DEFAULT (NULL) FOR [phone_number_confirmed]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__two_f__1BC821DD]  DEFAULT ('0') FOR [two_factor_enabled]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__other__1CBC4616]  DEFAULT (NULL) FOR [other_name]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__activ__1DB06A4F]  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__is_de__1EA48E88]  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__creat__1F98B2C1]  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__creat__208CD6FA]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__updat__2180FB33]  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcoreusers] ADD  CONSTRAINT [DF__tcoreuser__updat__22751F6C]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__prev___02FC7413]  DEFAULT (NULL) FOR [prev_balance]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__amoun__03F0984C]  DEFAULT (NULL) FOR [amount_paid]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__curre__04E4BC85]  DEFAULT (NULL) FOR [current_balance]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__activ__05D8E0BE]  DEFAULT ('1') FOR [active]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__is_de__06CD04F7]  DEFAULT ('0') FOR [is_deleted]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__creat__07C12930]  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__creat__08B54D69]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__updat__09A971A2]  DEFAULT (NULL) FOR [updated_by]
GO
ALTER TABLE [dbo].[tcorewallets] ADD  CONSTRAINT [DF__tcorewall__updat__0A9D95DB]  DEFAULT (getdate()) FOR [updated_at]
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[2] 2[39] 3) )"
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
         Begin Table = "tcoreusers"
            Begin Extent = 
               Top = 2
               Left = 257
               Bottom = 201
               Right = 385
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tcoremappedcodes"
            Begin Extent = 
               Top = 8
               Left = 421
               Bottom = 211
               Right = 591
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tcoreevents"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 193
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tcorecodestores"
            Begin Extent = 
               Top = 12
               Left = 625
               Bottom = 195
               Right = 798
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tcoreuserroles"
            Begin Extent = 
               Top = 29
               Left = 831
               Bottom = 223
               Right = 1001
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
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_event_user_mapped'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_event_user_mapped'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_event_user_mapped'
GO
