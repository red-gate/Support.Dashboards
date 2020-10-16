CREATE TABLE [settings].[ObjectsPendingRemoval]
(
[TargetObject] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[ObjectsPendingRemoval] ADD CONSTRAINT [ObjectsPendingRemoval_TargetObject] PRIMARY KEY CLUSTERED  ([TargetObject]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
