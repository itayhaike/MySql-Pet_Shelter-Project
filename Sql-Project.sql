-- Itay Haike
-- itayhaike@gmail.com


-- Create 'pet' table
CREATE TABLE pet (
  id INTEGER PRIMARY KEY,
  kind VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,
  birth_date DATE NOT NULL,
  arrival_date DATE NOT NULL
);

-- Create 'owner' table
CREATE TABLE owner (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  gender CHAR(1) NOT NULL
);

-- Create the 'adoption' table
CREATE TABLE adoption (
  owner_id INTEGER NOT NULL,
  pet_id INTEGER NOT NULL,
  adoption_date DATE NOT NULL,
  PRIMARY KEY (owner_id, pet_id),
  FOREIGN KEY (owner_id) REFERENCES owner(id),
  FOREIGN KEY (pet_id) REFERENCES pet(id)
);

-- how many pets are unadopted
SELECT COUNT(*) as 'Number of Unadopted Pets'
FROM pet
WHERE id NOT IN (SELECT pet_id FROM adoption);

-- how many pets were adopted between 2016-01-01 and 2018-01-01
SELECT COUNT(*) as 'Number of Pets Adopted'
FROM adoption
WHERE adoption_date BETWEEN '2016-01-01' AND '2018-01-01';

-- how much each pet waited (in days) from arrival to adoption, ordered from highest waiting time to lowest
SELECT p.id, DATEDIFF(a.adoption_date, p.arrival_date) as 'Days Waited'
FROM pet p
JOIN adoption a ON p.id = a.pet_id
ORDER BY 'Days Waited' DESC;

-- find which pets were born in the shelter (if their arrival date is the same as their birth date)
SELECT *
FROM pet
WHERE arrival_date = birth_date;

-- show for each kind of animal how many got adopted, ordered from most adopted to least
SELECT kind, COUNT(*) as 'Number Adopted'
FROM pet p
JOIN adoption a ON p.id = a.pet_id
GROUP BY kind
ORDER BY 'Number Adopted' DESC;

-- to show unadopted dogs from oldest to youngest
SELECT *
FROM pet
WHERE kind = 'dog' AND id NOT IN (SELECT pet_id FROM adoption)
ORDER BY arrival_date ASC;

--  show for each female who adopted cats, how many cats they adopted, ordered from most cats to least
SELECT o.fname, COUNT(*) as 'Number of Cats Adopted'
FROM owner o
JOIN adoption a ON o.id = a.owner_id
JOIN pet p ON a.pet_id = p.id
WHERE o.gender = 'F' AND p.kind = 'cat'
GROUP BY o.id
ORDER BY 'Number of Cats Adopted' DESC;

--  find all owners with no adoptions
SELECT *
FROM owner
WHERE id NOT IN (SELECT owner_id FROM adoption);

