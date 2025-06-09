package com.medicarepro.DTO;

public class Department {
	private int id;
	private String name;
	private String facilities;

	private String doctors;
	private String status;

	public Department(int id2, String name2, String facilities2, String doctors2, String status2) {
		// TODO Auto-generated constructor stub
	}

	public Department() {
		// TODO Auto-generated constructor stub
	}

	public String getDoctors() {
		return doctors;
	}

	public void setDoctors(String doctors) {
		this.doctors = doctors;
	}

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

	public String getFacilities() {
		return facilities;
	}

	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Getters and Setters

}
