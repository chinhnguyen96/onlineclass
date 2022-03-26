--Create table
	CREATE TABLE Users(
    UserID INT NOT NULL,
	UserName VARCHAR(20) NOT NULL,
	UserAddress VARCHAR(100),
	UserPhone VARCHAR(20) NOT NULL,
	PRIMARY KEY(userid)
);

CREATE TABLE Student(
    Userid INT NOT NULL,
	PRIMARY KEY(UserID), FOREIGN KEY(UserID) REFERENCES Users(userID)
);

CREATE TABLE Teacher(
    UserID INT NOT NULL,
	PRIMARY KEY(UserID), FOREIGN KEY(UserID) REFERENCES Users(UserID)
);

CREATE TABLE BankCard(
    CardNumber VARCHAR(50) NOT NULL,
	ExpiryDate DATE,
	Bank VARCHAR(20),
	PRIMARY KEY(CardNumber)
);

CREATE TABLE Courses(
    CourseID INT NOT NULL,
	CourseName VARCHAR(20) NOT NULL,
    CoursePrice INT NOT NULL,
    PRIMARY KEY(CourseID)
);

CREATE TABLE BuyCourses(
    orderNumber INT NOT NULL,
	PaymentState VARCHAR(50) NOT NULL,
	creationTime DATE,
	totalAmount INT,
	PRIMARY KEY (orderNumber)
);

