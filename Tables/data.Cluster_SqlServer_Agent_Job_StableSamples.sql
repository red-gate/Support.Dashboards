CREATE TABLE [data].[Cluster_SqlServer_Agent_Job_StableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CategoryName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_DateModified] [bigint] NULL,
[_Description] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_Enabled] [bit] NULL,
[_Owner] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_OwnerSid] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_VersionNumber] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Agent_Job_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Agent_Job_StableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Agent_Job_StableSamples] ADD CONSTRAINT [Cluster_SqlServer_Agent_Job_StableSamples_Cluster_SqlServer_Agent_Job_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Agent_Job_Keys] ([Id]) ON DELETE CASCADE
GO
