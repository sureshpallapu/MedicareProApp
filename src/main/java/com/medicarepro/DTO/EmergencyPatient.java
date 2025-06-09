package com.medicarepro.DTO;

public class EmergencyPatient {
    private int id;
    private String name;
    private int age;
    private String gender;
    private String phone;
    private String condition;
    private int priority;

    // Add these new fields
    private int departmentId;
    private int doctorId;
    private String departmentName;
    private String doctorName;

    // Constructors
    public EmergencyPatient() {}

    public EmergencyPatient(int id, String name, int age, String gender, String phone, String condition, int priority,
                            int departmentId, int doctorId, String departmentName, String doctorName) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.phone = phone;
        this.condition = condition;
        this.priority = priority;
        this.departmentId = departmentId;
        this.doctorId = doctorId;
        this.departmentName = departmentName;
        this.doctorName = doctorName;
    }

    // Existing getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getCondition() { return condition; }
    public void setCondition(String condition) { this.condition = condition; }

    public int getPriority() { return priority; }
    public void setPriority(int priority) { this.priority = priority; }

    // New getters and setters
    public int getDepartmentId() { return departmentId; }
    public void setDepartmentId(int departmentId) { this.departmentId = departmentId; }

    public int getDoctorId() { return doctorId; }
    public void setDoctorId(int doctorId) { this.doctorId = doctorId; }

    public String getDepartmentName() { return departmentName; }
    public void setDepartmentName(String departmentName) { this.departmentName = departmentName; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }
}
