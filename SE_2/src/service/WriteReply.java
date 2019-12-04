package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QuestionDAO;
import dao.ReviewDAO;

/**
 * Servlet implementation class WriteReply
 */
//@WebServlet("/WriteReply")
public class WriteReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteReply() {
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
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        if(request.getParameter("q_id")==null) {
            int p_id = Integer.parseInt(request.getParameter("p_id"));
            int o_id = Integer.parseInt(request.getParameter("o_id"));
    		String comment = request.getParameter("comment");
    		String u_id = request.getParameter("u_id");
    		
    		if(u_id == null) {
    			PrintWriter script = response.getWriter();
    			
    			script.println("<script>");
    			script.println("alert('로그인을 해주세요')");
    			script.println("history.back()");
    			script.println("</script>");
    			return;
    		}
    		else {
	    		ReviewDAO rvDAO = new ReviewDAO();
	    		int result = rvDAO.addReply(o_id, u_id, comment);
	    		
	    		if(result==-1) {
	    			PrintWriter script = response.getWriter();
	    			
	    			script.println("<script>");
	    			script.println("alert('댓글 작성에 실패하였습니다.')");
	    			script.println("history.back()");
	    			script.println("</script>");
	    		}
	    		else {
	    			PrintWriter script = response.getWriter();
	    			script.println("<script>");
	    			script.println("alert('댓글 작성이 완료되었습니다!')");
	    			script.println("location.href='product.jsp?idx="+p_id+"'");
	    			script.println("</script>");
	    		}
    		}
        }
        else if(request.getParameter("o_id")==null) {
            int p_id = Integer.parseInt(request.getParameter("p_id"));
            int q_id = Integer.parseInt(request.getParameter("q_id"));
    		String comment = request.getParameter("comment");
    		String u_id = request.getParameter("u_id");
    		
    		if(u_id == null) {
    			PrintWriter script = response.getWriter();
    			script.println("<script>");
    			script.println("alert('로그인을 해주세요')");
    			script.println("history.back()");
    			script.println("</script>");
    			return;
    		}
    		else {
	    		QuestionDAO qDAO = new QuestionDAO();
	    		int result = qDAO.addReply(q_id, u_id, comment);
	    		
	    		if(result==-1) {
	    			PrintWriter script = response.getWriter();
	    			
	    			script.println("<script>");
	    			script.println("alert('댓글 작성에 실패하였습니다.')");
	    			script.println("history.back()");
	    			script.println("</script>");
	    		}
	    		else {
	    			PrintWriter script = response.getWriter();
	    			script.println("<script>");
	    			script.println("alert('댓글 작성이 완료되었습니다!')");
	    			script.println("location.href='product.jsp?idx="+p_id+"'");
	    			script.println("</script>");
	    		}
    		}
        }
        
 
	}
}
