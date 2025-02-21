# CareerPathway User Manual

## Introduction

### Overview
CareerPathway is a comprehensive job portal designed to connect job seekers with potential employers. The platform allows users to create profiles, search for jobs, apply for positions, and manage their applications. Employers can post job listings, manage applications, and find suitable candidates.

### Purpose and Objectives
The primary objective of CareerPathway is to streamline the job search and hiring process, making it easier for job seekers to find suitable positions and for employers to find qualified candidates.

### Key Features
- User account management
- Job search and application
- Job listing management for employers
- Admin dashboard for managing users and listings

## Getting Started

### System Requirements
- A modern web browser (Google Chrome, Mozilla Firefox, Microsoft Edge, etc.)
- Internet connection

### Installation Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Adam-830/CareerPathway.git
   ```
2. Navigate to the project directory:
   ```bash
   cd CareerPathway
   ```
3. Set up the database (MySQL):
   - Create a database named `careerpathway`
   - Import the database schema from `schema.sql` file
4. Configure the database connection in `src/util/DBConnection.java`

### Configuration Steps
1. Open the project in your preferred IDE (e.g., Netbeans, IntelliJ IDEA, Eclipse).
2. Configure the server (e.g., Glassfish) to run the project.
3. Deploy the project to the server and ensure it is running.

## Using the Application

### User Roles and Permissions
- **Job Seeker**: Can search for jobs, apply for positions, and manage their applications.
- **Employer**: Can post job listings, manage job listings, and view applications.
- **Admin**: Has access to the admin dashboard to manage users and job listings.

### Navigating the User Interface
- **Home Page**: Provides an overview of the platform and allows users to navigate to different sections.
- **Login/Register**: Allows users to create an account or log in to an existing account.
- **Profile**: Allows users to view and update their profile information.
- **Job Listings**: Displays a list of available job listings that users can search and apply for.

## Managing Your Account

### Creating an Account
1. Navigate to the `Register` page.
2. Fill in the required information (username, email, password, etc.).
3. Click the `Register` button to create an account.

### Logging In and Out
- **Log In**:
  1. Navigate to the `Login` page.
  2. Enter your username and password.
  3. Click the `Login` button to access your account.
- **Log Out**:
  - Click the `Logout` button in the navigation bar to log out of your account.

### Updating Profile Information
1. Navigate to the `Profile` page.
2. Update the necessary information (skills, experience, education, etc.).
3. Click the `Save Changes` button to save the updates.

## Job Listings

### Searching for Jobs
1. Navigate to the `Job Listings` page.
2. Use the search bar to enter job titles or keywords.
3. Filter results by location using the dropdown menu.
4. Click the `Search` button to view matching job listings.

### Applying for Jobs
1. Browse the job listings and click on a job title to view details.
2. Click the `Apply Now` button to submit an application.
3. Fill in the required information and submit your application.

### Managing Job Applications
- View and manage your job applications from the `Profile` page under the `Applications` section.

## Employer Features

### Posting Job Listings
1. Navigate to the `Admin Dashboard`.
2. Click the `Add Job Listing` button.
3. Fill in the job details (title, description, salary, location, etc.).
4. Click the `Submit` button to post the job listing.

### Managing Job Listings
- View and manage your job listings from the `Admin Dashboard` under the `Job Listings` section.

### Viewing and Managing Applications
- View and manage applications for your job listings from the `Admin Dashboard` under the `Applications` section.

## Admin Features

### Admin Dashboard Overview
- The Admin Dashboard provides an overview of all users, job listings, and applications on the platform.

### Managing Users
1. Navigate to the `Admin Dashboard`.
2. Click the `Users` section to view all registered users.
3. Perform actions such as editing user details or deleting users.

### Managing Job Listings and Applications
- View and manage all job listings and applications from the respective sections in the `Admin Dashboard`.

## Troubleshooting and Support

### Common Issues and Solutions
- **Unable to log in**: Ensure you are using the correct username and password. If you have forgotten your password, use the `Forgot Password` feature to reset it.
- **Database connection error**: Verify that the database is running and the connection details in `DBConnection.java` are correct.

## Appendix

### Glossary of Terms
- **Job Seeker**: A user looking for job opportunities.
- **Employer**: A user or organization posting job listings.
- **Admin**: A user with administrative privileges to manage the platform.

### References and Resources
- [Project Repository](https://github.com/Adam-830/CareerPathway/tree/master)
