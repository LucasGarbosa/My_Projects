USE [DW_InfraDB]
GO

/****** CREATE TABLE STAGES THE FIRST STEP OF DATA TRANSFORMATION   Script Date: 16/04/2020 18:38:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_Address' and xtype='U')
CREATE TABLE [dbo].[STG_Address](
	[ID_Address] [int] IDENTITY(1,1) NOT NULL,
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
	[LoadDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*****######################################################### CLUSTER ################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_Cluster' and xtype='U')
CREATE TABLE [dbo].[STG_Cluster](
	[ID_Cluster] [int] IDENTITY(1,1) NOT NULL,
	[ClusterID] [nvarchar](256) NULL,
	[HostGroupID] [nvarchar](256) NULL,
	[ClusterName] [nvarchar](75) NULL,
	[IPAddress] [nvarchar](75) NULL,
	[QuorumDiskName] [nvarchar](75) NULL,
	[ValidationResult] [nvarchar](75) NULL,
	[ValidationReportPath] [nvarchar](256) NULL,
	[IsDynamicQuorumEnabled] [bit] NULL,
	[LoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cluster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*****######################################################## CLUSTERDISK ##################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_ClusterDisk' and xtype='U')
CREATE TABLE [dbo].[STG_ClusterDisk](
	[ID_ClusterDisk] [int] IDENTITY(1,1) NOT NULL,
	[DiskID] [nvarchar](256) NULL,
	[ClusterID] [nvarchar](256) NULL,
	[OwnerHostID] [nvarchar](75) NULL,
	[ClusterDiskName] [nvarchar](75) NULL,
	[IsOnline] [bit] NULL,
	[IsInUse] [bit] NULL,
	[LoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_ClusterDisk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*****######################################################## DISK #################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_Disk' and xtype='U')
CREATE TABLE [dbo].[STG_Disk](
	[ID_Disk] [int] IDENTITY(1,1) NOT NULL,
	[HostVolumeID] [nvarchar](256) NULL,
	[HostId] [nvarchar](256) NULL,
	[DiskName] [nvarchar](75) NULL,
	[FilePath] [nvarchar](256) NULL,
	[StorageName] [nvarchar](100) NULL,
	[LUNName] [nvarchar](100) NULL,
	[VMName] [nvarchar](100) NULL,
	[Accessibility] [nvarchar](75) NULL,
	[SrcObjectType] [nvarchar](75) NULL,
	[VhdxSize] [float] NULL,
	[CreationTime] [datetime] NULL,
	[ModifiedTime] [datetime] NULL,
	[LoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Disk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*****######################################################## HOST #################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_Host' and xtype='U')
CREATE TABLE [dbo].[STG_Host](
	[ID_Host] [int] IDENTITY(1,1) NOT NULL,
	[HostID] [nvarchar](256) NULL,
	[HostClusterID] [nvarchar](256) NULL,
	[PhysicalMachineId] [nvarchar](256) NULL,
	[HostName] [nvarchar](75) NULL,
	[IPAddress] [nvarchar](75) NULL,
	[MacAddress] [nvarchar](75) NULL,
	[ConnectionName] [nvarchar](75) NULL,
	[NameHostGroup] [nvarchar](75) NULL,
	[State] [nvarchar](75) NULL,
	[CPUPercentageReserve] [nvarchar](75) NULL,
	[DiskSpaceReserveMB] [nvarchar](75) NULL,
	[MaxDiskIOReservation] [nvarchar](75) NULL,
	[MemoryReserveMB] [nvarchar](75) NULL,
	[VhdPaths] [nvarchar](256) NULL,
	[LogicalProcessorCount] [nvarchar](75) NULL,
	[PhysicalProcessorCount] [nvarchar](75) NULL,
	[CoresPerProcessor] [nvarchar](75) NULL,
	[L2CacheSize] [nvarchar](75) NULL,
	[L3CacheSize] [nvarchar](75) NULL,
	[BusSpeed] [nvarchar](75) NULL,
	[ProcessorSpeed] [nvarchar](75) NULL,
	[ProcessorModel] [nvarchar](75) NULL,
	[ProcessorManufacturer] [nvarchar](75) NULL,
	[ProcessorArchitecture] [nvarchar](75) NULL,
	[ProcessorStepping] [nvarchar](75) NULL,
	[TotalMemory] [float] NULL,
	[OperatingSystemName] [nvarchar](75) NULL,
	[OperatingSystemVersion] [nvarchar](75) NULL,
	[OpticalDrives] [nvarchar](75) NULL,
	[IsoRWRepositoryAvailableBytes] [nvarchar](75) NULL,
	[CpuUtilization] [nvarchar](75) NULL,
	[AvailableMemory] [nvarchar](75) NULL,
	[MaximumMemoryPerVM] [nvarchar](75) NULL,
	[MinimumMemoryPerVM] [nvarchar](75) NULL,
	[SuggestedMaximumMemoryPerVM] [nvarchar](75) NULL,
	[ClusterNodeStatus] [nvarchar](75) NULL,
	[SecureMode] [nvarchar](75) NULL,
	[LoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Host] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*****######################################################## HostDisk #################################################################******/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_HostDisk' and xtype='U')
