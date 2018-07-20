package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import pattern_dao.UserDAO;
import pattern_dao.UserDTO;


@WebServlet(urlPatterns= {"/addUser"}, initParams = {@WebInitParam(name="dateFormat", value="yyyy-MM-dd")})
public class Register extends HttpServlet{
	private static String dateFormat;
	
	@Override
	public void init() throws ServletException {
		dateFormat = getServletConfig().getInitParameter("dateFormat");
		super.init();
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO userDAO = null;
		Map<String, String[]> parameters = req.getParameterMap();
		if(parameters.containsKey("nome") &&
				parameters.containsKey("cognome") &&
				parameters.containsKey("email") &&
				parameters.containsKey("hashed_password") &&
				parameters.containsKey("data_nascita")) {
			
			try {
				userDAO = new UserDAO((DataSource)getServletContext().getAttribute("software_ds"));
				
				UserDTO user = new UserDTO();
				user.setNome(parameters.get("nome")[0]);
				user.setCognome(parameters.get("cognome")[0]);
				user.setEmail(parameters.get("email")[0]);
				
				user.setHashed_psw(parameters.get("hashed_password")[0]);
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
				java.util.Date utilDate = null;
				try {
					utilDate = simpleDateFormat.parse((parameters.get("data_nascita")[0]));
				} catch (ParseException e) {
					resp.sendError(400);
					e.printStackTrace();
				}
				user.setData_nascita(new Date(utilDate.getTime()));
				try {
					userDAO.addUser(user);
				} catch (SQLException e) {
					resp.sendError(500);
					e.printStackTrace();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(userDAO != null)
					userDAO.close();
			}
		}else {
			resp.sendError(400);
			return;
		}
	
		resp.sendRedirect("registered/test.html");
	}
}
