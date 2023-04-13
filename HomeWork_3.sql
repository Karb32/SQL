
create table employees (
id serial primary key,
employee_name varchar(50) not null
);
select * from employees;


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


create table salary1 (
id serial primary key,
monthly_salary int not null
);
select * from salary1;
select * from employees;
select * from roles1;
select * from employee_salary;
select * from roles_employee;


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
           
      
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null); 




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
       (30,2),
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
       (82,35);

select * from employee_salary;

      
create table roles1 (
id serial primary key,
role_name varchar(30) not null unique
);
select * from roles1;


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
       
1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
  
 
select employee_name, monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id 
join salary1 on employee_salary.salary_id = salary1.id; 

2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id 
join salary1 on employee_salary.salary_id = salary1.id
where monthly_salary < ('2000');

3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_id,employee_name, monthly_salary
from employee_salary
left join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id 
where employee_name is null

4.Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_id,employee_name, monthly_salary
from employee_salary
left join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id 
where employee_name is null and  monthly_salary < ('2000')

5. Найти всех работников кому не начислена ЗП.

select  employee_id, employee_name, monthly_salary
from employee_salary
left join employees on employee_salary.employee_id = employees.id
left join salary1 on employee_salary.salary_id = salary1.id
where monthly_salary is null

6. Вывести всех работников с названиями их должности.
 
select employees.id, employees.employee_name, roles1.role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id

7. Вывести имена и должность только Java разработчиков.

select employees.id, employees.employee_name, roles1.role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id
where role_name like '%Java%'

8. Вывести имена и должность только Python разработчиков.

select employees.id, employees.employee_name, roles1.role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id
where role_name like '%Python%'

 9. Вывести имена и должность всех QA инженеров.
 
select employees.id, employees.employee_name, roles1.role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id
where role_name like '%QA engineer%'

 10. Вывести имена и должность ручных QA инженеров.
 
select employees.id, employees.employee_name, roles1.role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id
where role_name like '%Manual QA engineer%'

 11. Вывести имена и должность автоматизаторов QA
 
select employees.id, employees.employee_name, roles1.role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id
where role_name like '%Automation QA engineer%'

 12. Вывести имена и зарплаты Junior специалистов
 
select employees.id, employees.employee_name, roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%Junior%'

 13. Вывести имена и зарплаты Middle специалистов
 
select employees.id, employees.employee_name, roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%Middle%'

14. Вывести имена и зарплаты Senior специалистов

select employees.id, employees.employee_name, roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%Senior%'

15. Вывести зарплаты Java разработчиков

select roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%Java%'

16. Вывести зарплаты Python разработчиков

select roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%Python%'

17. Вывести имена и зарплаты Junior Python разработчиков

select employees.id, employees.employee_name, roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%Junior Python%'

 18. Вывести имена и зарплаты Middle JS разработчиков
 
select employees.id, employees.employee_name, roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%Middle JavaScript%'

19. Вывести имена и зарплаты Senior Java разработчиков

select employees.id, employees.employee_name, roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%Senior Java%'

20. Вывести зарплаты Junior QA инженеров

select roles1.role_name, salary1.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like 'Junior% QA%'

21. Вывести среднюю зарплату всех Junior специалистов

select AVG(salary1.monthly_salary)
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like 'Junior%'

22. Вывести сумму зарплат JS разработчиков

select SUM(salary1.monthly_salary)
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%JavaScript%'

23. Вывести минимальную ЗП QA инженеров

select MIN(salary1.monthly_salary)
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%QA engineer%'

24. Вывести максимальную ЗП QA инженеров

select MAX(salary1.monthly_salary)
from employee_salary
join employees on employee_salary.employee_id = employees.id
join salary1 on employee_salary.salary_id = salary1.id
join roles1 on employees.id = roles1.id
where role_name like '%QA engineer%'

25. Вывести количество QA инженеров

select count(role_id)
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id
where role_name like '%QA engineer%'

26. Вывести количество Middle специалистов.

select count(role_id)
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id
where role_name like '%Middle%'

27. Вывести количество разработчиков

select count(role_id)
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles1 on roles_employee.role_id = roles1.id
where role_name like '%developer%'

 28. Вывести фонд (сумму) зарплаты разработчиков.
 
 select sum(salary1.monthly_salary)
 from employee_salary
 join employees on employee_salary.employee_id = employees.id
 join salary1 on employee_salary.salary_id = salary1.id
 join roles1 on employees.id = roles1.id
 where role_name like '%developer%'
 
 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 
 select employee_name, role_name, monthly_salary
 from employee_salary
 join employees on employee_salary.employee_id = employees.id
 join salary1 on employee_salary.salary_id = salary1.id
 join roles1 on employees.id = roles1.id
 order by 3
 
 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 
 select employee_name, role_name, monthly_salary
 from employee_salary
 join employees on employee_salary.employee_id = employees.id
 join salary1 on employee_salary.salary_id = salary1.id
 join roles1 on employees.id = roles1.id
 where monthly_salary >=1700 and monthly_salary <=2300
 order by 3
 
 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
 
 select employee_name, role_name, monthly_salary
 from employee_salary
 join employees on employee_salary.employee_id = employees.id
 join salary1 on employee_salary.salary_id = salary1.id
 join roles1 on employees.id = roles1.id
 where monthly_salary <2300
 order by 3
 
 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1400, 1600
  
 select employee_name, role_name, monthly_salary
 from employee_salary
 join employees on employee_salary.employee_id = employees.id
 join salary1 on employee_salary.salary_id = salary1.id
 join roles_employee on employees.id = roles_employee.id
 join roles1 on roles_employee.id = roles1.id
 where monthly_salary in (1100,1400,1600)
 order by monthly_salary
