SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys_DeleteChunk]
    @ChunkSize AS INT
AS
BEGIN TRANSACTION

DECLARE @Chunk TABLE
(
    [Id] BIGINT NOT NULL,
    PRIMARY KEY ([Id])
)

DELETE TOP (@ChunkSize) [#Cluster_SqlServer_TopQueries_QueryWaitStats_Keys]
OUTPUT deleted.[Id] INTO @Chunk
FROM [#Cluster_SqlServer_TopQueries_QueryWaitStats_Keys]

DELETE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys]
FROM @Chunk c
INNER JOIN [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_Keys] d ON c.[Id] = d.[Id]

COMMIT TRANSACTION
GO
