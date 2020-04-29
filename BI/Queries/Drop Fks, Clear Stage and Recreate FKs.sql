USE [DW_InfraDB]
GO

--DROP FKs DIMENSION

--Drop FK ADDRESS
IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_ADDRESS_DIM_ADDRESS')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_Address')
)
  ALTER TABLE DIM_Address DROP CONSTRAINT FK_STG_ADDRESS_DIM_ADDRESS

--Drop FK CLUSTERDISK
IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_CLUSTERDISK_DIM_CLUSTERDISK')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_ClusterDisk')
)
  ALTER TABLE DIM_ClusterDisk DROP CONSTRAINT FK_STG_CLUSTERDISK_DIM_CLUSTERDISK
  
 --Drop FK DISK
IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_DISK_DIM_DISK')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_Disk')
)
  ALTER TABLE DIM_Disk DROP CONSTRAINT FK_STG_DISK_DIM_DISK
  
--Drop FK HOSTDISK
IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_HOSTDISK_DIM_HOSTDISK')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_HostDisk')
)
  ALTER TABLE DIM_HostDisk DROP CONSTRAINT FK_STG_HOSTDISK_DIM_HOSTDISK
  
--Drop FK LUN
IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_LUN_DIM_LUN')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_Lun')
)
  ALTER TABLE DIM_Lun DROP CONSTRAINT FK_STG_LUN_DIM_LUN
  
--Drop FK STORAGE
IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_Storage_DIM_Storage')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_Storage')
)
  ALTER TABLE DIM_Storage DROP CONSTRAINT FK_STG_Storage_DIM_Storage
  
--Drop FK VM
IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_VM_DIM_VM')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_Vm')
)
  ALTER TABLE DIM_Vm DROP CONSTRAINT FK_STG_VM_DIM_VM

--Drop FK CLUSTERHOST
IF EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_Cluster_DIM_ClusterHost')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_ClusterHost')
)
  ALTER TABLE DIM_ClusterHost DROP CONSTRAINT FK_STG_Cluster_DIM_ClusterHost
  ALTER TABLE DIM_ClusterHost DROP CONSTRAINT FK_STG_Host_DIM_ClusterHost
  
  
--CLEAR DATA TABLE TO NEW CHARGE--
Truncate table [dbo].[STG_Address]
Truncate table [dbo].[STG_Cluster]
Truncate table [dbo].[STG_ClusterDisk]
Truncate table [dbo].[STG_Disk]
Truncate table [dbo].[STG_Host]
Truncate table [dbo].[STG_HostDisk]
Truncate table [dbo].[STG_Lun]
Truncate table [dbo].[STG_Storage]
Truncate table [dbo].[STG_Vm]

--CREATE FKs DIMENSION 
--CRIA FK ADDRESS
ALTER TABLE [dbo].[DIM_Address]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_ADDRESS_DIM_ADDRESS] FOREIGN KEY([FK_Id_Address])
REFERENCES [dbo].[STG_Address] ([ID_Address])
GO

ALTER TABLE [dbo].[DIM_Address] NOCHECK CONSTRAINT [FK_STG_ADDRESS_DIM_ADDRESS]
GO

--CRIA FK CLUSTERDISK
ALTER TABLE [dbo].[DIM_ClusterDisk]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_CLUSTERDISK_DIM_CLUSTERDISK] FOREIGN KEY([FK_Id_ClusterDisk])
REFERENCES [dbo].[STG_ClusterDisk] ([ID_ClusterDisk])
GO

ALTER TABLE [dbo].[DIM_ClusterDisk] NOCHECK CONSTRAINT [FK_STG_CLUSTERDISK_DIM_CLUSTERDISK]
GO

--CRIA FK CLUSTERHOST
ALTER TABLE [dbo].[DIM_ClusterHost]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_HOST_DIM_CLUSTERHOST] FOREIGN KEY([FK_ID_Host])
REFERENCES [dbo].[STG_Host] ([ID_Host])
GO

ALTER TABLE [dbo].[DIM_ClusterHost] NOCHECK CONSTRAINT [FK_STG_HOST_DIM_CLUSTERHOST]
GO

ALTER TABLE [dbo].[DIM_ClusterHost]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_Cluster_DIM_CLUSTERHOST] FOREIGN KEY([FK_ID_Cluster])
REFERENCES [dbo].[STG_Cluster] ([ID_Cluster])
GO

ALTER TABLE [dbo].[DIM_ClusterHost] NOCHECK CONSTRAINT [FK_STG_Cluster_DIM_CLUSTERHOST]
GO

--CRIA FK DISK
ALTER TABLE [dbo].[DIM_Disk]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_DISK_DIM_DISK] FOREIGN KEY([FK_Id_Disk])
REFERENCES [dbo].[STG_Disk] ([ID_Disk])
GO

ALTER TABLE [dbo].[DIM_Disk] NOCHECK CONSTRAINT [FK_STG_DISK_DIM_DISK]
GO

--CRIA FK HOSTDISK
ALTER TABLE [dbo].[DIM_HostDisk]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_HOSTDISK_DIM_HOSTDISK] FOREIGN KEY([FK_Id_HostDisk])
REFERENCES [dbo].[STG_HostDisk] ([ID_HostDisk])
GO

ALTER TABLE [dbo].[DIM_HostDisk] NOCHECK CONSTRAINT [FK_STG_HOSTDISK_DIM_HOSTDISK]
GO

--CRIA FK LUN
ALTER TABLE [dbo].[DIM_Lun]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_LUN_DIM_LUN] FOREIGN KEY([FK_Id_Lun])
REFERENCES [dbo].[STG_Lun] ([ID_Lun])
GO

ALTER TABLE [dbo].[DIM_Lun] NOCHECK CONSTRAINT [FK_STG_LUN_DIM_LUN]
GO

--CRIA FK STORAGE
ALTER TABLE [dbo].[DIM_Storage]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_Storage_DIM_Storage] FOREIGN KEY([FK_Id_Storage])
REFERENCES [dbo].[STG_Storage] ([ID_Storage])
GO

ALTER TABLE [dbo].[DIM_Storage] NOCHECK CONSTRAINT [FK_STG_Storage_DIM_Storage]
GO

--CRIA FK VM
ALTER TABLE [dbo].[DIM_Vm]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_VM_DIM_VM] FOREIGN KEY([FK_Id_VM])
REFERENCES [dbo].[STG_Vm] ([ID_VM])
GO

ALTER TABLE [dbo].[DIM_Vm] NOCHECK CONSTRAINT [FK_STG_VM_DIM_VM]
GO

