CREATE TABLE [data].[Cluster_Machine_Network_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CumulativeBytesReceived] [bigint] NULL,
[_CumulativeBytesSent] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Network_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_Network_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Network_UnstableSamples] ADD CONSTRAINT [Cluster_Machine_Network_UnstableSamples_Cluster_Machine_Network_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_Network_Keys] ([Id]) ON DELETE CASCADE
GO
