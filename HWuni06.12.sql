 -- 1 уровень сложности: 1) Задачу 1 сделали в классе.
 -- 2) Вывести имена всех преподавателей с их компетенциями
 -- 3) Найти преподавателя, у которого нет компетенций
 -- 4) Найти имена студентов, которые не проходят ни один курс
 -- 5) Найти курсы, которые не посещает ни один студент
 -- 6) Найти компетенции, которых нет ни у одного преподавателя
 -- 8) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
 use university;
  -- 2) Вывести имена всех преподавателей с их компетенциями
 select
 t.name,
 c.title
 from Teachers t
 join Teachers2Competencies tc
 on t.id = tc.teacher_id
 join Competencies c
 on tc.competencies_id = c.id;
 
  -- 3) Найти преподавателя, у которого нет компетенций
select
t.name
from Teachers t
left join Teachers2Competencies tc
on t.id = tc.teacher_id
where tc.competencies_id is null;
  
  -- 4) Найти имена студентов, которые не проходят ни один курс
select
s.name
from Students s
left join Students2Courses sc
on s.id = sc.student_id
where sc.course_id is null;

 -- 5) Найти курсы, которые не посещает ни один студент
 select
 c.title
 from Courses c
 left join Students2Courses sc
 on sc.course_id = c.id
 where sc.student_id is null;
 
  -- 6) Найти компетенции, которых нет ни у одного преподавателя
  select
 c.title
 from Competencies c
 left join Teachers2Competencies tc
 on c.id = tc.competencies_id
where tc.teacher_id is null;
 
 -- 8) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
 SELECT
  s.name AS student_name,
  h.name AS headman_name
FROM
  Students s
JOIN
  Students2Courses sc ON s.id = sc.student_id
JOIN
  Courses c ON sc.course_id = c.id
JOIN
  Students h ON c.headman_id = h.id;



 