CREATE TABLE [data].[Cluster_SqlServer_Agent_Job_History_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[ParentId] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Id] [bigint] NOT NULL,
[_RunDate] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Agent_Job_History_Keys] ADD CONSTRAINT [Cluster_SqlServer_Agent_Job_History_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Cluster_SqlServer_Agent_Job_History_Keys__RunDate] ON [data].[Cluster_SqlServer_Agent_Job_History_Keys] ([_RunDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Agent_Job_History_Keys] ADD CONSTRAINT [Cluster_SqlServer_Agent_Job_History_Keys_ParentId__RunDate__Id] UNIQUE NONCLUSTERED  ([ParentId], [_RunDate], [_Id]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Agent_Job_History_Keys] ADD CONSTRAINT [Cluster_SqlServer_Agent_Job_History_Keys_Cluster_SqlServer_Agent_Job_Keys] FOREIGN KEY ([ParentId]) REFERENCES [data].[Cluster_SqlServer_Agent_Job_Keys] ([Id]) ON DELETE CASCADE
GO
