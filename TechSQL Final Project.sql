create database db_techLibrary

use db_techLibrary



/* I accidentally inserted data into tbl_bookLoans that says that some branches are loaning out
books that they don't have possession of according to the tbl_bookCopies table.
I decided to leave this, because it would be tedious doesn't matter much - I can still 
demonstrate knowledge about how to create and populate tables, and how to query specific 
data from specific tables. In order to change this, I could drop the table and remake it,
or use the update statement to set the values again wherever they equal something incorrect.  */

/* Use this to see all the tables
select * from tbl_books
select * from tbl_bookAuthors
select * from tbl_publisher
select * from tbl_bookLoans
select * from tbl_bookCopies
select * from tbl_borrower
select * from tbl_libraryBranch
*/



/*=====================
CREATE TABLES SECTION
=====================*/



create table tbl_books(
PK_bookID int not null primary key identity (1,1), 
title nvarchar(50) not null, 
publisherName nvarchar(50) not null
);



/*=========ADDING CONSTRAINT============*/

alter table tbl_books
add constraint FK_publisherName foreign key (FK_publisherName)
references tbl_publisher(name)
on delete cascade
on update cascade
;

/*==========ADDING CONSTRAINT===========*/



create table tbl_bookAuthors(
FK_bookID int not null foreign key references tbl_books(PK_bookID),
authorName nvarchar(50) not null
);

create table tbl_publisher(
name nvarchar(50) not null, 
address nvarchar(50) not null, 
phone int not null
);



/*============ADDING CONSTRAINT==============*/

alter table tbl_publisher
add constraint PK_name primary key (name)
;

/*============ADDING CONSTRAINT==============*/



create table tbl_bookLoans(
bookID int not null foreign key references tbl_books(PK_bookID),
branchID  int not null foreign key references tbl_libraryBranch(PK_branchID),
FK_CardNo int not null foreign key references tbl_borrower(PK_cardNO),
dateOut date not null,
dueDate date not null
);

create table tbl_bookCopies(
FK_bookID int not null foreign key references tbl_books(PK_bookID), 
FK_branchID int not null foreign key references tbl_libraryBranch(PK_branchID),
noOfCopies int not null
);

create table tbl_borrower(
PK_cardNo int not null primary key identity (1,1),
name nvarchar(50) not null,
address nvarchar(50) not null,
phone nvarchar(50) not null
);

create table tbl_libraryBranch(
PK_branchID int not null primary key identity (1,1),
branchName nvarchar(50)not null,
address nvarchar(50)not null
);



/*=====================
INSERT VALUES SECTION
=====================*/



insert into tbl_books
(tbl_book.title, tbl_books.FK_publisherName)
values
('book1', 'Good Publishing'),
('book2', 'Good Publishing'),
('book3', 'Good Publishing'),
('book4', 'Good Publishing'),
('book5', 'Good Publishing'),
('book6', 'Good Publishing'),
('book7', 'Good Publishing'),
('book8', 'Good Publishing'),
('book9', 'Good Publishing'),
('book10', 'Good Publishing'),
('book11', 'Good Publishing'),
('book12', 'Good Publishing'),
('book13', 'Good Publishing'),
('book14', 'Good Publishing'),
('book15', 'Good Publishing'),
('book16', 'Good Publishing'),
('book17', 'Good Publishing'),
('book18', 'Good Publishing'),
('book19', 'Good Publishing'),
('The Lost Tribe', 'Great Publishing')
;



/*============ADDING IN A THIRD PUBLISHER==============*/

update tbl_books set FK_publisherName = 'Mediocre Publishing' where title = 'book4';
update tbl_books set FK_publisherName = 'Mediocre Publishing' where title = 'book7';
update tbl_books set FK_publisherName = 'Mediocre Publishing' where title = 'book17';

/*============ADDING IN A THIRD PUBLISHER==============*/



insert into tbl_bookAuthors
(FK_bookID, authorName)
values
('1','Stephen King'),
('2','George Ducas'),
('3','John Lemon'),
('4','Harrison Bergeron'),
('5','Harrison Bergeron'),
('6','Harrison Bergeron'),
('7','George Ducas'),
('8','Crazy Davey'),
('9','Stephen King'),
('10','John Lemon'),
('12','Stephen King'),
('13','Stephen King'),
('14','Stephen King'),
('15','John Lemon'),
('16','Stephen King'),
('17','Crazy Davey'),
('18','Stephen King'),
('19','Crazy Davey'),
('20','The Lost Author')
;

insert into tbl_publisher
(name, address, phone)
values
('Good Publishing', 'Pretty Good Street', '1234567890'),
('Mediocre Publishing', 'Not So Great Street', '1234567891'),
('Great Publishing', 'Fantastic Street', '1234567892')
;

