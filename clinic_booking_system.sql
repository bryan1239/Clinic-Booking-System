-- Create Database
CREATE DATABASE ClinicDB;
USE ClinicDB;

-- Table: Patient
CREATE TABLE Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    DOB DATE
);

-- Table: Doctor
CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

-- Table: Appointment
CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Table: Treatment
CREATE TABLE Treatment (
    TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
    TreatmentName VARCHAR(100) NOT NULL,
    Cost DECIMAL(10,2) NOT NULL
);

-- Junction Table: AppointmentTreatment (Many-to-Many)
CREATE TABLE AppointmentTreatment (
    AppointmentID INT,
    TreatmentID INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (AppointmentID, TreatmentID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID)
);
