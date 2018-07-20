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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import pattern_dao.CartProduct;
import pattern_dao.SellingProductDAO;
import pattern_dao.SellingProductDTO;
import utility.Cart;

@WebServlet("/addToCart")
public class addToCart extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart == null)
			cart = new Cart();
		
		Map<String, String[]>parameters= request.getParameterMap();
		response.setContentType("text/json");
		PrintWriter out = response.getWriter();
		if(parameters.containsKey("id")){
			SellingProductDAO sellingProductDAO = null;
			try {
				sellingProductDAO = new SellingProductDAO((DataSource)getServletContext().getAttribute("software_ds"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			SellingProductDTO prod = null;
			try{
				prod = sellingProductDAO.getProductById(Integer.parseInt(parameters.get("id")[0]));
				sellingProductDAO.close();
			}catch(SQLException e) {
				e.printStackTrace();
				out.print("{val:0}");
			}
			
			int quantity = 1;
			if(parameters.containsKey("quantity"))
				quantity = Integer.parseInt(parameters.get("quantity")[0]);
			
			if(prod != null)
				cart.addProduct(new CartProduct(prod, quantity));
			else {
				out.print("{val:0.}");
			}
		session.setAttribute("cart", cart);
		}else {
			out.print("{err: 'id'}");
		}
		out.print("{val:1}");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
}

