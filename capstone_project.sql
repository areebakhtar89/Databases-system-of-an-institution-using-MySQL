CREATE DATABASE project;

USE project;

CREATE TABLE student(
    ID INT PRIMARY KEY,
    Last_Name VARCHAR(20),
    First_Name VARCHAR(20),
    College_ID INT,
    Email VARCHAR(40)
);

CREATE TABLE schedule(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Day VARCHAR(20),
    Start_Time TIME(0),
    End_Time TIME(0)
);

CREATE TABLE course(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Description VARCHAR(20),
    Type VARCHAR(20),
    Term VARCHAR(20)
);

CREATE TABLE instructor(
    ID INT PRIMARY KEY,
    College_ID INT,
    Last_name VARCHAR(20),
    First_Name VARCHAR(20),
    Inst_Rank INT,
    Type VARCHAR(20),
    Dept_ID INT
);

CREATE TABLE department(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Inst_ID INT,
    Phone INT,
    Email VARCHAR(20),
    CONSTRAINT fk_instructor_instID FOREIGN KEY (Inst_ID) REFERENCES instructor(ID)
);

CREATE TABLE section(
    ID INT PRIMARY KEY,
    Name VARCHAR(20),
    Course_ID INT,
    Schedule_ID INT,
    Inst_ID INT,
    Room INT,
    CONSTRAINT fk_course_courseID FOREIGN KEY (Course_ID) REFERENCES Course(ID),
    CONSTRAINT fk_schedule_scheduleID FOREIGN KEY (Schedule_ID) REFERENCES schedule(ID),
    CONSTRAINT fk_inst_instID FOREIGN KEY (Inst_ID) REFERENCES instructor(ID)
);

CREATE TABLE attendance(
    ID INT PRIMARY KEY,
    Student_ID INT,
    Section_ID INT,
    Date_Attendend DATE,
    Hours TIME(0), 
    CONSTRAINT fk_student_studentid FOREIGN KEY (Student_ID) REFERENCES student(ID),
    CONSTRAINT fk_section_sectionid FOREIGN KEY (Section_ID) REFERENCES section(ID)
);

CREATE TABLE enrollment(
    ID INT PRIMARY KEY,
    Academic_Year VARCHAR(20),
    Term VARCHAR(20),
    Date_Enrolled DATE,
    Student_ID INT,
    Section_ID INT,
    Midterm_Grade INT,
    Final_Grade INT,
    CONSTRAINT fk_student_student_id FOREIGN KEY (Student_ID) REFERENCES Student(ID),
    CONSTRAINT fk_section_section_id FOREIGN KEY (Section_ID) REFERENCES section(ID)
);

DESCRIBE student;
DESCRIBE course;
DESCRIBE schedule;
DESCRIBE instructor;
DESCRIBE department;
DESCRIBE section;
DESCRIBE attendance;
DESCRIBE enrollment;
#inserting values into students

INSERT into student VALUES (1, 'Patel', 'Raj', 10, 'patel.raj@email.com');
INSERT into student VALUES (2, 'Akhtar', 'Areeb', 20, 'a.a@email.com');
INSERT into student VALUES (3, 'Mane', 'Nitesh', 30, 'm.n@email.com');
INSERT into student VALUES (4, 'Pandey', 'Rishabh', 40, 'p.r@email.com');
INSERT into student VALUES (5, 'Shukla', 'Akarsh', 50, 's.a@email.com');
INSERT into student VALUES (6, 'Malhotra', 'Rohan', 60, 'm.r@email.com');
INSERT into student VALUES (7, 'Goraya', 'Balpreet', 70, 'g.b@email.com');
INSERT into student VALUES (8, 'Manocha', 'Manan', 80, 'm.m@email.com');
INSERT into student VALUES (9, 'Singh', 'Abhishek', 90, 's.a@email.com');
INSERT into student VALUES (10, 'Chaudhary', 'Hitesh', 100, 'c.h@email.com');
INSERT into student VALUES (11, 'Soni', 'Munket', 110, 's.m@email.com');
INSERT into student VALUES (12, 'Pillai', 'Sooraj', 120, 'p.s@email.com');
INSERT into student VALUES (13, 'Panchal', 'Dhrrumil', 130, 'p.d@email.com');
INSERT into student VALUES (14, 'Azmi', 'Abdul', 140, 'a.a@email.com');
INSERT into student VALUES (15, 'Bhosle', 'Pranav', 150, 'b.p@email.com');
INSERT into student VALUES (16, 'Singh', 'Dhruvraaj', 160, 'd.s@email.com');
INSERT into student VALUES (17, 'Tony', 'Chris', 170, 'c.t@email.com');
INSERT into student VALUES (18, 'Togarwar', 'Anchal', 180, 'a.t@email.com');
INSERT into student VALUES (19, 'pawar', 'Prachi', 190, 'p.p@email.com');
INSERT into student VALUES (20, 'Mallik', 'Rushil', 200, 'r.m@email.com');

