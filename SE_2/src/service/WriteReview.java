package service;
import dao.*;
import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WriteReview
 */
@WebServlet("/WriteReview")
public class WriteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteReview() {
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
		String r_content = request.getParameter("txt");
		int r_star = Integer.parseInt(request.getParameter("r_star"));
		response.setCharacterEncoding("utf-8");
		ReviewDAO rvDAO = new ReviewDAO();
		int result = rvDAO.addReview(1, r_star, r_content);
		if(result==-1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 리뷰를 작성하셨습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('리뷰 작성이 완료되었습니다!')");
			script.println("location.href='cart.jsp'");
			script.println("</script>");
		}
		
	}
	
}
