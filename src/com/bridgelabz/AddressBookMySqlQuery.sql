//Welcome to AddressBook MYSQL Query
//UC1--> Creat AddressBook_Service
mysql> create database AddressBook_Service;
Query OK, 1 row affected (0.11 sec)

mysql> show databases;
+---------------------+
| Database            |
+---------------------+
| addressbook_service |
| information_schema  |
| mysql               |
| payroll_service     |
| performance_schema  |
| sys                 |
| world               |
+---------------------+
7 rows in set (0.00 sec)

//UC2--> Creat addressbook table

mysql> use AddressBook_Service;
Database changed
mysql> create table addressbook(First_Name varchar(50) NOT NULL,Last_Name varchar(50) NOT NULL,Address varchar(150) NOT NULL,City varchar(50) NOT NULL,State varchar(50) NOT NULL,Zip_Code int NOT NULL,Phone_Number bigint(20) NOT NULL,Email varchar(30) NOT NULL);
Query OK, 0 rows affected, 1 warning (1.91 sec)

mysql> desc addressbook;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| First_Name   | varchar(50)  | NO   |     | NULL    |       |
| Last_Name    | varchar(50)  | NO   |     | NULL    |       |
| Address      | varchar(150) | NO   |     | NULL    |       |
| City         | varchar(50)  | NO   |     | NULL    |       |
| State        | varchar(50)  | NO   |     | NULL    |       |
| Zip_Code     | int          | NO   |     | NULL    |       |
| Phone_Number | bigint       | NO   |     | NULL    |       |
| Email        | varchar(30)  | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
8 rows in set (0.04 sec)

//UC3--> insert newcontact to the addressbook

mysql> insert into addressbook(First_Name,Last_Name,Address,City,State,Zip_Code,Phone_Number,Email) values
    -> ('Sanjay','Pandit','Kolkata','KharagPur','WestBengal',721436,9874563215,'Sanh@gmail.com');
Query OK, 1 row affected (0.22 sec)

mysql> select * from addressbook;
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
| First_Name | Last_Name | Address | City      | State      | Zip_Code | Phone_Number | Email          |
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
| Sanjay     | Pandit    | Kolkata | KharagPur | WestBengal |   721436 |   9874563215 | Sanh@gmail.com |
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
1 row in set (0.12 sec)

//UC4--> Ability to edit exist contact person using thire first_name

mysql> select * from addressbook;
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
| First_Name | Last_Name | Address | City      | State      | Zip_Code | Phone_Number | Email          |
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
| Sanjay     | Pandit    | Kolkata | KharagPur | WestBengal |   721436 |   9874563215 | Sanh@gmail.com |
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
1 row in set (0.12 sec)

mysql> update addressbook set Phone_Number = 8956471235 where First_Name = 'Sanjay';
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select * from addressbook;
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
| First_Name | Last_Name | Address | City      | State      | Zip_Code | Phone_Number | Email            |
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
| Sanjay     | Pandit    | Kolkata | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com   |
| Aviral     | Nimbelkar | Kota    | Kota      | Rajashthan |   879654 |   2315689547 | aviral@gmail.com |
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
2 rows in set (0.07 sec)

UC5-->Ability to delete a person using person first_name

mysql> select * from addressbook;
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
| First_Name | Last_Name | Address | City      | State      | Zip_Code | Phone_Number | Email            |
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
| Sanjay     | Pandit    | Kolkata | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com   |
| Aviral     | Nimbelkar | Kota    | Kota      | Rajashthan |   879654 |   2315689547 | aviral@gmail.com |
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
2 rows in set (0.07 sec)

mysql> delete from addressbook where First_Name = 'Aviral';
Query OK, 1 row affected (0.21 sec)

mysql> select * from addressbook;
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
| First_Name | Last_Name | Address | City      | State      | Zip_Code | Phone_Number | Email          |
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
| Sanjay     | Pandit    | Kolkata | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com |
+------------+-----------+---------+-----------+------------+----------+--------------+----------------+
1 row in set (0.02 sec)

//UC6-->Ability to find name using search by state or city

mysql> select * from addressbook;
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
| First_Name | Last_Name | Address | City      | State      | Zip_Code | Phone_Number | Email            |
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
| Sanjay     | Pandit    | Kolkata | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com   |
| Aviral     | Nimbelkar | Kota    | Kota      | Rajashthan |   879654 |   2315689547 | aviral@gmail.com |
+------------+-----------+---------+-----------+------------+----------+--------------+------------------+
2 rows in set (0.01 sec)

mysql> select First_Name from addressbook where City = 'kota';
+------------+
| First_Name |
+------------+
| Aviral     |
+------------+
1 row in set (0.00 sec)

mysql> select First_Name from addressbook where state = 'westbengal';
+------------+
| First_Name |
+------------+
| Sanjay     |
+------------+
1 row in set (0.00 sec)

UC7-->count the size of addressbook

