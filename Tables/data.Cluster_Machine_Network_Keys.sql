CREATE TABLE [data].[Cluster_Machine_Network_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Name] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[_SequenceNumber] [bigint] NOT NULL CONSTRAINT [DF_Cluster_Machine_Network_Keys__SequenceNumber] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Network_Keys] ADD CONSTRAINT [Cluster_Machine_Network_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_Machine_Network_Keys_CollectionDate] ON [data].[Cluster_Machine_Network_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Network_Keys] ADD CONSTRAINT [Cluster_Machine_Network_Keys_ParentId__Name__SequenceNumber] UNIQUE NONCLUSTERED  ([ParentId], [_Name], [_SequenceNumber]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Network_Keys] ADD CONSTRAINT [Cluster_Machine_Network_Keys_Cluster_Machine_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_Machine_Keys] ([Id]) ON DELETE CASCADE
GO
