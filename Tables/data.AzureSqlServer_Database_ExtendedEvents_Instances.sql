CREATE TABLE [data].[AzureSqlServer_Database_ExtendedEvents_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_EventData] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_FileName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_FileOffset] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_ExtendedEvents_Instances] ADD CONSTRAINT [AzureSqlServer_Database_ExtendedEvents_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_ExtendedEvents_Instances] ADD CONSTRAINT [AzureSqlServer_Database_ExtendedEvents_Instances_AzureSqlServer_Database_ExtendedEvents_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_ExtendedEvents_Keys] ([Id]) ON DELETE CASCADE
GO
