USE [master]
GO
/****** Object:  Database [paylocity-demo]    Script Date: 1/10/2023 10:03:02 PM ******/
CREATE DATABASE [paylocity-demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'paylocity-demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\paylocity-demo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'paylocity-demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\paylocity-demo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [paylocity-demo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [paylocity-demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [paylocity-demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [paylocity-demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [paylocity-demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [paylocity-demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [paylocity-demo] SET ARITHABORT ON 
GO
ALTER DATABASE [paylocity-demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [paylocity-demo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [paylocity-demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [paylocity-demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [paylocity-demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [paylocity-demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [paylocity-demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [paylocity-demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [paylocity-demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [paylocity-demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [paylocity-demo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [paylocity-demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [paylocity-demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [paylocity-demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [paylocity-demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [paylocity-demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [paylocity-demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [paylocity-demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [paylocity-demo] SET RECOVERY FULL 
GO
ALTER DATABASE [paylocity-demo] SET  MULTI_USER 
GO
ALTER DATABASE [paylocity-demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [paylocity-demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [paylocity-demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [paylocity-demo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'paylocity-demo', N'ON'
GO
USE [paylocity-demo]
GO
/****** Object:  Table [dbo].[Benefit]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Benefit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusId] [int] NOT NULL,
	[organizationId] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[cost] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_Benefit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BenefitDiscount]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BenefitDiscount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusId] [int] NOT NULL,
	[organizationId] [int] NOT NULL,
	[typeId] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[expression] [varchar](500) NOT NULL,
	[percentOff] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_BenefitDiscount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dependent]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[relationship] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dependent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DependentBenefit]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DependentBenefit](
	[dependentId] [int] NOT NULL,
	[benefitId] [int] NOT NULL,
 CONSTRAINT [PK_DependentBenefit] PRIMARY KEY CLUSTERED 
(
	[dependentId] ASC,
	[benefitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusId] [int] NOT NULL,
	[organizationId] [int] NOT NULL,
	[username] [varchar](100) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[salary] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeBenefit]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeBenefit](
	[employeeId] [int] NOT NULL,
	[benefitId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeBenefit] PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC,
	[benefitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organization]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusId] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statusId] [int] NOT NULL,
	[organizationId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[fromDate] [date] NOT NULL,
	[toDate] [date] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[grossPay] [decimal](19, 2) NOT NULL,
	[netPay] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_Payroll] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayrollItem]    Script Date: 1/10/2023 10:03:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayrollItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[payrollId] [int] NOT NULL,
	[description] [varchar](500) NOT NULL,
	[amount] [decimal](19, 2) NOT NULL,
 CONSTRAINT [PK_PayrollItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Benefit] ADD  CONSTRAINT [DF_Benefit_statusId]  DEFAULT ((1)) FOR [statusId]
GO
ALTER TABLE [dbo].[Benefit] ADD  CONSTRAINT [DF_Benefit_employeeCost]  DEFAULT ((0)) FOR [cost]
GO
ALTER TABLE [dbo].[BenefitDiscount] ADD  CONSTRAINT [DF_BenefitDiscount_statusId]  DEFAULT ((1)) FOR [statusId]
GO
ALTER TABLE [dbo].[BenefitDiscount] ADD  CONSTRAINT [DF_BenefitDiscount_percentOff]  DEFAULT ((0)) FOR [percentOff]
GO
ALTER TABLE [dbo].[Dependent] ADD  CONSTRAINT [DF_Dependent_statusId]  DEFAULT ((1)) FOR [statusId]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_statusId]  DEFAULT ((1)) FOR [statusId]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_salary]  DEFAULT ((52000)) FOR [salary]
GO
ALTER TABLE [dbo].[Organization] ADD  CONSTRAINT [DF_Organization_statusId]  DEFAULT ((1)) FOR [statusId]
GO
ALTER TABLE [dbo].[Payroll] ADD  CONSTRAINT [DF_Payroll_statusId]  DEFAULT ((2)) FOR [statusId]
GO
ALTER TABLE [dbo].[Payroll] ADD  CONSTRAINT [DF_Payroll_fromDate]  DEFAULT (getdate()) FOR [fromDate]
GO
ALTER TABLE [dbo].[Payroll] ADD  CONSTRAINT [DF_Payroll_toDate]  DEFAULT (getdate()) FOR [toDate]
GO
ALTER TABLE [dbo].[Payroll] ADD  CONSTRAINT [DF_Payroll_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Payroll] ADD  CONSTRAINT [DF_Payroll_grossPay]  DEFAULT ((0)) FOR [grossPay]
GO
ALTER TABLE [dbo].[Payroll] ADD  CONSTRAINT [DF_Payroll_netPay]  DEFAULT ((0)) FOR [netPay]
GO
ALTER TABLE [dbo].[PayrollItem] ADD  CONSTRAINT [DF_PayrollItem_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[Benefit]  WITH CHECK ADD  CONSTRAINT [FK_Benefit_Organization] FOREIGN KEY([organizationId])
REFERENCES [dbo].[Organization] ([id])
GO
ALTER TABLE [dbo].[Benefit] CHECK CONSTRAINT [FK_Benefit_Organization]
GO
ALTER TABLE [dbo].[BenefitDiscount]  WITH CHECK ADD  CONSTRAINT [FK_BenefitDiscount_Organization] FOREIGN KEY([organizationId])
REFERENCES [dbo].[Organization] ([id])
GO
ALTER TABLE [dbo].[BenefitDiscount] CHECK CONSTRAINT [FK_BenefitDiscount_Organization]
GO
ALTER TABLE [dbo].[Dependent]  WITH CHECK ADD  CONSTRAINT [FK_Dependent_Employee] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Dependent] CHECK CONSTRAINT [FK_Dependent_Employee]
GO
ALTER TABLE [dbo].[DependentBenefit]  WITH CHECK ADD  CONSTRAINT [FK_DependentBenefit_Benefit] FOREIGN KEY([benefitId])
REFERENCES [dbo].[Benefit] ([id])
GO
ALTER TABLE [dbo].[DependentBenefit] CHECK CONSTRAINT [FK_DependentBenefit_Benefit]
GO
ALTER TABLE [dbo].[DependentBenefit]  WITH CHECK ADD  CONSTRAINT [FK_DependentBenefit_Dependent] FOREIGN KEY([dependentId])
REFERENCES [dbo].[Dependent] ([id])
GO
ALTER TABLE [dbo].[DependentBenefit] CHECK CONSTRAINT [FK_DependentBenefit_Dependent]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Organization] FOREIGN KEY([organizationId])
REFERENCES [dbo].[Organization] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Organization]
GO
ALTER TABLE [dbo].[EmployeeBenefit]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBenefit_Benefit] FOREIGN KEY([benefitId])
REFERENCES [dbo].[Benefit] ([id])
GO
ALTER TABLE [dbo].[EmployeeBenefit] CHECK CONSTRAINT [FK_EmployeeBenefit_Benefit]
GO
ALTER TABLE [dbo].[EmployeeBenefit]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeBenefit_Employee] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[EmployeeBenefit] CHECK CONSTRAINT [FK_EmployeeBenefit_Employee]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_Payroll_Employee] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_Employee]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_Payroll_Organization] FOREIGN KEY([organizationId])
REFERENCES [dbo].[Organization] ([id])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_Organization]
GO
ALTER TABLE [dbo].[PayrollItem]  WITH CHECK ADD  CONSTRAINT [FK_PayrollItem_Payroll] FOREIGN KEY([payrollId])
REFERENCES [dbo].[Payroll] ([id])
GO
ALTER TABLE [dbo].[PayrollItem] CHECK CONSTRAINT [FK_PayrollItem_Payroll]
GO
USE [master]
GO
ALTER DATABASE [paylocity-demo] SET  READ_WRITE 
GO
