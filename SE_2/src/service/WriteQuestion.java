package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionDAO;

/**
 * Servlet implementation class WriteQuestion
 */
//@WebServlet("/WriteQuestion")
public class WriteQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
      
        int p_id = Integer.parseInt(request.getParameter("p_id"));
		String u_id = request.getParameter("u_id");

        String title = request.getParameter("q_title");
		String content = request.getParameter("q_content");
		
		if(u_id==null) {
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('로그인을 해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		QuestionDAO qDAO = new QuestionDAO();
		int result=qDAO.addQuestion(p_id, u_id, title, content);
		
		if(result==-1) {
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("alert('문의 작성에 실패하였습니다.')");
			script.println("window.close()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('문의 작성이 완료되었습니다!')");
			script.println("window.close()");
			script.println("</script>");
		}
	}

}
