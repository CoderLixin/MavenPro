--删除数据库
DROP DATABASE if exists mshop;
--创建数据库
CREATE DATABASE mshop CHARACTER SET UTF-8MB4;
--使用数据库
use mshop;
--删除数据表
drop table if exists details;
drop table if exists orders;
drop table if exists ember;
drop table if exists goods;
drop table if exists item;
drop table if exists admin;

--创建数据表
--1、创建商品类型表
/*==============================================================*/
/* Table: item                                                  */
/*==============================================================*/
create table item
(
   iid                  int auto_increment,
   title                varchar(200) not null ,
   constraint pk_idd primary key (iid)
);
--2、创建管理员信息表
/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   aid                  varchar(50),
   password             varchar(32),
   lastdate             datetime,
   constraint pk_aid primary key (aid)
);

--3、创建用户信息表
/*==============================================================*/
/* Table: member                                                */
/*==============================================================*/
create table member
(
   mid                  varchar(50),
   password             varchar(32),
   name                 varchar(50),
   phone                varchar(50),
   address              varchar(100),
   status               int,
   code                 varchar(100),
   regdate            datetime not null,
   photo                varchar(50) default 'nophoto.jpg',
   constraint pk_mid primary key (mid)
);
--4、创建商品信息表
/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   gid                  int auto_increment,
   iid                  int,
   aid                  varchar(50),
   title                varchar(50),
   pubdate              datetime,
   price                float,
   amount               int,
   bow                  int,
   note                 text,
   photo                varchar(100),
   status               int,
   constraint pk_gid primary key (gid),
   constraint fk_iid foreign key (iid) references item(iid) on delete set null,
   constraint fk_aid foreign key (aid) references admin(aid) on delete set null
);
--5、创建订单信息表
/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   oid                  int auto_increment,
   mid                  varchar(50),
   name                 varchar(50),
   phone                varchar(50),
   address              varchar(100),
   credate              datetime,
   pay                  float,
   constraint pk_oid primary key (oid),
   constraint fk_mid foreign key (mid) references member(mid) on delete cascade
);
--6、创建订单详情表
/*==============================================================*/
/* Table: details                                               */
/*==============================================================*/
create table details
(
   odid                int auto_increment,
   oid                  int not null,
   gid                  int not null,
   title                varchar(50) not null,
   price                float not null,
   amount               int not null,
   constraint pk_odid primary key (odid),
   constraint fk_oid foreign key (oid) references orders(oid) on delete cascade ,
   constraint fk_gid foreign key (gid) references goods(gid) on delete set null
);

--编写测试数据
--增加商品分类信息
insert into item(title) values ('厨房用品');
insert into item(title) values ('儿童玩具');
insert into item(title) values ('医疗器械');
insert into item(title) values ('运动健身');
insert into item(title) values ('办公用品');
--增加管理员信息:admin/hello
insert into admin(aid, password) values ('admin','5d41402abc4b2a76b9719d911017c592');
--增加用户信息:user/wlx
--提交事务
commit ;
