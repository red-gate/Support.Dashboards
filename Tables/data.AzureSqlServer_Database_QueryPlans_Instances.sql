CREATE TABLE [data].[AzureSqlServer_Database_QueryPlans_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_CreateDate] [bigint] NULL,
[_QueryPlan] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_QueryPlans_Instances] ADD CONSTRAINT [AzureSqlServer_Database_QueryPlans_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_QueryPlans_Instances] ADD CONSTRAINT [AzureSqlServer_Database_QueryPlans_Instances_AzureSqlServer_Database_QueryPlans_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_QueryPlans_Keys] ([Id]) ON DELETE CASCADE
GO
