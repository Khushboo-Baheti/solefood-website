# solefood-website
Sole Food is a web application with
Jsp and servlet as front end
Java in application layer 
mysql instance from aws cloud as database backend

To run the application :
prerequisite softwares
Apache Tomcat 7
java 1.8
MySQL

Deployment Steps:
1.copy the Database.war to tomcat webappfolder
2.start tomcat and go to http://localhost:8080/Database to run our application
3.login/registration page will open. login/register  your details to go to the site
4.after login home page will be displayed where you can choose the shoe you want to purchase
5.after selecting shoes it will ask for confirm order 
6.after confirming order it will go to delivery address page where you can see the address given before and if you want to change the address you can change and save it
7.After ordering it will take you to final page

Notes:
# currently not running on AWS
Currently, we are running our database backend in AWS using their RDS-Mysql DB.
To run local Mysql DB:
1. Load the attached solefooddb.sql to setup db and inialize with the required data
2. Change the connection string in ConnectMysql.java to connect to the local db
3. Create war and follow the above deployment steps
