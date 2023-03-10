USE [paylocity-demo]
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([id], [statusId], [name]) VALUES (1, 1, N'Mars Freight Express')
SET IDENTITY_INSERT [dbo].[Organization] OFF
SET IDENTITY_INSERT [dbo].[Benefit] ON 

INSERT [dbo].[Benefit] ([id], [statusId], [organizationId], [name], [cost]) VALUES (1, 1, 1, N'Employee benefits', CAST(38.4615 AS Decimal(19, 4)))
INSERT [dbo].[Benefit] ([id], [statusId], [organizationId], [name], [cost]) VALUES (2, 1, 1, N'Dependent benefits', CAST(19.2308 AS Decimal(19, 4)))
SET IDENTITY_INSERT [dbo].[Benefit] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [statusId], [organizationId], [username], [firstName], [lastName], [title], [salary]) VALUES (1, 1, 1, N'john.smith@test.com', N'John', N'Smith', N'Engineer', CAST(2000.0000 AS Decimal(19, 4)))
INSERT [dbo].[Employee] ([id], [statusId], [organizationId], [username], [firstName], [lastName], [title], [salary]) VALUES (2, 1, 1, N'arianne.smith@test.com', N'Arianne', N'Smith', N'Engineer', CAST(2000.0000 AS Decimal(19, 4)))
INSERT [dbo].[Employee] ([id], [statusId], [organizationId], [username], [firstName], [lastName], [title], [salary]) VALUES (3, 1, 1, N'laura.jane@test.com', N'Laura', N'Jane', N'Engineer', CAST(2000.0000 AS Decimal(19, 4)))
INSERT [dbo].[Employee] ([id], [statusId], [organizationId], [username], [firstName], [lastName], [title], [salary]) VALUES (4, 1, 1, N'anton.craig@test.com', N'Anton', N'Craig', N'Engineer', CAST(2000.0000 AS Decimal(19, 4)))
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[EmployeeBenefit] ([employeeId], [benefitId]) VALUES (1, 1)
INSERT [dbo].[EmployeeBenefit] ([employeeId], [benefitId]) VALUES (2, 1)
INSERT [dbo].[EmployeeBenefit] ([employeeId], [benefitId]) VALUES (4, 1)
SET IDENTITY_INSERT [dbo].[Dependent] ON 

INSERT [dbo].[Dependent] ([id], [statusId], [employeeId], [firstName], [lastName], [relationship]) VALUES (1, 1, 1, N'Kay', N'Smith', N'Spouse')
INSERT [dbo].[Dependent] ([id], [statusId], [employeeId], [firstName], [lastName], [relationship]) VALUES (2, 1, 1, N'Chris', N'Smith', N'Child')
INSERT [dbo].[Dependent] ([id], [statusId], [employeeId], [firstName], [lastName], [relationship]) VALUES (3, 1, 2, N'Dennis', N'Smith', N'Spouse')
INSERT [dbo].[Dependent] ([id], [statusId], [employeeId], [firstName], [lastName], [relationship]) VALUES (4, 1, 3, N'Adrian', N'Jane', N'Child')
INSERT [dbo].[Dependent] ([id], [statusId], [employeeId], [firstName], [lastName], [relationship]) VALUES (5, 1, 4, N'Aida', N'Craig', N'Spouse')
SET IDENTITY_INSERT [dbo].[Dependent] OFF
INSERT [dbo].[DependentBenefit] ([dependentId], [benefitId]) VALUES (1, 2)
INSERT [dbo].[DependentBenefit] ([dependentId], [benefitId]) VALUES (2, 2)
INSERT [dbo].[DependentBenefit] ([dependentId], [benefitId]) VALUES (3, 2)
INSERT [dbo].[DependentBenefit] ([dependentId], [benefitId]) VALUES (4, 2)
INSERT [dbo].[DependentBenefit] ([dependentId], [benefitId]) VALUES (5, 2)
SET IDENTITY_INSERT [dbo].[Payroll] ON 

