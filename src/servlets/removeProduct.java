package servlets;

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

import pattern_dao.SellingProductDAO;


@WebServlet("/removeProduct")
public class removeProduct extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]>parameters= request.getParameterMap();
		response.setContentType("text");
		PrintWriter out = response.getWriter();
		if(parameters.containsKey("id")){
			SellingProductDAO sellingProductDAO = null;
			try {
				sellingProductDAO = new SellingProductDAO((DataSource)getServletContext().getAttribute("software_ds"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		try{
			sellingProductDAO.deleteProductById(Integer.parseInt(parameters.get("id")[0]));
		}catch(SQLException e) {
			e.printStackTrace();
			out.print("0");
		}
		out.print("1");
		}else {
			out.print("id");
		}
	}
}
