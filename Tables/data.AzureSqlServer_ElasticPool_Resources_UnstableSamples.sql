CREATE TABLE [data].[AzureSqlServer_ElasticPool_Resources_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_AvgAllocatedStoragePercent] [float] NULL,
[_AvgCpuPercent] [float] NULL,
[_AvgDataIoPercent] [float] NULL,
[_AvgLogWritePercent] [float] NULL,
[_AvgStoragePercent] [float] NULL,
[_EndTime] [bigint] NULL,
[_MaxSessionPercent] [float] NULL,
[_MaxWorkerPercent] [float] NULL,
[_StartTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_ElasticPool_Resources_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_ElasticPool_Resources_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_ElasticPool_Resources_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_ElasticPool_Resources_UnstableSamples_AzureSqlServer_ElasticPool_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_ElasticPool_Keys] ([Id]) ON DELETE CASCADE
GO
