USE MASTER
GO
CREATE DATABASE DBQLLH
GO
USE [DBQLLH]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[AssignmentID] [nvarchar](10) NOT NULL,
	[ClassID] [nvarchar](10) NOT NULL,
	[SubjectID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [nvarchar](10) NOT NULL,
	[ClassName] [nvarchar](100) NOT NULL,
	[TeacherID] [nvarchar](10) NOT NULL,
	[StartDay] [date] NULL,
	[EndDay] [date] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mark]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark](
	[MarkID] [nvarchar](10) NOT NULL,
	[StudentID] [nvarchar](10) NOT NULL,
	[AssigmentID] [nvarchar](10) NOT NULL,
	[Scores] [float] NOT NULL,
 CONSTRAINT [PK_Mark] PRIMARY KEY CLUSTERED 
(
	[MarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [nvarchar](10) NOT NULL,
	[NotificationName] [nvarchar](200) NOT NULL,
	[NotificationContent] [nvarchar](500) NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nvarchar](10) NOT NULL,
	[Passcode] [nvarchar](20) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Picture] [nvarchar](50) NULL,
	[ClassID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectID] [nvarchar](10) NOT NULL,
	[SubjectName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [nvarchar](10) NOT NULL,
	[TeacherName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Addres] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Picture] [nvarchar](50) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[TimeTableID] [nvarchar](10) NOT NULL,
	[ClassID] [nvarchar](10) NOT NULL,
	[Schedule] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[TimeTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/21/2021 8:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [nvarchar](10) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A001', N'C01', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A002', N'C01', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A003', N'C01', N'M03')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A004', N'C01', N'M05')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A005', N'C01', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A006', N'C01', N'M10')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A007', N'C02', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A008', N'C02', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A009', N'C02', N'M03')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A010', N'C02', N'M05')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A011', N'C02', N'M14')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A012', N'C02', N'M15')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A013', N'C01', N'M16')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A014', N'C03', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A015', N'C03', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A016', N'C03', N'M04')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A017', N'C03', N'M06')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A018', N'C03', N'M08')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A019', N'C03', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A020', N'C03', N'M11')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A021', N'C03', N'M13')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A022', N'C04', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A023', N'C04', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A024', N'C04', N'M03')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A025', N'C04', N'M05')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A026', N'C04', N'M07')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A027', N'C04', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A028', N'C04', N'M10')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A029', N'C04', N'M11')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A030', N'C04', N'M12')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A031', N'C05', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A032', N'C05', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A033', N'C05', N'M03')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A034', N'C05', N'M05')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A035', N'C05', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A036', N'C05', N'M10')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A037', N'C05', N'M16')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A038', N'C06', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A039', N'C06', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A040', N'C06', N'M03')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A041', N'C06', N'M05')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A042', N'C06', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A043', N'C06', N'M10')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A044', N'C06', N'M16')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A045', N'C07', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A046', N'C07', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A047', N'C07', N'M03')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A048', N'C07', N'M05')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A049', N'C07', N'M07')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A050', N'C07', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A051', N'C07', N'M10')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A052', N'C07', N'M11')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A053', N'C07', N'M12')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A054', N'C08', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A055', N'C08', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A056', N'C08', N'M03')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A057', N'C08', N'M05')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A058', N'C08', N'M07')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A059', N'C08', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A060', N'C08', N'M10')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A061', N'C08', N'M11')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A062', N'C08', N'M12')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A063', N'C09', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A064', N'C09', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A065', N'C09', N'M03')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A066', N'C09', N'M05')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A067', N'C09', N'M07')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A068', N'C09', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A069', N'C09', N'M10')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A070', N'C09', N'M11')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A071', N'C09', N'M12')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A072', N'C10', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A073', N'C10', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A074', N'C10', N'M04')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A075', N'C10', N'M06')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A076', N'C10', N'M08')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A077', N'C10', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A078', N'C10', N'M11')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A079', N'C10', N'M13')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A080', N'C11', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A081', N'C11', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A082', N'C11', N'M04')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A083', N'C11', N'M06')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A084', N'C11', N'M08')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A085', N'C11', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A086', N'C11', N'M11')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A087', N'C11', N'M13')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A088', N'C12', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A089', N'C12', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A090', N'C12', N'M04')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A091', N'C12', N'M06')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A092', N'C12', N'M08')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A093', N'C12', N'M09')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A094', N'C12', N'M11')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A095', N'C12', N'M13')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A096', N'C13', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A097', N'C13', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A098', N'C13', N'M04')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A099', N'C13', N'M06')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A100', N'C13', N'M08')
