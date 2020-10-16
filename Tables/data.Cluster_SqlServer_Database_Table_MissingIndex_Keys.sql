CREATE TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_EqualityColumns] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[_IncludedColumns] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[_InequalityColumns] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_MissingIndex_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Database_Table_MissingIndex_Keys_CollectionDate] ON [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_MissingIndex_Keys_ParentId__EqualityColumns__IncludedColumns__InequalityColumns] UNIQUE NONCLUSTERED  ([ParentId], [_EqualityColumns], [_IncludedColumns], [_InequalityColumns]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_MissingIndex_Keys_Cluster_SqlServer_Database_Table_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Database_Table_Keys] ([Id]) ON DELETE CASCADE
GO
