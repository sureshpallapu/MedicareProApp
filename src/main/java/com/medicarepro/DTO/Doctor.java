package com.medicarepro.DTO;



import java.sql.Time;
import java.sql.Timestamp;

public class Doctor {

    private int id;
    private String name;
    private String email;
    private String phone;
    private String gender;
    private String department;
    private String specialization;
    private int experience;
    private String qualification;
    private String diseasesDiagnosed;
    private String scheduleDays;
    private Time scheduleTimeFrom;
    private Time scheduleTimeTo;
    private String consultationRoom;
    private String status;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // --- Getters and Setters ---

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getDiseasesDiagnosed() {
        return diseasesDiagnosed;
    }

    public void setDiseasesDiagnosed(String diseasesDiagnosed) {
        this.diseasesDiagnosed = diseasesDiagnosed;
    }

    public String getScheduleDays() {
        return scheduleDays;
    }

    public void setScheduleDays(String scheduleDays) {
        this.scheduleDays = scheduleDays;
    }

    public Time getScheduleTimeFrom() {
        return scheduleTimeFrom;
    }

    public void setScheduleTimeFrom(Time scheduleTimeFrom) {
        this.scheduleTimeFrom = scheduleTimeFrom;
    }

    public Time getScheduleTimeTo() {
        return scheduleTimeTo;
    }

    public void setScheduleTimeTo(Time scheduleTimeTo) {
        this.scheduleTimeTo = scheduleTimeTo;
    }

    public String getConsultationRoom() {
        return consultationRoom;
    }

    public void setConsultationRoom(String consultationRoom) {
        this.consultationRoom = consultationRoom;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}
