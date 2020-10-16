CREATE TABLE [data].[AzureSqlServer_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[CollectionDate] [bigint] NOT NULL,
[_Name] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Keys] ADD CONSTRAINT [AzureSqlServer_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Keys] ADD CONSTRAINT [AzureSqlServer_Keys__Name] UNIQUE NONCLUSTERED  ([_Name]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [AzureSqlServer_Keys_CollectionDate] ON [data].[AzureSqlServer_Keys] ([CollectionDate]) ON [PRIMARY]
GO
