**Introduction**
Overview
CareerPathway is a comprehensive job portal designed to connect job seekers with potential employers. The platform allows users to create profiles, search for jobs, apply for positions, and manage their applications. Employers can post job listings, manage applications, and find suitable candidates.

Purpose and Objectives
The primary objective of CareerPathway is to streamline the job search and hiring process, making it easier for job seekers to find suitable positions and for employers to find qualified candidates.

Key Features
User account management
Job search and application
Job listing management for employers
Admin dashboard for managing users and listings
Getting Started
System Requirements
A modern web browser (Google Chrome, Mozilla Firefox, Microsoft Edge, etc.)
Internet connection
Installation Instructions
Clone the repository:
git clone https://github.com/Adam-830/CareerPathway.git
Navigate to the project directory:
cd CareerPathway
Set up the database (MySQL):
Create a database named careerpathway
Import the database schema from schema.sql file
Configure the database connection in src/util/DBConnection.java
Configuration Steps
Open the project in your preferred IDE (e.g., IntelliJ IDEA, Eclipse).
Configure the server (e.g., Apache Tomcat) to run the project.
Deploy the project to the server and ensure it is running.
Using the Application
User Roles and Permissions
Job Seeker: Can search for jobs, apply for positions, and manage their applications.
Employer: Can post job listings, manage job listings, and view applications.
Admin: Has access to the admin dashboard to manage users and job listings.
Navigating the User Interface
Home Page: Provides an overview of the platform and allows users to navigate to different sections.
Login/Register: Allows users to create an account or log in to an existing account.
Profile: Allows users to view and update their profile information.
Job Listings: Displays a list of available job listings that users can search and apply for.
Managing Your Account
Creating an Account
Navigate to the Register page.
Fill in the required information (username, email, password, etc.).
Click the Register button to create an account.
Logging In and Out
Log In:
Navigate to the Login page.
Enter your username and password.
Click the Login button to access your account.
Log Out:
Click the Logout button in the navigation bar to log out of your account.
Updating Profile Information
Navigate to the Profile page.
Update the necessary information (skills, experience, education, etc.).
Click the Save Changes button to save the updates.
Job Listings
Searching for Jobs
Navigate to the Job Listings page.
Use the search bar to enter job titles or keywords.
Filter results by location using the dropdown menu.
Click the Search button to view matching job listings.
Applying for Jobs
Browse the job listings and click on a job title to view details.
Click the Apply Now button to submit an application.
Fill in the required information and submit your application.
Managing Job Applications
View and manage your job applications from the Profile page under the Applications section.
Employer Features
Posting Job Listings
Navigate to the Admin Dashboard.
Click the Add Job Listing button.
Fill in the job details (title, description, salary, location, etc.).
Click the Submit button to post the job listing.
Managing Job Listings
View and manage your job listings from the Admin Dashboard under the Job Listings section.
Viewing and Managing Applications
View and manage applications for your job listings from the Admin Dashboard under the Applications section.
Admin Features
Admin Dashboard Overview
The Admin Dashboard provides an overview of all users, job listings, and applications on the platform.
Managing Users
Navigate to the Admin Dashboard.
Click the Users section to view all registered users.
Perform actions such as editing user details or deleting users.
Managing Job Listings and Applications
View and manage all job listings and applications from the respective sections in the Admin Dashboard.
Troubleshooting and Support
Common Issues and Solutions
Unable to log in: Ensure you are using the correct username and password. If you have forgotten your password, use the Forgot Password feature to reset it.
Database connection error: Verify that the database is running and the connection details in DBConnection.java are correct.
Appendix
Glossary of Terms
Job Seeker: A user looking for job opportunities.
Employer: A user or organization posting job listings.
Admin: A user with administrative privileges to manage the platform.
References and Resources
Project Repository
