CREATE TABLE [data].[AzureSqlServer_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_IsReachable] [bit] NULL,
[_IsReadyForDataCollection] [bit] NULL,
[_MonitoredEntityState] [bigint] NULL,
[_MonitoringStatusCategory] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_StableSamples] ADD CONSTRAINT [AzureSqlServer_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_StableSamples] ADD CONSTRAINT [AzureSqlServer_StableSamples_AzureSqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
