USE [master]
GO
/****** Object:  Database [DB_HealInsurance]    Script Date: 23/10/2020 4:42:39 PM ******/
CREATE DATABASE [DB_HealInsurance]

GO

USE [DB_HealInsurance]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[UserName] [nvarchar](128) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Admins] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[Phone] [nvarchar](20) NULL,
	[Url] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [nvarchar](max) NULL,
	[JoinDate] [datetime] NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[User] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitals]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitals](
	[HospitalId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Hospitals] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policies]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PolicyName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[EMI] [decimal](18, 2) NOT NULL,
	[CompanyId] [int] NULL,
	[HospitalId] [int] NULL,
 CONSTRAINT [PK_dbo.Policies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PoliciesOnEmployees]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PoliciesOnEmployees](
	[EmployeeId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[PolicyStartDate] [datetime] NOT NULL,
	[PolicyEndDate] [datetime] NOT NULL,
	[PolicyDuration] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.PoliciesOnEmployees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC,
	[PolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyApprovals]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyApprovals](
	[RequestId] [int] NOT NULL,
	[ApprovalDate] [datetime] NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_dbo.PolicyApprovals] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyRequests]    Script Date: 23/10/2020 4:42:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyRequests](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[PolicyId] [int] NOT NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PolicyRequests] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202010110632546_AutomaticMigration', N'HealthInsuranceService.Data.HealthInsuranceDB', 0x1F8B0800000000000400E55DCD6EE4B811BE07C83B087D4A8259B7ED45808DD1DE85D79EC97A331E1BEE99456E062DD16D21FAE995D48E1B419E2C873C525E21D42FFF2992A2D4F22CE6D216C92259AC2A168BAC6FFEF79FFFAE7E788D23EF0566799826E78B93A3E38507133F0DC26473BED8154FDF7CB7F8E1FBDFFF6EF53E885FBD5FDA7ADF96F550CB243F5F3C17C5F66CB9CCFD671883FC280EFD2CCDD3A7E2C84FE32508D2E5E9F1F15F9627274B88482C102DCF5BDDEF92228C61F507FAF3324D7CB82D7620BA490318E5CD7754B2AEA87A9F400CF32DF0E1F9E22708A2E2F93AC9771940ADD6307B097D7874050AB0F02EA210A021AD61F4B4F04092A40528D080CFBEE4705D6469B2596FD107107DDE6F21AAF704A21C361339C3D575E7747C5ACE69891BB6A4FC5D5EA4B121C1936F1B262DD9E656AC5E744C446C7C8FD85DECCB5957AC3C5F5C047188E8B23D9D5D4659594BC9E6A3AAF13B4F5CE55D27254898CA7FEFBCCB5D54EC32789EC05D9181E89D77B77B8C42FF6F70FF39FD074CCE935D1491C345034665D407F4E92E4BB7302BF6F7F0A999045AD5ACFCB5F09674EB25DBBC6BCCB5AC678B840309FCC2BB01AF1F61B2299E912A9C7EB7F03E84AF3068BF34D2F22509917EA04645B6437F7E4283078F11ECCA97CA9EEF409EFF33CD0245CFE8A756CFEA8EDEC7208C1CF7B25A6241528AD7651A6F41B2B715B0A6F90C44AC19C975602E6344D37AC6D749F1EDA9406008EEAC8B34837F8509CC4001833B50143043D6E33A801587FBD6BCE9B247B2FF7C3C86605F044106F35CA5519A1DF728D0739AA86677EAA2932F994A75ECE6F109BC849B6A99394DDD46E91E42C4BB7B185535F2E7705B6F63AD2E3C10B53E64697C9F4678C171E1C33ADD657EC99F5456E333C836B0B054EC968CAD66B7ED67A0DA363A3DA5325FC13CDC248D0330F266F1731A26687D3ABD2A7F7F0E63732BB00611C8F61D19E8873140AA7497A15F8D8B89B6D5B50F4A8A22FEA9C97F08B3BCE8316F6E38F2114CD451E98A8CDEC9645E479F759EAF6F23DA4DD129050BF378FD54C660E44ED6C828ED54BBF3A8FEE04F69BE0D8BD212D86D1B6DFB196C1BED506CB60FB2ED54DBC824466C1AB5FF98FAD36C876AF7CFB20FA9FF779722B90C25EE5F55B87FC00A849D3FA6A873EC5AD78F2D6F5D432B0DAE89D9EA6FDD7A06DA3B77A7AF66D4243A8BFC4B3F0BB79328D4455CEEA5A3B985EF6FAE47A32D3BC6AB5B492DBDAE51E82228729BD055E14C427BE8630F834CB1E824A81A133642C30C9564589C21B33754C89ADE2643CFAA3CA51918B07628BC211356AF596B63F5C88ED4D64FC7A2B9A1829CD8AC70724EADE9BD4F0287D4AE904C90D674B829EA0D19C9359192DB075C9FD14A7135B1864AEA9A5A91D693D01B795B5B39EEC680688CBAA939DCC2EC2FB6DB2C7DB13FD2D054666059EEE1AF3B981736B682683A44C95B6638D1C97B08F2093C9B51CED5FDEAD3705CB113B7CC7C601AB0DBB2B89E648F965476A04EDDF886685343E437A24CEE4E1D4D974EF46E5E7EC3E4EAD9BF33775A23DD94B91A126DE4AAB9DE8ABB1E24BB3053DE334C8BBDF722CF533FACC6469F8B88EB307AAEC8A5F37AEFC66A61206ED790482043106E4B7FA1D89F2F8E8F8E4E3836AA4877B1174C1A2F2F4DFB4FECD48949AAE7CE9CFB64A3931D02F1D0DAE5540E4C4553305D134E223B09B3D23481E812491DB2BC6152F046354CFC700B22E51098566697F825F7BB6ED8922BB885496940956C1DDC7FD70DB34DF4F1C85C6EBAA379CF22F3E7740792C3472931511C33185976D841E82C9E3CDE6F233D2C6F878F602AF9911C2895CBDE77BA64E48A89DA18CA58CFF154C3329FB0CBB1BA4DAE60040BE85DF8F53BBE4B90FB2010BC3843837125A7EA89E8488C0B5955AF9DCE2894A1AA03C96D63BF0C0489756D469459C641EA35BBB394577A128791567ACD74C6208B934EBA43730703F59E2A3F25B082D31DAE4DB76DE909E3ED5853E91CA6124DE93ABD1D1BCA9E03F584A6C7720E97CA376A2F25E39F5C1EDFA895940436D522D317E564450747F78D02035A51525D45707AF6518F4967F1A5214D0B11542FC7E0D13897C53A3A85DA14A805CCDA83191D65BEFA5110BDFE92C326809D37A14456764ACA6B58908939F9C2C3F1B046549A8C1D4EF4E8E675A8A17A4CC451E822343D348897E61C0DBCD9F710690FAD2222F8BCDF4304BF8CE268B4165E9302760EA5C4184F5E877027C7F2116243A245B0116B39BDCE5630E408C165A581CA1D20EA49130C587DD289A976D3A16490534D9D182A418A1838BB21D313D66006FB6A86E7842ABEAA136125068E2557C1024950558795F6F3C7CA2765803850A8152AB46401171D24E81096C40D0F644F2324FCD0097C1987BE047CA24C541FCB7A825D63AA90F87D8616F344C707C3F88B5BC63127080DE9B5563CFED64FA67FEA30804920809D0FB1BDF4EAA4F4E83FAA79662F1CFB78A42751B223A90BFE4C2842B2271D3226E99C94CCCF4A1CD30827A8976B3D4723ED0551F0B0BD4BEEBCF5AE6CB5ACE1049A0FABA50477607503B6DB30D9103804CD176F5D83105C7EB3364FCA8F6B1A4B9FF2B0D8B345D7539166600399D2D2250860950657BE7B7904E55385CB20E6AAF1671389FBD9F6471D3FF8656C9DD1B67AF95B780AE2910204E7B986CA0734C3B83C1B56EF5788C597B4F34A408832C3509ACE7F9946BB3851C303A828E144399212FEAA4FA9C95123C9349F781AAB25C310EE44CB2D00179EA297536BB1B177E96ABD25AEB3C68A4B5BCAF84B5CAA933C56DCB5F7D2E245882AD0A7D7E5C293B4BA8F06D258A75551A2587FD2A751E532516A91CD490655A74E3B1994B94D1A42286F2AE32E2B7E667247A5789364A8027D7A388D9B2486BFEA536AF3B8493AED377D2A44BA364988F8AC4F0B276493A4F057038DA832AED99DE230BB840B0D37D969E416B0C975A6AD5FF3D1804EF5DA942222787FAA94BCE6C5262579CDB7D9582D1C937065B56431170DAB256F2AE331F9A288E4B3EAA5919C1AAF95C65E97032DC0C9C1947DE8BE7E353B6677AC74257AE233B486E0C91A8EB359D6BDF1C2467E37DA7A71F62BB3F5E2020397AFC970A53CBEE69B81292F135929435E7E3076649D38C57646E2C04A41C6029DEA077D3B64A92B3D44E41B3C7E0442EFF2F2C721726AF8129FD7221B4A4452264F902834A5DB2567F254BB22539A384593278ACBE625D5447CCDADC5EFAE266D2DBF9C806C15885B7B72011497F9725A74B6206577A9127D8A6DCA203DB4FADB57E6C032D155B7822509346BCB95B4FD146245E5C209A8990AD55C8DF7BCC4948EE68BC294D42B06A36824D95037E2535E5C887D2BFEED03CF2C0BDFEC419924448CC666A0D2575ED66EBA724897691284D5BBBDEBBCCCD7EC722A8DE6CD5EF1F072C3DDF4B0553AA9ED6E7C989B9D5573CBD20F3BCD5DBBD4554A7087F4250CCA2B97F53E2F605C8BDEFAD7E8320A61E9FDB7156E40123E21035227162F4E8F4F4E19C0EAF980472FF33C8804B7541C8234BD6213A336272F20F39F41C6E3360F04656E09FF2106AF7F24A91983131A50320657B6E0BD4B38E3B014EEDEC4733BB4A5DE552E21788701148B8587A66B0C7D27247A6A4C93C09FD398FD005192649A4C00A5368AF408207307A9320B8B1BA0DFC57058DC607458DC41B366A16F071123E16D0711726AA3854A3BA9B517993E0A6E76182D02527610211A3F63E0FC38878F3005DCC3F9EB2480AFE78B7F55ADCFBCEBBF3F7004DE79B71972ACCEBC63EFDF8E0CA22447FE00C8B0A31848676AED4E815850D761D686DF385D7A5EC2F4B7B7BA5992F7260E582F80131D448F860C75BE651290A1CE690FB57026964DDB9468748F5B8E6059FB2E40660F7FA9CB45DC52C6452BFC2BDDEEDB760E3AE7E036ADFD5FE6DAC60935166E73A01ADBC23F5A08B14B70385DB1E81A0E920B1142A3F532D2088D8771532D510AE7B0E8AEFD010108A0F5D2FEB6ADA77369740083E700F50E672E99A3DC7996C9EBF207E506C14DCF24415DF1C643DAA5FAF2663A84B73E644077B2D0E6675940C3BD113990BE8A33EC7046F87E38F5D7167CEF7002A0781F6B1289194B04DE24469F9141770A9EA34ACA1D8CB166255F4666DF3962D91BC28232C7D3D3B1125FB974195892C3C8D62C909DB4F1EF6663B8700EB63DBAD9DB30578A477D73B55466A8750736520793A4894D93911CCDC22A59E1CD19AFA63EAADC50B4BAE1C08507838B7B33C8703C4803BBB602D43739E85BFDD6F07C113CA668F5EBE8510B14C7498D08106EAF8283135197034FB11DE06D97EB011789BA9083C7B05DE0232AD7052E127521878E62BB680D3ED7415B20222F0578115267FC4C714F4C2555AF0AD8A31EB43A0DB03A69C772B41735A25D3FA09DBC4B2908CCA4A0770260364162B3D04B153D38EF79EDAC315126E83704D0CE768AB4DA9049A1CEA6E706AF8E352174E2F441A738361C9D9118F69E9ED5298DA3B0A4070BCC06624E673DE7C18A7170E306CA046BD405B95BAEA7DF2304A6807056EB3FE1B427827A339E90F25C224F10D5678B017A1B9FBB83FCF85D525E58D77FD5CFC13B12655E52027DCA83EFEA5C274F697B966046D456616E796F600102E4DE5F6445F804FC0215FB30CFABFF60EE1710ED2A357B84C17572BB2BB6BB024D19C68F112567E58144D57F0551478F79755BBDB1CB5D4C010D332CEFF86F931F77611474E3FE20781E2321519E749A4708E55A16E56384CDBEA3F48943F190116AD8D71DD03E43648E10316453D7E005DA8CED4B0E3FC20DF0F76D0A969C48FF42D06C5F5D85609381386F68E0F6E84F24C341FCFAFDFF01819CFDC35F910000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202010110635146_AutomaticMigration', N'HealthInsuranceService.Data.HealthInsuranceDB', 0x1F8B0800000000000400E55DDD6EDCB815BE2FD07710E6AA2DB21EDB4181AD31DE85D776BADEC671E04916BD0B68891E0BD5CFACA4713D28F6C9F6A28FD457283592F84F8AA4381A398BDC8C25F22379F89DC3438AE7E47FBFFD77F1FD4B9A04CFB028E33C3B9F9D1C1DCF029885791467ABF3D9A67AFCE6DBD9F7DFFDF10F8BEB287D097EEECABDADCBA19A59793E7BAAAAF5D97C5E864F3005E5511A87455EE68FD55198A77310E5F3D3E3E3BFCD4F4EE61041CC1056102CEE375915A770F707FAF332CF42B8AE3620B9CD239894ED73F466B9430D3E8014966B10C2F3D98F1024D5D34D566E0A806A2D61F11C87F0E80A5460165C2431405D5AC2E47116802CCB2B50A10E9F7D2EE1B22AF26CB55CA30720F9B45D4354EE1124256C0772468A9B8EE9F8B41ED39C54ECA0C24D59E5A925E0C9DB564873BEBA93A8675888488CD748DCD5B61EF54E94E7B38B288D112EDFD2D96552D4A5B4623EDA557E13C88BBCC12C4164AAFFBD092E3749B529E079063755019237C1C7CD431287FF80DB4FF9BF60769E6D9284EE2EEA307AC73C408F3E16F91A16D5F61E3EB68340B35AD4BF66C19CAD3DE7ABE3CA42CD66B4881C88F0B3E016BCBC87D9AA7A42AA70FAED2C7817BFC0A87BD2B2E5731623FD4095AA6283FEFC803A0F1E1288DFCFB52D7F0465F9EFBC88342DA39F462DEB1BBA4E419C786E65312744D2D2EB324FD720DBBA12ACAD3E018AB53DB989EC3946556D467C93556F4F2584A1A4B3ACF202FE1D66B000158C3E82AA8205B21E3711DC49B86FCEDB267B98FDD7E37D10FB228A0A58963A8D326CB847819EF24C37BA531F8D7C2E74AAE3300E63CDB94ED749BE85D05575BAFA13D01D17A519535BAE6019AFB27685DDB335FE298F33343F98B8F5EF4F716AAF664B9080628B616018A70071F563817EB53E1C5AB79621A81165F2D3C3BF8B8BB2EAB11F7E24F21E8CD450BDD6EFBD91D196F53EF3375DE741B65CA16D0021F3FEDAD919833D37B2444669A35BFEF6EA70FD9897EBB8AA2D81DBB2D1D59FC0B2D175C565F9A0EB8EB58C8C62C4C651FBF77938CE72A8F7AF1CDBF8009EE3D5AEFFBCF072C4CB1822E5BC87C9AE40F914AF9B6382A3DDCBED17A240EF8A3CBDCF93AE1E79F5E5132856B0421DCFE5EF97F9A6085D35B80173D5DFA6F604B477EA4E5F23A8517416F9976111AF4751A88BB45E4BF7E6165EDFDEEC0D5BB54FD6D7525A7A53A3808F28D4360117114C42FB066B3C6711BAD79DC130ED133142C30C95A25B8221733754C89ADE6543F7AA22D2040C58D715D190498B37A275B17A74437AEB6762D1FCA02027B6A8BCEC531BBCEB2CF288768538415BD3E1A648A98984DA2A4D6478FB8594E7B4525E4CAEA18AB2B656A4F324CC7ADE95D6F6BB352006BD6E4B0EB730DB8BF5BAC89FDDB7342CCA042CCB3DFC6503CBCAC5565055872879270C2F3A790F41398267B3977D75BFFAB412D7ACC49D30BF7015F865595E4EB1462B0A7B5027DCBF21DAD482FC4E94C9DFAEA36DD28BDE4DCB6F185D3DFB5766AC35CA455928A1D046A198EFA518B7A05885B9F73DDD74587B2FCA320FE35DDF982EE3BD0F3B50E4CF05FA8D5043033240C4056401E275ED2854DBF3D95F04E12931F1710BC1C43B3216F4F8E8E844C045B60216B57A82E412491E599F38AB44C3126761BC0689B60B5C2DBB2FC5B5F07133FC9B2BB886596D44B4621DDC3E6E8633957D325ACC298218F1066F4F7B2659DCAB7A608E78524740C9BE79CFDCE13B613279EA336F17F6F0B21DDE83B1F8A3D85469A7BD6F87C5F18A3BB9B0E458CF168D6A4CD5C4093F1D8BBBEC0A26B082C145D85C16BB04650822C9B526D4195F3CD50FC484313EB8AA9F3B935E688F6B0EC4DBD67E5910895FDEF7C859CE49E835BB93E42B3B88C3B0959D33933EA8CE0A475DA105E758BFA6AA3D659E38788369BB6C2BBDECD7634D9563188B9ACA797A3D3694DF0B9991A6C7720E67E52BB5978AFE8FCEC7576A2515877B7ACAF49DF4F1D42127DC065B12C3C6943C552882D7BD8FBE4F2693AF3CD673A0A07E3A06F7C63B179B131A54A7423560D16DCCD893D6AB1F2427B89F4BD81EE296ED711ACF9D1A79092B3AFAA39C05E44CA8A54A1B1622508FADDE1C35EC2ED40808F884A607A35B73641864B1EF01E936AD3210B2DFEF0121B783048CCEC21B2210E75009C679F226C098C7EA1E12436204D8D25A8D876D0507471197C7249725A842F2EB14BC26F51E2AE251D093252864EF3922054331985F83D9319A8F9FF04D2900F9D998D1E998A3088403310A87521E3F32507D1157C8C3E4ACC7FAB4472227462BFB44D673BE43C12B41FD88AF333D46C29379CC96470E7E05C739CD06EC75563CF1638F4AFFF43B5F9BBD2F3F1ECAA2F6EAA472B7BB4F6E09DF99FA6464C628D52ECC877C46A490EA4BBE4A48269B03FBED8120346ADDEF955ACF6EC078423432EC3E21620715BF5BCC9B30EDF6C162AE88E75EDC82F53ACE56547C77FB245836C1DD97DF2CED839DD306631E96929867DC5BDC5295176005B9B7B54B10C15DF4537DDDE101D45FA82FA3542826BAE30A8FAB6B8FF1B8C569ECFCAFAE78FD5BEAF88B11D8922D4C8BF20E8D30ADB743BB6B0BD4E42BEA0575A07D1D58A60C93BECC934D9AE9C3AE7548243E8A46224FCD91DAD0241AA67D24622CE69C40844D9C3001C2890C3B9D46934DBC4B5FF3AD709D0D665C5953255FEA3B322D63CDE7E55E2C9142CC0B733C1C634C63E187166C6CA269182A368FCC3176212C8C5A1453E22071217C7150E5361990505D55255D9E7E76BC63227B6918E685391E89DEA5C1C85373A42E7C97C6E99E99A35051BA3410F5D81C8BC4E1D250E4A98546EC026DF995E230AB840F0DB75969D416B00D7165AD5FFBD0026777C99001915C3BD432AFBDA8C730AF7D3619AB45CE247C592DD5998B81D5525755C998BE4443CB5977B9468D266AA5B5D7E5410B484C28631FF0D3AF66C5C4DB4A5FD493EFA10D88A7AAB89FC5B2694D241BFDDC6AE925418FDCD24B5E58B87C6D6023E3F1B5CF2C4C791DBFC818F2FA81B523EBC52976331207560AFA2CD0AB7EB01F441C75A50744BDC0937B0FEC2AAFBE0FA14623DFAD452D7241A262F14440EAA52D2E8EC91351F12B5B4C129927829277D3623575BEE6D7E2E3AF71AE965F0DA09A05EA43353D019AEFD76A2C36488CB1BBCC1B73C42E528CED5AF3EC2B7360B9D355BFC4521C341BF34A597F0C5A31215012345B524DD5784F88A6C2893D5F04B78E4FEEB913FA457B5ADE9F9655383E6F8AD4B1D9F9731CD547E7CB6D59C1B421F4F297E4328961EDC575056E41163F2222347181B3D3E393532EA1EB7492ABCECB324A245F1B840CABEC648D9CD5347B0645F8040A31AFE9C0A4A51DF09F52F0F2671ACD3AB798059275F25107D9FB4CF719D7E4EE8D1B754B96D23BCB758ACA61093CE5E46171AD335749414FAD31A9F45106A3F7918DD3814BC33221ED853D928C97835499CF6A19A1DFD5F0AC96D1DEB35A0E1A359FB97210189D9D721090571B2D55DA51ADBDCCF431D92287615119210701B1E1EFFB58CD1401B50748A5B81793E44D91FC5196CF82384CBFC5A5CA273BA4B132AF7579A24F9C3D885E927F6F101E9B63CFFB2245E5D8F38E2D774E8538829B2C822FE7B3FFEC6A9D0537FFFC822BBE09EE0AB4493B0B8E835F6D05A7302506CD939AE6ED0F4964E7A04707CC17672A4552532545A78431A6CD77F53C342EE4A773F638B9036F2F687C7EBA816AEC9A2FCD81C43EB32999D202571CC40B594A33E76964539A4DDC31D445261E66D27DFB0392AC59CE53FBFBB69EDED9E89C370A8789396675E22FBE3B250E720A7155DFC1B538470CECC358BFAAEC4F244ACE3535D3E108A0B94A66B3F5DE17055E65062712B53576B20F5DFCDAE00C3C4EFCD2DC8231D9BEDBF3AAEFEE8DE56667C2D9964CACC457CE2E0B4B72186E4D22EF877176A4C9182E12AEE89EFBE675982BCDFD97A95A2ABB9C460736520763D2C8A6C98A4793B04A4ED988AC67D33CE7D0D05C46C3D35A1D2C99D0ABC91B24C633F3732BC909A44E09D45CE73A9F450F399AFDE6B8A04B2324B046962E68AB4B16244357E768E11B20CBAED00279256B429D67816F826C518526C82B5913EA2C2B7C139DC1171AE85EC8E095B910A4E89C9F296F892BA46B559321A4279791412A2365C3EAC408FA7C47FDE98ED44D2AF325EC3B2512A73C4C4CB7685C448F420C2B12FC82C3663CE2358B0DBD3BE810F79DD088D7443656BA77E8526D5605C5EC45243DD9645C921499CCE73444B19FCC430339C1DB3AC9ED7FDFC3EF21816D4A21A7F91F71D823250BB21E90D65D578718998BC522FF8F183580DCDB4D567FB86BFE6A2EA2628805C2CC60C838B6B8CC4DF698772E36D7A3AE08F7B5EB165620425EEF4551C58F20ACD0EB1096E5EE7FA6F919249B9D9A3DC0E826BBDB54EB4D85860CD38784E159EDA7EBDADF253962FBBCB8DBDD352A7D0C017533AEBF75DE653F6CE224C2FD7E27B926A080A83700EDC7D87A2EABFAA3EC6A8B913E0871E02AA0567C78DFF209227384C0904D5D8267E8D2B7CF257C0F5720DC76C11F6A90FE8960C5BEB88AC1AA0069D96290FAE84FC4E1287DF9EEFFB20E165EF9880000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202010191043161_AutomaticMigration', N'HealthInsuranceService.Data.HealthInsuranceDB', 0x1F8B0800000000000400E55DDD6EDCB815BE2FD07710E6AA2DB21EDB4181AD31DE85D776BADEC671E04916BD0B68891E0BD5CFACA4713D28F6C9F6A28FD457283592F84F8AA4A819398BDC8C25F22379F89DC3438AE7E47FBFFD77F1FD4B9A04CFB028E33C3B9F9D1C1DCF029885791467ABF3D9A67AFCE6DBD9F7DFFDF10F8BEB287D097EEECABDADCBA19A59793E7BAAAAF5D97C5E864F3005E5511A87455EE68FD55198A77310E5F3D3E3E3BFCD4F4EE61041CC1056102CEE375915A770F707FAF332CF42B8AE3620B9CD239894ED73F466B9430D3E8014966B10C2F3D98F1024D5D34D566E0A806A2D61F11C87F0E80A5460165C2431405D5AC2E47116802CCB2B50A10E9F7D2EE1B22AF26CB55CA30720F9B45D4354EE1124256C0772468A9B8EE9F8B41ED39C54ECA0C24D59E5A925E0C9DB564873BEBA93A8675888488CD748DCD5B61EF54E94E7B38B288D112EDFD2D96552D4A5B4623EDA557E13C88BBCC12C4164AAFFBD092E3749B529E079063755019237C1C7CD431287FF80DB4FF9BF60769E6D9284EE2EEA307AC73C408F3E16F91A16D5F61E3EB68340B35AD4BF66C19CAD3DE7ABE3CA42CD66B4881C88F0B3E016BCBC87D9AA7A42AA70FAED2C7817BFC0A87BD2B2E5731623FD4095AA6283FEFC803A0F1E1288DFCFB52D7F0465F9EFBC88342DA39F462DEB1BBA4E419C786E65312744D2D2EB324FD720DBBA12ACAD3E018AB53DB989EC3946556D467C93556F4F2584A1A4B3ACF202FE1D66B000158C3E82AA8205B21E3711DC49B86FCEDB267B98FDD7E331887D1145052C4B9D461936DCA3404F79A61BDDA98F463E173AD5711887B1E65CA7EB24DF42E8AA3A5DFD09E88E8BD2EC535BAE6019AFB276851DD91AFF94C7199A1F4CDCFAF7A738B557B3254840B1C530308C5380B8FAB140BF5A1F0EAD5BCB10D48832F9E9E1DFC54559F5D80F3F12790FF6D450BDD68FDEC8DE96F53EF3375DE741B65CA16D0021F378EDEC8CC1C88D2C9151DAE896BF511DAE1FF3721D57B525705B36BAFA135836BAAEB82C1F74DD7D2D237B3162FB51FBF779B89FE550EF5F39B6F1013CC7AB5DFF79E1E588973144CA790F935D81F2295E37C70447BB97DB2F4481DE15797A9F275D3DF2EACB2750AC60853A9ECBDF2FF34D11BA6A7003E6AABF4DED0968EFD49DBE46507BD159E45F8645BCDE8B425DA4F55A3A9A5B787D7B331AB66A9FACAFA5B4F4A646011F51A86D022E229884F60DD678CE2274AF3B8361DA27628486192A45B70443E66EA89035BDCB86EE5545A40918B0AE2BA22193166F44EB62F5E886F4D6CFC4A2F941414E6C5179D9A73678D759E411ED0A7182B6A6C34D91521309B5559AC8F0F60B29CF69A5BC985C4315656DAD48E74998F5BC2BADED776B400C7ADD961C6E61B617EB75913FBB6F6958940958967BF8CB0696958BADA0AA0E51F24E185E74F21E8252EBD99C1CFB388AEDDD579F38B5D2A33DADC0350B7127CB2F5C057E559697532CD18AC21EB409F76F8832B520BF135DF2B7E9689BF4A276D3721B4639F51AB63063AD51AEC9420985360AC57CAFC4B805C522CCBDEFE9A6C3D27B51967918EFFAC674196F7DD88122772ED0EF831A1A9001222E200B10AF6B3FA1DA9ECFFE22084F89894F5B0826DE90B1A0C7474727022EB215B0A8D513249748F2C8FAC459251A96380BE33548B45DE06AD97D28AE858F9BE1DF5CC135CC6A23A215EBE0F671339CA9EC93D1624E11C488377877DA33C9E256D50373C4833A024AB6CD237387EF84C9E4A98FBC5DD8C3CB76780FF6C51FC59E4A3BED7D1B2C8E57DCC18525C77A76685463AA264EF8E958DC65573081150C2EC2E6AED825284310496E35A1CEF8E2A97E20268CF1C155FDDC99F4427B5A7320DEB6F6CB8248FCF23E22673927A1D7EC4E92AFEC200EC35676CE4CFAA03A2ADCEB0A2D38C7FA3555ED29F3C4C11B4CDB655BE965BF1E6BAA1CC3BEA8A99CA7D76343F9BD9019697A2CE77056BE527BA9E8FFDEF9F84AADA4E2704F4F99BE933E9E3AE480DB604B62D89892A70A45F0BAF7D1F7C964F295C77A0E14D44FC7E0DE78E762734283EA54A8062CBA8D197BD27AF583E404F77309DB43DCB23D4EE3B953232F6145077F94B3809C09B55469A34204EAB1D59BA386DD7D1A01019FD0F460746B8E0C832CF63D20DDA6550642F6FB3D20E4729080D159784304E21C2AC1384FDE0418F358DD4362488C005B5AABF1B0ADE0E028E2F298E4AE0455487E9B82D7A4DE43453C0A7AB20485EC3D47A4602806F36B303B46F3F113BE2905203F1B333A1D731481702046E150CAE34706AA0FE20A79989CF5589FF648E4C468659FC87ACE77287825A81FF175A6C74878328FD9F2C8C1AFE038A7D980BDCE8A277EEC51E99F7EE76BB3F7E5C74359D45E9D54EE76C7E496F09DA94F46668C52EDC27CC8678F14527DC95709C9647360BF3D108446ADFBBD52EBD90D184F884686DD2744ECA0E2778B7913A5DD3E58CC15E1DC8B5BB05EC7D98A0AEF6E9F04CB26B6FBF29BA57DAC73DA60CCC35212F28C7B8B5BAAF202AC20F7B6760922B80B7EAAAF3B3C80FA0BF565940AC544775CE17175ED311EB7388D9DFFD515AF7F4B1D7F31005BB2856951DEA111A6F57668776D819A7C45BDA08EB3AFE3CA9451D29779B249337DD4B50E898447D148E4A939521B9944C3B48F448CC59C1388B089132640389161A7D368B28977E96BBE15AEB3C18C2B6BAAE44B7D47A665ACF9BCDC8B25528879618E87438C692CFCD0828D4D300D43C5E69139C62E8285518B624A1C242E842F0EAADC260312AAABAAA4CBD3CF8E774C602F0DC3BC30C723C1BB3418796A8ED445EFD238DD3373142A489706A21E9B6391305C1A8A3CB5D0885D9C2DBF521C6695F0A1E1362B8DDA02B611AEACF56B1F5AE0EC2E193220926B875AE6B517F518E6B5CF2663B5C899842FABA53A7331B05AEAAA2A19D397686839EB2ED7A8D144ADB4F6BA3C6801090965EC037EFAD5AC98785BE98B7AF23DB401F15415C7592C9BD644B2D1CFAD965E12F3C82DBDE48585CBD7C635321E5FFBCCC294D7E18B8C21AF1F583BB25E9C6237237160A5A0CF02BDEA07FB41C451577A40D40B3CB9F7C0AEF2EAFB106A34F2DD5AD42217242A144F04A45EDAE2E2903C1115BFB2C5248179222879372D5653E76B7E2D3EFE1AE76AF9D500AA59A03E54D313A0F97EADC66263C418BBCBBC3147EC02C5D8AE35CFBE3207963B5DF54B2CC541B331AF94F5F7412B26044A82664BAAA91AEF09D15438B1E78BE0D6F1C93D7742BF684FCBFBB3B20AC7E74D913A343B7F8EA3FAE87CB92D2B9836845EFE925C2631ACBDB8AEC02DC8E2474484262E70767A7C72CAE5739D4E6ED579594689E46B839060959DAC3D2735CD9E41113E81424C6B3A30676907FCA714BCFC9946B34E2D6681649D7BD441F63EB37DC635B97BE346DD72A5F4CE729DA17258FE4E3979585CEBC45552D0536B4C2A7B94C1E87D24E374E0D2B04448A3B04792F072902AF3492D23F4BB1A9ED4321A3DA9E5A051F3892B0781D1C929070179B5D152A5DDABB597993E2659E4302C2A21E4202036FC7D8CD54C11507B804C8AA398246F8AE48FB27C12C461FA2D2E553ED9218D9579ADCB137DE2EC41F492F47B83F0D8147BDE17292AC59E776CB9732AC411DC64117C399FFD6757EB2CB8F9E7175CF14D7057A04DDA59701CFC6A2B38852931689ED4346F7F481E3B073D3A60BA385329929A2A293A258C316DBEABE7A171213D9DB3C7C91D787B41E3D3D30D5463D774690E24F6994DC99416B8E2205EC8329A394F239BD14CBE033EB6DEADCA7D44218599477F401EAE781826F8761224A9B49CE7FBF76D52BDEF5D9C9349E1D831C7544FFC6D78A76C424E71AFEA8BB916878B817D6CEB5795128A84CEB9E66B3A1C0134F7CB6CF6E36351E055A67522A15CFBCE00A20B6A1B9C96C7895F9AAB31267B7A7B5EF55DC8B1DC014D3805938995F8CAD96561490EC3AD492403314E993419C3456218DD13E2BC0E73A5B91433554B6597E8E8C046EA604CDAB369B2E2D124AC92538A22EBD9344F443434C1D1F05C5707CB30F46A92098941CEFCDC4A1205A9F3043577BCCE67D1438E66BF392EE8720B09AC91E510DAEA3208C9D0D5895BF806C8B22BB4405EC99A50275FE09B205B54A109F24AD6843AF50ADF4467F08506BA173278658204293AE767CA5BE20AE95AD5A40DE949706490DF48D9B03A5B823E09527F0E247593CA240A63E749E2948709F4168D8BE85188B146825F70D83448BC66B1F178071DE2D8598E784D6403A87B872ED56655A4CC2822E94931E392B9C8643EA7218A71D2110DE4046FEB242101BE87DF4302DB3C434EF3BFC761EF298390F580B4EEBA3AEEC85C2C164981C45002E4DE6EB2FAC35DF357733B15432C10660643C6B1C5656EB2C7BC73B1B91E7545B8AF5DB7B00211F27A2F8A2A7E0461855E87B02C77FF5DCDCF20D9ECD4EC014637D9DDA65A6F2A3464983E240CCF6A3F5DD7FE2EF311DBE7C5DDEE0252E96308A89B71FDADF32EFB61132711EEF73BC9DD010544BD01683FC6D67359D51F65575B8CF441080E5701B5E2C3FB964F10992304866CEA123C4397BE7D2EE17BB802E1B68B085183F44F042BF6C5550C560548CB1683D4477F220E47E9CB77FF079B3B7C680D890000, N'6.4.4')