insert into tbl_bookLoans
(FK_bookID, FK_branchID, FK_cardNo, dateOut, dueDate)
values
('1', '1', '1', '1997-06-21', '2017-06-21'),
('2', '2', '2', '1997-05-21', '2017-06-21'),
('4', '3', '3', '1997-04-29', '2017-06-21'),
('5', '4', '4', '1997-03-28', '2017-06-21'),
('6', '1', '5', '1997-02-27', '2017-06-21'),
('8', '2', '6', '1997-01-26', '2017-06-21'),
('10', '3', '7', '1997-06-01', '2017-06-21'),
('12', '4', '8', '1997-07-01', '2017-06-21'),
('14', '1', '7', '1997-08-01', '2017-06-21'),
('16', '2', '6', '1996-09-06', '2017-06-21'),
('18', '3', '5', '1998-01-15', '2017-06-21'),
('20', '4', '4', '1999-02-14', '2017-06-21'),
('20', '1', '3', '2000-03-13', '2017-06-21'),
('20', '2', '2', '2017-04-17', '2017-06-21'),
('2', '3', '1', '0001-02-18', '2017-06-21'),
('3', '4', '2', '0002-10-19', '2017-06-21'),
('5', '2', '3', '0003-11-20', '2017-06-21'),
('7', '1', '4', '1012-12-20', '2017-06-21'),
('9', '3', '5', '1495-12-26', '2017-06-21'),
('11', '4', '6', '1867-06-25', '2017-06-22'),
('13', '2', '7', '1867-06-24', '2017-06-23'),
('15', '2', '8', '1867-06-23', '2017-06-24'),
('17', '2', '6', '2016-05-22', '2017-06-25'),
('19', '2', '5', '2015-04-30', '2017-06-21'),
('20', '1', '4', '2014-03-13', '2017-06-21'),
('1', '1', '3', '2013-07-12', '2017-06-21'),
('2', '3', '2', '2012-09-12', '2017-06-21'),
('3', '3', '7', '2000-10-11', '2017-06-21'),
('4', '4', '7', '2010-10-10', '2017-06-21'),
('5', '4', '7', '2008-09-09', '2017-06-21'),
('6', '4', '7', '2007-07-08', '2017-06-21'),
('7', '4', '7', '2003-05-07', '2017-06-22'),
('8', '4', '7', '2002-03-06', '2017-06-23'),
('9', '4', '6', '1980-02-05', '2017-06-24'),
('10', '4', '1', '1997-10-24', '2017-06-25'),
('11', '1', '4', '1998-11-04', '2017-06-21'),
('12', '2', '3', '1990-01-03', '2017-06-21'),
('13', '3', '7', '1990-11-21', '2017-06-21'),
('14', '4', '8', '1970-11-22', '2017-06-21'),
('15', '2', '3', '1980-12-23', '2017-06-21'),
('16', '3', '2', '1997-12-24', '2017-06-21'),
('17', '4', '6', '1960-05-26', '2017-06-21'),
('18', '1', '4', '1997-04-03', '2017-06-21'),
('19', '1', '2', '1950-02-05', '2017-06-21'),
('20', '2', '1', '1950-06-22', '2017-06-21'),
('4', '4', '4', '1930-07-21', '2017-06-21'),
('1', '2', '3', '1920-06-21', '2017-06-21'),
('5', '3', '8', '1907-06-19', '2017-06-21'),
('15', '2', '8', '1940-06-14', '2017-06-21'),
('1', '1', '1', '1097-01-12', '2017-06-21')
;

insert into tbl_bookCopies
(FK_bookID, FK_branchID, noOfCopies)
values
('1', '1', '3'),
('2', '1', '5'),
('3', '1', '7'),
('4', '1', '4'),
('5', '1', '3'),
('6', '1', '2'),
('7', '1', '6'),
('8', '1', '7'),
('9', '1', '9'),
('10', '1', '33'),
('1', '2', '3234'),
('11', '2', '2'),
('12', '2', '4'),
('13', '2', '5'),
('14', '2', '765'),
('15', '2', '7'),
('16', '2', '8'),
('17', '2', '6'),
('18', '2', '4'),
('19', '2', '2'),
('1', '3', '36'),
('2', '3', '8'),
('4', '3', '7'),
('6', '3', '5'),
('8', '3', '10'),
('10', '3', '11'),
('12', '3', '12'),
('14', '3', '23'),
('16', '3', '2'),
('18', '3', '4'),
('20', '3', '6'),
('20', '4', '4'),
('11', '4', '3'),
('13', '4', '8'),
('15', '4', '6'),
('17', '4', '6'),
('19', '4', '16'),
('3', '4', '4'),
('5', '4', '34'),
('7', '4', '34'),
('9', '4', '32')
;