-- Weak Entity
CREATE TABLE ChatRoom(
    CreationTime DATE NOT NULL,
	userid INT NOT NULL,
	CourseID INT NOT NULL,
	NameRoom VARCHAR(50),
    PRIMARY KEY(CreationTime,UserID,CourseID), FOREIGN KEY(UserID) REFERENCES Teacher(UserID), FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Scores(
    UserID INT NOT NULL,
	CourseID INT NOT NULL,
	Score INT NOT NULL,
    PRIMARY KEY(Score,UserID), FOREIGN KEY(UserID) REFERENCES Student(UserID)
);

-- Relationship
CREATE TABLE Save_to_Courses(
    UserID INT NOT NULL,
    CourseID INT NOT NULL,
    addTime DATE,
    quantity INT,
    PRIMARY KEY (UserID,CourseID), FOREIGN KEY(UserID) REFERENCES Student(userID), FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Payment(
    orderNumber INT NOT NULL,
	CardNumber VARCHAR(50) NOT NULL,
	PayTime DATE,
	PRIMARY KEY(orderNumber,CardNumber), FOREIGN KEY(orderNumber) REFERENCES BuyCourses(orderNumber), FOREIGN KEY(CardNumber) REFERENCES BankCard(cardNumber)
);

CREATE TABLE Manage(
    UserID INT NOT NULL,
	CourseID INT NOT NULL,
	SetUpTime DATE,
	PRIMARY KEY(userid,CourseID), FOREIGN KEY(userid) REFERENCES Teacher(UserID), FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

--insert table	
	INSERT INTO users
		(userID, userName, userAddress, userPhone)
		VALUES
		(1,'Minh Nguyen','Ho Chi Minh','212-366-2000'),
		(2,'Nam Trung','Ho Chi Minh','312-366-2000'),
		(3,'Quoc Tran','Ho Chi Minh','222-366-2000'),
		(4,'Chau Nguyen','Not Available','Not Available'),
		(5,'Phu Nguyen','Da Nang','+84-2-8425-0100'),
		(6,'Tu Duong','Da Nang','212-320-7390'),		
		(7,'Hanh Le','Quang Ngai','212-419-2400'),
		(8,'Phuc Hoang','Quang Tri','+84-6-5588-6507'),
		(9,'Manh Nguyen','Ha Noi','333-207-7000'),
		(10,'Tam Tran','Ha Noi','234-307-5745'),
		(11,'Phuoc Doan','Ben Tre','212-256-2000'),
		(12,'Thao Le','Hue','212-420-1234'),
		(13,'Duyen Duong','Ha Noi','212-987-5500'),
		(14,'Nguyen Nguyen','Bac Giang','800-724-7830'),
		(15,'Bao To','Da Nang city','212-295-2000'),
		(16,'Phuc Tran','Ha Noi','083-307-5745'),
		(17,'Duong To','Ha Noi','083-307-9305'),
		(18,'Nhien Lam','Ho Chi Minh','998-307-5745'),
		(19,'Ha Le','Bac Ninh','083-112-5745'),
		(20,'Linh Lai','Thai Binh','083-307-9385');

	INSERT INTO student VALUES (1);
	INSERT INTO student VALUES (3);
	INSERT INTO student VALUES (5);
	INSERT INTO student VALUES (7);
	INSERT INTO student VALUES (9);
	INSERT INTO student VALUES (11);
	INSERT INTO student VALUES (13);
	INSERT INTO student VALUES (15);
	INSERT INTO student VALUES (17);
	INSERT INTO student VALUES (19);
	INSERT INTO student VALUES (2);
	INSERT INTO student VALUES (4);
	INSERT INTO student VALUES (6);
	INSERT INTO student VALUES (20);

	INSERT INTO teacher VALUES (8);
	INSERT INTO teacher VALUES (10);
	INSERT INTO teacher VALUES (12);
	INSERT INTO teacher VALUES (14);
	INSERT INTO teacher VALUES (16);
	INSERT INTO teacher VALUES (18);

	INSERT INTO BankCard
		(CardNumber, ExpiryDate, Bank)
		VALUES
		('4023 1231 3431 8623', '2039-9-10','ACB'),
		('5872 8293 3321 0123', '2020-5-14','ACB'),
		('5782 7293 8472 0318', '2028-8-15','VIB'),
		('5782 7293 8472 0318', '2028-8-15','VIB'),
		('4509 4462 9302 0716', '2030-1-30','VIB'),
		('8473 9299 8492 7361', '2024-6-20','TPBANK'),
		('4457 4992 7391 0219', '2025-8-30','TPBANK'),
		('5728 8391 7362 5381', '2035-5-20','ACB'),
		('7283 8982 8361 5593', '2029-4-14','SACOMBANK'),
		('9238 2749 5738 5921', '2027-8-01','VIETCOMBANK'),
		('2839 8219 3728 2933', '2031-5-20','VIETCOMBANK');

	INSERT INTO Courses
		(CourseID, CourseName, CoursePrice)
		VALUES
		(1,'Maths',380),
		(2,'Java & OOP',400),
		(3,'SQL & Excel',350),
		(4,'English',600),
		(5,'Python',400);

	INSERT INTO BuyCourses
		(orderNumber, PaymentState, creationTime,totalAmount)
		VALUES
		(1,'Paid','2021-09-21',2),
        (2,'UnPaid','2021-03-22',3),
		(3,'Unpaid','2020-01-23',2),
		(4,'Unpaid','2021-12-27',2),
		(5,'Paid','2020-05-30',3),
		(6,'Paid','2022-02-12',4),
		(7,'Unpaid','2021-12-27',1),
		(8,'Unpaid','2022-02-13',3),
		(9,'Paid','2021-08-22',2),
		(10,'UnPaid','2022-02-19',2),
		(11,'Paid','2021-01-03',1),
		(12,'Paid','2021-02-11',2);

	INSERT INTO ChatRoom
		(CreationTime, userid, CourseID,NameRoom)
		VALUES
		('2022-02-21',8,4,'Toeic'),
		('2021-09-18',10,1,'A1 Multistay analysis'),
		('2021-03-22',12,2,'Javas chatroom'),
		('2021-01-23',14,3,'SQL for beginner'),
		('2019-12-27',18,4,'Ielts'),
		('2020-05-30',16,5,'Python - opencv'),
		('2020-02-12',8,4,'VNU EPT'),
		('2021-12-27',10,3,'MS office'),
		('2021-05-30',12,3,'SQL & Excel for DA'),
		('2021-08-22',18,5,'Python for DA');

	INSERT INTO Scores
		(UserID, CourseID, Score)
		VALUES
		(1,2,8),
		(7,3,5),
		(3,4,7),
		(20,1,7),
		(1,5,9);

	INSERT INTO Save_to_Courses
		(UserID, CourseID, addTime, quantity)
		VALUES
		(5,1,'2021-02-21',1),
		(5,2,'2021-09-18',1),
		(20,3,'2021-03-22',2),
		(7,4,'2020-01-23',1),
		(9,5,'2020-12-27',2),
		(11,4,'2020-05-30',1),
		(13,3,'2021-02-19',3),
		(6,2,'2016-01-20',1);

	INSERT INTO Payment
		(orderNumber, CardNumber, PayTime)
		VALUES
		(1,'4902 9212 3402 8831','2021-09-21'),
		(5,'4023 1231 3431 8623','2020-05-30'),
		(6,'8473 9299 8492 7361','2022-02-12'),
		(9,'7283 8982 8361 5593','2021-08-22'),
		(11,'9238 2749 5738 5921','2021-01-03'),
		(12,'4902 9212 3402 8831','2021-02-11');
	
	INSERT INTO Manage
		(UserID, CourseID, SetUpTime)
		VALUES
		(8,4,'2018-12-24'),
		(10,1,'2017-03-20'),
		(12,2,'2017-08-09'),
		(14,3,'2018-03-04'),
		(16,5,'2016-05-06');

-- Data Modification
-- query the UserID, Score of the Scores in the same CourseID as userid 1   
SELECT UserID, Score
FROM Scores
WHERE Scores.CourseID IN (SELECT Courses.CourseID FROM Courses WHERE userid=1);

-- query the information of double Courses
SELECT *
FROM Courses
WHERE CourseName='&';

-- query the total quantity of Course from Courses with CourseID 4 of student
SELECT SUM(quantity) AS totalQuantity
FROM Save_to_Courses
WHERE Save_to_Courses.CourseID IN (SELECT Courses.Courseid FROM Courses WHERE courseid=4);

-- query the name and address of student bought course on 2022-02-12
SELECT UserName, UserAddress
FROM users
WHERE useraddress IN (SELECT useraddress FROM buycourses WHERE creationTime = '2022-02-12');

 -- query the chatroom of courseid 3  
 SELECT *
 FROM ChatRoom
 WHERE courseid = 3 ;

-- Insert the user id of teacher whose name starts with N into student
INSERT INTO student
SELECT * FROM teacher
WHERE userid IN (SELECT userid FROM users WHERE username LIKE 'N%');

-- Update the payment state of buycourses to unpaid which created after year 2020 and with total amount greater than 3.
UPDATE buycourses
SET paymentState = 'Unpaid'
WHERE creationTime > '2020-05-30' AND totalAmount > 3;

-- Update the name and phone number of users where the provice is Ninh Binh
UPDATE users
SET username = 'Tra Lam', userPhone ='87654321'
WHERE UserAddress = 'Ninh Binh';

-- Delete the Course which opened before year 2016
DELETE FROM Save_to_Courses
WHERE addTime < '2016-01-01';

-- Create view of all courses whose price above average price.
CREATE VIEW courses_above_average_price AS
SELECT courseid, coursename, courseprice 
FROM courses
WHERE courseprice > (SELECT AVG(courseprice) FROM courses);
select * from courses_above_average_price;

-- Update the view
UPDATE courses_Above_Average_Price
SET courseprice = 500000
WHERE coursename = 'C/C++';

-- Create view of all course sales in 2021.
CREATE VIEW course_Sales_For_2021 AS
SELECT courseid, coursename, courseprice
FROM courses
WHERE courseid IN (SELECT courseid FROM buycourses WHERE courseid IN 
              (SELECT courseid FROM Courses WHERE orderNumber IN
               (SELECT orderNumber FROM Payment WHERE payTime > '2021-01-01' AND payTime < '2021-12-31')
              )
             );

SELECT * FROM courses_sales_for_2021;

-- Update the view
UPDATE courses_sales_for_2021
SET courseprice = 800000
WHERE coursename = 'C/C++';

-- Check whether the courses saved to the buycourses after the year 2020 has quantities of smaller than 3.
DROP TABLE Save_to_courses;
CREATE TABLE Save_to_courses(
    userid INT NOT NULL,
    courseid INT NOT NULL,
	addTime DATE,
	quantity INT,
	PRIMARY KEY (userid,courseid), FOREIGN KEY(userid) REFERENCES student(userid), FOREIGN KEY(courseid) REFERENCES courses(courseid),CHECK (quantity <= 3 OR addTime > '2020-01-01')
);

INSERT INTO Save_to_courses VALUES(1,1,'2021-11-23',2);
INSERT INTO Save_to_courses VALUES(3,2,'2022-02-22',1);
INSERT INTO Save_to_courses VALUES(5,3,'2021-10-17',3);