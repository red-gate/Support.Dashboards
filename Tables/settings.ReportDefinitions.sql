CREATE TABLE [settings].[ReportDefinitions]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[Definition] [xml] NOT NULL,
[LastGenerated] [datetime] NULL,
[GeneratedReport] [varbinary] (max) NULL,
[Created] [datetime] NULL,
[Modified] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[ReportDefinitions] ADD CONSTRAINT [PK_ReportDefinition] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReportDefinitions_Name] ON [settings].[ReportDefinitions] ([Name]) ON [PRIMARY]
GO
