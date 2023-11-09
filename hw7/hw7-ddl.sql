# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills ( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255),
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    time_commitment int,
    primary key(skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (skills_id, skills_name, skills_description, skills_tag) values
    (1, "Dancing", "A form of expression, often paired with music, but can also be done competitively.", "Skill 1"),
    (2, "Java Coding", "A form of programming, specifically using the Java language, a great language for non-beginners.", "Skill 2"),
    (3, "Bowling", "A sport in which the goal is to knock down as many pins as possible by rolling a heavy ball at them.", "Skill 3"),
    (4, "Python Coding", "A form of programming, specifically using the Python language, a great language for beginners.", "Skill 4"),
    (5, "Fencing", "A sport where two competitors fight, and the first one to get struck with their opponents sword is the loser.", "Skill 5"),
    (6, "Cooking", "The ability to turn ingredients into meals, usually involves a stove, but can also be done without heat in some cases.", "Skill 6"),
    (7, "Assembly Coding", "A form of programming, specifically using the Assembly code, can differ from machine to machine, not very friendly to beginners.", "Skill 7"),
    (8, "Basketball", "A sport, where the goal is to throw a ball into a hoop typically about 10 feet off of the ground", "Skill 8");

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int not null,
    people_first_name varchar(255),
    people_last_name varchar(255) NOT NULL,
    people_email varchar(255) default null,
    people_linkedin_url varchar (255) default null,
    people_headshot_url varchar(255) default null,
    people_discord_url varchar (255) default null,
    people_brief_bio varchar(255) default null,
    people_date_joined varchar(4096) not null,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, people_first_name, people_last_name, people_date_joined) values 
    (1, "Fred",'Person 1', "2023-01-01"),
    (2, "Jay",'Person 2', "2023-01-02"),
    (3, "Ben",'Person 3', "2023-01-03"),
    (4, "Bob",'Person 4', "2023-01-04"),
    (5, "Paul",'Person 5', "2023-01-05"),
    (6, "Goku",'Person 6', "2023-01-06"),
    (7, "Dad?",'Person 7', "2023-01-01"),
    (8, "Chris",'Person 8', "2023-01-02"),
    (9, "Leonardo",'Person 9', "2023-01-03"),
    (10, "Ted",'Person 10', "2023-01-04");
    


# Section 6
# Create peopleskills ( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

Create Table peopleskills (
    peopleskills_id int not null auto_increment,
    peopleskills_skills_id int not null,
    peopleskills_people_id int not null,
    peopleskills_date_acquired varchar(255) not null,
    primary key(peopleskills_id)
);
# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills (peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired) values
    (1, 1, '2023-02-01'),
    (3, 1, '2023-02-01'),
    (6, 1, '2023-02-01'),
    (3, 2, '2023-02-02'),
    (4, 2, '2023-02-02'),
    (5, 2, '2023-02-02'),
    (1, 3, '2023-02-03'),
    (5, 3, '2023-02-03'),
    (3, 5, '2023-02-04'),
    (6, 5, '2023-02-04'),
    (2, 6, '2023-02-06'),
    (3, 6, '2023-02-06'),
    (4, 6, '2023-02-06'),
    (3, 7, '2023-02-07'),
    (5, 7, '2023-02-07'),
    (6, 7, '2023-02-07'),
    (1, 8, '2023-02-11'),
    (3, 8, '2023-02-11'),
    (5, 8, '2023-02-11'),
    (6, 8, '2023-02-11'),
    (2, 9, '2023-02-21'),
    (5, 9, '2023-02-21'),
    (6, 9, '2023-02-21'),
    (1, 10, '2023-02-05'),
    (4, 10, '2023-02-05'),
    (5, 10, '2023-02-05');

# Section 8
# Create roles ( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

create table roles(
    roles_id int not null,
    roles_name varchar(255) not null,
    roles_sort_priority int not null,
    primary key (roles_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles(roles_id, roles_name, roles_sort_priority) values
    (1, "Designer", 10),
    (2, "Developer", 20),
    (3, "Recruit", 30),
    (4, "Team Lead", 40),
    (5, "Boss", 50),
    (6, "Mentor", 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

create table peopleroles (
    peopleroles_id int not null auto_increment,
    peopleroles_people_id int not null,
    peopleroles_role_id int NOT null,
    peopleroles_date_assigned varchar(4096) not null,
    primary key (peopleroles_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (peopleroles_people_id, peopleroles_role_id, peopleroles_date_assigned) values
    (1,2,'2023-01-20'),
    (2,5,'2023-01-22'),
    (2,6,'2023-01-23'),
    (3,2,'2023-01-27'),
    (3,4,'2023-01-29'),
    (4,3,'2023-01-20'),
    (5,3,'2023-01-20'),
    (6,2,'2023-01-19'),
    (6,1,'2023-01-21'),
    (7,1,'2023-01-20'),
    (8,1,'2023-01-24'),
    (8,4,'2023-01-31'),
    (9,2,'2023-01-20'),
    (10,2,'2023-01-15'),
    (10,1,'2023-01-30');