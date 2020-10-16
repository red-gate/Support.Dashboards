CREATE TABLE [settings].[CustomMetrics]
(
[Id] [bigint] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[Description] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[Tsql] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[Frequency] [bigint] NOT NULL,
[UseRateOfChange] [bit] NOT NULL,
[Multiplier] [float] NOT NULL,
[Status] [tinyint] NOT NULL,
[Databases] [xml] NOT NULL,
[DatabaseSelectionMode] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [settings].[CustomMetrics] ADD CONSTRAINT [CustomMetrics_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
