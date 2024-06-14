create database DB_PVMS;
use DB_PVMS;

create table T_PRODUC(
product_id int primary key not null auto_increment,
product_description nvarchar(100),
product_finish varchar(20) not null,
standard_price float check (standard_price>=0),
product_line_id int not null
); 

create table T_ORDER_Line (
order_id int not null,
product_id int not null,
ordered_quantity int check (ordered_quantity >=0),
primary key (order_id,product_id),
foreign key (order_id) references T_ORDER(order_id),
foreign key (product_id) references T_PRODUC(product_id)
);

create table T_ORDER(
order_id int primary key not null auto_increment,
order_date date,
customer_id int not null,
foreign key (customer_id) references T_CUSTOMER(customer_id)
);

create table T_CUSTOMER(
customer_id int primary key not null auto_increment,
customer_name nvarchar(45),
customer_address nvarchar(100),
city nvarchar(100),
state nvarchar(100),
postal_code nvarchar(100)
);