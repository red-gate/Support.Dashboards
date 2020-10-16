CREATE TABLE [data].[Cluster_Machine_Process_Owner_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Domain] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_User] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Process_Owner_Instances] ADD CONSTRAINT [Cluster_Machine_Process_Owner_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_Machine_Process_Owner_Instances] ADD CONSTRAINT [Cluster_Machine_Process_Owner_Instances_Cluster_Machine_Process_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_Machine_Process_Keys] ([Id]) ON DELETE CASCADE
GO
