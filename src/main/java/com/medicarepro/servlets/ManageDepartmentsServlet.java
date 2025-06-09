package com.medicarepro.servlets;

import java.io.IOException;

import java.util.*;

import com.medicarepro.DAO.DepartmentDAO;
import com.medicarepro.DAO.DoctorDAO;
import com.medicarepro.DTO.Department;
import com.medicarepro.DTO.Doctor;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ManageDepartmentsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DepartmentDAO departmentDAO = new DepartmentDAO();
		DoctorDAO doctorDAO = new DoctorDAO();

		List<Department> departments = departmentDAO.getAllDepartments();
		List<Doctor> doctors = doctorDAO.getAllDoctor();

		Map<Integer, String> doctorMap = new HashMap<>();
		for (Doctor d : doctors) {
			doctorMap.put(d.getId(), d.getName());
		}

		request.setAttribute("departments", departments);
		request.setAttribute("doctorMap", doctorMap);

		RequestDispatcher dispatcher = request.getRequestDispatcher("manage_departments.jsp");
		dispatcher.forward(request, response);
		
		
	}
}
