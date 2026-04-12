CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    email VARCHAR(100),
    DOB DATE
);
DESC student;

/* ----------------------------------------------------------------------- */

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100) NOT NULL,
    publisher VARCHAR(100),
    year YEAR,
    ISBN VARCHAR(20)
);

DESC books;
ALTER TABLE books DROP COLUMN ISBN;
DESC books;

/* ----------------------------------------------------------------------- */

CREATE TABLE book_issues (
    issue_no INT PRIMARY KEY,
    book_id INT,
    student_id INT,
    date_of_issue DATE,
    date_of_return DATE,
    returned_book BOOLEAN,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

DESC book_issues;

/* ----------------------------------------------------------------------- */

INSERT INTO book_issues VALUES
    (1, 1, 1, '2026-01-01', '2026-01-10', TRUE),
    (2, 2, 2, '2026-01-23', '2026-01-25', TRUE),
    (3, 3, 3, '2026-02-03', NULL, FALSE),
    (4, 4, 4, '2026-02-05', NULL, FALSE),
    (5, 5, 5, '2025-12-15', '2025-12-25', TRUE),
    (6, 6, 6, '2025-12-31', NULL, FALSE),
    (7, 7, 7, '2026-01-07', '2026-01-17', TRUE),
    (8, 8, 8, '2026-02-04', NULL, FALSE),
    (9, 9, 9, '2026-01-09', '2026-01-29', TRUE),
    (10, 10, 10, '2026-02-01', NULL, FALSE);

/* ----------------------------------------------------------------------- */

INSERT INTO books VALUES 
    (1, "Introduction to Algorithms", "CLRS", 2022),
    (2, "Python for Data Analysis", "McKinney", 2012),
    (3, "R for Data Science", "Wickham", 2017),
    (4, "The Hundred-Page Machine Learning Book", "Burk", 2019),
    (5, "Deep Learning", "MIT Press", 2016),
    (6, "Artificial Intelligence: A Modern Approach", "Pearson", 2020),
    (7, "ML Guide", "MIT Press", 2020),
    (8, "Data Science", "Packt", 2021),
    (9, "Bioinformatics Algorithms: An Active Learning Approach", "Compeau", 2018),
    (10, "Cyber Security", "Pearson", 2018);

/* ----------------------------------------------------------------------- */

INSERT INTO student VALUES
    (1,"Monica","BDB", "monica@gmail.com", "2002-07-22" ),
    (2,"Chandler","BDB", "chandler@gmail.com", "2003-06-02" ),
    (3,"Rachel","BTBI", "rachel@gmail.com", "2000-05-11" ),
    (4,"JOey","BDB", "joe@gmail.com", "2004-08-26" ),
    (5,"Ross","BTBI", "ross@gmail.com", "2004-11-07" ),
    (6,"Phoebe","BTBI", "phoebe@gmail.com", "2000-10-23" ),
    (7,"Jim","BDB", "jim@gmail.com", "2003-01-24" ),
    (8,"Pam","BDB", "pamella@gmail.com", "2002-09-20" ),
    (9,"Michael","BTBI", "mike@gmail.com", "2000-09-16" ),
    (10,"Ishita","BDB", "ishita@gmail.com", "2004-07-16" );


/* ----------------------------------------------------------------------- */

SELECT * FROM books;
SELECT * FROM student;
SELECT * FROM book_issues;



/* ----------------------------------------------------------------------- */