-- Створення таблиці груп
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

-- Створення таблиці викладачів
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(150) NOT NULL
);

-- Створення таблиці предметів із вказівкою викладача
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(175) NOT NULL,
    teacher_id INTEGER REFERENCES teachers(id)
);

-- Створення таблиці студентів
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(150) NOT NULL,
    group_id INTEGER REFERENCES groups(id)
);

-- Створення таблиці оцінок студентів з вказівкою коли отримано
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    subject_id INTEGER REFERENCES subjects(id),
    grade INTEGER CHECK (grade >= 0 AND grade <= 100),
    grade_date DATE NOT NULL
);