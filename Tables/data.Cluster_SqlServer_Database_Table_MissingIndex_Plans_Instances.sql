CREATE TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_Plans_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_PlanHandle] [varbinary] (max) NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_Plans_Instances] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_MissingIndex_Plans_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[Cluster_SqlServer_Database_Table_MissingIndex_Plans_Instances] ADD CONSTRAINT [Cluster_SqlServer_Database_Table_MissingIndex_Plans_Instances_Cluster_SqlServer_Database_Table_MissingIndex_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[Cluster_SqlServer_Database_Table_MissingIndex_Keys] ([Id]) ON DELETE CASCADE
GO
