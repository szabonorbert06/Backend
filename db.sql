create database restapitest;

use restapitest;

CREATE TABLE BOOK
(
	BookId int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Title varchar(100) NOT NULL,
	Author varchar(100) NOT NULL,
	Topic varchar(100) NOT NULL
);

insert into BOOK (Title, Author, Topic) values 
				 ('Web Apps', 'Elvis Presly', 'Programming');
insert into BOOK (Title, Author, Topic) values 
				 ('IoT and Cloud', 'John Wayne', 'IoT');
insert into BOOK (Title, Author, Topic) values 
				 ('C#', 'Rune Hansen', 'Programming');
				 
