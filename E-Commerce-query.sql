
create database if not exists ECommerce_dbms;
use ECommerce_dbms;
create table if not exists Supplier(SUPP_ID int primary key AUTO_INCREMENT,
                      SUPP_NAME varchar(50) not null,
                      SUPP_CITY varchar(50) not null,
                      SUPP_PHONE varchar(50) not null);
create table if not exists Customer(CUS_ID int primary key AUTO_INCREMENT,
                       CUS_NAME varchar(20) not null,
                       CUS_PHONE varchar(10) not null,
                       CUS_CITY varchar(30) not null,
                       CUS_GENDER char);
create table if not exists Category(CAT_ID int primary key AUTO_INCREMENT,
                      CAT_NAME varchar(20) not null);
                    
create table if not exists Product(PRO_ID int primary key AUTO_INCREMENT,
                     PRO_NAME varchar(20) not null default 'Dummy',
                     PRO_DESC varchar(60),
                     CAT_ID int,
                     foreign key(CAT_ID) references Category(CAT_ID));
create table if not exists Supplier_pricing(PRICING_ID int primary key AUTO_INCREMENT,
                        SUPP_PRICE int default 0,
                        PRO_ID int,
                        foreign key (PRO_ID) references Product(PRO_ID),
                        SUPP_ID int,
                        foreign key(SUPP_ID) references Supplier(SUPP_ID));
# as Order is a keyword have used Order_table                        
create table if not exists Order_Table(ORD_ID int primary key AUTO_INCREMENT,
                   ORD_AMOUNT int not null,
                   ORD_DATE date not null,
                   CUS_ID int,
                   foreign key(CUS_ID) references customer(CUS_ID),
                   PRICING_ID int,
                   foreign key(PRICING_ID) references Supplier_Pricing(PRICING_ID));
alter table Order_Table AUTO_INCREMENT=101; 
                 
create table if not exists Rating(RAT_ID int primary key AUTO_INCREMENT,
                    ORD_ID int,
                    RAT_RATSTARS int not null,
                    foreign key(ORD_ID) references Order_Table(ORD_ID));
