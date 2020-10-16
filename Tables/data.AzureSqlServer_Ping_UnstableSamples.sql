CREATE TABLE [data].[AzureSqlServer_Ping_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_RoundtripTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Ping_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Ping_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Ping_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Ping_UnstableSamples_AzureSqlServer_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Keys] ([Id]) ON DELETE CASCADE
GO
