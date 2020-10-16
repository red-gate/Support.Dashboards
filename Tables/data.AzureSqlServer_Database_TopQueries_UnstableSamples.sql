CREATE TABLE [data].[AzureSqlServer_Database_TopQueries_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ExecutionCount] [bigint] NULL,
[_ExecutionTime] [bigint] NULL,
[_LogicalReads] [bigint] NULL,
[_LogicalWrites] [bigint] NULL,
[_PhysicalReads] [bigint] NULL,
[_WorkerTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_TopQueries_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_TopQueries_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_TopQueries_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_TopQueries_UnstableSamples_AzureSqlServer_Database_TopQueries_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_TopQueries_Keys] ([Id]) ON DELETE CASCADE
GO
