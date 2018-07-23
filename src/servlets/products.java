package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import pattern_dao.SellingProductDAO;
import pattern_dao.SellingProductDTO;

@WebServlet(urlPatterns= {"/products", "/management/products"})
public class products extends HttpServlet{
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SellingProductDAO sellingProductDAO = null;
		try {
			sellingProductDAO = new SellingProductDAO((DataSource)getServletContext().getAttribute("software_ds"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ArrayList<SellingProductDTO> productList = null;
		try {
			productList = sellingProductDAO.getAllProducts();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(sellingProductDAO != null) sellingProductDAO.close();
		req.setAttribute("sellingList", productList);
		if((req.getServletPath()).startsWith("/manager/")) {
			getServletContext().getRequestDispatcher("/restricted/modifica-prodotti.jsp").forward(req, resp);

		}else {
			getServletContext().getRequestDispatcher("/restricted/Prodotti.jsp").forward(req, resp);

		}
	}

}
