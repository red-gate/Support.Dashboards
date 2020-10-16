CREATE TABLE [data].[AzureSqlServer_Database_SqlProcess_UnstableSamples]
(
[Id] [bigint] NOT NULL,
[CollectionDate] [bigint] NOT NULL,
[_BlockingSessionId] [bigint] NULL,
[_BlockingSessionLoginTime] [bigint] NULL,
[_Command] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_CumulativeLogicalReads] [bigint] NULL,
[_CumulativeProcessorTime] [bigint] NULL,
[_CumulativeReads] [bigint] NULL,
[_CumulativeWrites] [bigint] NULL,
[_DatabaseName] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_FullCommand] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_LastRequestEnd] [bigint] NULL,
[_LastRequestStart] [bigint] NULL,
[_LastWaitType] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_MemoryUsage] [bigint] NULL,
[_OpenTransactions] [bigint] NULL,
[_PlanHandle] [varbinary] (max) NULL,
[_QueryStartTime] [bigint] NULL,
[_SqlHandle] [varbinary] (max) NULL,
[_StatementEnd] [bigint] NULL,
[_StatementStart] [bigint] NULL,
[_Status] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_TotalBlockingTime] [bigint] NULL,
[_WaitResource] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_WaitTime] [bigint] NULL,
[_WaitType] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[_MostRecentSqlHandle] [varbinary] (max) NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlProcess_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_SqlProcess_UnstableSamples_Id_CollectionDate] PRIMARY KEY CLUSTERED  ([Id], [CollectionDate]) ON [PRIMARY]
GO
ALTER TABLE [data].[AzureSqlServer_Database_SqlProcess_UnstableSamples] ADD CONSTRAINT [AzureSqlServer_Database_SqlProcess_UnstableSamples_AzureSqlServer_Database_SqlProcess_Keys] FOREIGN KEY ([Id]) REFERENCES [data].[AzureSqlServer_Database_SqlProcess_Keys] ([Id]) ON DELETE CASCADE
GO