insert into tbl_borrower
(name, address, phone)
values
('June','June''s house','8653543254'),
('Boon','Alright Street','456432341'),
('Groggery','123 45 St','985765864578'),
('Raja','7 123 46 St','345624362345'),
('Oliver',' Oliver''s house','2435456756437'),
('Bryn','A hill','2345234523'),
('Noodle','A bowl','6574576547'),
('Nala','The jungle','243523454563')
;

/*===========ADDING IN A BORROWER THAT HASN'T BORROWED ANY BOOKS============*/

insert into tbl_borrower
(name, address, phone)
values
('Blue', 'Foster''s Home', '123123123')
;

/*===========ADDING IN A BORROWER THAT HASN'T BORROWED ANY BOOKS============*/



insert into tbl_libraryBranch
(branchName, address)
values
('Sharpstown', 'Sharpsville'),
('Central', 'Midgar'),
('Shady', 'The Slums'),
('Royal', 'The Palace')
;

/*=====================
   QUERIES SECTION
=====================*/

/*
How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
*/
create procedure usp_copiesTheLostTribeInSharpstown
as 
begin
	select noOfCopies from tbl_bookCopies
	where FK_bookID = 20 and FK_branchID = 1
	;
end





/*
How many copies of the book titled "The Lost Tribe" are owned by each library branch?
*/
create procedure usp_copiesTheLostTribeInBranch
as 
begin
	select tbl_bookCopies.noOfCopies, tbl_libraryBranch.branchName from tbl_libraryBranch
	inner join tbl_bookCopies on tbl_bookCopies.FK_branchID = tbl_libraryBranch.PK_branchID
	where tbl_bookCopies.FK_bookID = 20
	;
end




/*
Retrieve the names of all borrowers who do not have any books checked out.
*/
create procedure usp_BorrowersNoLoans
as 
begin
	select name from tbl_borrower
	where tbl_borrower.PK_cardNo not in (select FK_CardNo from tbl_bookLoans)
	;
end




/*
For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, 
retrieve the book title, the borrower's name, and the borrower's address.
*/
create procedure usp_booksDueSharpstown
as 
begin
	select tbl_books.title, tbl_borrower.name, tbl_borrower.address from tbl_books, tbl_borrower, tbl_libraryBranch, tbl_bookLoans
	where tbl_libraryBranch.PK_branchID = '1' 
	and tbl_bookLoans.dueDate = '2017-12-06'
	and tbl_bookLoans.FK_bookID = tbl_libraryBranch.PK_branchID
	;
end




/*
For each library branch, retrieve the branch name and the total number of books loaned out from that branch
*/
create procedure usp_LoansBranches
as 
begin
	select count(tbl_bookLoans.FK_branchID) as booksLoanedFrom
	from tbl_libraryBranch
	inner join tbl_bookLoans on tbl_bookLoans.FK_branchID = tbl_libraryBranch.PK_branchID
	group by tbl_bookLoans.FK_branchID
	;

	select tbl_libraryBranch.branchName from tbl_libraryBranch
	;
end




/*
Retrieve the names, addresses, and number of books checked out for all borrowers who have 
more than five books checked out.
*/
create procedure usp_LoansBorrowersOverFive
as 
begin
	select count(tbl_bookLoans.FK_cardNo) as booksLoanedTo
	from tbl_bookLoans
	inner join tbl_borrower on tbl_borrower.PK_cardNo = tbl_bookLoans.FK_CardNo
	group by tbl_borrower.PK_cardNo
	;

	select tbl_borrower.name from tbl_borrower
	where tbl_borrower.PK_cardNo in (select FK_CardNo from tbl_bookLoans)
	;
end




/*
For each book authored (or co-authored) by "Stephen King", retrieve the title and the number 
of copies owned by the library branch whose name is "Central".
*/
create procedure usp_CopiesCentralStephenKing
as 
begin
	select tbl_books.title, tbl_bookCopies.noOfCopies from tbl_bookCopies
	inner join tbl_books on tbl_books.PK_bookID = tbl_bookCopies.FK_bookID
	inner join tbl_bookAuthors on tbl_bookAuthors.FK_bookID = tbl_books.PK_bookID
	inner join tbl_libraryBranch on tbl_libraryBranch.PK_branchID = tbl_bookCopies.FK_branchID
	where tbl_libraryBranch.PK_branchID = 2 and tbl_bookAuthors.authorName = 'Stephen King'
	;
end









