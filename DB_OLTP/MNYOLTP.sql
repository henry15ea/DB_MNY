-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- MNYOLTP.dbo.tbl_Categoria definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Categoria;

CREATE TABLE MNYOLTP.dbo.tbl_Categoria (
	ID int NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Descripcion varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__tbl_Cate__3214EC272858C48C PRIMARY KEY (ID)
);


-- MNYOLTP.dbo.tbl_Departamento definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Departamento;

CREATE TABLE MNYOLTP.dbo.tbl_Departamento (
	ID int NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__tbl_Depa__3214EC270AA4D55C PRIMARY KEY (ID)
);


-- MNYOLTP.dbo.tbl_TipoMovimiento definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_TipoMovimiento;

CREATE TABLE MNYOLTP.dbo.tbl_TipoMovimiento (
	ID int NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Descripcion varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__tbl_Tipo__3214EC27FA75D342 PRIMARY KEY (ID)
);


-- MNYOLTP.dbo.tbl_metodoPago definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_metodoPago;

CREATE TABLE MNYOLTP.dbo.tbl_metodoPago (
	idMetodo int IDENTITY(0,1) NOT NULL,
	metodo varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'EFECTIVO' NULL,
	Descripcion varchar(120) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'Pago en Tienda' NULL,
	CONSTRAINT PK__tbl_meto__E123E7E64E8EE077 PRIMARY KEY (idMetodo)
);


-- MNYOLTP.dbo.tbl_rol definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_rol;

CREATE TABLE MNYOLTP.dbo.tbl_rol (
	rolId int IDENTITY(0,1) NOT NULL,
	nameRol varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'Colaborador de Sala' NULL,
	Salario money NULL,
	Estado bit DEFAULT 0 NULL,
	CONSTRAINT PK__tbl_rol__54023634B147EF7E PRIMARY KEY (rolId)
);


-- MNYOLTP.dbo.tbl_Municipio definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Municipio;

CREATE TABLE MNYOLTP.dbo.tbl_Municipio (
	ID int NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DepartamentoID int NULL,
	CONSTRAINT PK__tbl_Muni__3214EC2713621150 PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Munic__Depar__38996AB5 FOREIGN KEY (DepartamentoID) REFERENCES MNYOLTP.dbo.tbl_Departamento(ID)
);


-- MNYOLTP.dbo.tbl_Proveedor definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Proveedor;

CREATE TABLE MNYOLTP.dbo.tbl_Proveedor (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Direccion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Telefono varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CorreoElectronico varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	EstadoRel bit DEFAULT 0 NULL,
	MunicipioID int NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__tbl_Prov__3214EC27CDB3AB95 PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Prove__Munic__4316F928 FOREIGN KEY (MunicipioID) REFERENCES MNYOLTP.dbo.tbl_Municipio(ID)
);


-- MNYOLTP.dbo.tbl_Articulo definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Articulo;

CREATE TABLE MNYOLTP.dbo.tbl_Articulo (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Descripcion varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Garantia varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Precio money NULL,
	PrecioNeto money NULL,
	PrecioVenta money NULL,
	Descuento decimal(5,2) NULL,
	Estado bit DEFAULT 0 NULL,
	CategoriaID int NOT NULL,
	ProveedorID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__tbl_Arti__3214EC2769A9C412 PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Artic__Categ__47DBAE45 FOREIGN KEY (CategoriaID) REFERENCES MNYOLTP.dbo.tbl_Categoria(ID),
	CONSTRAINT FK__tbl_Artic__Prove__48CFD27E FOREIGN KEY (ProveedorID) REFERENCES MNYOLTP.dbo.tbl_Proveedor(ID)
);


-- MNYOLTP.dbo.tbl_Bodega definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Bodega;

CREATE TABLE MNYOLTP.dbo.tbl_Bodega (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Ubicacion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Capacidad int NULL,
	Descripcion varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MunicipioID int NULL,
	Estado bit DEFAULT 0 NULL,
	CONSTRAINT PK__tbl_Bode__3214EC2736C75E99 PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Bodeg__Munic__3C69FB99 FOREIGN KEY (MunicipioID) REFERENCES MNYOLTP.dbo.tbl_Municipio(ID)
);


-- MNYOLTP.dbo.tbl_Cliente definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Cliente;

