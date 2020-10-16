CREATE TABLE [data].[AzureSqlServer_Database_Resources_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_MaxSessionPercent] [float] NULL,
[_MaxWorkerPercent] [float] NULL,
[_PercentCpu] [float] NULL,
[_PercentIo] [float] NULL,
[_PercentLogWrite] [float] NULL,
[_PercentMemoryUsed] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Resources_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Resources_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Resources_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Resources_UnstableSamples_AzureSqlServer_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