INSERT [dbo].[Payroll] ([id], [statusId], [organizationId], [employeeId], [fromDate], [toDate], [createdOn], [grossPay], [netPay]) VALUES (1, 2, 1, 1, CAST(0xD8440B00 AS Date), CAST(0xDE440B00 AS Date), CAST(0x0000AF87004543AC AS DateTime), CAST(2000.00 AS Decimal(19, 2)), CAST(1442.31 AS Decimal(19, 2)))
INSERT [dbo].[Payroll] ([id], [statusId], [organizationId], [employeeId], [fromDate], [toDate], [createdOn], [grossPay], [netPay]) VALUES (2, 2, 1, 4, CAST(0xD8440B00 AS Date), CAST(0xDE440B00 AS Date), CAST(0x0000AF870051F87B AS DateTime), CAST(2000.00 AS Decimal(19, 2)), CAST(1461.06 AS Decimal(19, 2)))
INSERT [dbo].[Payroll] ([id], [statusId], [organizationId], [employeeId], [fromDate], [toDate], [createdOn], [grossPay], [netPay]) VALUES (3, 2, 1, 2, CAST(0xD8440B00 AS Date), CAST(0xDE440B00 AS Date), CAST(0x0000AF870066B62B AS DateTime), CAST(2000.00 AS Decimal(19, 2)), CAST(1459.62 AS Decimal(19, 2)))
SET IDENTITY_INSERT [dbo].[Payroll] OFF
SET IDENTITY_INSERT [dbo].[BenefitDiscount] ON 

INSERT [dbo].[BenefitDiscount] ([id], [statusId], [organizationId], [typeId], [name], [expression], [percentOff]) VALUES (1, 1, 1, 1, N'Employee name starts with "A"', N'x => x.FirstName.StartsWith("A")', CAST(10.0000 AS Decimal(19, 4)))
INSERT [dbo].[BenefitDiscount] ([id], [statusId], [organizationId], [typeId], [name], [expression], [percentOff]) VALUES (2, 1, 1, 2, N'Dependent name starts with "A"', N'x => x.FirstName.StartsWith("A")', CAST(10.0000 AS Decimal(19, 4)))
SET IDENTITY_INSERT [dbo].[BenefitDiscount] OFF
SET IDENTITY_INSERT [dbo].[PayrollItem] ON 

INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (1, 1, N'Employee John Smith base salary', CAST(2000.00 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (2, 1, N'Benefits employee', CAST(-38.46 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (3, 1, N'Benefits depentent Kay Smith', CAST(-19.23 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (4, 1, N'Benefits depentent Chris Smith', CAST(-19.23 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (5, 1, N'Taxes (after deductions)', CAST(-480.77 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (6, 2, N'Employee Anton Craig base salary', CAST(2000.00 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (7, 2, N'Benefits employee', CAST(-38.46 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (8, 2, N'Employee benefits discount (-10.00%)', CAST(3.85 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (9, 2, N'Benefits depentent Aida Craig', CAST(-19.23 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (10, 2, N'Dependent benefits discount (-10.00%)', CAST(1.92 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (11, 2, N'Taxes (after deductions)', CAST(-487.02 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (12, 3, N'Employee Arianne Smith base salary', CAST(2000.00 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (13, 3, N'Benefits employee', CAST(-38.46 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (14, 3, N'Employee benefits discount (-10.00%)', CAST(3.85 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (15, 3, N'Benefits depentent Dennis Smith', CAST(-19.23 AS Decimal(19, 2)))
INSERT [dbo].[PayrollItem] ([id], [payrollId], [description], [amount]) VALUES (16, 3, N'Taxes (after deductions)', CAST(-486.54 AS Decimal(19, 2)))
SET IDENTITY_INSERT [dbo].[PayrollItem] OFF
