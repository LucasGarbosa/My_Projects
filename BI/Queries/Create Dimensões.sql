USE [DW_InfraDB]
GO

/****** CREATE TABLE DIMENSÃO E FATO   Script Date: 16/04/2020 18:38:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_Address' and xtype='U')
CREATE TABLE [dbo].[DIM_Address](
	[SK_Address] [int] IDENTITY(1,1) NOT NULL,
	[FK_Id_Address] [int] NOT NULL,
	[ClusterName] [nvarchar](75) NOT NULL,
	[Datacenter] [varchar](50) NULL,
	[Type1] [varchar](50) NULL,
	[Type2] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Number] [int] NULL,
	[Complement] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_ADDRESS_DIM_ADDRESS')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_Address')
)

ALTER TABLE [dbo].[DIM_Address]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_ADDRESS_DIM_ADDRESS] FOREIGN KEY([FK_Id_Address])
REFERENCES [dbo].[STG_Address] ([ID_Address])
GO

ALTER TABLE [dbo].[DIM_Address] NOCHECK CONSTRAINT [FK_STG_ADDRESS_DIM_ADDRESS]
GO

/*****######################################################### CLUSTERDISK ################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_ClusterDisk' and xtype='U')
CREATE TABLE [dbo].[DIM_ClusterDisk](
	[SK_ClusterDisk] [int] IDENTITY(1,1) NOT NULL,
	[FK_Id_ClusterDisk] [int] NOT NULL,
	[DiskID] [nvarchar](300) NULL,
	[ClusterDiskName] [nvarchar](256) NULL,
	[IsOnline] [bit] NULL,
	[IsInUse] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_ClusterDisk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_CLUSTERDISK_DIM_CLUSTERDISK')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_ClusterDisk')
)
ALTER TABLE [dbo].[DIM_ClusterDisk]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_CLUSTERDISK_DIM_CLUSTERDISK] FOREIGN KEY([FK_Id_ClusterDisk])
REFERENCES [dbo].[STG_ClusterDisk] ([ID_ClusterDisk])
GO

/*****######################################################## CLUSTERHOST ##################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_ClusterHost' and xtype='U')
CREATE TABLE [dbo].[DIM_ClusterHost](
	[SK_ClusterHost] [int] IDENTITY(1,1) NOT NULL,
	[FK_ID_Cluster] [int] NOT NULL,
	[FK_ID_Host] [int] NOT NULL,
	[HostID] [nvarchar](300) NOT NULL,
	[ClusterID] [nvarchar](300) NOT NULL,
	[ClusterName] [nvarchar](75) NOT NULL,
	[HostName] [nvarchar](75) NOT NULL,
	[HostGroup] [nvarchar](75) NOT NULL,
	[HostIPAddress] [nvarchar](75) NULL,
	[ClusterIPAddress] [nvarchar](75) NULL,
	[MacAddress] [nvarchar](75) NULL,
	[ConnectionName] [nvarchar](75) NULL,
	[ProcessorSpeed] [int] NULL,
	[ProcessorModel] [nvarchar](75) NULL,
	[ProcessorManufacturer] [nvarchar](75) NULL,
	[OperatingSystemName] [nvarchar](75) NULL,
	[CoresPerProcessor] [int] NULL,
	[LogicalProcessorCount] [int] NULL,
	[PhysicalProcessorCount] [int] NULL,
	[AvailableMemory] [float] NULL,
	[TotalMemory] [float] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK__DIM_ClusterHost] PRIMARY KEY CLUSTERED 
(
	[SK_ClusterHost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_Cluster_DIM_CLUSTERHOST')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_ClusterHost')
)

ALTER TABLE [dbo].[DIM_ClusterHost]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_Cluster_DIM_CLUSTERHOST] FOREIGN KEY([FK_ID_Cluster])
REFERENCES [dbo].[STG_Cluster] ([ID_Cluster])
GO

ALTER TABLE [dbo].[DIM_ClusterHost] NOCHECK CONSTRAINT [FK_STG_Cluster_DIM_CLUSTERHOST]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_HOST_DIM_CLUSTERHOST')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_ClusterHost')
)
ALTER TABLE [dbo].[DIM_ClusterHost]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_HOST_DIM_CLUSTERHOST] FOREIGN KEY([FK_ID_Host])
REFERENCES [dbo].[STG_Host] ([ID_Host])
GO

ALTER TABLE [dbo].[DIM_ClusterHost] NOCHECK CONSTRAINT [FK_STG_HOST_DIM_CLUSTERHOST]
GO

/*****######################################################## DISK #################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_Disk' and xtype='U')
CREATE TABLE [dbo].[DIM_Disk](
	[SK_Disk] [int] IDENTITY(1,1) NOT NULL,
	[FK_Id_Disk] [int] NULL,
	[HostVolumeID] [nvarchar](256) NULL,
	[HostId] [nvarchar](256) NULL,
	[DiskName] [nvarchar](75) NULL,
	[FilePath] [nvarchar](256) NULL,
	[StorageName] [nvarchar](100) NULL,
	[LUNName] [nvarchar](100) NULL,
	[VMName] [nvarchar](100) NULL,
	[Accessibility] [nvarchar](75) NULL,
	[SrcObjectType] [nvarchar](75) NULL,
	[Qtd_Disk] [float] NULL,
	[CreationTime] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Disk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_DISK_DIM_DISK')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_Disk')
)
ALTER TABLE [dbo].[DIM_Disk]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_DISK_DIM_DISK] FOREIGN KEY([FK_Id_Disk])
REFERENCES [dbo].[STG_Disk] ([ID_Disk])
GO

ALTER TABLE [dbo].[DIM_Disk] NOCHECK CONSTRAINT [FK_STG_DISK_DIM_DISK]
GO

/*****######################################################## HOSTDISK #################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_HostDisk' and xtype='U')
CREATE TABLE [dbo].[DIM_HostDisk](
	[SK_HostDisk] [int] IDENTITY(1,1) NOT NULL,
	[FK_Id_HostDisk] [int] NOT NULL,
	[ClusterDiskID] [nvarchar](256) NULL,
	[DiskID] [nvarchar](300) NULL,
	[HostID] [nvarchar](300) NULL,
	[Signature] [bigint] NULL,
	[Capacity] [Float] NULL,
	[IsPassThroughCapable] [bit] NULL,
	[IsSanAttached] [bit] NULL,
	[IsClustered] [bit] NULL,
	[IsBootFromDisk] [bit] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_HostDisk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_HOSTDISK_DIM_HOSTDISK')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_HostDisk')
)
ALTER TABLE [dbo].[DIM_HostDisk]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_HOSTDISK_DIM_HOSTDISK] FOREIGN KEY([FK_Id_HostDisk])
REFERENCES [dbo].[STG_HostDisk] ([ID_HostDisk])
GO

ALTER TABLE [dbo].[DIM_HostDisk] NOCHECK CONSTRAINT [FK_STG_HOSTDISK_DIM_HOSTDISK]
GO

/*****######################################################## LUN #################################################################******/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_LUN' and xtype='U')
CREATE TABLE [dbo].[DIM_Lun](
	[SK_Lun] [int] IDENTITY(1,1) NOT NULL,
	[FK_Id_Lun] [int] NOT NULL,
	[HostDiskID] [nvarchar](300) NULL,
	[VolumeID] [nvarchar](300) NULL,
	[FileSystem] [nvarchar](256) NULL,
	[VolumeLabel] [nvarchar](256) NULL,
	[LunCapacity] [float] NULL,
	[LunFreeSpace] [float] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Lun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_LUN_DIM_LUN')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_LUN')
)
ALTER TABLE [dbo].[DIM_Lun]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_LUN_DIM_LUN] FOREIGN KEY([FK_Id_Lun])
REFERENCES [dbo].[STG_Lun] ([ID_Lun])
GO