GO
INSERT [dbo].[Admins] ([UserName], [Password], [Email]) VALUES (N'admin01', N'12345', N'admin01@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [Address], [Phone], [Url]) VALUES (2, N'Health Strong', N'1 Tran Thai Tong ', N'0258741963', N'healthstrong.com')
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [Address], [Phone], [Url]) VALUES (3, N'Daichi VietNam', N'Ha noi', N'0321597896', N'daichivietnam@gmail.com')
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [Address], [Phone], [Url]) VALUES (4, N'Bao Hiem Nhan Tho', N'zxc', N'0258743258', N'baohiemnhantho.com')
INSERT [dbo].[Companies] ([CompanyId], [CompanyName], [Address], [Phone], [Url]) VALUES (5, N'Dsanfoxn', N'Kayaky', N'10019005', N'kayaky.com')
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Designation], [JoinDate], [Salary], [FirstName], [LastName], [User], [Password], [Phone], [Email], [Country], [City], [Status]) VALUES (1, N'Manager', CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(2500.00 AS Decimal(18, 2)), N'Moria', N'John', N'john', N'12345', N'0147852369', N'john@gmail.com', N'US', N'New York', N'oke')
INSERT [dbo].[Employees] ([Id], [Designation], [JoinDate], [Salary], [FirstName], [LastName], [User], [Password], [Phone], [Email], [Country], [City], [Status]) VALUES (2, N'Salesman', CAST(N'2020-10-13T00:00:00.000' AS DateTime), CAST(800.00 AS Decimal(18, 2)), N'Adora', N'Lauria', N'lauria', N'1234', N'0258741147', N'lauria@gmail.com', N'Singapo', N'Singapo', N'active')
INSERT [dbo].[Employees] ([Id], [Designation], [JoinDate], [Salary], [FirstName], [LastName], [User], [Password], [Phone], [Email], [Country], [City], [Status]) VALUES (3, N'Designer', CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(1600.00 AS Decimal(18, 2)), N'Machvitch', N'Elena', N'elena', N'1234', N'0987564323', N'elena@gmail.com', N'VietNam', N'Ha Noi', N'success')
INSERT [dbo].[Employees] ([Id], [Designation], [JoinDate], [Salary], [FirstName], [LastName], [User], [Password], [Phone], [Email], [Country], [City], [Status]) VALUES (4, N'Salesman', CAST(N'2019-02-23T00:00:00.000' AS DateTime), CAST(800.00 AS Decimal(18, 2)), N'Bakoval', N'Jack', N'jack', N'1234', N'0254785123', N'jack@gmail.com', N'Canada', N'ABC', N'oke')
INSERT [dbo].[Employees] ([Id], [Designation], [JoinDate], [Salary], [FirstName], [LastName], [User], [Password], [Phone], [Email], [Country], [City], [Status]) VALUES (5, N'Salesman', CAST(N'2018-01-20T00:00:00.000' AS DateTime), CAST(1100.00 AS Decimal(18, 2)), N'Kalvin', N'Jackcop', N'jackcop', N'1234', N'0325874563', N'jackcop@gmail.com', N'Ukaraina', N'XYZ', N'oke')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Hospitals] ON 

