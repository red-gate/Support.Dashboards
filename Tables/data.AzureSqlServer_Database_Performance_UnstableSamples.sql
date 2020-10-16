CREATE TABLE [data].[AzureSqlServer_Database_Performance_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ActiveTransactions] [bigint] NULL,
[_CumulativeLogBytesFlushed] [bigint] NULL,
[_CumulativeLogFlushes] [bigint] NULL,
[_CumulativeLogFlushWaits] [bigint] NULL,
[_CumulativeTransactions] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Performance_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Performance_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Performance_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Performance_UnstableSamples_AzureSqlServer_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
