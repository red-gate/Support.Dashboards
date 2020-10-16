CREATE TABLE [data].[Cluster_Ping_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_RoundtripTime] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Ping_UnstableSamples] ADD CONSTRAINT [Cluster_Ping_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Ping_UnstableSamples] ADD CONSTRAINT [Cluster_Ping_UnstableSamples_Cluster_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Keys] ([Id]) ON DELETE CASCADE
GO
