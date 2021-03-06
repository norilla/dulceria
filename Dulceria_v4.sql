/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     03-06-2017 16:27:12                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTE') and o.name = 'FK_CLIENTE_CLIENTES__COMUNA')
alter table CLIENTE
   drop constraint FK_CLIENTE_CLIENTES__COMUNA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTE') and o.name = 'FK_CLIENTE_COMPRA_DE_VENTA')
alter table CLIENTE
   drop constraint FK_CLIENTE_COMPRA_DE_VENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMUNA') and o.name = 'FK_COMUNA_COMUNA_DE_REGION')
alter table COMUNA
   drop constraint FK_COMUNA_COMUNA_DE_REGION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_VENTA') and o.name = 'FK_DETALLE__DETALLE_D_VENTA')
alter table DETALLE_VENTA
   drop constraint FK_DETALLE__DETALLE_D_VENTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLE_VENTA') and o.name = 'FK_DETALLE__DETALLE_D_PRODUCTO')
alter table DETALLE_VENTA
   drop constraint FK_DETALLE__DETALLE_D_PRODUCTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOCAL') and o.name = 'FK_LOCAL_LOCALES_D_COMUNA')
alter table LOCAL
   drop constraint FK_LOCAL_LOCALES_D_COMUNA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PRODUCTO') and o.name = 'FK_PRODUCTO_CATEGORIA_CATEGORI')
alter table PRODUCTO
   drop constraint FK_PRODUCTO_CATEGORIA_CATEGORI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENTA') and o.name = 'FK_VENTA_COMPRA_DE_CLIENTE')
alter table VENTA
   drop constraint FK_VENTA_COMPRA_DE_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENTA') and o.name = 'FK_VENTA_DESPACHO__LOCAL')
alter table VENTA
   drop constraint FK_VENTA_DESPACHO__LOCAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATEGORIA')
            and   type = 'U')
   drop table CATEGORIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTE')
            and   name  = 'COMPRA_DEL_CLIENTE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTE.COMPRA_DEL_CLIENTE2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTE')
            and   name  = 'CLIENTES_DE_LA_COMUNA_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTE.CLIENTES_DE_LA_COMUNA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMUNA')
            and   name  = 'COMUNA_DE_LA_REGION_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMUNA.COMUNA_DE_LA_REGION_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMUNA')
            and   type = 'U')
   drop table COMUNA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_VENTA')
            and   name  = 'DETALLE_DEL_CARRITO_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_VENTA.DETALLE_DEL_CARRITO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLE_VENTA')
            and   name  = 'DETALLE_DE_LA_COMPRA_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLE_VENTA.DETALLE_DE_LA_COMPRA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLE_VENTA')
            and   type = 'U')
   drop table DETALLE_VENTA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOCAL')
            and   name  = 'LOCALES_DE_LA_COMUNA_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOCAL.LOCALES_DE_LA_COMUNA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOCAL')
            and   type = 'U')
   drop table LOCAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCTO')
            and   name  = 'CATEGORIA_DEL_PRODUCTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.CATEGORIA_DEL_PRODUCTO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTO')
            and   type = 'U')
   drop table PRODUCTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REGION')
            and   type = 'U')
   drop table REGION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'DESPACHO_DEL_LOCAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.DESPACHO_DEL_LOCAL_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'COMPRA_DEL_CLIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.COMPRA_DEL_CLIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VENTA')
            and   type = 'U')
   drop table VENTA
go

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   ID_CAT               int                  not null,
   COD_CAT              varchar(10)          not null,
   NOMBRE_CAT           varchar(50)          not null,
   constraint PK_CATEGORIA primary key (ID_CAT)
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_USUARIO           int                  not null,
   ID_COMUNA            int                  null,
   ID_CARRITO           int                  null,
   RUN                  varchar(20)          not null,
   NOMBRE               varchar(50)          not null,
   AP_PATERNO           varchar(50)          not null,
   AP_MATERNO           varchar(50)          not null,
   MAIL_USUARIO         varchar(1024)        not null,
   TELEFONO             int                  not null,
   DIRECCION            varchar(1024)        not null,
   COMUNA               varchar(50)          not null,
   REGION               varchar(50)          not null,
   LOGIN                varchar(50)          not null,
   PASS                 varchar(12)          not null,
   constraint PK_CLIENTE primary key (ID_USUARIO)
)
go

/*==============================================================*/
/* Index: CLIENTES_DE_LA_COMUNA_FK                              */
/*==============================================================*/




create nonclustered index CLIENTES_DE_LA_COMUNA_FK on CLIENTE (ID_COMUNA ASC)
go

/*==============================================================*/
/* Index: COMPRA_DEL_CLIENTE2_FK                                */
/*==============================================================*/




create nonclustered index COMPRA_DEL_CLIENTE2_FK on CLIENTE (ID_CARRITO ASC)
go

/*==============================================================*/
/* Table: COMUNA                                                */
/*==============================================================*/
create table COMUNA (
   ID_COMUNA            int                  not null,
   ID_REGION            int                  null,
   COMUNA               varchar(50)          not null,
   constraint PK_COMUNA primary key (ID_COMUNA)
)
go

/*==============================================================*/
/* Index: COMUNA_DE_LA_REGION_FK                                */
/*==============================================================*/