ALTER TABLE [dbo].[DIM_Lun] NOCHECK CONSTRAINT [FK_STG_LUN_DIM_LUN]
GO

/*****######################################################## STORAGE #################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_STORAGE' and xtype='U')
CREATE TABLE [dbo].[DIM_Storage](
	[SK_Storage] [int] IDENTITY(1,1) NOT NULL,
	[FK_Id_Storage] [int] NOT NULL,
	[Storage] [varchar](50) NULL,
	[StorageMaxCapacity] [float] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_Storage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_Storage_DIM_Storage')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_STORAGE')
)
ALTER TABLE [dbo].[DIM_Storage]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_Storage_DIM_Storage] FOREIGN KEY([FK_Id_Storage])
REFERENCES [dbo].[STG_Storage] ([ID_Storage])
GO

ALTER TABLE [dbo].[DIM_Storage] NOCHECK CONSTRAINT [FK_STG_Storage_DIM_Storage]
GO

/*****######################################################## VM #################################################################******/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DIM_VM' and xtype='U')
CREATE TABLE [dbo].[DIM_Vm](
	[SK_VM] [int] IDENTITY(1,1) NOT NULL,
	[FK_Id_VM] [int] NULL,
	[HostID] [nvarchar](256) NULL,
	[VMName] [nvarchar](100) NULL,
	[VMIPAddress] [nvarchar](256) NULL,
	[DNSServers] [nvarchar](256) NULL,
	[DNSName] [nvarchar](75) NULL,
	[Status] [nvarchar](75) NULL,
	[OperatingSystem] [nvarchar](100) NULL,
	[VCPU_Used] [int] NULL,
	[VM_Size] [float] NULL,
	[VM_MaxSize] [float] NULL,
	[VM_MemoryRAM] [int] NULL,
	[VM_MaxRAM] [int] NULL,
	[CreationTime] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[LoadDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK__FT_VM__8B63A16458F68EF4] PRIMARY KEY CLUSTERED 
(
	[SK_VM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.FK_STG_VM_DIM_VM')
   AND parent_object_id = OBJECT_ID(N'dbo.DIM_VM')
)
ALTER TABLE [dbo].[DIM_Vm]  WITH NOCHECK ADD  CONSTRAINT [FK_STG_VM_DIM_VM] FOREIGN KEY([FK_Id_VM])
REFERENCES [dbo].[STG_Vm] ([ID_VM])
GO

ALTER TABLE [dbo].[DIM_Vm] NOCHECK CONSTRAINT [FK_STG_VM_DIM_VM]
GO

/*****######################################################## FATO #################################################################******/
/****** Object:  Table [dbo].[FATO]    Script Date: 23/04/2020 17:59:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='FATO' and xtype='U')
CREATE TABLE [dbo].[FATO](
	[Id_Reg] [int] IDENTITY(1,1) NOT NULL,
	[SK_Tempo] [int] NULL,
	[SK_Address] [int] NULL,
	[SK_ClusterHost] [int] NULL,
	[SK_ClusterDisk] [int] NULL,
	[SK_Disk] [int] NULL,
	[SK_Lun] [int] NULL,
	[SK_HostDisk] [int] NULL,
	[SK_Storage] [int] NULL,
	[SK_VM] [int] NULL,
	[VMCreationTime] [datetime] NULL,
	[DiskCreationTime] [datetime] NULL,
	[LoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Reg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.SK_DIM_ADDRESS_FATO')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)

ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_ADDRESS_FATO] FOREIGN KEY([SK_Address])
REFERENCES [dbo].[DIM_Address] ([SK_Address])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_ADDRESS_FATO]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.[SK_DIM_CALENDAR_FATO]')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)
ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_CALENDAR_FATO] FOREIGN KEY([SK_Tempo])
REFERENCES [dbo].[DIM_Calendar] ([SK_Tempo])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_CALENDAR_FATO]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.[SK_DIM_CLUSTERDISK_FATO]')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)
ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_CLUSTERDISK_FATO] FOREIGN KEY([SK_ClusterDisk])
REFERENCES [dbo].[DIM_ClusterDisk] ([SK_ClusterDisk])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_CLUSTERDISK_FATO]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.[SK_DIM_CLUSTERHOST_FATO]')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)
ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_CLUSTERHOST_FATO] FOREIGN KEY([SK_ClusterHost])
REFERENCES [dbo].[DIM_ClusterHost] ([SK_ClusterHost])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_CLUSTERHOST_FATO]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.[SK_DIM_DISK_FATO]')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)
ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_DISK_FATO] FOREIGN KEY([SK_Disk])
REFERENCES [dbo].[DIM_Disk] ([SK_Disk])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_DISK_FATO]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.[SK_DIM_HOSTDISK_FATO]')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)
ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_HOSTDISK_FATO] FOREIGN KEY([SK_HOSTDISK])
REFERENCES [dbo].[DIM_HOSTDISK] ([SK_HOSTDISK])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_HOSTDISK_FATO]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.[SK_DIM_LUN_FATO]')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)
ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_LUN_FATO] FOREIGN KEY([SK_LUN])
REFERENCES [dbo].[DIM_LUN] ([SK_LUN])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_LUN_FATO]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.[SK_DIM_STORAGE_FATO]')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)
ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_STORAGE_FATO] FOREIGN KEY([SK_STORAGE])
REFERENCES [dbo].[DIM_STORAGE] ([SK_STORAGE])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_STORAGE_FATO]
GO

IF NOT EXISTS (SELECT * 
  FROM sys.foreign_keys 
   WHERE object_id = OBJECT_ID(N'dbo.[SK_DIM_VM_FATO]')
   AND parent_object_id = OBJECT_ID(N'dbo.FATO')
)
ALTER TABLE [dbo].[FATO]  WITH NOCHECK ADD  CONSTRAINT [SK_DIM_VM_FATO] FOREIGN KEY([SK_VM])
REFERENCES [dbo].[DIM_VM] ([SK_VM])
GO

ALTER TABLE [dbo].[FATO] NOCHECK CONSTRAINT [SK_DIM_VM_FATO]
GO