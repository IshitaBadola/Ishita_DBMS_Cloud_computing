CREATE TABLE Student (
    Student_id INT PRIMARY KEY,
    Programme VARCHAR(10),
    DOB DATE,
    City VARCHAR(50)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_name VARCHAR(50),
    Course_coordinator VARCHAR(50)
);

CREATE TABLE Enroll (
    Student_id INT,
    Course_ID INT,
    PRIMARY KEY (Student_id, Course_ID),
    FOREIGN KEY (Student_id) REFERENCES Student(Student_id),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

INSERT INTO Student VALUES (1, 'MSc', '2000-05-10', 'Delhi');
INSERT INTO Student VALUES (2, 'PhD', '1998-11-20', 'Mumbai');
INSERT INTO Student VALUES (3, 'MSc', '2001-02-15', 'Chennai');
INSERT INTO Student VALUES (4, 'PhD', '1997-08-30', 'Kolkata');
INSERT INTO Student VALUES (5, 'MSc', '2000-12-01', 'Pune');

INSERT INTO Course VALUES (101, 'Database Systems', 'Dr. Rao');
INSERT INTO Course VALUES (102, 'Bioinformatics', 'Dr. Mehta');
INSERT INTO Course VALUES (103, 'Machine Learning', 'Dr. Sharma');
INSERT INTO Course VALUES (104, 'Data Mining', 'Dr. Gupta');
INSERT INTO Course VALUES (105, 'AI Fundamentals', 'Dr. Patel');


INSERT INTO Enroll VALUES (1, 101);
INSERT INTO Enroll VALUES (1, 102);
INSERT INTO Enroll VALUES (2, 103);
INSERT INTO Enroll VALUES (3, 101);
INSERT INTO Enroll VALUES (4, 104);




