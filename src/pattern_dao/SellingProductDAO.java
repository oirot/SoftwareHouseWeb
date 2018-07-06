package pattern_dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;
import utility.SQLStatemets;

public class SellingProductDAO {

	private Connection conn;
	
	
	public SellingProductDAO(DataSource ds) throws SQLException{
		conn = ds.getConnection();
		conn.setAutoCommit(true);
	}
	
	
	public SellingProductDTO getProductById(int id) throws SQLException{
		PreparedStatement statementProductById = conn.prepareStatement(SQLStatemets.productById);
		
		statementProductById.setInt(0, id);
		ResultSet result = statementProductById.executeQuery();
		
		statementProductById.close();
		return mapResultSetToSellingProduct(result);
	}
	
	public ArrayList<SellingProductDTO> getProductsByPrice(BigDecimal price, boolean isLower) throws SQLException{
		ResultSet result;
		
		PreparedStatement statementGetProductByPrice;
		if(isLower) {
			statementGetProductByPrice = conn.prepareStatement(SQLStatemets.productByPriceLower);
			statementGetProductByPrice.setBigDecimal(0, price);
			result = statementGetProductByPrice.executeQuery();
		}
		else {
			statementGetProductByPrice = conn.prepareStatement(SQLStatemets.productByPriceHigher);
			statementGetProductByPrice.setBigDecimal(0, price);
			result = statementGetProductByPrice.executeQuery();
		}
		
		statementGetProductByPrice.close();
		return mapAllResultSetToSellingProduct(result);
	}
	
	public ArrayList<SellingProductDTO> getProductsByPriceRange(BigDecimal lowBound, BigDecimal highBound) throws SQLException{
		PreparedStatement statementGetProductByPriceRange = conn.prepareStatement(SQLStatemets.productByPriceRange);
		
		statementGetProductByPriceRange.setBigDecimal(0, lowBound);
		statementGetProductByPriceRange.setBigDecimal(1, highBound);
		
		statementGetProductByPriceRange.close();
		
		return mapAllResultSetToSellingProduct(statementGetProductByPriceRange.executeQuery());

	}
	
	
	private ArrayList<SellingProductDTO> mapAllResultSetToSellingProduct(ResultSet rs) throws SQLException{
		ArrayList<SellingProductDTO> list = new ArrayList<>();
		while(!rs.next()) {
			list.add(mapResultSetToSellingProduct(rs));
		}
		return list;
	}
	
	
	private SellingProductDTO mapResultSetToSellingProduct(ResultSet result) throws SQLException {
		if(result == null || !result.next()) {
			return null;
		}
		SellingProductDTO sellingProduct = new SellingProductDTO();
		sellingProduct.setId(result.getInt("id_prodotto"));
		sellingProduct.setName(result.getString("descrizione"));
		sellingProduct.setPrice(result.getBigDecimal("prezzo"));
		sellingProduct.setDescriprion(result.getString("descrizione"));
		sellingProduct.setVersion(result.getString("versione"));
		sellingProduct.setIdaProgetto(result.getString("ida"));
		return sellingProduct;
	}
	
	public boolean insertOrUpdate(SellingProductDTO product) throws SQLException{
		SellingProductDTO dbProduct = getProductById(product.getId());
		int rs;
		if(dbProduct != null) {
			PreparedStatement statementUpdateProduct = conn.prepareStatement(SQLStatemets.updateProduct);
			
			statementUpdateProduct.setString(0, product.getName());
			statementUpdateProduct.setString(1, product.getVersion());
			statementUpdateProduct.setString(2, product.getDescriprion());
			statementUpdateProduct.setString(3, product.getIdaProgetto());
			statementUpdateProduct.setInt(4, product.getId());
			
			rs = statementUpdateProduct.executeUpdate();
			
			statementUpdateProduct.close();
		} else {
			PreparedStatement statementInsertProduct = conn.prepareStatement(SQLStatemets.insertProduct);
			
			statementInsertProduct.setString(0, product.getName());
			statementInsertProduct.setString(1, product.getVersion());
			statementInsertProduct.setString(2, product.getDescriprion());
			statementInsertProduct.setString(3, product.getIdaProgetto());
			
			rs = statementInsertProduct.executeUpdate();
			
			statementInsertProduct.close();
		}
		if(rs != 1) {
			return false;
		}
		return true;
	}
	
	
	public ArrayList<Review> getRecensioniById(int id) throws SQLException{
		ArrayList<Review> recensioni = new ArrayList<>();
		
		//leggi dal db le recensioni
		PreparedStatement reviewStatementById = conn.prepareStatement(SQLStatemets.recensioniById);
		reviewStatementById.setInt(0, id);
		ResultSet rs = reviewStatementById.executeQuery();
		reviewStatementById.close();
		
		//itera finchè ci sono recensioni nei risultati
		while(rs.next()) {
			recensioni.add(new Review(rs.getString(0), rs.getInt(1)));
		}
	
		return recensioni;
	}
	
	@Override
	protected void finalize() throws Throwable {
		try{conn.close();}
		finally{super.finalize();}
	}
}