GO
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A101', N'C13', N'M17')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A107', N'C01', N'M17')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A108', N'C14', N'M01')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A109', N'C14', N'M02')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A110', N'C14', N'M04')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A111', N'C14', N'M06')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A112', N'C14', N'M08')
INSERT [dbo].[Assignment] ([AssignmentID], [ClassID], [SubjectID]) VALUES (N'A113', N'C14', N'M17')
GO
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C01', N'Lập trình ASP.NET', N'T01', CAST(N'2021-08-05' AS Date), CAST(N'2021-11-10' AS Date))
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C02', N'Lập trình Winform', N'T02', CAST(N'2021-08-05' AS Date), CAST(N'2021-11-20' AS Date))
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C03', N'Lập trình Fullstack Java Web Developer', N'T03', CAST(N'2021-08-12' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C04', N'Lập trình Fullstack .NET Web Developer', N'T04', CAST(N'2021-09-15' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C05', N'Lập trình ASP.NET', N'T05', CAST(N'2021-10-01' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C06', N'Lập trình ASP.NET', N'T09', CAST(N'2021-10-01' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C07', N'Lập trình Fullstack .NET Web Developer', N'T10', CAST(N'2021-11-18' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C08', N'Lập trình Fullstack .NET Web Developer', N'T11', CAST(N'2021-11-18' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C09', N'Lập trình Fullstack .NET Web Developer', N'T06', CAST(N'2021-11-18' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C10', N'Lập trình Fullstack Java Web Developer', N'T13', CAST(N'2021-11-25' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C11', N'Lập trình Fullstack Java Web Developer', N'T07', CAST(N'2021-11-25' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C12', N'Lập trình Fullstack Java Web Developer', N'T12', CAST(N'2021-11-25' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C13', N'Lập trình Mobile Fulluter', N'T14', CAST(N'2021-12-01' AS Date), NULL)
INSERT [dbo].[Class] ([ClassID], [ClassName], [TeacherID], [StartDay], [EndDay]) VALUES (N'C14', N'Lập trình Mobile Fulluter', N'T08', CAST(N'2021-12-01' AS Date), NULL)
GO
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0001', N'HV0001', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0002', N'HV0002', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0003', N'HV0003', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0004', N'HV0004', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0005', N'HV0005', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0006', N'HV0006', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0007', N'HV0007', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0008', N'HV0008', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0009', N'HV0009', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0010', N'HV0010', N'A001', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0011', N'HV0011', N'A001', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0012', N'HV0012', N'A001', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0013', N'HV0013', N'A001', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0014', N'HV0014', N'A001', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0015', N'HV0015', N'A001', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0016', N'HV0001', N'A002', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0017', N'HV0002', N'A002', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0018', N'HV0003', N'A002', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0019', N'HV0004', N'A002', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0020', N'HV0005', N'A002', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0021', N'HV0006', N'A002', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0022', N'HV0007', N'A002', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0023', N'HV0008', N'A002', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0024', N'HV0009', N'A002', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0025', N'HV0010', N'A002', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0026', N'HV0011', N'A002', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0027', N'HV0012', N'A002', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0028', N'HV0013', N'A002', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0029', N'HV0014', N'A002', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0030', N'HV0015', N'A002', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0031', N'HV0001', N'A003', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0032', N'HV0002', N'A003', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0033', N'HV0003', N'A003', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0034', N'HV0004', N'A003', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0035', N'HV0005', N'A003', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0036', N'HV0006', N'A003', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0037', N'HV0007', N'A003', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0038', N'HV0008', N'A003', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0039', N'HV0009', N'A003', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0040', N'HV0010', N'A003', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0041', N'HV0011', N'A003', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0042', N'HV0012', N'A003', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0043', N'HV0013', N'A003', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0044', N'HV0014', N'A003', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0045', N'HV0015', N'A003', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0046', N'HV0001', N'A004', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0047', N'HV0002', N'A004', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0048', N'HV0003', N'A004', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0049', N'HV0004', N'A004', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0050', N'HV0005', N'A004', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0051', N'HV0006', N'A004', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0052', N'HV0007', N'A004', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0053', N'HV0008', N'A004', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0054', N'HV0009', N'A004', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0055', N'HV0010', N'A004', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0056', N'HV0011', N'A004', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0057', N'HV0012', N'A004', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0058', N'HV0013', N'A004', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0059', N'HV0014', N'A004', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0060', N'HV0015', N'A004', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0061', N'HV0001', N'A005', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0062', N'HV0002', N'A005', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0063', N'HV0003', N'A005', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0064', N'HV0004', N'A005', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0065', N'HV0005', N'A005', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0066', N'HV0006', N'A005', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0067', N'HV0007', N'A005', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0068', N'HV0008', N'A005', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0069', N'HV0009', N'A005', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0070', N'HV0010', N'A005', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0071', N'HV0011', N'A005', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0072', N'HV0012', N'A005', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0073', N'HV0013', N'A005', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0074', N'HV0014', N'A005', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0075', N'HV0015', N'A005', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0076', N'HV0001', N'A006', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0077', N'HV0002', N'A006', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0078', N'HV0003', N'A006', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0079', N'HV0004', N'A006', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0080', N'HV0005', N'A006', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0081', N'HV0006', N'A006', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0082', N'HV0007', N'A006', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0083', N'HV0008', N'A006', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0084', N'HV0009', N'A006', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0085', N'HV0010', N'A006', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0086', N'HV0011', N'A006', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0087', N'HV0012', N'A006', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0088', N'HV0013', N'A006', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0089', N'HV0014', N'A006', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0090', N'HV0015', N'A006', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0091', N'HV0001', N'A013', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0092', N'HV0002', N'A013', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0093', N'HV0003', N'A013', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0094', N'HV0004', N'A013', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0095', N'HV0005', N'A013', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0096', N'HV0006', N'A013', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0097', N'HV0007', N'A013', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0098', N'HV0008', N'A013', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0099', N'HV0009', N'A013', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0100', N'HV0010', N'A013', 7)
GO
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0101', N'HV0011', N'A013', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0102', N'HV0012', N'A013', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0103', N'HV0013', N'A013', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0104', N'HV0014', N'A013', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0105', N'HV0015', N'A013', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0106', N'HV0001', N'A107', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0107', N'HV0002', N'A107', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0108', N'HV0003', N'A107', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0109', N'HV0004', N'A107', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0110', N'HV0005', N'A107', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0111', N'HV0006', N'A107', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0112', N'HV0007', N'A107', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0113', N'HV0008', N'A107', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0114', N'HV0009', N'A107', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0115', N'HV0010', N'A107', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0116', N'HV0011', N'A107', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0117', N'HV0012', N'A107', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0118', N'HV0013', N'A107', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0119', N'HV0014', N'A107', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0120', N'HV0015', N'A107', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0121', N'HV0016', N'A007', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0122', N'HV0017', N'A007', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0123', N'HV0018', N'A007', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0124', N'HV0019', N'A007', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0125', N'HV0020', N'A007', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0126', N'HV0021', N'A007', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0127', N'HV0022', N'A007', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0128', N'HV0023', N'A007', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0129', N'HV0024', N'A007', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0130', N'HV0025', N'A007', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0131', N'HV0026', N'A007', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0132', N'HV0027', N'A007', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0133', N'HV0028', N'A007', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0134', N'HV0029', N'A007', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0135', N'HV0030', N'A007', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0136', N'HV0016', N'A008', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0137', N'HV0017', N'A008', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0138', N'HV0018', N'A008', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0139', N'HV0019', N'A008', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0140', N'HV0020', N'A008', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0141', N'HV0021', N'A008', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0142', N'HV0022', N'A008', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0143', N'HV0023', N'A008', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0144', N'HV0024', N'A008', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0145', N'HV0025', N'A008', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0146', N'HV0026', N'A008', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0147', N'HV0027', N'A008', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0148', N'HV0028', N'A008', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0149', N'HV0029', N'A008', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0150', N'HV0030', N'A008', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0151', N'HV0016', N'A009', 7.5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0152', N'HV0017', N'A009', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0153', N'HV0018', N'A009', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0154', N'HV0019', N'A009', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0155', N'HV0020', N'A009', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0156', N'HV0021', N'A009', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0157', N'HV0022', N'A009', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0158', N'HV0023', N'A009', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0159', N'HV0024', N'A009', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0160', N'HV0025', N'A009', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0161', N'HV0026', N'A009', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0162', N'HV0027', N'A009', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0163', N'HV0028', N'A009', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0164', N'HV0029', N'A009', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0165', N'HV0030', N'A009', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0166', N'HV0016', N'A010', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0167', N'HV0017', N'A010', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0168', N'HV0018', N'A010', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0169', N'HV0019', N'A010', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0170', N'HV0020', N'A010', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0171', N'HV0021', N'A010', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0172', N'HV0022', N'A010', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0173', N'HV0023', N'A010', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0174', N'HV0024', N'A010', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0175', N'HV0025', N'A010', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0176', N'HV0026', N'A010', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0177', N'HV0027', N'A010', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0178', N'HV0028', N'A010', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0179', N'HV0029', N'A010', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0180', N'HV0030', N'A010', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0181', N'HV0016', N'A011', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0182', N'HV0017', N'A011', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0183', N'HV0018', N'A011', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0184', N'HV0019', N'A011', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0185', N'HV0020', N'A011', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0186', N'HV0021', N'A011', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0187', N'HV0022', N'A011', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0188', N'HV0023', N'A011', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0189', N'HV0024', N'A011', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0190', N'HV0025', N'A011', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0191', N'HV0026', N'A011', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0192', N'HV0027', N'A011', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0193', N'HV0028', N'A011', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0194', N'HV0029', N'A011', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0195', N'HV0030', N'A011', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0196', N'HV0016', N'A012', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0197', N'HV0017', N'A012', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0198', N'HV0018', N'A012', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0199', N'HV0019', N'A012', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0200', N'HV0020', N'A012', 5)
GO
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0201', N'HV0021', N'A012', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0202', N'HV0022', N'A012', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0203', N'HV0023', N'A012', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0204', N'HV0024', N'A012', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0205', N'HV0025', N'A012', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0206', N'HV0026', N'A012', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0207', N'HV0027', N'A012', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0208', N'HV0028', N'A012', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0209', N'HV0029', N'A012', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0210', N'HV0030', N'A012', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0211', N'HV0031', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0212', N'HV0032', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0213', N'HV0033', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0214', N'HV0034', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0215', N'HV0035', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0216', N'HV0036', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0217', N'HV0037', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0218', N'HV0038', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0219', N'HV0039', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0220', N'HV0040', N'A014', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0221', N'HV0041', N'A014', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0222', N'HV0042', N'A014', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0223', N'HV0043', N'A014', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0224', N'HV0044', N'A014', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0225', N'HV0045', N'A014', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0226', N'HV0031', N'A015', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0227', N'HV0032', N'A015', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0228', N'HV0033', N'A015', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0229', N'HV0034', N'A015', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0230', N'HV0035', N'A015', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0231', N'HV0036', N'A015', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0232', N'HV0037', N'A015', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0233', N'HV0038', N'A015', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0234', N'HV0039', N'A015', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0235', N'HV0040', N'A015', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0236', N'HV0041', N'A015', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0237', N'HV0042', N'A015', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0238', N'HV0043', N'A015', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0239', N'HV0044', N'A015', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0240', N'HV0045', N'A015', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0241', N'HV0031', N'A016', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0242', N'HV0032', N'A016', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0243', N'HV0033', N'A016', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0244', N'HV0034', N'A016', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0245', N'HV0035', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0246', N'HV0036', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0247', N'HV0037', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0248', N'HV0038', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0249', N'HV0039', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0250', N'HV0040', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0251', N'HV0041', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0252', N'HV0042', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0253', N'HV0043', N'A016', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0254', N'HV0044', N'A016', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0255', N'HV0045', N'A016', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0256', N'HV0031', N'A017', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0257', N'HV0032', N'A017', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0258', N'HV0033', N'A017', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0259', N'HV0034', N'A017', 0)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0260', N'HV0035', N'A017', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0261', N'HV0036', N'A017', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0262', N'HV0037', N'A017', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0263', N'HV0038', N'A017', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0264', N'HV0039', N'A017', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0265', N'HV0040', N'A017', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0266', N'HV0041', N'A017', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0267', N'HV0042', N'A017', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0268', N'HV0043', N'A017', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0269', N'HV0044', N'A017', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0270', N'HV0045', N'A017', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0271', N'HV0031', N'A018', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0272', N'HV0032', N'A018', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0273', N'HV0033', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0274', N'HV0034', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0275', N'HV0035', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0276', N'HV0036', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0277', N'HV0037', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0278', N'HV0038', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0279', N'HV0039', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0280', N'HV0040', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0281', N'HV0041', N'A018', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0282', N'HV0042', N'A018', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0283', N'HV0043', N'A018', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0284', N'HV0044', N'A018', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0285', N'HV0045', N'A018', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0286', N'HV0031', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0287', N'HV0032', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0288', N'HV0033', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0289', N'HV0034', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0290', N'HV0035', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0291', N'HV0036', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0292', N'HV0037', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0293', N'HV0038', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0294', N'HV0039', N'A019', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0295', N'HV0040', N'A019', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0296', N'HV0041', N'A019', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0297', N'HV0042', N'A019', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0298', N'HV0043', N'A019', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0299', N'HV0044', N'A019', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0300', N'HV0045', N'A019', 9)
GO
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0301', N'HV0031', N'A020', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0302', N'HV0032', N'A020', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0303', N'HV0033', N'A020', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0304', N'HV0034', N'A020', 4)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0305', N'HV0035', N'A020', 4)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0306', N'HV0036', N'A020', 4)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0307', N'HV0037', N'A020', 4)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0308', N'HV0038', N'A020', 4)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0309', N'HV0039', N'A020', 4)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0310', N'HV0040', N'A020', 4)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0311', N'HV0041', N'A020', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0312', N'HV0042', N'A020', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0313', N'HV0043', N'A020', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0314', N'HV0044', N'A020', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0315', N'HV0045', N'A020', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0316', N'HV0031', N'A021', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0317', N'HV0032', N'A021', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0318', N'HV0033', N'A021', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0319', N'HV0034', N'A021', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0320', N'HV0035', N'A021', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0321', N'HV0036', N'A021', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0322', N'HV0037', N'A021', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0323', N'HV0038', N'A021', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0324', N'HV0039', N'A021', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0325', N'HV0040', N'A021', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0326', N'HV0041', N'A021', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0327', N'HV0042', N'A021', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0328', N'HV0043', N'A021', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0329', N'HV0044', N'A021', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0330', N'HV0045', N'A021', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0331', N'HV0046', N'A022', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0332', N'HV0047', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0333', N'HV0048', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0334', N'HV0049', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0335', N'HV0050', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0336', N'HV0051', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0337', N'HV0052', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0338', N'HV0053', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0339', N'HV0054', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0340', N'HV0055', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0341', N'HV0056', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0342', N'HV0057', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0343', N'HV0058', N'A022', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0344', N'HV0059', N'A022', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0345', N'HV0060', N'A022', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0346', N'HV0046', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0347', N'HV0047', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0348', N'HV0048', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0349', N'HV0049', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0350', N'HV0050', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0351', N'HV0051', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0352', N'HV0052', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0353', N'HV0053', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0354', N'HV0054', N'A023', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0355', N'HV0055', N'A023', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0356', N'HV0056', N'A023', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0357', N'HV0057', N'A023', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0358', N'HV0058', N'A023', 0)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0359', N'HV0059', N'A023', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0360', N'HV0060', N'A023', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0361', N'HV0046', N'A024', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0362', N'HV0047', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0363', N'HV0048', N'A024', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0364', N'HV0049', N'A024', 5)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0365', N'HV0050', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0366', N'HV0051', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0367', N'HV0052', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0368', N'HV0053', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0369', N'HV0054', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0370', N'HV0055', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0371', N'HV0056', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0372', N'HV0057', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0373', N'HV0058', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0374', N'HV0059', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0375', N'HV0060', N'A024', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0376', N'HV0046', N'A025', 9)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0377', N'HV0047', N'A025', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0378', N'HV0048', N'A025', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0379', N'HV0049', N'A025', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0380', N'HV0050', N'A025', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0381', N'HV0051', N'A025', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0382', N'HV0052', N'A025', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0383', N'HV0053', N'A025', 8)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0384', N'HV0054', N'A025', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0385', N'HV0055', N'A025', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0386', N'HV0056', N'A025', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0387', N'HV0057', N'A025', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0388', N'HV0058', N'A025', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0389', N'HV0059', N'A025', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0390', N'HV0060', N'A025', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0391', N'HV0046', N'A026', 7)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0392', N'HV0047', N'A026', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0393', N'HV0048', N'A026', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0394', N'HV0049', N'A026', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0395', N'HV0050', N'A026', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0396', N'HV0051', N'A026', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0397', N'HV0052', N'A026', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0398', N'HV0053', N'A026', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0399', N'HV0054', N'A026', 6)
INSERT [dbo].[Mark] ([MarkID], [StudentID], [AssigmentID], [Scores]) VALUES (N'D0400', N'HV0055', N'A026', 6)
GO
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N01', N'Thông báo khai giảng', N'Ngày 5/8/2021. Khai giảng lớp lập trình ASP.NET và lớp lập trình Winform')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N02', N'Thông báo khai giảng', N'Ngày 12/8/2021. Khai giảng lớp lập trình Fullstack Java Web Developer')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N03', N'Thông báo nghỉ lễ ', N'Từ ngày 1/9-3/9/2021. Tất cả học viên & giảng viên toàn trung tâm được nghỉ lễ Quốc Khánh')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N04', N'Thông báo khai giảng', N'Ngày 15/9/2021. Khai giảng lớp lập trình Fullstack .NET Web Developer')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N05', N'Thông báo khai giảng', N'Ngày 1/10/2021. Khai giảng lớp lập trình ASP.NET (2 lớp)')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N06', N'Thông báo nghỉ học', N'Do tình hình dịch bệnh diễn biến phức tạp nên tạm thời các lớp sẽ nghỉ học từ ngày 12/10-26/10. Mọi người chú ý thông báo để cập nhật các thông báo tiếp theo')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N07', N'Thông báo thay đổi lịch học', N'Lớp lập trình ASP.NET(C01) của thầy Lê Thanh Hải sẽ thay đổi lịch học sang chiều các thứ 2-4-6 từ ngày 1/11/2021')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N08', N'Thông báo khai giảng', N'Ngày 18/11/2021. Khai giảng lớp lập trình Fullstack .NET Web Developer(3 lớp)')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N09', N'Thông báo khai giảng', N'Ngày 25/11/2021. Khai giảng lớp lập trình Fullstack Java Web Developer(3 lớp)')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N10', N'Thông báo khai giảng', N'Ngày 1/12/2021. Khai giảng lớp lập trình Mobile Fulluter(2 lớp)')
INSERT [dbo].[Notification] ([NotificationID], [NotificationName], [NotificationContent]) VALUES (N'N11', N'Thông báo học online', N'Từ ngày 5/12/2021. Toàn bộ các lớp sẽ chuyển sang học tập bằng hình thức online qua Zoom')
GO
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0001', N'011234', N'Đào Đình Dương', CAST(N'2000-03-12' AS Date), N'Hà Nội', N'0974938427', N'nguyminhthang.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0002', N'021234', N'Hà Ngọc Ánh', CAST(N'2000-04-06' AS Date), N'Hà Nội', N'0365829294', N'hangocanh.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0003', N'031234', N'	Lê Thị Ngọc Ánh', CAST(N'2000-05-12' AS Date), N'Thái Bình', N'0352938248', N'lethingocanh.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0004', N'041234', N'Nguyễn Tuấn Anh', CAST(N'2000-12-25' AS Date), N'Hà Nội', N'0863823992', N'nguyentuananh.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0005', N'051234', N'Nguyễn Việt Anh', CAST(N'2000-10-22' AS Date), N'Thái Bình', N'0357924920', N'nguyenvietanh.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0006', N'061234', N'Nguyễn Mạnh Cường', CAST(N'2000-08-07' AS Date), N'Phú Thọ', N'0962399452', N'nguyenmanhcuong.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0007', N'071234', N'Nguyễn Văn Cường', CAST(N'2000-10-07' AS Date), N'Hà Nội', N'0866323889', N'nguyenvancuong.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0008', N'081234', N'Nguyễn Thành Đạt', CAST(N'2000-02-01' AS Date), N'Nam Định', N'0911392382', N'nguyenthanhdat.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0009', N'091234', N'Trần Quang Đạt', CAST(N'2000-02-23' AS Date), N'Hải Dương', N'0392742932', N'tranquangdat.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0010', N'101234', N'Tạ Văn Đạt', CAST(N'2000-04-26' AS Date), N'Ninh Bình', N'0331302929', N'tavandat.jpg', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0011', N'111234', N'	Đặng Phương Đông', CAST(N'2000-03-20' AS Date), N'Hà Nội', N'0983132004', N'', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0012', N'121234', N'Phạm Thanh Đức', CAST(N'2000-12-30' AS Date), N'Thái Bình', N'0336924292', N'', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0013', N'131234', N'Nguyễn Tiến Dũng', CAST(N'2000-10-03' AS Date), N'Hà Nội', N'0387429911', N'', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0014', N'141234', N'Phạm Việt Dũng', CAST(N'2000-10-25' AS Date), N'Ninh Bình', N'0938240292', N'', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0015', N'151234', N'Vũ Việt Dũng', CAST(N'2000-12-27' AS Date), N'Hà Nội', N'0967382913', N'', N'C01')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0016', N'161234', N'Đào Đình Dương', CAST(N'2000-08-04' AS Date), N'Hải Dương', N'090842903', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0017', N'171234', N'Nguyễn Thái Sơn', CAST(N'2000-01-05' AS Date), N'Nam Định', N'0987318833', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0018', N'031234', N'Hà Thái Dương', CAST(N'2000-05-11' AS Date), N'Thái Bình', N'0252938248', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0019', N'041234', N'Đào Văn Hải', CAST(N'2000-12-23' AS Date), N'Hà Nội', N'0863323992', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0020', N'051234', N'Dương Đình Quang', CAST(N'2000-10-24' AS Date), N'Thái Bình', N'0457924920', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0021', N'061234', N'Nguyễn Thái Vũ', CAST(N'2000-08-05' AS Date), N'Phú Thọ', N'0965399452', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0022', N'071234', N'Nguyễn Cường Văn', CAST(N'2000-10-06' AS Date), N'Hà Nội', N'0866323889', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0023', N'081234', N'Nguyễn Đạt Thành', CAST(N'2000-02-07' AS Date), N'Nam Định', N'0711392382', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0024', N'091234', N'Trần Đạt Quang', CAST(N'2000-02-28' AS Date), N'Hải Dương', N'0382742932', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0025', N'101234', N'Tạ Đạt Văn', CAST(N'2000-04-29' AS Date), N'Ninh Bình', N'0331309929', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0026', N'111234', N'Đặng Đông Phương', CAST(N'2000-03-10' AS Date), N'Hà Nội', N'0981132004', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0027', N'121234', N'Phạm Đức Thanh', CAST(N'2000-12-11' AS Date), N'Thái Bình', N'0316924292', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0028', N'131234', N'Nguyễn Dũng Tiến', CAST(N'2000-10-12' AS Date), N'Hà Nội', N'0382429911', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0029', N'141234', N'Phạm Dũng Việt', CAST(N'2000-10-13' AS Date), N'Ninh Bình', N'0958240292', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0030', N'151234', N'Vũ Dũng Việt', CAST(N'2000-12-14' AS Date), N'Hà Nội', N'0967382413', N'', N'C02')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0031', N'161234', N'Trương Đào Ngọc Tân', CAST(N'2000-01-04' AS Date), N'Hải Dương', N'010842903', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0032', N'021234', N'Trương Đào Tân Ngọc', CAST(N'2000-02-01' AS Date), N'Hà Nội', N'0265129294', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0033', N'031234', N'Trương Ngọc Đào Tân', CAST(N'2000-03-11' AS Date), N'Thái Bình', N'0352938248', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0034', N'041234', N'Trương Ngọc Tân Đào', CAST(N'2000-04-23' AS Date), N'Hà Nội', N'0463323992', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0035', N'051234', N'Trương Tân Ngọc Đào', CAST(N'2000-05-24' AS Date), N'Thái Bình', N'0557924920', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0036', N'061234', N'Trương Tân Đào Ngọc', CAST(N'2000-06-05' AS Date), N'Phú Thọ', N'0665399452', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0037', N'071234', N'Trần Văn Tâm', CAST(N'2000-07-06' AS Date), N'Hà Nội', N'0766323889', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0038', N'081234', N'Trương Ngọc Tân', CAST(N'2000-08-07' AS Date), N'Nam Định', N'0811392382', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0039', N'091234', N'Nguyễn Huy Hoàng', CAST(N'2000-09-28' AS Date), N'Hải Dương', N'0982742932', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0040', N'101234', N'Nguyễn Thành Nam', CAST(N'2000-10-29' AS Date), N'Ninh Bình', N'0131309929', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0041', N'111234', N'Lê Tuấn Thành', CAST(N'2000-11-10' AS Date), N'Hà Nội', N'0281132004', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0042', N'121234', N'Nguyễn Văn Phong', CAST(N'2000-12-11' AS Date), N'Thái Bình', N'0316924292', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0043', N'131234', N'Nguyễn Duy Phong', CAST(N'2000-01-12' AS Date), N'Hà Nội', N'0482429911', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0044', N'141234', N'Nguyễn Thị Oanh', CAST(N'2000-02-13' AS Date), N'Ninh Bình', N'0558240292', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0045', N'151234', N'Ngụy Thế Thanh', CAST(N'2000-02-14' AS Date), N'Hà Nội', N'0667382413', N'', N'C03')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0046', N'161234', N'Lê Thị Ngát', CAST(N'2000-08-10' AS Date), N'Hải Dương', N'090842913', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0047', N'021234', N'Trần Thị Hậu', CAST(N'2000-04-11' AS Date), N'Hà Nội', N'0365129224', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0048', N'031234', N'Thái Thị Hải Yến', CAST(N'2000-05-12' AS Date), N'Thái Bình', N'0252938238', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0049', N'041234', N'Trần Hữu Chung', CAST(N'2000-12-13' AS Date), N'Hà Nội', N'0863323942', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0050', N'051234', N'Lê Ngọc Khúc', CAST(N'2000-10-14' AS Date), N'Thái Bình', N'0457924950', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0051', N'061234', N'Trần Thị Lan Anh', CAST(N'2000-08-15' AS Date), N'Phú Thọ', N'0965399462', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0052', N'071234', N'Trần Lan Anh', CAST(N'2000-10-16' AS Date), N'Hà Nội', N'0866323879', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0053', N'081234', N'Đỗ Thị Huyền', CAST(N'2000-02-17' AS Date), N'Nam Định', N'0711392382', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0054', N'091234', N'Đặng Huy Hoàng', CAST(N'2000-02-18' AS Date), N'Hải Dương', N'0382742992', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0055', N'101234', N'Đặng Khúc Bảo', CAST(N'2000-04-19' AS Date), N'Ninh Bình', N'0331309919', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0056', N'111234', N'Đặng Khúc Quân', CAST(N'2000-03-20' AS Date), N'Hà Nội', N'0981132024', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0057', N'121234', N'Trần Anh Thư', CAST(N'2000-12-21' AS Date), N'Thái Bình', N'0316924232', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0058', N'131234', N'Nguyễn Minh Hòa', CAST(N'2000-10-22' AS Date), N'Hà Nội', N'0382429941', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0059', N'141234', N'Nguyễn Thị Hòa', CAST(N'2000-10-23' AS Date), N'Ninh Bình', N'0958240252', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0060', N'151234', N'Nguyễn Xuân Trường', CAST(N'2000-12-24' AS Date), N'Hà Nội', N'0967382463', N'', N'C04')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0061', N'161234', N'Ngát Thị Lê', CAST(N'2000-12-10' AS Date), N'Hải Dương', N'090842913', N'', N'C05')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0062', N'021234', N'Hậu Thị Trần', CAST(N'2000-11-11' AS Date), N'Hà Nội', N'0315129224', N'', N'C05')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0063', N'031234', N'Yến Hải Thị Thái', CAST(N'2000-10-12' AS Date), N'Thái Bình', N'0222938238', N'', N'C05')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0064', N'041234', N'Chung Hữu Trần', CAST(N'2000-09-13' AS Date), N'Hà Nội', N'0833323942', N'', N'C05')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0065', N'051234', N'Khúc Ngọc Lê', CAST(N'2000-08-14' AS Date), N'Thái Bình', N'0447924950', N'', N'C05')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0066', N'061234', N'Anh Lan Thị Trần', CAST(N'2000-07-15' AS Date), N'Phú Thọ', N'0955399462', N'', N'C06')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0067', N'071234', N'Anh Lan Trần', CAST(N'2000-06-16' AS Date), N'Hà Nội', N'0866323879', N'', N'C06')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0068', N'081234', N'Huyền Thị Đỗ', CAST(N'2000-05-17' AS Date), N'Nam Định', N'0771392382', N'', N'C06')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0069', N'091234', N'Hoàng Huy Đặng', CAST(N'2000-04-18' AS Date), N'Hải Dương', N'0382742992', N'', N'C06')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0070', N'101234', N'Bảo Khúc Đặng', CAST(N'2000-03-19' AS Date), N'Ninh Bình', N'0391309919', N'', N'C06')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0071', N'111234', N'Quân Khúc Đặng', CAST(N'2000-02-20' AS Date), N'Hà Nội', N'0901132024', N'', N'C07')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0072', N'121234', N'Thư Anh Trần', CAST(N'2000-01-21' AS Date), N'Thái Bình', N'0316924232', N'', N'C07')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0073', N'131234', N'Hòa Minh Nguyễn', CAST(N'2000-12-22' AS Date), N'Hà Nội', N'0322429941', N'', N'C07')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0074', N'141234', N'Hòa Thị Nguyễn', CAST(N'2000-11-23' AS Date), N'Ninh Bình', N'0938240252', N'', N'C07')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0075', N'151234', N'Trường Xuân Nguyễn', CAST(N'2000-10-24' AS Date), N'Hà Nội', N'0947382463', N'', N'C07')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0076', N'161234', N'Hà Thị Phương Anh', CAST(N'2000-08-10' AS Date), N'Hải Dương', N'090842913', N'', N'C08')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0077', N'021234', N'Nguyễn Thị Ánh', CAST(N'2000-01-11' AS Date), N'Hà Nội', N'0365129224', N'', N'C08')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0078', N'031234', N'Hà Ngọc Bích', CAST(N'2000-02-12' AS Date), N'Thái Bình', N'0252938238', N'', N'C08')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0079', N'041234', N'Nguyễn Tiến Bộ', CAST(N'2000-03-13' AS Date), N'Hà Nội', N'0863323942', N'', N'C08')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0080', N'051234', N'Phùng Văn Đảm', CAST(N'2000-04-14' AS Date), N'Thái Bình', N'0457924950', N'', N'C08')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0081', N'061234', N'Nguyễn Thị Diệp', CAST(N'2000-05-15' AS Date), N'Phú Thọ', N'0965399462', N'', N'C09')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0082', N'071234', N'Đằng Thị Thùy Dung', CAST(N'2000-06-16' AS Date), N'Hà Nội', N'0866323879', N'', N'C09')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0083', N'081234', N'Đỗ Thị Dung', CAST(N'2000-07-17' AS Date), N'Nam Định', N'0711392382', N'', N'C09')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0084', N'091234', N'Đặng Thùy Dung', CAST(N'2000-08-18' AS Date), N'Hải Dương', N'0382742992', N'', N'C09')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0085', N'101234', N'Nguyễn Thị Dung', CAST(N'2000-09-19' AS Date), N'Ninh Bình', N'0331309919', N'', N'C09')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0086', N'111234', N'Nguyễn Ngọc Dũng', CAST(N'2000-10-20' AS Date), N'Hà Nội', N'0981132024', N'', N'C10')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0087', N'121234', N'Lê Trung Hà', CAST(N'2000-11-21' AS Date), N'Thái Bình', N'0316924232', N'', N'C10')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0088', N'131234', N'Vũ Thái Hà', CAST(N'2000-12-22' AS Date), N'Hà Nội', N'0382429941', N'', N'C10')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0089', N'141234', N'Vũ Hà Thái', CAST(N'2000-10-01' AS Date), N'Ninh Bình', N'0958240252', N'', N'C10')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0090', N'151234', N'Nguyễn Trường Xuân', CAST(N'2000-12-02' AS Date), N'Hà Nội', N'0967382463', N'', N'C10')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0091', N'161234', N'Nguyễn Thị Thanh Hằng', CAST(N'2000-08-03' AS Date), N'Hải Dương', N'090842913', N'', N'C11')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0092', N'021234', N'Nguyễn Thanh Hằng', CAST(N'2000-04-04' AS Date), N'Hà Nội', N'0365129224', N'', N'C11')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0093', N'031234', N'Nguyễn Hằng Thanh', CAST(N'2000-05-05' AS Date), N'Thái Bình', N'0252938238', N'', N'C11')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0094', N'041234', N'Nguyễn Thị Hồng Hạnh', CAST(N'2000-12-06' AS Date), N'Hà Nội', N'0863323942', N'', N'C11')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0095', N'051234', N'Phùng Hạnh Hồng', CAST(N'2000-10-07' AS Date), N'Thái Bình', N'0457924950', N'', N'C11')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0096', N'061234', N'Nguyễn Hạnh Hồng', CAST(N'2000-08-08' AS Date), N'Phú Thọ', N'0965399462', N'', N'C12')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0097', N'071234', N'Hoàng Thu Hiền', CAST(N'2000-10-09' AS Date), N'Hà Nội', N'0866323879', N'', N'C12')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0098', N'081234', N'Hoàng Thu Hằng', CAST(N'2000-02-10' AS Date), N'Nam Định', N'0711392382', N'', N'C12')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0099', N'091234', N'Trịnh Thị Hiền', CAST(N'2000-02-11' AS Date), N'Hải Dương', N'0382742992', N'', N'C12')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0100', N'101234', N'Đỗ Thị Hoa', CAST(N'2000-04-12' AS Date), N'Ninh Bình', N'0331309919', N'', N'C12')
GO
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0101', N'111234', N'Đỗ Hoa Thị', CAST(N'2000-03-13' AS Date), N'Hà Nội', N'0981132024', N'', N'C13')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0102', N'121234', N'Nguyễn Văn Hợp', CAST(N'2000-12-14' AS Date), N'Thái Bình', N'0316924232', N'', N'C13')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0103', N'131234', N'Nguyễn Thị Hợp', CAST(N'2000-10-15' AS Date), N'Hà Nội', N'0382429941', N'', N'C13')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0104', N'141234', N'Trần Thị Huệ', CAST(N'2000-10-16' AS Date), N'Ninh Bình', N'0958240252', N'', N'C13')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0105', N'151234', N'Nguyễn Dương Huệ', CAST(N'2000-12-17' AS Date), N'Hà Nội', N'0967382463', N'', N'C13')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0106', N'101234', N'Nguyễn Thị Hương', CAST(N'2000-04-18' AS Date), N'Ninh Bình', N'0331309919', N'', N'C14')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0107', N'111234', N'Nguyễn Tiến Huy', CAST(N'2000-03-19' AS Date), N'Hà Nội', N'0981132024', N'', N'C14')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0108', N'121234', N'Lê Thị Huyên', CAST(N'2000-12-20' AS Date), N'Thái Bình', N'0316924232', N'', N'C14')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0109', N'131234', N'Bùi Thị Linh', CAST(N'2000-10-21' AS Date), N'Hà Nội', N'0382429941', N'', N'C14')
INSERT [dbo].[Student] ([StudentID], [Passcode], [StudentName], [DateOfBirth], [Address], [Phone], [Picture], [ClassID]) VALUES (N'HV0110', N'141234', N'Trần Tạ Linh', CAST(N'2000-10-22' AS Date), N'Ninh Bình', N'0958240252', N'', N'C14')
GO
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M01', N'Lập trình C')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M02', N'Cấu trúc dữ liệu và giải thuật')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M03', N'Lập trình C#')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M04', N'Lập trình Java')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M05', N'Hệ quản trị CSDL SQL Server')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M06', N'Hệ quản trị CSDL MySQL')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M07', N'Entity Framework ')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M08', N'Spring Boot')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M09', N'HTML/CSS')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M10', N'JavaScript')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M11', N'Bootstrap')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M12', N'Vuejs Framework')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M13', N'Reactjs Framework')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M14', N'Winform cơ bản')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M15', N'Winfrom nâng cao')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M16', N'ASP.NET MVC')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (N'M17', N'Lập trình Flutter')
GO
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T01', N'Lục Đức Thuận', CAST(N'1989-02-12' AS Date), N'Hà Nội', N'0986357843', N'lucducthuan.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T02', N'Nguyễn Thị Lan', CAST(N'1994-05-25' AS Date), N'Hà Nội', N'0961385989', N'nguyenthilan.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T03', N'Lê Hoàng Phong', CAST(N'1993-06-12' AS Date), N'Hải Phòng', N'0352958239', N'lehoangphong.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T04', N'Đào Đình Dương', CAST(N'1995-03-20' AS Date), N'Cao Bằng', N'0983294892', N'daodinhduong.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T05', N'Nguyễn Văn Thức', CAST(N'1994-02-22' AS Date), N'Hòa Bình', N'0961328903', N'nguyenvanthuc.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T06', N'Nguyễn Phú Mạnh', CAST(N'1990-07-27' AS Date), N'Bắc Ninh', N'0984193842', N'nguyenphumanh.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T07', N'Lê Thanh Hải', CAST(N'1996-10-10' AS Date), N'Hà Nam', N'0971394893', N'lethanhhai.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T08', N'Hoàng Văn Khải', CAST(N'1993-10-20' AS Date), N'Hà Nội', N'0352309492', N'hoangvankhai.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T09', N'Lê Thị Huyền', CAST(N'1994-11-21' AS Date), N'Hà Nội', N'0983178237', N'lethihuyen.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T10', N'Nguyễn Mạnh Kha', CAST(N'1992-12-02' AS Date), N'Hải Phòng', N'0961382978', N'nguyenmanhkha.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T11', N'Lê Đình Công', CAST(N'1994-10-19' AS Date), N'Hưng Yên', N'0352948202', N'ledinhcong.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T12', N'Nguyễn Đình Chiểu', CAST(N'1995-03-30' AS Date), N'Hà Nội', N'0981394891', N'nguyendinhchieu.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T13', N'Hoàng Nguyên Hà', CAST(N'1999-01-20' AS Date), N'Hà Nam', N'0983713874', N'hoangnguyenha.jpg')
INSERT [dbo].[Teacher] ([TeacherID], [TeacherName], [DateOfBirth], [Addres], [Phone], [Picture]) VALUES (N'T14', N'Nguyễn Thu Anh', CAST(N'2000-10-11' AS Date), N'Hà Nội', N'0983198491', N'nguyenthuanh.jpg')
GO
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB01', N'C01', N'Thứ 2-4-6 ( 9h-12h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB02', N'C02', N'Thứ 2-4-6 ( 14h-17h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB03', N'C03', N'Thứ 3-5-7 ( 9h-12h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB04', N'C04', N'Thứ 3-5-7 ( 14h-17h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB05', N'C05', N'Thứ 2-4-6 ( 18h-21h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB06', N'C06', N'Thứ 3-5-7 ( 18h-21h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB07', N'C07', N'Thứ 2-3-5 ( 9h-12h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB08', N'C07', N'Thứ 2-3-5 ( 14-17h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB09', N'C09', N'Thứ 2-4-7 ( 9h-12h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB10', N'C10', N'Thứ 2-4-7 ( 14h-17h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB11', N'C11', N'Thứ 3-5-6 ( 9h-12h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB12', N'C12', N'Thứ 3-5-6 ( 14h-17h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB13', N'C13', N'Thứ 3-4-6 ( 18h-21h)')
INSERT [dbo].[TimeTable] ([TimeTableID], [ClassID], [Schedule]) VALUES (N'TKB14', N'C14', N'Thứ 2-4-5 ( 18h-21h)')
GO
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U01', N'Admin', N'123', N'Lê Quang Trung', N'Quản lý')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U02', N'Teacher01', N'123456', N'Lục Đức Thuận', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U03', N'Teacher02', N'123456', N'Nguyễn Thị Lan', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U04', N'Teacher03', N'123456', N'Lê Hoàng Phong', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U05', N'Teacher04', N'123456', N'Đào Đình Dương', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U06', N'Teacher05', N'123456', N'Nguyễn Văn Thức', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U07', N'Teacher06', N'123456', N'Nguyễn Phú Mạnh', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U08', N'Teacher07', N'123456', N'Lê Thanh Hải', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U09', N'Teacher08', N'123456', N'Hoàng Văn Khải', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U10', N'Teacher09', N'123456', N'Lê Thị Huyền', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U11', N'Teacher10', N'123456', N'Nguyễn Mạnh Kha', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U12', N'Teacher11', N'123456', N'Lê Đình Công', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U13', N'Teacher12', N'123456', N'Nguyễn Đình Chiểu', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U14', N'Teacher13', N'123456', N'Hoàng Nguyên Hà', N'Giảng viên')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Name], [Position]) VALUES (N'U15', N'Teacher14', N'123456', N'Nguyễn Thu Anh', N'Giảng viên')
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_Assignment_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_Assignment_Class]
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_Assignment_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_Assignment_Subject]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Teacher]
GO
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Assignment] FOREIGN KEY([AssigmentID])
REFERENCES [dbo].[Assignment] ([AssignmentID])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [FK_Mark_Assignment]
GO
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [FK_Mark_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Class]
GO
