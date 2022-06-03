--UC1 Create database
CREATE DATABASE AddressBookDB;

use AddressBookDB;

--UC2--Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes
create table AddressBook (
Id int primary key identity(1,1),
firstName varchar(50),
 lastName varchar(50),
  address varchar(100),
  city varchar(20),
  state varchar(20),
  zip int,
  phoneNumber int,
  email varchar(50)
);
select * from AddressBook

--UC3---Ability to insert new Contacts to Address Book

    insert into AddressBook values('Arpan','Suji','Siliguri','Kolkata','West Bengal',1234,923456555,'arpan@gmail.com');
	insert into AddressBook values('Prayash','Rana','Jaldhaka','Jalpaiguri','West Bengal',256440,888666999,'prayash@gmail.com');
	insert into AddressBook values('Sanskar','Rana','Kalimpong','Malda','West Bengal',56445,999888444,'sanskar@gmail.com');

--UC4---Ability to edit existing contact person using their name

update AddressBook SET state = 'Odhisa' where firstName = 'Sanskar';

--UC5--Ability to delete a person using person's name
delete from AddressBook where firstName = 'Sanskar';

--UC6--Ability to Retrieve Person belonging to a City or State from the Address Book

select * from AddressBook where city = 'Kolkata' or state = 'West Bengal';

--UC7--Ability to understand the size of address book by City and State

select COUNT(firstName) from AddressBook where city = 'Kolkata' or state = 'West Bengal';

--UC8--Ability to retrieve entries sorted alphabetically by Person’s name for a given city

select city , firstName from AddressBook ORDER BY city ASC;

--UC9--Ability to identify each Address Book with name and Type

alter Table AddressBook ADD Type varchar(30);
update AddressBook SET Type = 'Family' where firstName = 'Arpan';
update AddressBook SET Type = 'Profession' where firstName = 'Prayash';
update AddressBook SET Type = 'Friend' where firstName = 'Sanskar';
select * from AddressBook;

--UC10--Ability to get number of contact persons i.e. count by type

select COUNT(firstName) from AddressBook where state = 'West Bengal';
select COUNT(firstName) from AddressBook;

select COUNT(*), 'Family' from AddressBook group by Type;

alter table AddressBook Drop Column Type;

create table AddressBookType (
TypeId int primary key identity (1,1),
Type varchar(20)
);

insert into AddressBookType values
('Friends'),
('Family'),
('Proffesion'),
('others');

create table AddressBookMapping (
MappingId int primary key identity (1,1),
AddressBookID int,
TypeId int
);

alter table AddressBookMapping add foreign key (AddressBookID)
 references AddressBook(Id);
alter table AddressBookMapping add foreign key (TypeId) 
references AddressBookType(TypeId);

insert into AddressBookMapping(AddressBookID,TypeId) values
(1,1),
(2,1);

select * from AddressBook inner join
AddressBookMapping on AddressBook.Id = AddressBookMapping.AddressBookID
inner join AddressBookType on AddressBookType.TypeId = AddressBookMapping.TypeId