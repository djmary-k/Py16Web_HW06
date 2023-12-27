--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT students.fullname, AVG(grades.grade) AS average_grade
FROM students
JOIN grades ON students.id = grades.student_id
GROUP BY students.id, students.fullname
ORDER BY average_grade DESC
LIMIT 5;

--Знайти студента із найвищим середнім балом з певного предмета.
SELECT students.fullname, AVG(grades.grade) AS average_grade
FROM students
JOIN grades ON students.id = grades.student_id
JOIN subjects on subject_id = grades.subject_id 
where subjects.name = 'oil'
GROUP BY students.id, students.fullname
ORDER BY average_grade DESC
LIMIT 1;

--Знайти середній бал у групах з певного предмета.
SELECT groups.name, AVG(grades.grade) as average_grade
FROM groups
JOIN students ON groups.id = students.group_id
JOIN grades ON students.id = grades.student_id
JOIN subjects ON subjects.id = grades.subject_id
WHERE subjects.name = 'oil'
GROUP BY groups.id, groups.name;

--Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT AVG(grade) as average_grade
FROM grades;

--Знайти які курси читає певний викладач.
SELECT subjects.name
FROM subjects 
WHERE subjects.teacher_id  = (SELECT id FROM teachers WHERE fullname = 'James Morgan');

--Знайти список студентів у певній групі.
SELECT students.fullname 
FROM students 
WHERE students.group_id = (SELECT id FROM groups WHERE name = 'industry');

--Знайти оцінки студентів у окремій групі з певного предмета.
SELECT students.fullname, grades.grade
FROM students 
JOIN grades ON students.id = grades.student_id 
JOIN subjects ON subjects.id = grades.subject_id
join groups on students.group_id = groups.id
WHERE groups.name = 'industry' AND subjects.name = 'oil';

--Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT teachers.fullname, AVG(grades.grade) AS average_grade
FROM teachers
JOIN subjects ON teachers.id = subjects.teacher_id
JOIN grades ON subjects.id = grades.subject_id
where subjects.teacher_id  = (select id from teachers where fullname = 'James Morgan')
group by teachers.fullname;

--Знайти список курсів, які відвідує студент.
SELECT distinct subjects.name
FROM subjects
JOIN grades ON subjects.id = grades.subject_id
JOIN students ON grades.student_id = students.id
WHERE students.fullname = 'Jason Walker';

--Список курсів, які певному студенту читає певний викладач.
select subjects.name
FROM subjects 
join grades on subject.id = grades.subject_id 
JOIN students ON grades.student_id = students.id
JOIN teachers ON subjects.teacher_id = teachers.id
where students.fullname = 'Jason Walker' and teachers.fullname = 'James Morgan';