INSERT [dbo].[Hospitals] ([HospitalId], [Name], [Phone], [Location], [Url]) VALUES (1, N'Hospital E', N'0147789999', N'HQV', N'hospitalE.com')
INSERT [dbo].[Hospitals] ([HospitalId], [Name], [Phone], [Location], [Url]) VALUES (2, N'Bv QDND', N'026875321', N'drone', N'bvqdnd.com')
INSERT [dbo].[Hospitals] ([HospitalId], [Name], [Phone], [Location], [Url]) VALUES (3, N'Hospital 199', N'119311', N'Baroza', N'hospital199.com')
SET IDENTITY_INSERT [dbo].[Hospitals] OFF
GO
SET IDENTITY_INSERT [dbo].[Policies] ON 

INSERT [dbo].[Policies] ([Id], [PolicyName], [Description], [Amount], [EMI], [CompanyId], [HospitalId]) VALUES (2, N'Covid-19', N'Insurance about covid 19', CAST(1000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 2, 2)
INSERT [dbo].[Policies] ([Id], [PolicyName], [Description], [Amount], [EMI], [CompanyId], [HospitalId]) VALUES (5, N'Traffic', N'Insurace for traffic', CAST(500.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 3, 2)
INSERT [dbo].[Policies] ([Id], [PolicyName], [Description], [Amount], [EMI], [CompanyId], [HospitalId]) VALUES (6, N'Happy', N'insurance for happy. hahhaha', CAST(1200.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 3, 1)
INSERT [dbo].[Policies] ([Id], [PolicyName], [Description], [Amount], [EMI], [CompanyId], [HospitalId]) VALUES (7, N'Healthy', N'Insurace for healthy', CAST(1300.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), 5, 3)
SET IDENTITY_INSERT [dbo].[Policies] OFF
GO
INSERT [dbo].[PoliciesOnEmployees] ([EmployeeId], [PolicyId], [PolicyStartDate], [PolicyEndDate], [PolicyDuration]) VALUES (1, 2, CAST(N'2020-10-16T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[PoliciesOnEmployees] ([EmployeeId], [PolicyId], [PolicyStartDate], [PolicyEndDate], [PolicyDuration]) VALUES (1, 5, CAST(N'2020-10-22T00:00:00.000' AS DateTime), CAST(N'2020-11-22T00:00:00.000' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[PoliciesOnEmployees] ([EmployeeId], [PolicyId], [PolicyStartDate], [PolicyEndDate], [PolicyDuration]) VALUES (5, 7, CAST(N'2020-10-23T00:00:00.000' AS DateTime), CAST(N'2020-11-23T00:00:00.000' AS DateTime), CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PolicyApprovals] ([RequestId], [ApprovalDate], [Reason], [Status]) VALUES (2, CAST(N'2020-10-19T00:00:00.000' AS DateTime), N'Good guy', NULL)
INSERT [dbo].[PolicyApprovals] ([RequestId], [ApprovalDate], [Reason], [Status]) VALUES (3, CAST(N'2020-10-22T00:00:00.000' AS DateTime), N'working hard', NULL)
GO
SET IDENTITY_INSERT [dbo].[PolicyRequests] ON 

INSERT [dbo].[PolicyRequests] ([RequestId], [RequestDate], [EmployeeId], [PolicyId], [Status]) VALUES (2, CAST(N'2020-10-16T21:20:11.940' AS DateTime), 2, 2, N'Accepted')
INSERT [dbo].[PolicyRequests] ([RequestId], [RequestDate], [EmployeeId], [PolicyId], [Status]) VALUES (3, CAST(N'2020-10-19T18:54:06.470' AS DateTime), 2, 5, N'Accepted')
INSERT [dbo].[PolicyRequests] ([RequestId], [RequestDate], [EmployeeId], [PolicyId], [Status]) VALUES (4, CAST(N'2020-10-20T15:44:36.990' AS DateTime), 2, 6, N'waiting')
INSERT [dbo].[PolicyRequests] ([RequestId], [RequestDate], [EmployeeId], [PolicyId], [Status]) VALUES (5, CAST(N'2020-10-20T15:45:00.373' AS DateTime), 2, 5, N'waiting')
INSERT [dbo].[PolicyRequests] ([RequestId], [RequestDate], [EmployeeId], [PolicyId], [Status]) VALUES (6, CAST(N'2020-10-23T00:00:00.000' AS DateTime), 1, 5, N'waiting')
SET IDENTITY_INSERT [dbo].[PolicyRequests] OFF
GO

/****** Object:  Index [IX_HospitalId]    Script Date: 23/10/2020 4:42:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_HospitalId] ON [dbo].[Policies]
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeId]    Script Date: 23/10/2020 4:42:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeId] ON [dbo].[PoliciesOnEmployees]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PolicyId]    Script Date: 23/10/2020 4:42:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_PolicyId] ON [dbo].[PoliciesOnEmployees]
(
	[PolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RequestId]    Script Date: 23/10/2020 4:42:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_RequestId] ON [dbo].[PolicyApprovals]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmployeeId]    Script Date: 23/10/2020 4:42:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmployeeId] ON [dbo].[PolicyRequests]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PolicyId]    Script Date: 23/10/2020 4:42:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_PolicyId] ON [dbo].[PolicyRequests]
(
	[PolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Policies_dbo.Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([CompanyId])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_dbo.Policies_dbo.Companies_CompanyId]
GO
ALTER TABLE [dbo].[Policies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Policies_dbo.Hospitals_HospitalId] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[Policies] CHECK CONSTRAINT [FK_dbo.Policies_dbo.Hospitals_HospitalId]
GO
ALTER TABLE [dbo].[PoliciesOnEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PoliciesOnEmployees_dbo.Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PoliciesOnEmployees] CHECK CONSTRAINT [FK_dbo.PoliciesOnEmployees_dbo.Employees_EmployeeId]
GO
ALTER TABLE [dbo].[PoliciesOnEmployees]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PoliciesOnEmployees_dbo.Policies_PolicyId] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PoliciesOnEmployees] CHECK CONSTRAINT [FK_dbo.PoliciesOnEmployees_dbo.Policies_PolicyId]
GO
ALTER TABLE [dbo].[PolicyApprovals]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PolicyApprovals_dbo.PolicyRequests_RequestId] FOREIGN KEY([RequestId])
REFERENCES [dbo].[PolicyRequests] ([RequestId])
GO
ALTER TABLE [dbo].[PolicyApprovals] CHECK CONSTRAINT [FK_dbo.PolicyApprovals_dbo.PolicyRequests_RequestId]
GO
ALTER TABLE [dbo].[PolicyRequests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PolicyRequests_dbo.Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PolicyRequests] CHECK CONSTRAINT [FK_dbo.PolicyRequests_dbo.Employees_EmployeeId]
GO
ALTER TABLE [dbo].[PolicyRequests]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PolicyRequests_dbo.Policies_PolicyId] FOREIGN KEY([PolicyId])
REFERENCES [dbo].[Policies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PolicyRequests] CHECK CONSTRAINT [FK_dbo.PolicyRequests_dbo.Policies_PolicyId]
GO
USE [master]
GO
ALTER DATABASE [DB_HealInsurance] SET  READ_WRITE 
GO
