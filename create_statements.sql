CREATE TABLE  `Hotel`(
    `hotel_name` varchar(20) NOT NULL,
    `hotel_id` varchar(10) PRIMARY KEY,
    `address` varchar(30),
    `contact_details` varchar(50) NOT NULL
   /* add total number of rooms */
   
 );

 CREATE TABLE Guests(
   `name` varchar(20) NOT NULL,
   `login_id` varchar(20)  PRIMARY KEY,
   `email` varchar(20) NOT NULL,
   `contacts_details` varchar(30)

);


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


 use lab;

create table `grades` (
	`sub_1` int,
    `sub_2` int,
    `std_id` int,
   	FOREIGN key (`std_id`) REFERENCES students(`id`)
    
);