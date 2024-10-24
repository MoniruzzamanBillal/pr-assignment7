-- Active: 1729091421495@@127.0.0.1@5432@university_db

-- ! creating students table
CREATE Table students (
    student_id SERIAL UNIQUE PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(50) NOT NULL,
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(20)
);
-- ! inserting values in students table
INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark
    )
VALUES (
        'Sameer',
        21,
        'sameer@example.com',
        48,
        60
    ),
    (
        'Zoya',
        23,
        'zoya@example.com',
        52,
        58
    ),
    (
        'Nabil',
        22,
        'nabil@example.com',
        37,
        46
    ),
    (
        'Rafi',
        24,
        'rafi@example.com',
        41,
        40
    ),
    (
        'Sophia',
        22,
        'sophia@example.com',
        50,
        52
    ),
    (
        'Hasan',
        23,
        'hasan@gmail.com',
        43,
        39
    );

-- ! creating courses table
CREATE TABLE courses (
    course_id SERIAL UNIQUE PRIMARY KEY,
    course_name VARCHAR(50),
    credits INTEGER
);
-- ! inserting values in courses table
INSERT INTO
    courses (course_name, credits)
VALUES ('Next.js', 3),
    ('React.js', 4),
    ('Databases', 3),
    ('Prisma', 3);

-- ! creating enrollment table
CREATE TABLE enrollment (
    enrollment_id SERIAL UNIQUE PRIMARY KEY,
    student_id INTEGER REFERENCES students (student_id) NOT NULL,
    course_id INTEGER REFERENCES courses (course_id) NOT NULL
);

-- ! inserting values in enrollment table
INSERT INTO
    enrollment (student_id, course_id)
VALUES (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);

-- ! Query 1:
INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'monir 1',
        24,
        'abc@d1.com',
        60,
        60,
        NULL
    );

--
-- ! Query 2

SELECT stu.student_name
from
    students as stu
    join enrollment as enr on stu.student_id = enr.student_id
    join courses as c on c.course_id = enr.course_id
where
    c.course_name = 'Next.js';
--
-- ! Query 3

UPDATE students
set
    status = 'Awarded'
where
    student_id = (
        SELECT student_id
        from students
        ORDER BY (frontend_mark + backend_mark) DESC
        LIMIT 1
    );
--

-- ! Query 4

DELETE FROM courses
WHERE
    course_id NOT in (
        SELECT DISTINCT
            course_id
        FROM enrollment
    );
--
-- ! Query 5
SELECT student_name from students OFFSET 2 LIMIT 2;
--

-- ! Query 6

SELECT courses.course_name, count(enrollment.student_id) as students_enrolled
from courses
    join enrollment on enrollment.course_id = courses.course_id
GROUP BY
    courses.course_name;
--