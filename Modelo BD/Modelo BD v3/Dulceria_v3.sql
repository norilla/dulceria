/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     03-06-2017 16:12:38                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARRITO') and o.name = 'FK_CARRITO_CARRITO_D_CLIENTE')
alter table CARRITO
   drop constraint FK_CARRITO_CARRITO_D_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CARRITO') and o.name = 'FK_CARRITO_DETALLE_D_DETALLE_')
alter table CARRITO
   drop constraint FK_CARRITO_DETALLE_D_DETALLE_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTE') and o.name = 'FK_CLIENTE_CARRITO_D_CARRITO')
alter table CLIENTE
   drop constraint FK_CLIENTE_CARRITO_D_CARRITO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLIENTE') and o.name = 'FK_CLIENTE_CLIENTES__COMUNA')
alter table CLIENTE
   drop constraint FK_CLIENTE_CLIENTES__COMUNA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMUNA') and o.name = 'FK_COMUNA_COMUNA_DE_REGION')
alter table COMUNA
   drop constraint FK_COMUNA_COMUNA_DE_REGION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOCAL') and o.name = 'FK_LOCAL_DESPACHO__CARRITO')
alter table LOCAL
   drop constraint FK_LOCAL_DESPACHO__CARRITO
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
   where r.fkeyid = object_id('PRODUCTO') and o.name = 'FK_PRODUCTO_DETALLE_D_DETALLE_')
alter table PRODUCTO
   drop constraint FK_PRODUCTO_DETALLE_D_DETALLE_
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARRITO')
            and   name  = 'DETALLE_DEL_CARRITO_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARRITO.DETALLE_DEL_CARRITO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CARRITO')
            and   name  = 'CARRITO_DEL_CLIENTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CARRITO.CARRITO_DEL_CLIENTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CARRITO')
            and   type = 'U')
   drop table CARRITO
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
            and   name  = 'CARRITO_DEL_CLIENTE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTE.CARRITO_DEL_CLIENTE2_FK
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
            from  sysobjects
           where  id = object_id('DETALLE_VENTA')
            and   type = 'U')
   drop table DETALLE_VENTA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOCAL')
            and   name  = 'DESPACHO_DEL_LOCAL_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOCAL.DESPACHO_DEL_LOCAL_FK
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
            and   name  = 'DETALLE_DE_LA_COMPRA_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCTO.DETALLE_DE_LA_COMPRA_FK
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

/*==============================================================*/
/* Table: CARRITO                                               */
/*==============================================================*/
create table CARRITO (
   ID_CARRITO           int                  not null,
   ID_DET_VENTA         int                  null,
   ID_USUARIO           int                  null,
   ID_VENTA             int                  not null,
   ID_LOCALDESP         int                  not null,
   ID_CLIENTE           char(10)             not null,
   FECHA_CARRITO        char(10)             not null,
   SUBTOTAL             char(10)             not null,
   IVA                  char(10)             not null,
   TOTAL                money                not null,
   constraint PK_CARRITO primary key (ID_CARRITO)
)
go

/*==============================================================*/
/* Index: CARRITO_DEL_CLIENTE_FK                                */
/*==============================================================*/




create nonclustered index CARRITO_DEL_CLIENTE_FK on CARRITO (ID_USUARIO ASC)
go

/*==============================================================*/
/* Index: DETALLE_DEL_CARRITO_FK                                */
/*==============================================================*/




create nonclustered index DETALLE_DEL_CARRITO_FK on CARRITO (ID_DET_VENTA ASC)
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
/* Index: CARRITO_DEL_CLIENTE2_FK                               */
/*==============================================================*/




create nonclustered index CARRITO_DEL_CLIENTE2_FK on CLIENTE (ID_CARRITO ASC)
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
   ID_PROD              int                  not null,
   PRECIO               money                not null,
   CANTIDAD             int                  not null,
   TOTAL                money                not null,
   constraint PK_DETALLE_VENTA primary key (ID_DET_VENTA)
)
go

/*==============================================================*/
/* Table: LOCAL                                                 */
/*==============================================================*/
create table LOCAL (
   ID_LOCAL             int                  not null,
   ID_CARRITO           int                  null,
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
/* Index: DESPACHO_DEL_LOCAL_FK                                 */
/*==============================================================*/




create nonclustered index DESPACHO_DEL_LOCAL_FK on LOCAL (ID_CARRITO ASC)
go

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          int                  not null,
   ID_DET_VENTA         int                  null,
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
/* Index: DETALLE_DE_LA_COMPRA_FK                               */
/*==============================================================*/




create nonclustered index DETALLE_DE_LA_COMPRA_FK on PRODUCTO (ID_DET_VENTA ASC)
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

alter table CARRITO
   add constraint FK_CARRITO_CARRITO_D_CLIENTE foreign key (ID_USUARIO)
      references CLIENTE (ID_USUARIO)
go

alter table CARRITO
   add constraint FK_CARRITO_DETALLE_D_DETALLE_ foreign key (ID_DET_VENTA)
      references DETALLE_VENTA (ID_DET_VENTA)
go

alter table CLIENTE
   add constraint FK_CLIENTE_CARRITO_D_CARRITO foreign key (ID_CARRITO)
      references CARRITO (ID_CARRITO)
go

alter table CLIENTE
   add constraint FK_CLIENTE_CLIENTES__COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA)
go

alter table COMUNA
   add constraint FK_COMUNA_COMUNA_DE_REGION foreign key (ID_REGION)
      references REGION (ID_REGION)
go

alter table LOCAL
   add constraint FK_LOCAL_DESPACHO__CARRITO foreign key (ID_CARRITO)
      references CARRITO (ID_CARRITO)
go

alter table LOCAL
   add constraint FK_LOCAL_LOCALES_D_COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_CATEGORIA_CATEGORI foreign key (ID_CAT)
      references CATEGORIA (ID_CAT)
go

alter table PRODUCTO
   add constraint FK_PRODUCTO_DETALLE_D_DETALLE_ foreign key (ID_DET_VENTA)
      references DETALLE_VENTA (ID_DET_VENTA)
go

