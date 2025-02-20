package com.user.model;

import java.util.Date;

public class Job {
    private int jobID;
    private String title;
    private String description;
    private double salary;
    private String location;
    private Date postedDate;
    private Date deadLine;
    private String status;

    // Constructors
    public Job() {
    jobID = 0;
    title = "";
    description = "";
    salary = 0.0;
    location = "";
    postedDate = null;
    deadLine = null;
    status = "";
    }

    public Job(int jobID, String title, String description, double salary, String location, Date postedDate, Date deadLine, String status) {
        this.jobID = jobID;
        this.title = title;
        this.description = description;
        this.salary = salary;
        this.location = location;
        this.postedDate = postedDate;
        this.deadLine = deadLine;
        this.status = status;
    }

    // Getters and Setters
    public int getJobID() {
        return jobID;
    }

    public void setJobID(int jobID) {
        this.jobID = jobID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Date postedDate) {
        this.postedDate = postedDate;
    }

    public Date getDeadLine() {
        return deadLine;
    }

    public void setDeadLine(Date deadLine) {
        this.deadLine = deadLine;
    }
    
     public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}