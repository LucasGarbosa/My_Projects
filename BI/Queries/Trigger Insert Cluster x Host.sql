USE [DEV_DW_InfraDB]
GO

/****** Object:  Trigger [dbo].[trgClusterInserttoHost]    Script Date: 30/04/2020 14:45:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trgClusterInserttoHost]
ON [dbo].[STG_Cluster]
FOR INSERT
AS
BEGIN
    INSERT INTO STG_Host (HostClusterID,LoadDate) 
	SELECT ClusterID, GETDATE()
	  FROM STG_Cluster cl
	  LEFT JOIN STG_Host h
	  ON cl.ClusterID = h.HostClusterID 
	WHERE h.HostClusterID is null
END
GO

ALTER TABLE [dbo].[STG_Cluster] ENABLE TRIGGER [trgClusterInserttoHost]
GO


