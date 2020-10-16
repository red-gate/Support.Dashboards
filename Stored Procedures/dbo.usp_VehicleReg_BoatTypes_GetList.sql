SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_VehicleReg_BoatTypes_GetList]
AS
-- ================================================================================================================
-- File Name:              [usp_VehicleReg_BoatTypes_GetList]
-- File Type:              Stored Procedure
-- Author:                        
-- Create Date:                   
-- Copyright:              ©2018 Brandt Information Services, Inc.
-- Description:            Adds record to VehicleReg_LienHolders table
-- Modification History:
-- Stephen Frouge :ONE-2907 Add isActive column to dbo.VehicleReg_BoatTypes and add two new Paddlecraft records    
-- Oleg Novoselskyy - Pipeline fix
-- ================================================================================================================\
BEGIN

	SET NOCOUNT ON
	DECLARE @Err INT

	SELECT
		VehicleReg_BoatTypes.[BoatTypeID] AS [BoatTypeID],
		VehicleReg_BoatTypes.[BoatType] AS [BoatType]
	FROM [dbo].[VehicleReg_BoatTypes]
	WHERE isActive = 1
	ORDER BY [ORDER]
	SET @Err = @@Error

	RETURN @Err
END
GO
