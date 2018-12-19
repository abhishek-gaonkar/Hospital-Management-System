# Hospital-Management-System
This is a repository consisting of the mini-project of a Hospital Management System.

# Scripting Languages Used
Client-Side: HTML, CSS, JS, Bootstrap
Server-Side: PHP, MySQL
Server: Apache through XAMPP

# Description
The project consists of Login System for both Doctors and Patient who can login securely.
The advantage here is that every doctor and every patient has a login page of his/her own, eliminating any prospect of centralized administrator maintaining the whole database him/herself.
Doctor mainpage: Consists of doctor's details, his/her patients and adding of patients, his/her test and treatment. The doctor can also delete his/her own patients only.
Patient Mainpage: Consists of patient's details, Can view his/her tests and treatments and Bill Details.

# Doctor and Patient password
Doctor: Enter DocID.
        Password is first 3 letters of doctor's name and then 'pas'.. example-- docid:password -> 101:manpas ; 102:jaypas.

Patient: Enter PatID.
        Password is simply pass_'PatID'.. example-- patid:password -> 311:pass_311 ; 314:pass_314.

# Trigger and Stored Procedure
Trigger is used to set Patient's Phone number as NULL when it is not 10 digits i.e., <10 or >10.
Stored Procedure is used to calculate patient's Bill automatically. DRAWBACK: Won't calculate unless patient has all details.

# Photos, Database, Report
Photos of this project are available in the misc folder.
Database i.e., sql file is in the misc folder. Utilize phpmyadmin or MySQL Workbench to import them, and set the database name as hdbms before importing.
Report is also available in misc folder. Edit as necessary since it has been written as per my college's regulations.

# Contributors for this project
Abhishek Gaonkar (Me :) 
Ananya B Madhusudhan