create nonclustered index COMUNA_DE_LA_REGION_FK on COMUNA (ID_REGION ASC)
go

/*==============================================================*/
/* Table: DETALLE_VENTA                                         */
/*==============================================================*/
create table DETALLE_VENTA (
   ID_DET_VENTA         int                  not null,
   ID_PRODUCTO          int                  null,
   ID_CARRITO           int                  null,
   ID_PROD              int                  not null,
   PRECIO               money                not null,
   CANTIDAD             int                  not null,
   TOTAL                money                not null,
   constraint PK_DETALLE_VENTA primary key (ID_DET_VENTA)
)
go

/*==============================================================*/
/* Index: DETALLE_DE_LA_COMPRA_FK                               */
/*==============================================================*/




create nonclustered index DETALLE_DE_LA_COMPRA_FK on DETALLE_VENTA (ID_PRODUCTO ASC)
go

/*==============================================================*/
/* Index: DETALLE_DEL_CARRITO_FK                                */
/*==============================================================*/




create nonclustered index DETALLE_DEL_CARRITO_FK on DETALLE_VENTA (ID_CARRITO ASC)
go

/*==============================================================*/
/* Table: LOCAL                                                 */
/*==============================================================*/
create table LOCAL (
   ID_LOCAL             int                  not null,
   ID_COMUNA            int                  null,
   COD_LOCAL            int                  not null,
   NOMBRE_LOCAL         varchar(50)          not null,
   DIRECCION_LOCAL      varchar(1024)        not null,
   TELEFONO_LOCAL       int                  not null,
   COMUNA_LOCAL         varchar(50)          not null,
   REGION_LOCAL         varchar(50)          not null,
   constraint PK_LOCAL primary key (ID_LOCAL)
)
go

/*==============================================================*/
/* Index: LOCALES_DE_LA_COMUNA_FK                               */
/*==============================================================*/




create nonclustered index LOCALES_DE_LA_COMUNA_FK on LOCAL (ID_COMUNA ASC)
go

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          int                  not null,
   ID_CAT               int                  null,
   CAT_PROD             varchar(10)          not null,
   COD_PROD             varchar(10)          not null,
   NOMBRE_PROD          varchar(100)         not null,
   DESCRIP_PROD         varchar(1024)        not null,
   PRECIO_PROD          money                not null,
   STOCK_PROD           int                  not null,
   ORIGEN_PROD          varchar(1024)        not null,
   PESO_PROD            varchar(10)          not null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
)
go

/*==============================================================*/
/* Index: CATEGORIA_DEL_PRODUCTO_FK                             */
/*==============================================================*/




create nonclustered index CATEGORIA_DEL_PRODUCTO_FK on PRODUCTO (ID_CAT ASC)
go

/*==============================================================*/
/* Table: REGION                                                */
/*==============================================================*/
create table REGION (
   ID_REGION            int                  not null,
   REGION               varchar(50)          not null,
   constraint PK_REGION primary key (ID_REGION)
)
go

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA (
   ID_CARRITO           int                  not null,
   ID_LOCAL             int                  null,
   ID_USUARIO           int                  null,
   ID_VENTA             int                  not null,
   ID_LOCALDESP         int                  not null,
   ID_CLIENTE           char(10)             not null,
   FECHA_CARRITO        char(10)             not null,
   SUBTOTAL             char(10)             not null,
   IVA                  char(10)             not null,
   TOTAL                money                not null,
   constraint PK_VENTA primary key (ID_CARRITO)
)
go

/*==============================================================*/
/* Index: COMPRA_DEL_CLIENTE_FK                                 */
/*==============================================================*/




create nonclustered index COMPRA_DEL_CLIENTE_FK on VENTA (ID_USUARIO ASC)
go

/*==============================================================*/
/* Index: DESPACHO_DEL_LOCAL_FK                                 */
/*==============================================================*/




create nonclustered index DESPACHO_DEL_LOCAL_FK on VENTA (ID_LOCAL ASC)
go

alter table CLIENTE
   add constraint FK_CLIENTE_CLIENTES__COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA)
go

alter table CLIENTE
   add constraint FK_CLIENTE_COMPRA_DE_VENTA foreign key (ID_CARRITO)
      references VENTA (ID_CARRITO)
go

alter table COMUNA
   add constraint FK_COMUNA_COMUNA_DE_REGION foreign key (ID_REGION)
      references REGION (ID_REGION)
go

alter table DETALLE_VENTA
   add constraint FK_DETALLE__DETALLE_D_VENTA foreign key (ID_CARRITO)
      references VENTA (ID_CARRITO)
go

alter table DETALLE_VENTA
   add constraint FK_DETALLE__DETALLE_D_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
go

alter table LOCAL
   add constraint FK_LOCAL_LOCALES_D_COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_CATEGORIA_CATEGORI foreign key (ID_CAT)
      references CATEGORIA (ID_CAT)
go

alter table VENTA
   add constraint FK_VENTA_COMPRA_DE_CLIENTE foreign key (ID_USUARIO)
      references CLIENTE (ID_USUARIO)
go

alter table VENTA
   add constraint FK_VENTA_DESPACHO__LOCAL foreign key (ID_LOCAL)
      references LOCAL (ID_LOCAL)
go

