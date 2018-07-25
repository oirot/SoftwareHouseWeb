package model;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ProductDAOTest
 */
@WebServlet("/ProductDAOTest")
public class ProductDAOTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDAOTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int action = Integer.parseInt(request.getParameter("action"));
		SellingProductDAO sellingProductDAO = null;
		try {
			sellingProductDAO = new SellingProductDAO((DataSource)getServletContext().getAttribute("software_ds"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<SellingProductDTO> list = null;
		int max;
		int min;
		switch(action) {
		case 0:
			max = Integer.parseInt(request.getParameter("max"));
			try {
				list = sellingProductDAO.getProductsByPrice(BigDecimal.valueOf(max), true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case 1:
			min = Integer.parseInt(request.getParameter("min"));
			try {
				list = sellingProductDAO.getProductsByPrice(BigDecimal.valueOf(min), false);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case 2:
			max = Integer.parseInt(request.getParameter("max"));
			min = Integer.parseInt(request.getParameter("min"));
			try {
				list = sellingProductDAO.getProductsByPriceRange(BigDecimal.valueOf(min), BigDecimal.valueOf(max));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		request.setAttribute("sellingList", list);
		getServletContext().getRequestDispatcher("/ProductDAOTest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
