CREATE TABLE [data].[Cluster_SqlServer_ExtendedEvents_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_EventData] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_FileName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_FileOffset] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_ExtendedEvents_Instances] ADD CONSTRAINT [Cluster_SqlServer_ExtendedEvents_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_ExtendedEvents_Instances] ADD CONSTRAINT [Cluster_SqlServer_ExtendedEvents_Instances_Cluster_SqlServer_ExtendedEvents_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_ExtendedEvents_Keys] ([Id]) ON DELETE CASCADE
GO
