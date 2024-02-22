-- 建立資料庫指令
-- CREATE DATABASE java COLLATE Chinese_Taiwan_Stroke_CI_AS; --

-- DROP Database if exists javapratice;
-- go
-- CREATE DATABASE javapratice
-- GO
Use javapratice
GO


DROP TABLE if exists product;

CREATE TABLE product (
   product_id integer primary key identity(1,1),
   product_name nvarchar(20),
   price    float,
   make     datetime,
   expire    integer
);
GO
INSERT INTO product values ('Coca Cola',20, '2007-01-01',365);
INSERT INTO product values ('Milk Tea',15, '2007-02-14',150);
INSERT INTO product values ('Easy Coffe',10, '2007-10-01',200);
INSERT INTO product values ('Coffe Square',15, '2007-02-20',100);
INSERT INTO product values ('Cookie',25, '2007-03-27',45);
INSERT INTO product values ('Prince Noodle',5, '2007-04-02',365);
INSERT INTO product values ('Chicken Noodle',20, '2006-10-30',300);
INSERT INTO product values ('Qwi-Qwi',20, '2007-02-28',200);
INSERT INTO product values ('Ice Pop',15, '2007-05-30',150);
INSERT INTO product values ('HotDog',25, '2007-04-30',1);
GO
/*==========================================================================*/



/*==========================================================================*/
DROP TABLE if exists customerroles;
DROP TABLE if exists customer;
CREATE TABLE customer (
   custid     nvarchar(20) primary key,
   password   varbinary(50),
   email      nvarchar(30),
   birth      datetime,
   bcryptpwd  varchar(70),
   enabled    integer
);
GO
INSERT INTO customer values ('Alex', 0, 'alex@lab.com', '2001-07-20','{bcrypt}$2a$10$kBnFAMiCNLfYBT3tHoUICe.9XF7lVrdoiNgg2giOtYDBU6wvjB9zW', 1);
INSERT INTO customer values ('Babe', 0, 'babe@lab.com', '2003-03-20','{bcrypt}$2a$10$NCgDqWoT7jxSrQ95kOhAh.POsUNP29/CSnIU52Bu7HilJ9/4W.YJW', 1);
INSERT INTO customer values ('Carol', 0, 'carol@lab.com', '2001-09-11','{bcrypt}$2a$10$kyLUYF.3ihX/ew8h3si9gO4b857VXLuAjRChpIsiRrWK/tMUqXLw.', 1);
INSERT INTO customer values ('Dave', 0, 'dave@lab.com', '2001-01-20','{bcrypt}$2a$10$kcdflBsoxpEuxq3WRLgpOeKKekEoNGk8wlgX9BM88OtKQbGpmSAbu', 1);
INSERT INTO customer values ('Ellen', 0, 'ellen@lab.com', '2000-05-20','{bcrypt}$2a$10$.AYyb/FvdVsvAKKd1AhfUuKVUvgpwIFTfcMk5mWbzppUGCW56eGfS', 1);
GO
/*==========================================================================*/
CREATE TABLE customerroles(
  rolesid integer primary key identity(1,1),
	custid NVARCHAR(20) NOT NULL ,
	roles VARCHAR(50)  NOT NULL DEFAULT('ROLE_EMPLOYEE'),
	FOREIGN KEY(custid) REFERENCES customer(custid),
	CONSTRAINT authorities_custname_role UNIQUE (custid ,roles)
)
GO
INSERT INTO customerroles 
VALUES
('Alex', 'ROLE_EMPLOYEE'),
('Alex', 'ROLE_MANAGER'),
('Alex', 'ROLE_ADMIN'),
('Babe', 'ROLE_EMPLOYEE'),
('Babe', 'ROLE_MANAGER'),
('Carol', 'ROLE_EMPLOYEE'),
('Dave', 'ROLE_EMPLOYEE'),
('Ellen', 'ROLE_EMPLOYEE');
GO
/*==========================================================================*/
DROP TABLE if exists projemp;
DROP TABLE if exists proj;
DROP TABLE if exists emp;
DROP TABLE if exists dept;
DROP TABLE if exists cartmiddle;
DROP TABLE if exists shoppingcart;

GO
CREATE Table shoppingcart (
  shoppingcart_id integer primary key identity(1,1),
  user_id nvarchar(20),
  totalprice FLOAT
)

GO

INSERT INTO shoppingcart values ('Alex',35);
INSERT INTO shoppingcart values ('Babe',25);
INSERT INTO shoppingcart values ('Carol',75);
INSERT INTO shoppingcart values ('Dave',40);
INSERT INTO shoppingcart values ('Ellen',60);

GO
/*=====================================================================*/
CREATE Table cartmiddle(
    cartmiddle_id integer primary key identity(1,1), 
    product_id integer,
    shoppingcart_id integer,
    quantity integer,
    productprice float,
)

GO

INSERT INTO cartmiddle values (1, 1, 1, 20);
INSERT INTO cartmiddle values (2, 1, 1, 15);
INSERT INTO cartmiddle values (3, 2, 1, 10);
INSERT INTO cartmiddle values (4, 2, 1, 15);
INSERT INTO cartmiddle values (5, 3, 1, 25);
INSERT INTO cartmiddle values (6, 3, 1, 5);
INSERT INTO cartmiddle values (7, 3, 1, 20);
INSERT INTO cartmiddle values (8, 3, 1, 20);
INSERT INTO cartmiddle values (9, 3, 1, 15);
INSERT INTO cartmiddle values (7, 4, 1, 20);
INSERT INTO cartmiddle values (8, 4, 1, 20);
INSERT INTO cartmiddle values (8, 5, 1, 20);
INSERT INTO cartmiddle values (9, 5, 1, 15);
INSERT INTO cartmiddle values (10, 5, 1, 25);

GO
/*=====================================================================*/
DROP TABLE if exists orderdetails;
DROP TABLE if exists orders;

GO

CREATE Table orderdetails(
  orderdetail_id integer primary key identity(1,1),
  quantity integer,
  history_product_name varchar(20),
  history_price float,
  order_id integer,  
  product_id integer,
)

GO

/*=====================================================================*/
CREATE Table orders(
  order_id int primary key identity(1,1),
  user_id nvarchar(50),
  total_amount int,   
  order_date datetime ,
  payment_method varchar(50),
  payment_date datetime,  
  order_status VARCHAR(20),
  order_address NVARCHAR(50),
  receiver NVARCHAR(10),
  ecpay_merchant_trade_no VARCHAR(20),
  )

GO

/*=====================================================================*/

DROP PROCEDURE if exists proProductByPrice;

-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE PROCEDURE proProductByPrice
-- 	@param_price float AS
-- BEGIN
-- 	SET NOCOUNT ON;
-- 	SELECT * FROM product WHERE price>@param_price
-- END
-- GO

/*==========================================================================*/
