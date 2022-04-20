CREATE TABLE [dbo].[Sucursal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](max) NULL,
	[nombre] [nvarchar](max) NULL,
	[fechaEstatus] [datetime] NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Servicio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](max) NULL,
	[nombre] [nvarchar](max) NULL,
	[descripcion] [nvarchar](max) NULL,
	[precio] decimal(12,2) NULL,
	[fechaEstatus] [datetime] NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](max) NULL,
	[nombre] [nvarchar](max) NULL,
	[direccion] [nvarchar](max) NULL,
	[saldo] decimal(12,2) NULL,
	[fechaEstatus] [datetime] NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
DROP  TABLE [dbo].[ConceptoIE]
GO
CREATE TABLE [dbo].[ConceptoIE] (
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](max) NULL,
	[nombre] [nvarchar](max) NULL,
	[direccion] [nvarchar](max) NULL,
	[tipo] [nvarchar](1) NULL,
	[IdCategoria] [int] NULL,
	[fechaEstatus] [datetime] NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_ConceptoIE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

DROP  TABLE [dbo].[ControlIE]
GO
CREATE TABLE [dbo].[ControlIE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](max) NULL,
	[nombre] [nvarchar](max) NULL,
	[descripcion] [nvarchar](max) NULL,
	[fecha] [datetime] NULL,
	[tipo] [nvarchar](1) NULL,
	[IdConceptoIE] [int] NOT NULL,
	[IdOrdenServicio] [int] NULL,
	[importe] decimal(12,2) NULL,
	[fechaEstatus] [datetime] NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_ControlIE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

DROP  TABLE [dbo].[OrdenServicio]
GO
CREATE TABLE [dbo].[OrdenServicio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](max) NULL,
	[nombre] [nvarchar](max) NULL,
	[descripcion] [nvarchar](max) NULL,
	[fecha] [datetime] NULL,
	[IdCliente] [int] NOT NULL,
	[formaPago] [nvarchar](1) NULL,
	[importe] decimal(12,2) NULL,
	[saldo] decimal(12,2) NULL,
	[fechaEstatus] [datetime] NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_OrdenServicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

DROP  TABLE [dbo].[OrdenServicioPartida]
GO
CREATE TABLE [dbo].[OrdenServicioPartida](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](max) NULL,
	[nombre] [nvarchar](max) NULL,
	[descripcion] [nvarchar](max) NULL,
	IdServicio  [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[importe] decimal(12,2) NULL,
	[fechaEstatus] [datetime] NULL,
	[estatus] [smallint] NULL,
 CONSTRAINT [PK_OrdenServicioPartida] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO