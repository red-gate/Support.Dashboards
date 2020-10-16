CREATE TABLE [data].[AzureSqlServer_Database_ExtendedEvents_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_EventName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[_Sequence] [bigint] NOT NULL,
[_TimeStamp] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_ExtendedEvents_Keys] ADD CONSTRAINT [AzureSqlServer_Database_ExtendedEvents_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AzureSqlServer_Database_ExtendedEvents_Keys_CollectionDate] ON [data].[AzureSqlServer_Database_ExtendedEvents_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_ExtendedEvents_Keys] ADD CONSTRAINT [AzureSqlServer_Database_ExtendedEvents_Keys_ParentId__EventName__Sequence__TimeStamp] UNIQUE NONCLUSTERED  ([ParentId], [_EventName], [_Sequence], [_TimeStamp]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_ExtendedEvents_Keys] ADD CONSTRAINT [AzureSqlServer_Database_ExtendedEvents_Keys_AzureSqlServer_Database_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[AzureSqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
