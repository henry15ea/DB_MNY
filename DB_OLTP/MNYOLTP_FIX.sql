
create database MNYOLTP
go
use MNYOLTP
go
CREATE TABLE tbl_Departamento (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);
go
CREATE TABLE tbl_Municipio (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
	DepartamentoID INT,
	FOREIGN KEY (DepartamentoID) REFERENCES tbl_Departamento(ID)
);
go
CREATE TABLE tbl_Bodega (
    ID VARCHAR(250) PRIMARY KEY,
    Nombre VARCHAR(255),
    Ubicacion VARCHAR(255),
    Capacidad INT,
    Descripcion VARCHAR(250),
		MunicipioID INT,
		Estado bit DEFAULT 0,
	FOREIGN KEY (MunicipioID) REFERENCES tbl_Municipio(ID)
);
go
CREATE TABLE tbl_Categoria (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion VARCHAR(250)
);

go
CREATE TABLE tbl_Proveedor (
    ID VARCHAR(250) PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    CorreoElectronico VARCHAR(255),
		EstadoRel bit DEFAULT 0,
		MunicipioID INT,
		FechaReg DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (MunicipioID) REFERENCES tbl_Municipio(ID)
);
go
CREATE TABLE tbl_Articulo (
    ID VARCHAR(250) PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripcion VARCHAR(250),
    Garantia VARCHAR(500),
    Precio MONEY,
		PrecioNeto MONEY,
		PrecioVenta MONEY,
		Descuento DECIMAL(5,2),
    Estado BIT DEFAULT 0,
    CategoriaID INT not null,
    ProveedorID VARCHAR(250) not NULL,
		FechaReg DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoriaID) REFERENCES tbl_Categoria(ID),
    FOREIGN KEY (ProveedorID) REFERENCES tbl_Proveedor(ID)
);
go
--(ingreso, devolución,traslado, ensamblaje, etc.)
CREATE TABLE tbl_TipoMovimiento(
	ID INT PRIMARY KEY,
	Nombre VARCHAR(255),
  Descripcion VARCHAR(250)
);
go
CREATE TABLE tbl_MovimientoInventario (
    ID VARCHAR(250) PRIMARY KEY,
    TipoMovimientoID INT,
    FechaMovimiento DATETIME,
		FechaCaducidad DATE,
    ArticuloID VARCHAR(250),
    Cantidad INT,
    BodegaOrigenID VARCHAR(250),
    BodegaDestinoID VARCHAR(250),
    Detalles VARCHAR(512),
		FechaReg DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ArticuloID) REFERENCES tbl_Articulo(ID),
    FOREIGN KEY (BodegaOrigenID) REFERENCES tbl_Bodega(ID),
    FOREIGN KEY (BodegaDestinoID) REFERENCES tbl_Bodega(ID),
	FOREIGN KEY (TipoMovimientoID) REFERENCES tbl_TipoMovimiento(ID)
);
go
CREATE TABLE tbl_Cliente (
    ID VARCHAR(250) PRIMARY KEY,
    Nombre VARCHAR(255) not null,
		Apellidos VARCHAR(255) not null,
    Direccion VARCHAR(255) not NULL,
    Telefono VARCHAR(20) not NULL,
    CorreoElectronico VARCHAR(120) not NULL,
		MunicipioID INT not NULL,
		Estado bit DEFAULT 0 not null,
		FechaReg DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (MunicipioID) REFERENCES tbl_Municipio(ID)
);
go 
CREATE TABLE tbl_rol(
	rolId int IDENTITY(0,1) PRIMARY KEY,
	nameRol VARCHAR(250) DEFAULT 'Colaborador de Sala',
	Salario Money,
	Estado bit DEFAULT 0,
	
);

go
CREATE TABLE tbl_Empleado (
    ID VARCHAR(250) PRIMARY KEY,
    Nombre VARCHAR(255) not null,
		Apellidos VARCHAR(250) not NULL,
    Direccion VARCHAR(255) not NULL,
    Telefono VARCHAR(20) not NULL,
    CorreoElectronico VARCHAR(255) not NULL,
    RolEmpleado int not null,
    FechaContratacion DATE,
		MunicipioID INT,
		FechaReg DATETIME DEFAULT GETDATE(),
	constraint pk_refEmpleado FOREIGN key (RolEmpleado) REFERENCES tbl_rol(rolId),
	FOREIGN KEY (MunicipioID) REFERENCES tbl_Municipio(ID)
);

GO
drop table tbl_metodoPago;

CREATE TABLE tbl_metodoPago(
	idMetodo int IDENTITY(0,1) primary key,
	metodo VARCHAR(50) DEFAULT 'EFECTIVO',
	Descripcion VARCHAR(120) DEFAULT 'Pago en Tienda'
);

go
CREATE TABLE tbl_Factura (
    ID VARCHAR(250) PRIMARY KEY,
    NumeroFactura VARCHAR(250),
    FechaFactura DATE,
    ClienteID VARCHAR(250) not NULL,
		EmpleadoID VARCHAR(250) not null,
		TotalCompra money,
		Impuesto DECIMAL,
		metodoPago INT not NULL DEFAULT 0,
		FechaReg DATETIME DEFAULT GETDATE(),
		CONSTRAINT pkref_mpago FOREIGN KEY (metodoPago) REFERENCES tbl_metodoPago(idMetodo),
    FOREIGN KEY (ClienteID) REFERENCES tbl_Cliente(ID),
		FOREIGN KEY (EmpleadoID) REFERENCES tbl_Empleado(ID)
);
go
CREATE TABLE tbl_DetalleFactura (
    ID VARCHAR(250) PRIMARY KEY,
    FacturaID VARCHAR(250),
		ArticuloID VARCHAR(250),
    Cantidad INT,
    PrecioUnitario MONEY,
		FechaReg DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (FacturaID) REFERENCES tbl_Factura(ID),
    FOREIGN KEY (ArticuloID) REFERENCES tbl_Articulo(ID)
);
go
CREATE TABLE tbl_Existencias(
	ID VARCHAR(250) PRIMARY KEY,
	ArticuloID VARCHAR(250) not NULL,
	ExistenciasActuales INT not NULL,
	ExistenciasMinimas INT not NULL,
	ExistenciasMaximas INT not NULL,
	BodegaID VARCHAR(250) not NULL,
	FechaActualizacion DATE,
	EmpleadoID VARCHAR(250) not null,
	EstadoExistencias bit DEFAULT 0,
	FechaReg DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (EmpleadoID) REFERENCES tbl_Empleado(ID),
	FOREIGN KEY (BodegaID) REFERENCES tbl_Bodega(ID),
	FOREIGN KEY (ArticuloID) REFERENCES tbl_Articulo(ID)
);

go

CREATE TABLE tbl_AccesoSistema(
	ID VARCHAR(250) not NULL,
	Usuario VARCHAR(20) DEFAULT 'USER123' UNIQUE,
	Pass VARCHAR(250) DEFAULT '202CB962AC59075B964B07152D234B70',
	Estado bit DEFAULT 0,
	FechaReg DATETIME DEFAULT GETDATE(),	
	CONSTRAINT pk_access PRIMARY KEY (ID),
	CONSTRAINT fk_UseRef FOREIGN KEY (ID) REFERENCES tbl_Empleado(ID)
);

