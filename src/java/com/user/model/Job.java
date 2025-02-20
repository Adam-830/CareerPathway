package com.user.model;

import java.util.Date;
import java.sql.Timestamp;

public class Job {
    private int jobID;
    private String title;
    private String description;
    private double salary;
    private String location;
    private Timestamp postedDate;
    private Timestamp deadLine;
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

    public Job(int jobID, String title, String description, double salary, String location, Timestamp postedDate, Timestamp deadLine, String status) {
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

    public Timestamp getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Timestamp postedDate) {
        this.postedDate = postedDate;
    }

    public Timestamp getDeadLine() {
        return deadLine;
    }

    public void setDeadLine(Timestamp deadLine) {
        this.deadLine = deadLine;
    }
    
     public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}