SELECT * FROM student;

#inserting values into course

INSERT INTO course VALUES (121, 'Management', 'Business', 'online', 'Second');
INSERT INTO course VALUES (131, 'Management', 'Finance', 'hybrid', 'Third');
INSERT INTO course VALUES (141, 'Technical', 'Engineer', 'hubrid', 'Fourth');
INSERT INTO course VALUES (151, 'Automation', 'Automobile', 'online', 'Sixth');
INSERT INTO course VALUES (161, 'Management', 'Sports', 'online', 'First');

SELECT * FROM course;

#inserting values into schedule

INSERT INTO schedule VALUES (001, 'Python', 'Monday', '10:00:00', '12:00:00');
INSERT INTO schedule VALUES (002, 'Finance', 'Tuesday', '11:00:00', '13:00:00');
INSERT INTO schedule VALUES (003, 'Ananlysis', 'Wednesday', '12:30:00', '14:00:00');
INSERT INTO schedule VALUES (004, 'Networks', 'Thursday', '10:00:00', '12:00:00');
INSERT INTO schedule VALUES (005, 'Data', 'Friday', '15:00:00', '16:30:00');
INSERT INTO schedule VALUES (006, 'Analysis', 'Tuesday', '09:00:00', '11:00:00');
INSERT INTO schedule VALUES (007, 'java', 'Wednesday', '13:00:00', '15:00:00');
INSERT INTO schedule VALUES (008, 'Mechanics', 'Monday', '10:00:00', '12:00:00');
INSERT INTO schedule VALUES (009, 'Accounts', 'Thursday', '13:00:00', '15:00:00');
INSERT INTO schedule VALUES (010, 'File Handling', 'Wednesday', '11:00:00', '13:00:00');
INSERT INTO schedule VALUES (011, 'Java', 'Monday', '09:00:00', '11:30:00');
INSERT INTO schedule VALUES (012, 'Data Mining', 'Tuesday', '13:00:00', '15:00:00');
INSERT INTO schedule VALUES (013, 'Risk Management', 'Friday', '11:00:00', '13:00:00');
INSERT INTO schedule VALUES (014, 'Economics', 'Wednesday', '09:00:00', '11:00:00');
INSERT INTO schedule VALUES (015, 'Statistics', 'Thursday', '12:00:00', '14:30:00');

SELECT * FROM schedule;

#inserting values into instructor

INSERT INTO instructor VALUES (90, 01, 'Gidwani', 'Pankaj', 8, 'Assistant Professor', 211);
INSERT INTO instructor VALUES (91, 02, 'Rawat', 'Abhishek', 9, 'Head Professor', 213);
INSERT INTO instructor VALUES (92, 03, 'Koul', 'Mayur', 10, 'Lab Professor', 213);
INSERT INTO instructor VALUES (93, 04, 'Chahuha', 'Hari', 7, 'Research Professor', 214);
INSERT INTO instructor VALUES (94, 05, 'Wadekar', 'Himanshu', 8, 'Assistant Professor', 215);
INSERT INTO instructor VALUES (95, 06, 'Patil', 'Rajas', 7, 'Assistant Professor', 214);
INSERT INTO instructor VALUES (96, 07, 'Dere', 'Neha', 9, 'Head of Department', 213);
INSERT INTO instructor VALUES (97, 08, 'Bhosle', 'Tanvi', 10, 'Assistant Professor', 211);
INSERT INTO instructor VALUES (98, 09, 'Ajgaonkar', 'Saihita', 9, 'Assistant Professor', 212);
INSERT INTO instructor VALUES (99, 010, 'Bhilare', 'Nishant', 7, 'Assistant Professor', 215);
INSERT INTO instructor VALUES (911, 011, 'Meghani', 'Yash', 9, 'Head of Department', 211);
INSERT INTO instructor VALUES (912, 012, 'Ayub', 'Remia', 10, 'Research Professor', 213);
INSERT INTO instructor VALUES (913, 013, 'Phadke', 'Mayitri', 8, 'Head Professor', 214);
INSERT INTO instructor VALUES (914, 014, 'Bandawar', 'Pratish', 9, 'Head of Department', 211);
INSERT INTO instructor VALUES (9015, 015, 'Devikar', 'Vinay', 10, 'Assistant Professor', 215);

