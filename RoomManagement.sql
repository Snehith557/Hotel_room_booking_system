/*  4 tables have to be created */
/* 
1. Hotel
2. Rooms
3. Reservations
4. Guests
 */


CREATE TABLE  `Hotel`(
    `hotel_name` varchar(20) NOT NULL,
    `hotel_id` varchar(10) PRIMARY KEY,
    `address` varchar(30),
    `contact_details` varchar(50) NOT NULL
   /* add total number of rooms */
   
 );
 INSERT INTO `Hotel` (`hotel_name`,`hotel_id`,`address`,`contact_details`  ) VALUES
     ('Marriott','#hotel_1','PlatinumCity # 2, HMT Watch Factory Road,  Yeshwantpur ,Bangalore,Karnataka','9894765480')
;

CREATE TABLE Guests(
   `name` varchar(20) NOT NULL,
   `login_id` varchar(20)  PRIMARY KEY,
   `email` varchar(20) NOT NULL,
   `contacts_details` varchar(30)

);
INSERT INTO `Guests` (  `name`,`login_id`,`email`,`contacts_details`) VALUES
     ('Andreas','$24w4','andres23@gmail.com','01292276263'),
     ('Addisyn','$26sd','addisyn43@gmail.com','02231062081'),
     ('Clarissa','$12ks','clarissa894@gmail.com','02222084529'),
     ('Caitlyn Gardner','$45ks','caitlyngar3432@gmail.com','02222084534'),
     ('Makenzie Jarvis','$23ls','jarvis93@gmail.com','03322208764'),
     ('Elias Harris','$20sl','eharris8@gmail.com','0124656811'),
     ('Giana Tyler','$93sk','jonytlyer73@gmail.com','0802287705'),
     ('Davion Patrick','$93al','davidson92@gmail.com','02228682203'),
     ('Houston','$02al','houstonchr@gmail.com','03322208764')
     
;
CREATE TABLE  `Rooms`(
   `room_number` int PRIMARY KEY,
   `type` varchar(20)NOT NULL,
   `beds` int NOT NULL,
   `level` int NOT NULL,
   `hotel_id`  varchar(10),
   `log_id` varchar(10),
   FOREIGN KEY (`hotel_id`) REFERENCES Hotel(`hotel_id`),
   FOREIGN KEY (`log_id`)REFERENCES Guests(`login_id`)
);


/* inserting unoccupied rooms */
Insert into `rooms` (`room_number`,`type`,`beds`, `level`,`hotel_id`,`log_id`) VALUES
   (202,'normal',2,2,'#hotel_1',NULL)
   (203,'delux',3,2,`#hotel_1`,NULL)
   (210,'double',2,2,`#hotel_1`,NULL);
/* inserting occupied rooms */
INSERT INTO `Rooms` ( `room_number`,`type`,`beds`,`level`,`hotel_id` ,`log_id` ) VALUES
     (201,'delux',3,2,'#hotel_1','$24w4'),
     (205,'normal',1,2,'#hotel_1','$02al'),
     (301,'normal',1,3,'#hotel_1','$93al'),
     (102,'double',2,1,'#hotel_1','$93sk'),
     (402,'normal',1,4,'#hotel_1','$20sl'),
     (401,'normal',1,4,'#hotel_1','$23ls'),
     (204,'delux',3,2,'#hotel_1','$45ks'),
     (302,'delux',3,3,'#hotel_1','$12ks'),
     (209,'double',2,2,'#hotel_1','$26sd')
;




 CREATE TABLE `Reservations`(
    `res_id` varchar(20)  PRIMARY KEY,
    `check_in` DATE NOT NULL,
    `check_out` DATE,
    `trans_details` varchar(20)NOT NULL UNIQUE,
    `room_num` int,
    `log_id` varchar(10),
     FOREIGN KEY (`room_num`) REFERENCES Rooms(`room_number`),
	FOREIGN KEY (`log_id`) REFERENCES Guests(`login_id`)
     
 );

ALTER TABLE   Reservations MODIFY  check_in Date;
ALTER TABLE   Reservations MODIFY  check_out Date;

INSERT INTO `Reservations` (`res_id`,`check_in`,`check_out`,`trans_details`, `room_num`,`log_id`  ) VALUES
   ('&32la','2022-10-25',NULL,'Fair - 20000 rupees transaction_id : $sd123 Date:24/05/2022',205,'$02al'),     
   ('&92jy','2022-10-11','2022-10-15','Fair - 8000 rupees transaction_id :$sd231 Date:11/05/2022',301,'$93al'),     
   ('&23as','2022-10-23','2022-10-25','Fare - 15000 rupees transaction_id : $2sa112 Date:20/10/2022',201,'$24w4'),     
   ('&28xv','2022-11-01',NULL,'Fair - 6000 rupees transaction_id : $as124 Date:31/10/2022',102,'$20sl'),     
   ('&81fh','2022-11-04',NULL,'Fair - 8500 rupees transaction_id : $sa212 Date: 03/10/2022',402,'$23ls'),     
   ('&73kf','2022-10-21','2022-10-23','Fair  - 6000 rupees transaction_id : $ Date15/10/2022 : ',401,'$45ks'),     
   ('&94kg','2022-10-25','2022-10-28','Fair - 900 rupees transaction_id : $ Date :24/10/2022 ',204,'$45ks'),     
   ('&74sv','2022-11-10',NULL,'Fair - 15000 rupees transaction_id : $ Date : 08/11/2022',302,'$12ks'),     
   ('&84rs','2022-11-5',NULL,'Fair - 9000 rupees transaction_id : $ Date : 05/11/2022',209,'$26sd')  
;

Alter table Reservations MODIFY trans_details(100)
use new;
ALTER TABLE Hotel ADD total_reservations int;

update hotel set 	total_reservations = 9;


/* creating a trigger to increment the total number of reservations in the hotel table 
for each insert in reservations */
CREATE TRIGGER update_reservations1
after INSERT on reservations for EACH row
UPDATE hotel set total_reservations = total_reservations+1
/* creating another trigger to decrement the total number of reservations in the hotel table if the person checks out */

CREATE TRIGGER update_reservations2
after DELETE on reservations for EACH row
UPDATE hotel set total_reservations = total_reservations-1

DELETE from reservations where res_id ="&84rs"

/*  creating functions
   create a function that returns how many days have passed since the person first visited the hotel
   today_date - Reservation_date 

 */



use new;
DELIMITER //

   CREATE FUNCTION no_of_days(date1 date) RETURNS int DETERMINISTIC
   BEGIN
   DECLARE date2 DATE;
   Select current_date()into date2;
   RETURN date(date2)-date(date1);
   END 

//

DELIMITER ;


SELECT res_id , check_in ,no_of_years(check_in) from reservations ;
/* // gives the nubmer of days past from the customer first visited the hotel to till date */






/* // difference between a stored procedure and a function  */
/*  * A function should always return a value 
    * Stored Procedure need not to return a value optional

    * Functions can be called from a procedure
    * But the other way is not possible i.e a procedure cannot be called from a function
 */


 use lab;

delimiter //
CREATE FUNCTION show_data(id int) returns varchar(30) DETERMINISTIC
	BEGIN
    	declare name varchar(30);
        SELECT name into name from students where id = id; 
        RETURN name ;
        
    
	END //
 delimiter