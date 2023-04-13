1. Создать таблицу employees.

create table employees (
id serial primary key,
employee_name varchar(50) not null
);
select * from employees;

2. Наполнить таблицу employee 70 строками.

insert into employees (employee_name)
values ('person1'),
('person2'),
('person3'),
('person4'),
('person5'),
('person6'),
('person7'),
('person8'),
('person9'),
('person10'),
('person11'),
('person12'),
('person13'),
('person14'),
('person15'),
('person16'),
('person17'),
('person18'),
('person19'),
('person20'),
('person21'),
('person22'),
('person23'),
('person24'),
('person25'),
('person26'),
('person27'),
('person28'),
('person29'),
('person30'),
('person31'),
('person32'),
('person33'),
('person34'),
('person35'),
('person36'),
('person37'),
('person38'),
('person39'),
('person40'),
('person41'),
('person42'),
('person43'),
('person44'),
('person45'),
('person46'),
('person47'),
('person48'),
('person49'),
('person50'),
('person51'),
('person52'),
('person53'),
('person54'),
('person55'),
('person56'),
('person57'),
('person58'),
('person59'),
('person60'),
('person61'),
('person62'),
('person63'),
('person64'),
('person65'),
('person66'),
('person67'),
('person68'),
('person69'),
('person70');

3. Создать таблицу salary.

create table salary1 (
id serial primary key,
monthly_salary int not null
);
select * from salary1;
select * from employees;
select * from roles1;
select * from employee_salary;
select * from roles_employee;

4.Наполнить таблицу salary 15 строками:.

insert into salary1(monthly_salary)
values ('1000'),
       ('1100'),
       ('1200'),
       ('1300'),
       ('1400'),
       ('1500'),
       ('1600'),
       ('1700'),
       ('1800'),
       ('1900'),
       ('2000'),
       ('2100'),
       ('2200'),
       ('2300'),
       ('2400'),
       ('2500');
      
5.Создать таблицу employee_salary      
      
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null); 

6. Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id.

insert into employee_salary (employee_id, salary_id)
values (1,2),
       (2,3),
       (3,9),
       (4,15),
       (5,15),
       (6,5),
       (7,5),
       (8,5),
       (9,7),
       (10,5),
       (11,12),
       (12,5),
       (13,3),
       (14,8),
       (15,9),
       (16,5),
       (17,9),
       (18,14),
       (19,15),
       (20,7),
       (21,8),
       (22,9),
       (23,10),
       (24,9),
       (25,7),
       (26,8),
       (27,3),
       (28,13),
       (29,9),
       (30,10),
       (72,10),
       (73,11),
       (74,12),
       (75,2),
       (76,4),
       (77,9),
       (78,14),
       (79,15),
       (80,16),
       (81,13),
       (82,5);

select * from employee_salary;

7. Создать таблицу roles
      
create table roles1 (
id serial primary key,
role_name varchar(30) not null unique
);
select * from roles1;

8. Наполнить таблицу roles 20 строками:

insert into roles1(role_name);
values  ('Junior Python developer'),
        ('Middle Python developer'),
        ('Senior Python developer'),
        ('Junior Java developer'),
        (' Middle Java developer'),
        (' Senior Java developer'),
        (' Junior JavaScript developer'),
        (' Middle JavaScript developer'),
        (' Senior JavaScript developer'),
        (' Junior Manual QA engineer'),
        (' Middle Manual QA engineer'),
        (' Senior Manual QA engineer'),
        (' Project Manager'),
        (' Designer'),
        (' HR'),
        (' CEO'),
        (' Sales manager'),
        (' Junior Automation QA engineer'),
        (' Middle Automation QA engineer'),
        ('Senior Automation QA engineer'),

9. Создать таблицу roles_employee        
        
create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
    references employees(id),
foreign key (role_id)
    references roles1(id)
);
select * from roles_employee;

10. Наполнить таблицу roles_employee 40 строками:

insert into roles_employee (employee_id, role_id)
values (1,2),
       (2,1),
       (3,5),
       (4,2),
       (5,19),
       (6,7),
       (7,5),
       (8,8),
       (9,3),
       (10,9),
       (11,8),
       (12,5),
       (13,2),
       (14,8),
       (15,1),
       (16,4),
       (17,7),
       (18,1),
       (19,2),
       (20,8),
       (21,19),
       (22,8),
       (23,3),
       (24,6),
       (25,11),
       (26,9),
       (27,7),
       (28,3),
       (29,12),
       (30,1),
       (31,12),
       (32,6),
       (33,15),
       (34,1),
       (35,8),
       (36,17),
       (37,5),
       (38,16),
       (39,17),
       (40,18);