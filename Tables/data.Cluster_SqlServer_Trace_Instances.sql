CREATE TABLE [data].[Cluster_SqlServer_Trace_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_ApplicationName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_DatabaseName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_HostName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_LoginName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_Spid] [bigint] NULL,
[_TextData] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Trace_Instances] ADD CONSTRAINT [Cluster_SqlServer_Trace_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Trace_Instances] ADD CONSTRAINT [Cluster_SqlServer_Trace_Instances_Cluster_SqlServer_Trace_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Trace_Keys] ([Id]) ON DELETE CASCADE
GO
