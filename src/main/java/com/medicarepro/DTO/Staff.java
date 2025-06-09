package com.medicarepro.DTO;


public class Staff {
    private int staffId;
    private String name;
    private String phone;
    private String email;
    private String department;
    private String qualification;
    private String experience;
    private String shift;
    private String status;

    public Staff() {}

    public Staff(int staffId, String name, String phone, String email, String department,
                 String qualification, String experience, String shift, String status) {
        this.staffId = staffId;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.department = department;
        this.qualification = qualification;
        this.experience = experience;
        this.shift = shift;
        this.status = status;
    }

    // Getters and Setters
    public int getStaffId() { return staffId; }
    public void setStaffId(int staffId) { this.staffId = staffId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getQualification() { return qualification; }
    public void setQualification(String qualification) { this.qualification = qualification; }

    public String getExperience() { return experience; }
    public void setExperience(String experience) { this.experience = experience; }

    public String getShift() { return shift; }
    public void setShift(String shift) { this.shift = shift; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
