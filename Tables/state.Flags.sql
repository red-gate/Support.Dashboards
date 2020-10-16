CREATE TABLE [state].[Flags]
(
[Category] [nvarchar] (256) COLLATE Latin1_General_CI_AS NOT NULL,
[Key] [nvarchar] (256) COLLATE Latin1_General_CI_AS NOT NULL,
[Value] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [state].[Flags] ADD CONSTRAINT [Flags_PK] PRIMARY KEY CLUSTERED  ([Category], [Key]) ON [PRIMARY]
GO