SELECT * FROM instructor;

UPDATE instructor SET dept_id = 211 WHERE id = 91;
UPDATE instructor SET dept_id = 212 WHERE id = 96;
UPDATE instructor SET dept_id = 213 WHERE id = 911;
UPDATE instructor SET dept_id = 215 WHERE id = 914;

#Inserting Values into department

INSERT INTO department VALUES (211, 'Mechanical', 91, 43355, 'a.a@email.com');
INSERT INTO department VALUES (212, 'Management', 96, 87755, 'b.b@email.com');
INSERT INTO department VALUES (213, 'Engineering', 911, 76655, 'c.c@email.com');
INSERT INTO department VALUES (214, 'Sports', 913, 22355, 'd.d@email.com');
INSERT INTO department VALUES (215, 'Automation', 914, 24567, 'e.e@email.com');

SELECT * FROM department;

#Inserting values in section
 
INSERT INTO section VALUES (1, 'section_a', 121, 001, 95, 101);
INSERT INTO section VALUES (2, 'section_b', 131, 002, 94, 102);
INSERT INTO section VALUES (3, 'section_c', 121, 003, 91, 103);
INSERT INTO section VALUES (4, 'section_d', 151, 004, 96, 104);
INSERT INTO section VALUES (5, 'section_e', 131, 005, 911, 105);
INSERT INTO section VALUES (6, 'section_f', 131, 006, 90, 103);
INSERT INTO section VALUES (7, 'section_g', 131, 007, 913, 102);
INSERT INTO section VALUES (8, 'section_h', 151, 008, 93, 105);
INSERT INTO section VALUES (9, 'section_i', 151, 009, 914, 101);
INSERT INTO section VALUES (10, 'section_j', 161, 010, 97, 102);
INSERT INTO section VALUES (11, 'section_k', 121, 006, NULL, 103);
INSERT INTO section VALUES (12, 'section_l', 131, 007, NULL, 102);
INSERT INTO section VALUES (13, 'section_m', 141, 008, 93, 105);
INSERT INTO section VALUES (14, 'section_n', 151, 009, NULL, 101);
INSERT INTO section VALUES (15, 'section_o', 121, 010, 97, 102);

SELECT * FROM section;

#inserting values into attendace

INSERT INTO attendance VALUES (201, 1, 1, '2019-01-01', 03);
INSERT INTO attendance VALUES (202, 2, 2, '2019-01-08', 02);
INSERT INTO attendance VALUES (203, 3, 3, '2019-01-03', 03);
INSERT INTO attendance VALUES (204, 4, 4, '2019-01-06', 01);
INSERT INTO attendance VALUES (205, 5, 5, '2019-02-01', 04);
INSERT INTO attendance VALUES (206, 6, 6, '2019-01-08', 05);
INSERT INTO attendance VALUES (207, 7, 7, '2019-02-09', 01);
INSERT INTO attendance VALUES (208, 8, 8, '2019-03-11', 04);
INSERT INTO attendance VALUES (209, 9, 9, '2019-04-01', 02);
INSERT INTO attendance VALUES (210, 10, 10, '2019-03-03', 05);
INSERT INTO attendance VALUES (211, 11, 1, '2019-01-05', 02);
INSERT INTO attendance VALUES (212, 12, 2, '2019-03-07', 05);
INSERT INTO attendance VALUES (213, 13, 3, '2019-02-09', 04);
INSERT INTO attendance VALUES (214, 14, 4, '2019-04-02', 02);
INSERT INTO attendance VALUES (215, 15, 5, '2019-01-05', 03);

SELECT * FROM attendance;

#inserting values into enrollment

