/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 16                          */
/* Created on:     01-06-2017 1:15:42                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_CARRITO_CARRITO_D_CLIENTE') then
    alter table CARRITO
       delete foreign key FK_CARRITO_CARRITO_D_CLIENTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CATEGORI_CATEGORIA_CARRITO') then
    alter table CATEGORIA
       delete foreign key FK_CATEGORI_CATEGORIA_CARRITO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CLIENTE_CARRITO_D_CARRITO') then
    alter table CLIENTE
       delete foreign key FK_CLIENTE_CARRITO_D_CARRITO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CLIENTE_CLIENTES__COMUNA') then
    alter table CLIENTE
       delete foreign key FK_CLIENTE_CLIENTES__COMUNA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COMUNA_COMUNA_DE_REGION') then
    alter table COMUNA
       delete foreign key FK_COMUNA_COMUNA_DE_REGION
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LOCAL_DESPACHO__CARRITO') then
    alter table LOCAL
       delete foreign key FK_LOCAL_DESPACHO__CARRITO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LOCAL_LOCALES_D_COMUNA') then
    alter table LOCAL
       delete foreign key FK_LOCAL_LOCALES_D_COMUNA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PRODUCTO_PRODUCTOS_CATEGORI') then
    alter table PRODUCTO
       delete foreign key FK_PRODUCTO_PRODUCTOS_CATEGORI
end if;

drop index if exists CARRITO.CARRITO_DEL_CLIENTE_FK;

drop index if exists CARRITO.CARRITO_PK;

drop table if exists CARRITO;

drop index if exists CATEGORIA.CATEGORIAS_EN_EL_CARRITO_FK;

drop index if exists CATEGORIA.CATEGORIA_PK;

drop table if exists CATEGORIA;

drop index if exists CLIENTE.CARRITO_DEL_CLIENTE2_FK;

drop index if exists CLIENTE.CLIENTES_DE_LA_COMUNA_FK;

drop index if exists CLIENTE.CLIENTE_PK;

drop table if exists CLIENTE;

drop index if exists COMUNA.COMUNA_DE_LA_REGION_FK;

drop index if exists COMUNA.COMUNA_PK;

drop table if exists COMUNA;

drop index if exists LOCAL.DESPACHO_DEL_LOCAL_FK;

drop index if exists LOCAL.LOCALES_DE_LA_COMUNA_FK;

drop index if exists LOCAL.LOCAL_PK;

drop table if exists LOCAL;

drop index if exists PRODUCTO.PRODUCTOS_DE_LA_CATEGORIA_FK;

drop index if exists PRODUCTO.PRODUCTO_PK;

drop table if exists PRODUCTO;

drop index if exists REGION.REGION_PK;

drop table if exists REGION;

/*==============================================================*/
/* Table: CARRITO                                               */
/*==============================================================*/
create table CARRITO 
(
   ID_CARRITO           integer                        not null,
   ID_USUARIO           integer                        null,
   constraint PK_CARRITO primary key clustered (ID_CARRITO)
);

/*==============================================================*/
/* Index: CARRITO_PK                                            */
/*==============================================================*/
create unique clustered index CARRITO_PK on CARRITO (
ID_CARRITO ASC
);

/*==============================================================*/
/* Index: CARRITO_DEL_CLIENTE_FK                                */
/*==============================================================*/
create index CARRITO_DEL_CLIENTE_FK on CARRITO (
ID_USUARIO ASC
);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA 
(
   ID_CAT               integer                        not null,
   ID_CARRITO           integer                        null,
   COD_CAT              varchar(10)                    not null,
   NOMBRE_CAT           varchar(50)                    not null,
   constraint PK_CATEGORIA primary key clustered (ID_CAT)
);

/*==============================================================*/
/* Index: CATEGORIA_PK                                          */
/*==============================================================*/
create unique clustered index CATEGORIA_PK on CATEGORIA (
ID_CAT ASC
);

