create database OnlineBank;
use OnlineBank;
-- drop table customer_personal_info;
create table customer_personal_info
(
customer_id varchar(10),
customer_name varchar(20),
dob date,
guardian_name varchar(20),
contact_number bigint(10),
address varchar(50),
mailid varchar(19),
gender varchar(1),
marital_status varchar(20),
identification_document varchar(20),
doc_number int(10),
citizenship varchar(10),
constraint cust_pers_info_pk primary key(customer_id)
);
create table customer_reference_info
(
customer_id varchar(10),
reference_acc_name varchar(20),
reference_acc_number bigint(16),
reference_acc_address varchar(50),
relation varchar(25),
constraint cust_ref_info_pk primary key(customer_id),
constraint cust_ref_info_pk foreign key(customer_id) references  customer_personal_info(customer_id)
);
create table bank_info
(
ifsc_code varchar(20),
bank_name varchar(25),
branch_name varchar(25),
constraint  bank_info_pk primary key(ifsc_code)
);
create table account_info
(
account_no bigint(16),
customer_id varchar(10),
account_type varchar(10),
registration_date date,
activation_date date,
ifsc_code varchar(10),
interest decimal(7,2),
inital_deposit bigint(10),
constraint acc_info_pk primary key(account_no),
constraint acc_info_fk foreign key(customer_id) references customer_personal_info(customer_id),
constraint acc_info_bank_fk foreign key(ifsc_code) references bank_info(ifsc_code)
);
-- show tables;
-- desc customer_personal_info;
insert into bank_info (ifsc_code,bank_name,branch_name) values('KVB12345','K V Bank','Visakhapatnam');
insert into bank_info (ifsc_code,bank_name,branch_name) values('KSB12345','K S Bank','Visakhapatnam');
insert into bank_info (ifsc_code,bank_name,branch_name) values('KPB12345','K P Bank','Visakhapatnam');
insert into bank_info (ifsc_code,bank_name,branch_name) values('KRB12345','K R Bank','Visakhapatnam');
-- select * from bank_info;
insert into customer_personal_info (customer_id,customer_name,dob,guardian_name,contact_number,address,mailid,gender,marital_status,identification_document,doc_number,citizenship) values('KVK231199','K Venkat','1999-11-23','K Purushotham',9951289856,'104 AREA Vizag','venkikv@gmail.com','M','unmarried','aadhar',123344,'Indian');
insert into customer_personal_info (customer_id,customer_name,dob,guardian_name,contact_number,address,mailid,gender,marital_status,identification_document,doc_number,citizenship) values('KSK101201','K Sanjana','2001-12-10','K Purushotham',9951289866,'104 AREA Vizag','sanju@gmail.com','F','unmarried','aadhar',123345,'Indian');
insert into customer_reference_info (customer_id,reference_acc_name,reference_acc_number,reference_acc_address) values('KVK231199','K Purushotham','2101061974','104 AREA Vizag');
select * from customer_reference_info;
-- update  customer_reference_info set relation='Father';
-- desc account_info;
insert into account_info (account_no,customer_id,account_type,registration_date,activation_date,ifsc_code,interest,inital_deposit) values(21231119951,'KVK231199','Savings','2021-09-02','2021-09-05','KVB12345',4.5,100000);
select * from account_info;