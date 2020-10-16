CREATE TABLE [data].[Group_Keys]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[CollectionDate] [bigint] NOT NULL,
[_Name] [nvarchar] (450) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [data].[Group_Keys] ADD CONSTRAINT [Group_Keys_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [data].[Group_Keys] ADD CONSTRAINT [Group_Keys__Name] UNIQUE NONCLUSTERED  ([_Name]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Group_Keys_CollectionDate] ON [data].[Group_Keys] ([CollectionDate]) ON [PRIMARY]
GO
