 INSERT INTO `Hotel` (`hotel_name`,`hotel_id`,`address`,`contact_details`  ) VALUES
     ('Marriott','#hotel_1','PlatinumCity # 2, HMT Watch Factory Road,  Yeshwantpur ,Bangalore,Karnataka','9894765480')
;INSERT INTO `Guests` (  `name`,`login_id`,`email`,`contacts_details`) VALUES
     ('Andreas','$24w4','andres23@gmail.com','01292276263'),
     ('Addisyn','$26sd','addisyn43@gmail.com','02231062081'),
     ('Clarissa','$12ks','clarissa894@gmail.com','02222084529'),
     ('Caitlyn Gardner','$45ks','caitlyngar3432@gmail.com','02222084534'),
     ('Makenzie Jarvis','$23ls','jarvis93@gmail.com','03322208764'),
     ('Elias Harris','$20sl','eharris8@gmail.com','0124656811'),
     ('Giana Tyler','$93sk','jonytlyer73@gmail.com','0802287705'),
     ('Davion Patrick','$93al','davidson92@gmail.com','02228682203'),
     ('Houston','$02al','houstonchr@gmail.com','03322208764')
     
;Insert into `rooms` (`room_number`,`type`,`beds`, `level`,`hotel_id`,`log_id`) VALUES
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