insert into Supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values('Rajesh Retails','Delhi','1234567890'); 
insert into Supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values('Appario Ltd','Mumbai','2589631470'); 
insert into Supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values('Knome products','Bangalore','9785462315'); 
insert into Supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values('Bansal Retails','Kochi','8975463285'); 
insert into Supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE) values('Mittal Ltd','Lucknow','7898456532'); 
select * from Supplier;
insert into Customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values('Aakash','9999999999','Delhi','M');
insert into Customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values('Aman','9785463215','Noida','M');
insert into Customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values('Neha','9999999999','Mumbai','F');
insert into Customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values('Megha','9994562399','Kolkata','F');
insert into Customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values('pulkit','7895999999','Lucknow','M');   
select * from Customer; 
insert into Category(CAT_NAME) values('Books');               
insert into Category(CAT_NAME) values('Games');
insert into Category(CAT_NAME) values('Groceries');
insert into Category(CAT_NAME) values('Electronics');
insert into Category(CAT_NAME) values('Clothes');
select * from Category; 
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('T-SHIRT','Size-L with black, blue and white variations',5);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('ROG LAPTOP','Windows 10 with 15 inch screen,i7 processor,1 TB SSD',4);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('OATS','Highly nutritious from Nestle',3);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('HARRY POTTER','Best Collection of all time by J.K.Rowling',1);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('MILK','1L Toned milk',3);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('Boat Earphones','1.5 meter long Dolby Atmos',4);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('Jeans','Stretchable denim jeans with various sizes and colour',5);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('Project IGI','Compatible with windows 7 and above',2);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('Hoodie','Black GUCCI for 13 yrs and above',5);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('Rich dad Poor Dad','Written by Robert Kiyosaki',1);
insert into Product(PRO_NAME,PRO_DESC,CAT_ID)values('Train your Brain','By Shireen Stephen',1);
select * from Product;       
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(1,2,1500); 
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(3,5,30000); 
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(5,1,3000); 
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(2,3,2500); 
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(4,1,1000);
# additional rows are added apart from given ones to match with Order table
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(12,2,1500); 
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(11,5,30000); 
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(10,1,3000); 
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(9,3,2500); 
insert into Supplier_Pricing(PRO_ID,SUPP_ID,SUPP_PRICE) values(8,1,1000);
select * from Supplier_Pricing; 
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(1500,'2021-10-06',2,1);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(1000,'2021-10-12',3,5);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(30000,'2021-09-16',5,2); 
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(1500,'2021-10-05',1,1);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(3000,'2021-08-16',4,3);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(1450,'2021-08-18',1,9);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(789,'2021-09-01',3,7);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(780,'2021-09-07',5,6);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(3000,'2021-09-10',5,3);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(2500,'2021-09-10',2,4);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(1000,'2021-09-15',4,5);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(789,'2021-09-16',4,7);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(31000,'2021-09-16',1,8);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(1000,'2021-09-16',3,5);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(3000,'2021-09-16',5,3);
insert into Order_table(ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(99,'2021-09-17',2,10);
SET SQL_SAFE_UPDATES=0;
select * from Order_table;
insert into Rating(ORD_ID,RAT_RATSTARS) values(101,4);
insert into Rating(ORD_ID,RAT_RATSTARS) values(102,3);
insert into Rating(ORD_ID,RAT_RATSTARS) values(103,1);
insert into Rating(ORD_ID,RAT_RATSTARS) values(104,2);
insert into Rating(ORD_ID,RAT_RATSTARS) values(105,4);
insert into Rating(ORD_ID,RAT_RATSTARS) values(106,3);
insert into Rating(ORD_ID,RAT_RATSTARS) values(107,4);
insert into Rating(ORD_ID,RAT_RATSTARS) values(108,4);
insert into Rating(ORD_ID,RAT_RATSTARS) values(109,3);
insert into Rating(ORD_ID,RAT_RATSTARS) values(110,5);
insert into Rating(ORD_ID,RAT_RATSTARS) values(111,3);
insert into Rating(ORD_ID,RAT_RATSTARS) values(112,4);
insert into Rating(ORD_ID,RAT_RATSTARS) values(113,2);
insert into Rating(ORD_ID,RAT_RATSTARS) values(114,1);
insert into Rating(ORD_ID,RAT_RATSTARS) values(115,1);
insert into Rating(ORD_ID,RAT_RATSTARS) values(116,0);
select * from Rating;

#3##.Display the total number of customers based on gender who have placed orders of worth at least Rs.3000
 select B.CUS_GENDER,count(CUS_GENDER) as NO_OF_CUSTOMERS from
 (select A.CUS_ID,A.CUS_GENDER,A.ORD_AMOUNT,A.CUS_NAME from
 (select Order_Table.*,C.CUS_GENDER,C.CUS_NAME from Order_Table inner join Customer as C 
 where Order_Table.CUS_ID=C.CUS_ID and Order_Table.ORD_AMOUNT>=3000)
 as A group by A.CUS_ID) as B group by B.CUS_GENDER;
   
#4##.Display all the orders along with product name ordered by a customer having Customer_id=2
select Product.PRO_NAME,Order_table.* from Order_table,Supplier_Pricing,Product
where Order_table.CUS_ID=2 and
Order_Table.PRICING_ID=Supplier_Pricing.PRICING_ID and Supplier_Pricing.PRO_ID=Product.PRO_ID;

 #5##.Display the supplier details who can supply more than one product
 select P.SUPP_ID,P.SUPP_NAME,P.SUPP_CITY,P.SUPP_PHONE,S.NO_OF_PRODUCTS from Supplier as P inner Join
 (select SUPP_ID , COUNT(SUPP_ID) as NO_OF_PRODUCTS from Supplier_Pricing group by SUPP_ID) as S
 on S.SUPP_ID=P.SUPP_ID and S.NO_OF_PRODUCTS>1;
  
 #6##.Find the least expensive product from each category and print the table with
 #category id, name, product name and price of the product
  select C.CAT_ID,C.CAT_NAME,min(B.MIN_PRICE) as MIN_PRICE from Category as C inner join
 (select Product.CAT_ID,Product.PRO_NAME,A.* from product inner join
 (select PRO_ID,min(SUPP_PRICE) as Min_Price from Supplier_Pricing group by PRO_ID)
 as A where A.PRO_ID=PRODUCT.PRO_ID)
 as B where B.CAT_ID=C.CAT_ID group by B.CAT_ID;
  
  #7##.Display the Id and name of the product ordered after "2021-10-05"
  select distinct P.PRO_ID,P.PRO_NAME,O.ORD_DATE from Product as P inner join
  (select PRO_ID, PRICING_ID from Supplier_pricing) as S inner join
  (select PRICING_ID,ORD_DATE from Order_table where ORD_DATE>'2021-10-05')as O
  on O.PRICING_ID=S.PRICING_ID
  on S.PRO_ID=P.PRO_ID;
    
  #8.##Display customer name and gender whose names start or end with character 'A' 
  select distinct CUS_NAME,CUS_GENDER from Customer where CUS_NAME like 'A%' or CUS_NAME like '%A';
    
  #9.##Create a stored Procedure to display Supplier_id, name,rating and Type_Of_Service.
  #For Type_of_service, If rating=5 print "Excellent service"
  # if rating>4 print "Good Service",
  # if rating>2 print "Average Service"
  # else print "Poor Service"
  	
  DELIMITER &&
  CREATE PROCEDURE Service_Rating_Procedure()
  BEGIN
  select report.SUPP_ID,report.SUPP_NAME,report.Average,
   case 
     when report.Average = 5 then 'Excellent Service'
     when report.Average > 4 and report.Average < 5 then 'Good Service'
     when report.Average > 2 and report.Average < 4 then 'Average Service'
     else 'Poor Service'
   end as typeOfService from
    (select final.SUPP_ID,Supplier.SUPP_NAME,final.Average from
    (select Q.SUPP_ID,sum(Q.RAT_RATSTARS)/count(Q.RAT_RATSTARS) as Average from
    (select Supplier_pricing.SUPP_ID,P.ORD_ID,P.RAT_RATSTARS from supplier_pricing inner join
    (select Order_table.PRICING_ID,rating.ORD_ID,rating.RAT_RATSTARS from Order_table inner join
	rating on rating.ORD_ID=Order_table.ORD_ID) as P
    on P.PRICING_ID=Supplier_Pricing.PRICING_ID)
    as Q group by Supplier_Pricing.SUPP_ID)
    as final inner join Supplier where final.SUPP_ID=supplier.SUPP_ID) as report;
     END &&
     DELIMITER ;
     
     CALL Service_Rating_Procedure();
 