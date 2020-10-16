CREATE TABLE [alert].[Alert]
(
[AlertId] [bigint] NOT NULL,
[AlertType] [bigint] NOT NULL,
[TargetObject] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL,
[Read] AS (CONVERT([bit],case  when [ReadDate] IS NULL then (0) else (1) end,(0))) PERSISTED,
[ReadDate] [bigint] NULL,
[SubType] [bigint] NOT NULL CONSTRAINT [Alert_SubType_DF] DEFAULT ((0)),
[LastUpdate] [bigint] NOT NULL,
[Raised] [bigint] NOT NULL,
[LastSeverity] [int] NOT NULL,
[WorstSeverity] [int] NOT NULL,
[Cleared] AS (CONVERT([bit],case  when [ClearedDate] IS NULL then (0) else (1) end,(0))) PERSISTED,
[ClearedDate] [bigint] NULL,
[LastComment] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[RootCir] [nvarchar] (450) COLLATE Latin1_General_CI_AS NULL,
[GroupCir] [nvarchar] (450) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [alert].[Alert] ADD CONSTRAINT [Alert_AlertId] PRIMARY KEY CLUSTERED  ([AlertId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Alert_Type] ON [alert].[Alert] ([AlertType]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Alert_Cleared] ON [alert].[Alert] ([Cleared]) INCLUDE ([AlertType], [LastSeverity], [LastUpdate], [RootCir]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GroupCir_Read] ON [alert].[Alert] ([GroupCir], [Read]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Alert_TargetObject] ON [alert].[Alert] ([TargetObject]) ON [PRIMARY]
GO
