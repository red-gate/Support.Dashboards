CREATE TABLE [data].[AzureSqlServer_Database_SqlText_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_SqlText] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlText_Instances] ADD CONSTRAINT [AzureSqlServer_Database_SqlText_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlText_Instances] ADD CONSTRAINT [AzureSqlServer_Database_SqlText_Instances_AzureSqlServer_Database_SqlText_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_SqlText_Keys] ([Id]) ON DELETE CASCADE
GO
