CREATE TABLE [settings].[GroupMachines]
(
[GroupId] [uniqueidentifier] NOT NULL,
[ClusterId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[GroupMachines] ADD CONSTRAINT [GroupMachines_GroupId_ClusterId] PRIMARY KEY CLUSTERED  ([GroupId], [ClusterId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[GroupMachines] ADD CONSTRAINT [GroupMachines_ClusterId] UNIQUE NONCLUSTERED  ([ClusterId]) ON [PRIMARY]
GO
ALTER TABLE [settings].[GroupMachines] ADD CONSTRAINT [GroupMachines_Clusters] FOREIGN KEY ([ClusterId]) REFERENCES [settings].[Clusters] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [settings].[GroupMachines] ADD CONSTRAINT [GroupMachines_Group] FOREIGN KEY ([GroupId]) REFERENCES [settings].[Group] ([GroupId]) ON DELETE CASCADE ON UPDATE CASCADE
GO
