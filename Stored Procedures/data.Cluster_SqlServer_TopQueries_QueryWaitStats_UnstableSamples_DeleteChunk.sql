SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples_DeleteChunk]
    @ChunkSize AS INT
AS
BEGIN TRANSACTION

DECLARE @Chunk TABLE
(
    [Id] BIGINT NOT NULL,
    [CollectionDate] BIGINT NOT NULL,
    PRIMARY KEY ([Id], [CollectionDate])
)

DELETE TOP (@ChunkSize) [#Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples]
OUTPUT deleted.[Id], deleted.[CollectionDate] INTO @Chunk
FROM [#Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples]

DELETE [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples]
FROM @Chunk c
INNER JOIN [data].[Cluster_SqlServer_TopQueries_QueryWaitStats_UnstableSamples] d ON c.[Id] = d.[Id] AND c.[CollectionDate] = d.[CollectionDate]

COMMIT TRANSACTION
GO
