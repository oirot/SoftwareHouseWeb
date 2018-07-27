package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.UserDAO;
import model.UserDTO;

@WebServlet("/check")
public class CheckEmail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		UserDAO userDAO = null;
		Map<String, String[]> parameters = request.getParameterMap();
		if(parameters.containsKey("email")) {
			try {
				userDAO = new UserDAO((DataSource)getServletContext().getAttribute("software_ds"));
				boolean isValid = userDAO.checkEmail(parameters.get("email")[0]);
				PrintWriter out = response.getWriter();
				out.print(isValid);
			}catch(SQLException e) {
				e.printStackTrace();
				response.sendError(500);
			}finally {
				if(userDAO != null) {
					userDAO.close();
				}
			}
		}else {
			response.sendError(400);
		}
	}
}
