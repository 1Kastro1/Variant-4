USE [заказ]
GO
/****** Object:  Table [dbo].[Заказной товар]    Script Date: 03.04.2020 10:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказной товар](
	[ID] [int] NOT NULL,
	[ID товара] [int] NULL,
	[Количество] [int] NULL,
 CONSTRAINT [PK_Заказной товар] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Покупатели]    Script Date: 03.04.2020 10:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Покупатели](
	[Код покупателя] [nchar](10) NOT NULL,
	[Телефон] [nchar](10) NULL,
	[Контактное лицо] [nchar](10) NULL,
	[Адрес] [nchar](10) NULL,
 CONSTRAINT [PK_Покупатели] PRIMARY KEY CLUSTERED 
(
	[Код покупателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 03.04.2020 10:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[ID] [nchar](10) NOT NULL,
	[Логин] [nchar](10) NULL,
	[Пароль] [nchar](10) NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сведения о сделке]    Script Date: 03.04.2020 10:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сведения о сделке](
	[Код сделки] [int] NOT NULL,
	[Код товара] [int] NULL,
	[Количество] [int] NULL,
	[Признак] [varchar](50) NULL,
 CONSTRAINT [PK_Сведения о сделке] PRIMARY KEY CLUSTERED 
(
	[Код сделки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сделка]    Script Date: 03.04.2020 10:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сделка](
	[Код сделки] [int] NOT NULL,
	[Дата сделки] [date] NULL,
	[Код товара] [int] NULL,
	[Количество] [int] NULL,
	[Код покупателя] [int] NULL,
	[Признак оптовой продажи] [varchar](50) NULL,
 CONSTRAINT [PK_Сделка] PRIMARY KEY CLUSTERED 
(
	[Код сделки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Скидки]    Script Date: 03.04.2020 10:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Скидки](
	[Код таблицы] [int] NOT NULL,
	[От] [nchar](10) NULL,
	[До] [nchar](10) NULL,
	[Процент скидки] [nchar](10) NULL,
 CONSTRAINT [PK_Скидки] PRIMARY KEY CLUSTERED 
(
	[Код таблицы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 03.04.2020 10:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[Код товара] [nchar](10) NOT NULL,
	[Наименование] [nchar](10) NULL,
	[Оптовая цена] [nchar](10) NULL,
	[Розничная цена] [nchar](10) NULL,
	[Описание] [nchar](10) NULL,
 CONSTRAINT [PK_Товары] PRIMARY KEY CLUSTERED 
(
	[Код товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказной товар]  WITH CHECK ADD  CONSTRAINT [FK_Заказной товар_Скидки] FOREIGN KEY([ID товара])
REFERENCES [dbo].[Скидки] ([Код таблицы])
GO
ALTER TABLE [dbo].[Заказной товар] CHECK CONSTRAINT [FK_Заказной товар_Скидки]
GO
ALTER TABLE [dbo].[Покупатели]  WITH CHECK ADD  CONSTRAINT [FK_Покупатели_Пользователь] FOREIGN KEY([Контактное лицо])
REFERENCES [dbo].[Пользователь] ([ID])
GO
ALTER TABLE [dbo].[Покупатели] CHECK CONSTRAINT [FK_Покупатели_Пользователь]
GO
ALTER TABLE [dbo].[Сведения о сделке]  WITH CHECK ADD  CONSTRAINT [FK_Сведения о сделке_Сделка] FOREIGN KEY([Код товара])
REFERENCES [dbo].[Сделка] ([Код сделки])
GO
ALTER TABLE [dbo].[Сведения о сделке] CHECK CONSTRAINT [FK_Сведения о сделке_Сделка]
GO
ALTER TABLE [dbo].[Скидки]  WITH CHECK ADD  CONSTRAINT [FK_Скидки_Товары] FOREIGN KEY([Процент скидки])
REFERENCES [dbo].[Товары] ([Код товара])
GO
ALTER TABLE [dbo].[Скидки] CHECK CONSTRAINT [FK_Скидки_Товары]
GO