mysql> select * from addressbook;
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+
| First_Name | Last_Name | Address  | City      | State      | Zip_Code | Phone_Number | Email            |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+
| Sanjay     | Pandit    | Kolkata  | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com   |
| Aviral     | Nimbelkar | Kota     | Kota      | Rajashthan |   879654 |   2315689547 | aviral@gmail.com |
| Amit       | Das       | Mohanpur | Kolkata   | WestBengal |   879654 |   2315689547 | aviral@gmail.com |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+
3 rows in set (0.11 sec)

mysql> select count(First_Name) from addressbook where State = 'westbengal';
+-------------------+
| count(First_Name) |
+-------------------+
|                 2 |
+-------------------+
1 row in set (0.10 sec)

mysql> select count(First_Name) from addressbook where city = 'kolkata';
+-------------------+
| count(First_Name) |
+-------------------+
|                 1 |
+-------------------+
1 row in set (0.00 sec)

UC8-->sorted person name alphabeticaly by given city

mysql> select First_Name from addressbook order by city ;
+------------+
| First_Name |
+------------+
| Sanjay     |
| Amit       |
| Aviral     |
+------------+
3 rows in set (0.10 sec)

UC9-->Ability to identify each addressbook by type and name

mysql> update addressbook set Type ='Family' where first_name = 'Sanjay';
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook;
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+--------+
| First_Name | Last_Name | Address  | City      | State      | Zip_Code | Phone_Number | Email            | Type   |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+--------+
| Sanjay     | Pandit    | Kolkata  | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com   | Family |
| Aviral     | Nimbelkar | Kota     | Kota      | Rajashthan |   879654 |   2315689547 | aviral@gmail.com |        |
| Amit       | Das       | Mohanpur | Kolkata   | WestBengal |   879654 |   2315689547 | aviral@gmail.com |        |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+--------+
3 rows in set (0.02 sec)

mysql> update addressbook set Type ='Friends' where first_name = 'Aviral';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook;
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+---------+
| First_Name | Last_Name | Address  | City      | State      | Zip_Code | Phone_Number | Email            | Type    |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+---------+
| Sanjay     | Pandit    | Kolkata  | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com   | Family  |
| Aviral     | Nimbelkar | Kota     | Kota      | Rajashthan |   879654 |   2315689547 | aviral@gmail.com | Friends |
| Amit       | Das       | Mohanpur | Kolkata   | WestBengal |   879654 |   2315689547 | aviral@gmail.com |         |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+---------+
3 rows in set (0.00 sec)

mysql> update addressbook set Type ='Profession' where first_name = 'Amit';
Query OK, 1 row affected (0.29 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook;
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+------------+
| First_Name | Last_Name | Address  | City      | State      | Zip_Code | Phone_Number | Email            | Type       |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+------------+
| Sanjay     | Pandit    | Kolkata  | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com   | Family     |
| Aviral     | Nimbelkar | Kota     | Kota      | Rajashthan |   879654 |   2315689547 | aviral@gmail.com | Friends    |
| Amit       | Das       | Mohanpur | Kolkata   | WestBengal |   879654 |   2315689547 | aviral@gmail.com | Profession |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+------------+
3 rows in set (0.00 sec)

//UC10-->Abilityto get contact number count by type

mysql> select first_name,phone_number from addressbook where type = 'Family';
+------------+--------------+
| first_name | phone_number |
+------------+--------------+
| Sanjay     |   8956471235 |
+------------+--------------+
1 row in set (0.00 sec)

//UC11-->Abilityto add personboth add and family

mysql> insert into addressbook(First_Name,Last_Name,Address,City,State,Zip_Code,Phone_Number,Email,Type) values('Amit','Das','Mohanpur','Kolkata','WestBengal',879654,2315689547,'aviral@gmail.com','Friend');
Query OK, 1 row affected (0.22 sec)

mysql> select * from addressbook;
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+------------+
| First_Name | Last_Name | Address  | City      | State      | Zip_Code | Phone_Number | Email            | Type       |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+------------+
| Sanjay     | Pandit    | Kolkata  | KharagPur | WestBengal |   721436 |   8956471235 | Sanh@gmail.com   | Family     |
| Aviral     | Nimbelkar | Kota     | Kota      | Rajashthan |   879654 |   2315689547 | aviral@gmail.com | Friends    |
| Amit       | Das       | Mohanpur | Kolkata   | WestBengal |   879654 |   2315689547 | aviral@gmail.com | Profession |
| Amit       | Das       | Mohanpur | Kolkata   | WestBengal |   879654 |   2315689547 | aviral@gmail.com | Family     |
| Amit       | Das       | Mohanpur | Kolkata   | WestBengal |   879654 |   2315689547 | aviral@gmail.com | Friend     |
+------------+-----------+----------+-----------+------------+----------+--------------+------------------+------------+
5 rows in set (0.00 sec)
