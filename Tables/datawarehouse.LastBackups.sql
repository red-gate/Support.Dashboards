CREATE TABLE [datawarehouse].[LastBackups]
(
[ClusterName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[InstanceName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[DatabaseName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[StartDate] [bigint] NULL,
[FinishDate] [bigint] NOT NULL,
[Size] [bigint] NULL,
[BackupType] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[IsNativeBackup] [bit] NULL,
[BackupDevice] [nvarchar] (450) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [datawarehouse].[LastBackups] ADD CONSTRAINT [PK_datawarehouse_LastBackups] PRIMARY KEY CLUSTERED  ([ClusterName], [InstanceName], [DatabaseName], [BackupType]) ON [PRIMARY]
GO
