-- создадим БД
CREATE DATABASE if NOT exists HumanFriends;
USE HumanFriends;
-- создадим и заполним таблицу Parents_Сlass
create table IF NOT exists Parents_Сlass(
	id INT auto_increment NOT null primary key,
    NAME varchar(50)
    );

insert into Parents_Сlass(name)
VALUES
	('Pets'),
    ('Pack Animals');
    
-- выведем таблицу Parents_Сlass
select * from Parents_Сlass;

-- создаем таблицу Types  и свяжем с Parents_Сlass
create table IF not exists Types(
id INT auto_increment not null primary key,
name varchar(50),
category_id int,
constraint fk_category foreign key(category_id) references Parents_Сlass(id)
);

-- заполним таблицу Types
insert into Types(name, category_id)
values
	('Dog', 1),
    ('Cat', 1),
    ('Hamster', 1),
    ('Horse', 2),
    ('Camel', 2),
    ('Donkkey', 2);
    
-- вывежем таблицу Types
select * from types;

-- делаем таблицу Animals и связываем с таблицей Types
create table if not exists Animals(
	id INT auto_increment not null primary key,
	name varchar(50),
    type_id int,
    birthday date,
    constraint fk_type Foreign Key (type_id) references Types(id)
    );
    
-- заполняем таблицу Animals
insert into Animals(name, type_id, birthday)
values
	('Fido', 1,	'2020-01-01'),
    ('Whiskers', 2,	'2019-05-15'),
	('Hammy', 3, '2021-03-10'),
	('Buddy', 1, '2018-12-10'),
    ('Smudge', 2, '2020-02-20'),
    ('Peanut', 3, '2021-08-01'),
	('Bella', 1, '2019-11-11'),
	('Oliver', 2, '2020-06-30'),
    ('Thunder', 3, '2015-07-21'),
    ('Sandy', 4, '2016-11-03'),
	('Eeyore', 5, '2017-09-18'),
	('Storm', 6, '2014-05-05'),
    ('Dune', 4, '2018-12-12'),
    ('Burro', 5, '2019-01-23'),
	('Blaze', 6, '2016-02-29'),
	('Sahara', 5, '2015-08-14');
    
-- выведем Animals
select * from Animals;

-- создадим таблицу Comands и свяжем с таблицей Animals
create table if not exists Comands(
	id INT auto_increment not null primary key,
	name varchar(50),
    animal_id int,
    constraint fk_animal Foreign Key (animal_id) references Animals(id)
);
-- заполним таблицу Comands
insert into Comands(name, animal_id)
values
	('Barrier', 1), ('Place', 1), ('Go around', 1),
    ('Home', 2), ('Fetch', 2),
    ('Throw', 3), ('Up', 3),
    ('Sit', 4), ('Leg', 4),  
    ('Sit', 5), ('Fetch', 5),
    ('Home', 6), ('Place', 6),
    ('Sit', 7), ('Jump', 7), ('Up', 7),
    ('Jump', 8), ('Throw', 8), ('Barrier', 8),
    ('Barrier', 9), ('Up', 9), ('Jump', 9),
    ('Go around', 10), ('Sit', 10),
    ('Walk', 11), ('Bray', 11),
    ('Trot', 12), ('Canter', 12),
    ('Walk', 13), ('Sit', 13),
    ('Walk', 14), ('Kick', 14),
    ('Trot', 15), ('Gallop', 15),
    ('Walk', 16), ('Run', 16);
    
-- выведем Comands
select * from Comands;
-- Создаем виртуальную таблицу, которая 
-- объединит Parents_Сlass, Types, Animals, Comands и выводит только ослов и лошадей
create view Tab_Animals_Comands as
select
	a.id,
    a.name,
    a.birthday,
    t.name AS animal_type,
    c.name AS category,
    group_concat(cm.name order by cm.name ASC separator ', ') AS combo_comands
from animals as a
left join types AS t on t.id = a.type_id
join Parents_Сlass AS c ON t.category_id = c.id
left join comands AS cm ON cm.animal_id = a.id
where c.name = 'Pack Animals' and (t.name = 'Horse' or t.name = 'Donkkey')
group by a.id, a.name, a.birthday, t.name, c.name;

-- выведем таблицу Tab_Animals_Comands

select * from Tab_Animals_Comands;
    
-- Создаем новую виртуальную таблицу, которая 
-- объединит Parents_Сlass, Types, Animals, Comands и выводит животных от 1 до 3 лет
-- и вычислит их возраст с точностью до 1 месяца

create view Tab_Age_By3 as
select
    a.name,
    a.birthday,
    t.name AS animal_type,
    c.name AS category,
    concat(
		timestampdiff(year, a.birthday, curdate()),
        'years ',
        timestampdiff(month, a.birthday, curdate()) % 12,
        ' months'
    ) AS age
from animals as a
left join types AS t on t.id = a.type_id
join Parents_Сlass AS c ON t.category_id = c.id
where timestampdiff(year, a.birthday, curdate()) between 1 and 3;

-- выведем таблицу Tab_Age_By3
select * from Tab_Age_By3;
    
-- выведем объединенную таблицу
select
	a.id,
    a.name,
       concat(
		timestampdiff(year, a.birthday, curdate()),
        'years ',
        timestampdiff(month, a.birthday, curdate()) % 12,
        ' months'
    ) AS age,
    t.name AS animal_type,
    c.name AS category,
    GROUP_CONCAT(cm.name order by cm.name ASC separator ', ') AS combo_comands
from animals as a
left join types AS t on t.id = a.type_id
join Parents_Сlass AS c ON t.category_id = c.id
left join comands AS cm ON cm.animal_id = a.id
group by a.id, a.name, a.birthday, t.name, c.name
ORDER BY age;
    
    

    
	



    

