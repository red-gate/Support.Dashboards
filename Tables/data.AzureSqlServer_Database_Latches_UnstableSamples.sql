CREATE TABLE [data].[AzureSqlServer_Database_Latches_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CumulativeLatchWaits] [bigint] NULL,
[_CumulativeLatchWaitTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Latches_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Latches_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Latches_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_Latches_UnstableSamples_AzureSqlServer_Database_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
