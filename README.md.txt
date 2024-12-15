Business Card Manager
Overview
Business Card Manager is a modern web application for managing business card information. It allows users to create, view, import, export, and filter business cards with ease. The project adheres to clean code practices, SOLID principles, and modern design standards.
---------------

Features
Create Business Cards: Add new business card details via a user-friendly form.
View Business Cards: List all stored business cards with options to filter, delete, or export.
Import/Export: Import data from XML/CSV files and export business cards in XML/CSV format.
Optional Filtering: Filter cards by name, gender, date of birth, phone, or email.
Photo Encoding: Store business card photos as Base64 strings.
Responsive Design: Optimized for desktop and mobile use.

------------------
Technology Stack
Frontend: Angular
Backend: .NET Core (C#) Web API (Minimum .NET 6)
Database: SQL Server, PostgreSQL, or Oracle
Photo Encoding: Base64
----------
Prerequisites
Ensure the following are installed:

Node.js (for Angular)
Angular CLI
.NET SDK
A database server (SQL Server)


-------------
Setup Instructions

(Backend)
1- Navigate to the backend folder:

2- Restore dependencies:

Copy code
dotnet restore

3- Run the backend:
dotnet run

--------------
Frontend
1 - Navigate to the frontend folder:

cd Frontend


2 - Install dependencies:

npm install
3 - Run the Angular app:
ng serve
The frontend will be available at http://localhost:4200.

-----------

Database
1-Open your database management tool (e.g., SQL Server Management Studio).
2-Run the provided SQL script DB_Script.sql from the Database folder.
3-Ensure the database connection string in the backend matches your setup.
----------------------
Author
Developed by Abdelrahman. For queries or feedback, please contact afabdel@hotmail.com