SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [utils].[GetRootCir]
(
    @TargetObject NVARCHAR(450)
)
RETURNS NVARCHAR(450)
BEGIN
    DECLARE @ClusterString AS VARCHAR(MAX) = '7:Cluster,1,4:Name,s';
    DECLARE @AzureString AS VARCHAR(MAX) = '14:AzureSqlServer,1,4:Name,s';
    DECLARE @MachineString AS VARCHAR(MAX) = '7:Machine,1,4:Name,s';
    DECLARE @SqlString AS VARCHAR(MAX) = '9:SqlServer,1,4:Name,s';
    DECLARE @AgString AS VARCHAR(MAX) = '17:AvailabilityGroup,1,4:Name,s';
    DECLARE @DatabaseString AS VARCHAR(MAX) = '8:Database,1,4:Name,s';
    DECLARE @ElasticPoolString AS VARCHAR(MAX) = '11:ElasticPool,1,4:Name,s';

    DECLARE @ClusterPos AS INT = CHARINDEX(@ClusterString, @TargetObject);
    DECLARE @AzurePos AS INT = CHARINDEX(@AzureString, @TargetObject);
    DECLARE @MachinePos AS INT = CHARINDEX(@MachineString, @TargetObject);
    DECLARE @SqlPos AS INT = CHARINDEX(@SqlString, @TargetObject);
    DECLARE @AgPos AS INT = CHARINDEX(@AgString, @TargetObject);
    DECLARE @DatabasePos AS INT = CHARINDEX(@DatabaseString, @TargetObject);
    DECLARE @ElasticPoolPos AS INT = CHARINDEX(@ElasticPoolString, @TargetObject);

    RETURN CASE
                WHEN @ClusterPos > 0 THEN
                    CASE
                         WHEN @MachinePos > 0 THEN
                             SUBSTRING(@TargetObject, 1, CHARINDEX(',', @TargetObject, @MachinePos + LEN(@MachineString)))
                         WHEN @SqlPos > 0 THEN
                             SUBSTRING(@TargetObject, 1, CHARINDEX(',', @TargetObject, @SqlPos + LEN(@SqlString)))
                         WHEN @AgPos > 0 THEN
                             SUBSTRING(@TargetObject, 1, CHARINDEX(',', @TargetObject, @AgPos + LEN(@AgString)))
                         ELSE
                             SUBSTRING(@TargetObject, 1, CHARINDEX(',', @TargetObject, @ClusterPos + LEN(@ClusterString)))
                    END
                ELSE
                    CASE
                         WHEN @AzurePos > 0 THEN
                             CASE
                                  WHEN @ElasticPoolPos > 0 THEN
                                      SUBSTRING(@TargetObject, 1, CHARINDEX(',', @TargetObject, @ElasticPoolPos + LEN(@ElasticPoolString)))
                                  WHEN @DatabasePos > 0 THEN
                                      SUBSTRING(@TargetObject, 1, CHARINDEX(',', @TargetObject, @DatabasePos + LEN(@DatabaseString)))
                                  ELSE
                                      SUBSTRING(@TargetObject, 1, CHARINDEX(',', @TargetObject, @AzurePos + LEN(@AzureString)))
                             END
                    END
           END;
END;
GO
