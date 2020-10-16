CREATE TABLE [datawarehouse].[AllRPOs]
(
[ClusterName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[InstanceName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[DatabaseName] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[BackupFinishDate] [bigint] NOT NULL,
[DurationTicks] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [datawarehouse].[AllRPOs] ADD CONSTRAINT [PK_datawarehouse_AllRPOs] PRIMARY KEY CLUSTERED  ([ClusterName], [InstanceName], [DatabaseName], [BackupFinishDate]) ON [PRIMARY]
GO
