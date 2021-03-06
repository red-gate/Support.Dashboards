CREATE TABLE [data].[AzureSqlServer_Database_Waits_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_WaitType] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Waits_Keys] ADD CONSTRAINT [AzureSqlServer_Database_Waits_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AzureSqlServer_Database_Waits_Keys_CollectionDate] ON [data].[AzureSqlServer_Database_Waits_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Waits_Keys] ADD CONSTRAINT [AzureSqlServer_Database_Waits_Keys_ParentId__WaitType] UNIQUE NONCLUSTERED  ([ParentId], [_WaitType]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_Waits_Keys] ADD CONSTRAINT [AzureSqlServer_Database_Waits_Keys_AzureSqlServer_Database_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
