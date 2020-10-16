CREATE TABLE [data].[Cluster_Machine_Process_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Id] [bigint] NOT NULL,
[_StartDate] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Process_Keys] ADD CONSTRAINT [Cluster_Machine_Process_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_Machine_Process_Keys_CollectionDate] ON [data].[Cluster_Machine_Process_Keys] ([CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Process_Keys] ADD CONSTRAINT [Cluster_Machine_Process_Keys_ParentId__Id__StartDate] UNIQUE NONCLUSTERED  ([ParentId], [_Id], [_StartDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Process_Keys] ADD CONSTRAINT [Cluster_Machine_Process_Keys_Cluster_Machine_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_Machine_Keys] ([Id]) ON DELETE CASCADE
GO
