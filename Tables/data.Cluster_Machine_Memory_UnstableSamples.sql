CREATE TABLE [data].[Cluster_Machine_Memory_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CumulativePagesInput] [bigint] NULL,
[_CumulativePagesOutput] [bigint] NULL,
[_FreeBytes] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Memory_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_Memory_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Memory_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_Memory_UnstableSamples_Cluster_Machine_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_Keys] ([Id]) ON DELETE CASCADE
GO