INSERT INTO enrollment VALUES (811, '2018', 'Second', '2018-12-12', 1, 1, 8, 10);
INSERT INTO enrollment VALUES (812, '2019', 'Third', '2018-12-12', 2, 2, 7, 9);
INSERT INTO enrollment VALUES (813, '2019', 'Fourth', '2018-12-12', 3, 3, 6, 8);
INSERT INTO enrollment VALUES (814, '2019', 'Fourth', '2018-12-12', 4, 4, 5, 7);
INSERT INTO enrollment VALUES (815, '2019', 'Second', '2018-12-12', 5, 5, 7, 9);
INSERT INTO enrollment VALUES (816, '2019', 'Third', '2018-12-12', 6, 6, 8, 10);
INSERT INTO enrollment VALUES (817, '2019', 'first', '2018-12-12', 7, 7, 7, 9);
INSERT INTO enrollment VALUES (818, '2019', 'fourth', '2018-12-12', 8, 8, 8, 10);
INSERT INTO enrollment VALUES (819, '2019', 'Second', '2018-12-12', 9, 9, 8, 10);
INSERT INTO enrollment VALUES (820, '2019', 'Second', '2018-12-12', 10, 10, 8, 10);
INSERT INTO enrollment VALUES (821, '2019', 'Third', '2018-12-12', 11, 1, 6, 8);
INSERT INTO enrollment VALUES (822, '2019', 'Fourth', '2018-12-12', 12, 2, 7, 9);
INSERT INTO enrollment VALUES (823, '2019', 'Second', '2018-12-12', 13, 3, 8, 9);
INSERT INTO enrollment VALUES (824, '2019', 'First', '2018-12-12', 14, 4, 9, 10);
INSERT INTO enrollment VALUES (825, '2019', 'Second', '2018-12-12', 15, 5, 10, 10);

SELECT * FROM enrollment;

#1 Create monthly report of the stuents of management

SELECT * FROM attendance WHERE student_id IN 
(SELECT id FROM section WHERE section.course_id IN 
(SELECT id FROM course WHERE name = 'management'))
ORDER BY attendance.id;

#2 Determine the list of students who have enrolled for multiple courses thus finding out most popular one

SELECT s.first_name, sec.course_id
FROM student s INNER JOIN enrollment e 
ON s.id = e.student_id 
INNER JOIN section sec 
ON sec.id = e.section_id;
#INNER JOIN course c 
#ON sec.course_id = c.id;
#GROUP BY sec.course_id;

#prepare a schedule for every instructor to determine the courses they are supposed to conduct

SELECT i.id, concat(i.first_name,' ',i.last_name) 
as Professor, sch.name, sch.day, sch.start_time, sch.end_time
FROM instructor i INNER JOIN section s   
ON i.id = s.inst_id 
INNER JOIN schedule sch 
ON s.schedule_id = sch.id;

#Make a marksheet of every student for every course

SELECT s.id, CONCAT(s.first_name,' ',s.last_name) 
as Name, e.final_grade, c.name 
FROM student s INNER JOIN enrollment e  
ON s.id = e.student_id
LEFT JOIN section sec 
ON e.section_id = sec.id
INNER JOIN course c 
ON sec.course_id = c.id
ORDER BY final_grade DESC, s.id ASC;

#Determine how many instructors are present for every department

SELECT department.name AS 'Department Name', COUNT(instructor.dept_id) 
AS 'No of Instructors' 
FROM department RIGHT JOIN instructor
ON department.id = instructor.dept_id
GROUP BY department.name;

#Find courses that are offered based on its types

SELECT name as 'Course Name', type as 'Type' FROM course;

#classrooms occupied during particular time interval in the schedule

SELECT sch.day, sch.start_time, sch.end_time, sec.room 
FROM schedule sch RIGHT JOIN section sec  
ON sch.id = sec.schedule_id;
#ORDER BY sec.room;

#find students with absences(3 hrs)

SELECT s.id, CONCAT(s.first_name,' ',s.last_name) as Name, a.hours
FROM student s JOIN attendance a 
ON s.id=a.student_id AND a.hours<=3;

#Print course names for sections with unassigned instructors

SELECT c.name as 'Name'
FROM course c JOIN section s
ON c.ID = s.course_ID AND s.inst_ID IS NULL;

#Find courses with no more than 1 section

SELECT s.Section_ID, s.Section_Name, s.Course_ID,c.name, c.description
FROM (SELECT name as Section_Name, ID as Section_ID, course_ID, 
COUNT(course_id) as CNT FROM section GROUP BY course_id) s 
JOIN course c
WHERE s.CNT=1;

