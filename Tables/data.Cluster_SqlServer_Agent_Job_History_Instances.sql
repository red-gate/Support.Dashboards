CREATE TABLE [data].[Cluster_SqlServer_Agent_Job_History_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Message] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_RunDuration] [bigint] NULL,
[_RunStatus] [bigint] NULL,
[_SqlMessageId] [bigint] NULL,
[_SqlSeverity] [bigint] NULL,
[_StepID] [bigint] NULL,
[_StepMessage] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_StepName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Agent_Job_History_Instances] ADD CONSTRAINT [Cluster_SqlServer_Agent_Job_History_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Agent_Job_History_Instances] ADD CONSTRAINT [Cluster_SqlServer_Agent_Job_History_Instances_Cluster_SqlServer_Agent_Job_History_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Agent_Job_History_Keys] ([Id]) ON DELETE CASCADE
GO
