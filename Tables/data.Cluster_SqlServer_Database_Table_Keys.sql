CREATE TABLE [data].[Cluster_SqlServer_Database_Table_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Name] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[_Schema] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Database_Table_Keys_CollectionDate] ON [data].[Cluster_SqlServer_Database_Table_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_Keys_ParentId__Name__Schema] UNIQUE NONCLUSTERED  ([ParentId], [_Name], [_Schema]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_Keys_Cluster_SqlServer_Database_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Database_Keys] ([Id]) ON DELETE CASCADE
GO
