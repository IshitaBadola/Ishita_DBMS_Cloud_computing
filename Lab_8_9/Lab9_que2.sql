CREATE TABLE student_food_subscription (
    student_id INT,
    food_subscribed BOOLEAN
);

INSERT INTO student_food_subscription VALUES (1, TRUE);
INSERT INTO student_food_subscription VALUES (2, FALSE);
INSERT INTO student_food_subscription VALUES (3, TRUE);

CREATE VIEW student_library_cafetaria AS
SELECT 
    l.student_name,
    c.food_subscribed
FROM library.student l
JOIN cafetaria.student_food_subscription c
ON l.student_id = c.student_id;

SELECT * FROM student_library_cafetaria;