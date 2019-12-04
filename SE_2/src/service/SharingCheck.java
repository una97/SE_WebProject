package service;

import dao.*;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SharingCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SharingCheck() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String strDate="",endDate="";
		int s_p_id = Integer.parseInt(request.getParameter("s_p_id"));
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date s_Date = dateFormat.parse(request.getParameter("start"));
			Date e_Date = dateFormat.parse(request.getParameter("end"));
			strDate = dateFormat.format(s_Date);
			endDate = dateFormat.format(e_Date);
		}catch(Exception e) {
			e.printStackTrace();
		}

		PrintWriter script = response.getWriter();
		SharingDAO shrDAO = new SharingDAO();
		int result = shrDAO.checkDuplication(s_p_id, strDate, endDate);

		if (result == 0) {
			script.println("<script>");
			script.println("alert('겹치는 사람이 존재합니다.')");
			script.println("history.back()");
			script.println("window.close()");
			script.println("</script>");

		} else if (result == 1 || result == -1) {
			script.println("<script>");
			script.println("location.href='sharingReservation.jsp?p_id="+s_p_id+"&sDate="+strDate+"&eDate="+endDate+"'");
			script.println("window.close()");
			script.println("</script>");
			

		} else {
			script.println("<script>");
			script.println("alert('오류')");
			script.println("window.close()");
			script.println("</script>");
		}

	}

}