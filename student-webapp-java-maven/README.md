# Student Web Application

Java 21 + Maven + Tomcat 10.1 + MySQL.

## Build

mvn clean package

The WAR file will be:
target/student-webapp.war

## Database

Run database.sql in MySQL/RDS.

Set these environment variables before starting Tomcat:

DB_URL=jdbc:mysql://YOUR-RDS-ENDPOINT:3306/studentdb?useSSL=false&serverTimezone=UTC
DB_USER=admin
DB_PASSWORD=YOUR_PASSWORD

## Tomcat

Copy target/student-webapp.war to Tomcat's webapps directory.

Open:

http://YOUR-TOMCAT-SERVER:8080/student-webapp/students
