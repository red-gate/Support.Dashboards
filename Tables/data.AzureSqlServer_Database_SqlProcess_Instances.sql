CREATE TABLE [data].[AzureSqlServer_Database_SqlProcess_Instances]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_Hostname] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_LoginName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_ProgramName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlProcess_Instances] ADD CONSTRAINT [AzureSqlServer_Database_SqlProcess_Instances_Id] PRIMARY KEY CLUSTERED  ([Id]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlProcess_Instances] ADD CONSTRAINT [AzureSqlServer_Database_SqlProcess_Instances_AzureSqlServer_Database_SqlProcess_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_SqlProcess_Keys] ([Id]) ON DELETE CASCADE
GO