/*==============================================================*/
/* Index: CATEGORIAS_EN_EL_CARRITO_FK                           */
/*==============================================================*/
create index CATEGORIAS_EN_EL_CARRITO_FK on CATEGORIA (
ID_CARRITO ASC
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   ID_USUARIO           integer                        not null,
   ID_COMUNA            integer                        null,
   ID_CARRITO           integer                        null,
   RUN                  varchar(20)                    not null,
   NOMBRE               varchar(50)                    not null,
   AP_PATERNO           varchar(50)                    not null,
   AP_MATERNO           varchar(50)                    not null,
   MAIL_USUARIO         varchar(1024)                  not null,
   TELEFONO             integer                        not null,
   DIRECCION            varchar(1024)                  not null,
   COMUNA               varchar(50)                    not null,
   REGION               varchar(50)                    not null,
   "LOGIN"              varchar(50)                    not null,
   PASS                 varchar(12)                    not null,
   constraint PK_CLIENTE primary key clustered (ID_USUARIO)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique clustered index CLIENTE_PK on CLIENTE (
ID_USUARIO ASC
);

/*==============================================================*/
/* Index: CLIENTES_DE_LA_COMUNA_FK                              */
/*==============================================================*/
create index CLIENTES_DE_LA_COMUNA_FK on CLIENTE (
ID_COMUNA ASC
);

/*==============================================================*/
/* Index: CARRITO_DEL_CLIENTE2_FK                               */
/*==============================================================*/
create index CARRITO_DEL_CLIENTE2_FK on CLIENTE (
ID_CARRITO ASC
);

/*==============================================================*/
/* Table: COMUNA                                                */
/*==============================================================*/
create table COMUNA 
(
   ID_COMUNA            integer                        not null,
   ID_REGION            integer                        null,
   COMUNA               varchar(50)                    not null,
   constraint PK_COMUNA primary key clustered (ID_COMUNA)
);

/*==============================================================*/
/* Index: COMUNA_PK                                             */
/*==============================================================*/
create unique clustered index COMUNA_PK on COMUNA (
ID_COMUNA ASC
);

/*==============================================================*/
/* Index: COMUNA_DE_LA_REGION_FK                                */
/*==============================================================*/
create index COMUNA_DE_LA_REGION_FK on COMUNA (
ID_REGION ASC
);

/*==============================================================*/
/* Table: LOCAL                                                 */
/*==============================================================*/
create table LOCAL 
(
   ID_LOCAL             integer                        not null,
   ID_CARRITO           integer                        null,
   ID_COMUNA            integer                        null,
   COD_LOCAL            integer                        not null,
   NOMBRE_LOCAL         varchar(50)                    not null,
   DIRECCION_LOCAL      varchar(1024)                  not null,
   TELEFONO_LOCAL       integer                        not null,
   COMUNA_LOCAL         varchar(50)                    not null,
   REGION_LOCAL         varchar(50)                    not null,
   constraint PK_LOCAL primary key clustered (ID_LOCAL)
);

/*==============================================================*/
/* Index: LOCAL_PK                                              */
/*==============================================================*/
create unique clustered index LOCAL_PK on LOCAL (
ID_LOCAL ASC
);

/*==============================================================*/
/* Index: LOCALES_DE_LA_COMUNA_FK                               */
/*==============================================================*/
create index LOCALES_DE_LA_COMUNA_FK on LOCAL (
ID_COMUNA ASC
);

/*==============================================================*/
/* Index: DESPACHO_DEL_LOCAL_FK                                 */
/*==============================================================*/
create index DESPACHO_DEL_LOCAL_FK on LOCAL (
ID_CARRITO ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   ID_PRODUCTO          integer                        not null,
   ID_CAT               integer                        null,
   CAT_PROD             varchar(10)                    not null,
   COD_PROD             varchar(10)                    not null,
   NOMBRE_PROD          varchar(100)                   not null,
   DESCRIP_PROD         varchar(1024)                  not null,
   PRECIO_PROD          numeric(8,2)                   not null,
   STOCK_PROD           integer                        not null,
   ORIGEN_PROD          varchar(1024)                  not null,
   PESO_PROD            varchar(10)                    not null,
   constraint PK_PRODUCTO primary key clustered (ID_PRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique clustered index PRODUCTO_PK on PRODUCTO (
ID_PRODUCTO ASC
);

/*==============================================================*/
/* Index: PRODUCTOS_DE_LA_CATEGORIA_FK                          */
/*==============================================================*/
create index PRODUCTOS_DE_LA_CATEGORIA_FK on PRODUCTO (
ID_CAT ASC
);

/*==============================================================*/
/* Table: REGION                                                */
/*==============================================================*/
create table REGION 
(
   ID_REGION            integer                        not null,
   REGION               varchar(50)                    not null,
   constraint PK_REGION primary key clustered (ID_REGION)
);

/*==============================================================*/
/* Index: REGION_PK                                             */
/*==============================================================*/
create unique clustered index REGION_PK on REGION (
ID_REGION ASC
);

alter table CARRITO
   add constraint FK_CARRITO_CARRITO_D_CLIENTE foreign key (ID_USUARIO)
      references CLIENTE (ID_USUARIO)
      on update restrict
      on delete restrict;

alter table CATEGORIA
   add constraint FK_CATEGORI_CATEGORIA_CARRITO foreign key (ID_CARRITO)
      references CARRITO (ID_CARRITO)
      on update restrict
      on delete restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_CARRITO_D_CARRITO foreign key (ID_CARRITO)
      references CARRITO (ID_CARRITO)
      on update restrict
      on delete restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_CLIENTES__COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA)
      on update restrict
      on delete restrict;

alter table COMUNA
   add constraint FK_COMUNA_COMUNA_DE_REGION foreign key (ID_REGION)
      references REGION (ID_REGION)
      on update restrict
      on delete restrict;

alter table LOCAL
   add constraint FK_LOCAL_DESPACHO__CARRITO foreign key (ID_CARRITO)
      references CARRITO (ID_CARRITO)
      on update restrict
      on delete restrict;

alter table LOCAL
   add constraint FK_LOCAL_LOCALES_D_COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA)
      on update restrict
      on delete restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_PRODUCTOS_CATEGORI foreign key (ID_CAT)
      references CATEGORIA (ID_CAT)
      on update restrict
      on delete restrict;

