SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples_DeleteChunk]
    @ChunkSize AS INT
AS
BEGIN TRANSACTION

DECLARE @Chunk TABLE
(
    [Id] BIGINT NOT NULL,
    [CollectionDate] BIGINT NOT NULL,
    PRIMARY KEY ([Id], [CollectionDate])
)

DELETE TOP (@ChunkSize) [#Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples]
OUTPUT deleted.[Id], deleted.[CollectionDate] INTO @Chunk
FROM [#Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples]

DELETE [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples]
FROM @Chunk c
INNER JOIN [data].[Cluster_AvailabilityGroup_Replica_Database_Status_StableSamples] d ON c.[Id] = d.[Id] AND c.[CollectionDate] = d.[CollectionDate]

COMMIT TRANSACTION
GO
