CREATE TABLE [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_WaitTime] [bigint] NULL,
[_WaitTimeCount] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_TopQueries_QueryWaitStats_UnstableSamples_AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_TopQueries_QueryWaitStats_Keys] ([Id]) ON DELETE CASCADE
GO