CREATE TABLE MNYOLTP.dbo.tbl_Cliente (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Apellidos varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Direccion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Telefono varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CorreoElectronico varchar(120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	MunicipioID int NOT NULL,
	Estado bit DEFAULT 0 NOT NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__tbl_Clie__3214EC27FF2F50DE PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Clien__Munic__5629CD9C FOREIGN KEY (MunicipioID) REFERENCES MNYOLTP.dbo.tbl_Municipio(ID)
);


-- MNYOLTP.dbo.tbl_Empleado definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Empleado;

CREATE TABLE MNYOLTP.dbo.tbl_Empleado (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Nombre varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Apellidos varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Direccion varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Telefono varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CorreoElectronico varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	RolEmpleado int NOT NULL,
	FechaContratacion date NULL,
	MunicipioID int NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__tbl_Empl__3214EC27B54B364F PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Emple__Munic__5EBF139D FOREIGN KEY (MunicipioID) REFERENCES MNYOLTP.dbo.tbl_Municipio(ID),
	CONSTRAINT pk_refEmpleado FOREIGN KEY (RolEmpleado) REFERENCES MNYOLTP.dbo.tbl_rol(rolId)
);


-- MNYOLTP.dbo.tbl_Existencias definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Existencias;

CREATE TABLE MNYOLTP.dbo.tbl_Existencias (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ArticuloID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ExistenciasActuales int NOT NULL,
	ExistenciasMinimas int NOT NULL,
	ExistenciasMaximas int NOT NULL,
	BodegaID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FechaActualizacion date NULL,
	EmpleadoID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	EstadoExistencias bit DEFAULT 0 NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__tbl_Exis__3214EC2738E9BED5 PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Exist__Artic__7D439ABD FOREIGN KEY (ArticuloID) REFERENCES MNYOLTP.dbo.tbl_Articulo(ID),
	CONSTRAINT FK__tbl_Exist__Bodeg__7C4F7684 FOREIGN KEY (BodegaID) REFERENCES MNYOLTP.dbo.tbl_Bodega(ID),
	CONSTRAINT FK__tbl_Exist__Emple__7B5B524B FOREIGN KEY (EmpleadoID) REFERENCES MNYOLTP.dbo.tbl_Empleado(ID)
);


-- MNYOLTP.dbo.tbl_Factura definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_Factura;

CREATE TABLE MNYOLTP.dbo.tbl_Factura (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	NumeroFactura varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FechaFactura date NULL,
	ClienteID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	EmpleadoID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	TotalCompra money NULL,
	Impuesto decimal(18,0) NULL,
	metodoPago int DEFAULT 0 NOT NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__tbl_Fact__3214EC2728664FEB PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Factu__Clien__70DDC3D8 FOREIGN KEY (ClienteID) REFERENCES MNYOLTP.dbo.tbl_Cliente(ID),
	CONSTRAINT FK__tbl_Factu__Emple__71D1E811 FOREIGN KEY (EmpleadoID) REFERENCES MNYOLTP.dbo.tbl_Empleado(ID),
	CONSTRAINT pkref_mpago FOREIGN KEY (metodoPago) REFERENCES MNYOLTP.dbo.tbl_metodoPago(idMetodo)
);


-- MNYOLTP.dbo.tbl_MovimientoInventario definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_MovimientoInventario;

CREATE TABLE MNYOLTP.dbo.tbl_MovimientoInventario (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	TipoMovimientoID int NULL,
	FechaMovimiento datetime NULL,
	FechaCaducidad date NULL,
	ArticuloID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cantidad int NULL,
	BodegaOrigenID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BodegaDestinoID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Detalles varchar(512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__tbl_Movi__3214EC270AC2BE30 PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Movim__Artic__4E88ABD4 FOREIGN KEY (ArticuloID) REFERENCES MNYOLTP.dbo.tbl_Articulo(ID),
	CONSTRAINT FK__tbl_Movim__Bodeg__4F7CD00D FOREIGN KEY (BodegaOrigenID) REFERENCES MNYOLTP.dbo.tbl_Bodega(ID),
	CONSTRAINT FK__tbl_Movim__Bodeg__5070F446 FOREIGN KEY (BodegaDestinoID) REFERENCES MNYOLTP.dbo.tbl_Bodega(ID),
	CONSTRAINT FK__tbl_Movim__TipoM__5165187F FOREIGN KEY (TipoMovimientoID) REFERENCES MNYOLTP.dbo.tbl_TipoMovimiento(ID)
);


-- MNYOLTP.dbo.tbl_AccesoSistema definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_AccesoSistema;

CREATE TABLE MNYOLTP.dbo.tbl_AccesoSistema (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Usuario varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT 'USER123' NULL,
	Pass varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT '202CB962AC59075B964B07152D234B70' NULL,
	Estado bit DEFAULT 0 NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT UQ__tbl_Acce__E3237CF704660B63 UNIQUE (Usuario),
	CONSTRAINT pk_access PRIMARY KEY (ID),
	CONSTRAINT fk_UseRef FOREIGN KEY (ID) REFERENCES MNYOLTP.dbo.tbl_Empleado(ID)
);


-- MNYOLTP.dbo.tbl_DetalleFactura definition

-- Drop table

-- DROP TABLE MNYOLTP.dbo.tbl_DetalleFactura;

CREATE TABLE MNYOLTP.dbo.tbl_DetalleFactura (
	ID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	FacturaID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ArticuloID varchar(250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cantidad int NULL,
	PrecioUnitario money NULL,
	FechaReg datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__tbl_Deta__3214EC27F202DC6B PRIMARY KEY (ID),
	CONSTRAINT FK__tbl_Detal__Artic__76969D2E FOREIGN KEY (ArticuloID) REFERENCES MNYOLTP.dbo.tbl_Articulo(ID),
	CONSTRAINT FK__tbl_Detal__Factu__75A278F5 FOREIGN KEY (FacturaID) REFERENCES MNYOLTP.dbo.tbl_Factura(ID)
);


