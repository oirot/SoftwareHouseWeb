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

import model.Review;
import model.SellingProductDAO;


@WebServlet("/addReview")
public class AddReview extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/plain");
		
		Map<String, String[]> parameters = req.getParameterMap();
		boolean status = true;
		if(parameters.containsKey("id") &&
				parameters.containsKey("commento") &&
				parameters.containsKey("stelle")) {
			
			SellingProductDAO sellingProductDAO = null;
			try {
				sellingProductDAO = new SellingProductDAO((DataSource)getServletContext().getAttribute("software_ds"));
			} catch (SQLException e) {
				out.println("DAO");
				status = false;
				e.printStackTrace();
			}		
			
			if(status) {
				try {
					status = sellingProductDAO.addReview(Integer.parseInt(parameters.get("id")[0]),
							new Review(parameters.get("commento")[0], Integer.parseInt(parameters.get("stelle")[0])));
				}catch(SQLException e){
					e.printStackTrace();
					status = false;
					out.println("SQL");
				}catch(NumberFormatException e) {
					out.println("param num");
					status = false;
				}
			}
			
			if(sellingProductDAO != null) {
				sellingProductDAO.close();
			}
			if(status)
				out.println("OOK");
		}else {
			out.print("nagg");
		}
		
	
	}
}
