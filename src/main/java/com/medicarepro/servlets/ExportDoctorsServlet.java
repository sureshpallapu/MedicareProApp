package com.medicarepro.servlets;

import com.medicarepro.DAO.DoctorDAO;

import com.medicarepro.DTO.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.itextpdf.text.*;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ExportDoctorsServlet")
public class ExportDoctorsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String format = request.getParameter("format");

		if ("excel".equalsIgnoreCase(format)) {
			exportToExcel(response);
		} else if ("pdf".equalsIgnoreCase(format)) {
			exportToPDF(response);
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unsupported format");
		}
	}

	private void exportToExcel(HttpServletResponse response) throws IOException {
		try {
			DoctorDAO dao = new DoctorDAO();
			List<Doctor> doctors = dao.getAllDoctors();

			Workbook workbook = new XSSFWorkbook();
			Sheet sheet = workbook.createSheet("Doctors");

			// Header row
			Row header = sheet.createRow(0);
			String[] columns = { "ID", "Name", "Specialization", "Phone", "Email", "Department", "Qualification",
					"Experience", "Diseases Diagnosed", "Consultation Room", "Schedule" };
			for (int i = 0; i < columns.length; i++) {
				Cell cell = header.createCell(i);
				cell.setCellValue(columns[i]);
			}

			// Data rows
			int rowNum = 1;
			for (Doctor doc : doctors) {
				Row row = sheet.createRow(rowNum++);
				row.createCell(0).setCellValue(doc.getId());
				row.createCell(1).setCellValue(doc.getName());
				row.createCell(2).setCellValue(doc.getSpecialization());
				row.createCell(3).setCellValue(doc.getPhone());
				row.createCell(4).setCellValue(doc.getEmail());
				row.createCell(5).setCellValue(doc.getDepartment());
				row.createCell(6).setCellValue(doc.getQualification());
				row.createCell(7).setCellValue(doc.getExperience());
				row.createCell(8).setCellValue(doc.getDiseasesDiagnosed());
				row.createCell(9).setCellValue(doc.getConsultationRoom());
				row.createCell(10).setCellValue(
						doc.getScheduleDays() + " " + doc.getScheduleTimeFrom() + "-" + doc.getScheduleTimeTo());

			}

			// Auto-size columns
			for (int i = 0; i < columns.length; i++) {
				sheet.autoSizeColumn(i);
			}

			// Set response headers
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			response.setHeader("Content-Disposition", "attachment; filename=Doctors.xlsx");

			workbook.write(response.getOutputStream());
			workbook.close();

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error exporting Excel");
		}
	}

	private void exportToPDF(HttpServletResponse response) throws IOException {
		try {
			DoctorDAO dao = new DoctorDAO();
			List<Doctor> doctors = dao.getAllDoctors();

			Document document = new Document(PageSize.A4.rotate());
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "attachment; filename=Doctors.pdf");

			PdfWriter.getInstance(document, response.getOutputStream());
			document.open();

			Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
			Paragraph title = new Paragraph("List of Doctors", titleFont);
			title.setAlignment(Element.ALIGN_CENTER);
			title.setSpacingAfter(20);
			document.add(title);

			PdfPTable table = new PdfPTable(12);
			table.setWidthPercentage(100);
			table.setSpacingBefore(10);

			String[] headers = { "ID", "Name", "Specialization", "Phone", "Email", "Department", "Qualification",
					"Experience", "Diseases Diagnosed", "Consultation Room", "Schedule", "status" };

			for (String header : headers) {
				PdfPCell headerCell = new PdfPCell(new Phrase(header, FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
				headerCell.setBackgroundColor(BaseColor.LIGHT_GRAY);
				table.addCell(headerCell);
			}

			for (Doctor doc : doctors) {
				table.addCell(String.valueOf(doc.getId()));
				table.addCell(doc.getName());
				table.addCell(doc.getSpecialization());
				table.addCell(doc.getPhone());
				table.addCell(doc.getEmail());
				table.addCell(doc.getDepartment());
				table.addCell(doc.getQualification());
				table.addCell(doc.getExperience() + " yrs");
				table.addCell(doc.getDiseasesDiagnosed());
				table.addCell(doc.getConsultationRoom());
				table.addCell(doc.getScheduleDays() + " " + doc.getScheduleTimeFrom() + "-" + doc.getScheduleTimeTo());
				table.addCell(doc.getStatus()); // ✅ Add status here
			}

			document.add(table);
			document.close();

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error exporting PDF");
		}
	}

}