CREATE TABLE [dbo].[STG_HostDisk](
	[ID_HostDisk] [int] IDENTITY(1,1) NOT NULL,
	[DiskID] [nvarchar](256) NULL,
	[UniqueID] [nvarchar](256) NULL,
	[ClusterDiskID] [nvarchar](256) NULL,
	[HostID] [nvarchar](256) NULL,
	[DeviceID] [nvarchar](256) NULL,
	[ObjectID] [nvarchar](500) NULL,
	[Signature] [nvarchar](75) NULL,
	[Capacity] [float] NULL,
	[IsPassThroughCapable] [bit] NULL,
	[IsSanAttached] [bit] NULL,
	[IsClustered] [bit] NULL,
	[IsBootFromDisk] [bit] NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_HostDisk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*****######################################################## LUN #################################################################******/

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_Lun' and xtype='U')
CREATE TABLE [dbo].[STG_Lun](
	[ID_Lun] [int] IDENTITY(1,1) NOT NULL,
	[VolumeID] [nvarchar](256) NULL,
	[HostVolumeID] [nvarchar](256) NULL,
	[ClusterVolumeID] [nvarchar](256) NULL,
	[HostID] [nvarchar](256) NULL,
	[HostDiskID] [nvarchar](256) NULL,
	[Capacity] [float] NULL,
	[FreeSpace] [float] NULL,
	[FileSystem] [nvarchar](75) NULL,
	[VolumeLabel] [nvarchar](75) NULL,
	[LoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Lun] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*****######################################################## Storage #################################################################******/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_Storage' and xtype='U')
CREATE TABLE [dbo].[STG_Storage](
	[ID_Storage] [int] IDENTITY(1,1) NOT NULL,
	[Storage] [varchar](50) NULL,
	[MaxCapacity] [float] NULL,
	[DataCarga] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Storage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/*****######################################################## VM #################################################################******/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='STG_Vm' and xtype='U')
CREATE TABLE [dbo].[STG_Vm](
	[ID_VM] [int] IDENTITY(1,1) NOT NULL,
	[ObjectId] [nvarchar](256) NULL,
	[HostId] [nvarchar](256) NULL,
	[HWProfileId] [nvarchar](256) NULL,
	[VMInstanceId] [nvarchar](256) NULL,
	[VMName] [nvarchar](75) NULL,
	[State] [nvarchar](75) NULL,
	[OperatingSystem] [nvarchar](75) NULL,
	[VMResourceGroup] [nvarchar](75) NULL,
	[VMResource] [nvarchar](75) NULL,
	[Accessibility] [nvarchar](75) NULL,
	[IPv4Addresses] [nvarchar](256) NULL,
	[IPv4AddressType] [nvarchar](75) NULL,
	[VirtualNetwork] [nvarchar](75) NULL,
	[MACAddressType] [nvarchar](75) NULL,
	[DNSServers] [nvarchar](256) NULL,
	[DNSName] [nvarchar](75) NULL,
	[ProcessorCount] [int] NULL,
	[MemoryRAM] [int] NULL,
	[MemoryMaxRAM] [int] NULL,
	[MemoryWeight] [int] NULL,
	[CPUReserve] [int] NULL,
	[CPUMax] [int] NULL,
	[CPUPerVirtualNumaNodeMaximum] [int] NULL,
	[MemoryPerVirtualNumaNodeMaximumMB] [int] NULL,
	[DynamicMemoryMinimumMB] [int] NULL,
	[VMTotalSize] [float] NULL,
	[VMTotalMaxSize] [float] NULL,
	[CurrentAvailableMemoryPercent] [int] NULL,
	[AvailableMemoryBuffer] [int] NULL,
	[CreationTime] [datetime] NULL,
	[LoadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_VM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO