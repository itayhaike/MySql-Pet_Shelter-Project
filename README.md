# MySql-Project- Pet Shelter

q1.sql: Make a query to create the following tables:
pet - represents an animal in the shelter or that was adopted from the shelter
● primary key: id
● other columns: kind ("dog"/"cat"/"bird"/etc), color, birth_date, arrival_date
owner - represents people that adopt animals from the shelter
● primary key: id
● other columns: fname lname gender
adoption - represents what owner adopted what animal (the relations is one to many)
● Primary Key is the combination of both owner_id and pet_id
● owner_id references id from the owner table.
● pet_id references id from the pet table. must be unique.
● other columns: adoption_date
IMPORTANT: see and execute insert_shelter_data.sql to add values to the table.
q2.sql: create a query to show how many pets are unadopted
q3.sql: Show how many pets were adopted between 2016-01-01 and 2018-01-01
q4.sql: Show how much each pet waited (in days) from arrival to adoption(example: if a dog
arrived in 2003 and adopted in 2005 it waited 2 years, a dog arrived in 2007 and adopted in
2010 waited 3 years) ordered from highest waiting time to lowest.
q5.sql: Find which pets were born in the shelter (if their arrival date is the same as their birth
date)
q6.sql: Show for each kind of animal how many got adopted, ordered from most adopted to
least. (how many dogs were adopted, how many cats were adopted etc)
q7.sql: Show unadopted dogs from oldest to youngest
q8.sql: for each female who adopted cats, show how many cats they adopted, ordered from
most cats to least.
q9.sql: find all owners with no adoptions
