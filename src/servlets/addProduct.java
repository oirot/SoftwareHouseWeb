package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import pattern_dao.SellingProductDAO;
import pattern_dao.SellingProductDTO;


@WebServlet("/addProduct")
public class addProduct extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]>parameters= request.getParameterMap();
		response.setContentType("text");
		PrintWriter out = response.getWriter();
		if(parameters.containsKey("nome") &&
			parameters.containsKey("ida") &&
			parameters.containsKey("prezzo")){
			
			
			
			SellingProductDAO sellingProductDAO = null;
			try {
				sellingProductDAO = new SellingProductDAO((DataSource)getServletContext().getAttribute("software_ds"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			
			String nome = parameters.get("nome")[0];
			String ida = parameters.get("ida")[0];
			BigDecimal prezzo = new BigDecimal(parameters.get("prezzo")[0]);
			String desc = parameters.get("desc")[0];
			String version = parameters.get("version")[0];
			if(desc == null) {
				desc = "nessuna descrizione";
			}
			
		
			boolean ret = false;
			try {
			ret = sellingProductDAO.insertOrUpdate(new SellingProductDTO(nome, prezzo, desc, version, ida));
			}catch(SQLException e) {
				e.printStackTrace();
				out.print("exc");
			}finally {
				if(sellingProductDAO != null) {
					sellingProductDAO.close();
				}
			}
			if(!ret) {
				out.print("ret");
			}
		}else {
			out.print("param");
		}
		out.print("ammostr");	
	}
}
