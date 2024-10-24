-- Active: 1729091421495@@127.0.0.1@5432@university_db

-- ! creating students table
CREATE Table students (
    student_id INTEGER UNIQUE PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(50) NOT NULL,
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(20)
)
-- ! inserting values in students table
INSERT INTO
    students (
        student_id,
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark
    )
VALUES (
        1,
        'Sameer',
        21,
        'sameer@example.com',
        48,
        60
    ),
    (
        2,
        'Zoya',
        23,
        'zoya@example.com',
        52,
        58
    ),
    (
        3,
        'Nabil',
        22,
        'nabil@example.com',
        37,
        46
    ),
    (
        4,
        'Rafi',
        24,
        'rafi@example.com',
        41,
        40
    ),
    (
        5,
        'Sophia',
        22,
        'sophia@example.com',
        50,
        52
    ),
    (
        6,
        'Hasan',
        23,
        'hasan@gmail.com',
        43,
        39
    );

SELECT *
FROM students
    -- ! creating courses table
CREATE TABLE courses (
    course_id INTEGER UNIQUE PRIMARY KEY, course_name VARCHAR(50) NOT NULL, credits INTEGER NOT NULL
)

SELECT *
FROM courses
    -- ! inserting values in courses table
INSERT INTO
    courses (
        course_id,
        course_name,
        credits
    )
VALUES (1, 'Next.js', 3),
    (2, 'React.js', 4),
    (3, 'Databases', 3),
    (4, 'Prisma', 3);

-- ! creating enrollment table
CREATE TABLE enrollment (
    enrollment_id INTEGER UNIQUE PRIMARY KEY,
    student_id INTEGER REFERENCES students (student_id) NOT NULL,
    course_id INTEGER REFERENCES courses (course_id) NOT NULL
)
-- ! inserting values in enrollment table
INSERT INTO
    enrollment (
        enrollment_id,
        student_id,
        course_id
    )
VALUES (1, 1, 1),
    (2, 1, 2),
    (3, 2, 1),
    (4, 3, 2);

SELECT * FROM enrollment

-- ! Query 1: