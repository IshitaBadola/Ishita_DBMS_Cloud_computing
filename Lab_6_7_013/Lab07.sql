ALTER TABLE book_issues
ADD fine DECIMAL(8,2);

DESC book_issues;

/* ------------------------------------------------------------------------------*/

SELECT * FROM book_issues WHERE fine IS NULL;

UPDATE book_issues
SET fine = 0
WHERE fine IS NULL;

ALTER TABLE book_issues
MODIFY fine DECIMAL(8,2) NOT NULL DEFAULT 0;


DESC book_issues;

/* -------------------------------------------------------------------------------*/

UPDATE book_issues
SET fine = 50
WHERE return_date IS NULL;

SELECT * FROM book_issues;

/* -------------------------------------------------------------------------------*/

SELECT s.student_name, b.book_name
FROM book_issues bi
INNER JOIN student s ON bi.student_id = s.student_id
INNER JOIN books b ON bi.book_id = b.book_id;

/* -------------------------------------------------------------------------------*/


SELECT b.book_name, s.student_name
FROM books b
LEFT JOIN book_issues bi ON b.book_id = bi.book_id
LEFT JOIN student s ON bi.student_id = s.student_id;

/* -------------------------------------------------------------------------------*/

UPDATE book_issues
SET fine = fine+50
WHERE returned_book = 0;

/* -------------------------------------------------------------------------------*/

UPDATE book_issue bi
JOIN student s ON bi.student_id = s.student_id
WHERE s.department = 'Maths'
AND bi.returned_book = 0;
SET bi.fine = fine + 100

/* -------------------------------------------------------------------------------*/

SELECT s.student_name, bi.fine
FROM book_issue bi
JOIN student s ON bi.student_id = s.student_id
WHERE bi.fine > 0
AND bi.returned_book = 0
ORDER BY bi.fine DESC;

/* -------------------------------------------------------------------------------*/

UPDATE book_issues
SET fine = 0
WHERE returned_book =0;

/* -------------------------------------------------------------------------------*/

SELECT *
FROM student
WHERE department IN ('Mathematics', 'Physics');
