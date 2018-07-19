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
		
		statementProductById.setInt(1, id);
		ResultSet result = statementProductById.executeQuery();
		SellingProductDTO ret = mapResultSetToSellingProduct(result);
		statementProductById.close();
		return ret;
	}
	
	public ArrayList<SellingProductDTO> getProductsByPrice(BigDecimal price, boolean isLower) throws SQLException{
		ResultSet result;
		
		PreparedStatement statementGetProductByPrice;
		if(isLower) {
			statementGetProductByPrice = conn.prepareStatement(SQLStatemets.productByPriceLower);
			statementGetProductByPrice.setBigDecimal(1, price);
			result = statementGetProductByPrice.executeQuery();
		}
		else {
			statementGetProductByPrice = conn.prepareStatement(SQLStatemets.productByPriceHigher);
			statementGetProductByPrice.setBigDecimal(1, price);
			result = statementGetProductByPrice.executeQuery();
		}
		
		ArrayList<SellingProductDTO> ret = mapAllResultSetToSellingProduct(result);
		statementGetProductByPrice.close();
		return ret;		
	}
	
	public ArrayList<SellingProductDTO> getProductsByPriceRange(BigDecimal lowBound, BigDecimal highBound) throws SQLException{
		PreparedStatement statementGetProductByPriceRange = conn.prepareStatement(SQLStatemets.productByPriceRange);
		
		statementGetProductByPriceRange.setBigDecimal(1, lowBound);
		statementGetProductByPriceRange.setBigDecimal(2, highBound);

		ArrayList<SellingProductDTO> ret = mapAllResultSetToSellingProduct(statementGetProductByPriceRange.executeQuery());
		statementGetProductByPriceRange.close();
		return ret;
	}
	
	
	private ArrayList<SellingProductDTO> mapAllResultSetToSellingProduct(ResultSet rs) throws SQLException{
		ArrayList<SellingProductDTO> list = new ArrayList<>();
		SellingProductDTO iterRes;
		while( (iterRes = mapResultSetToSellingProduct(rs)) != null){
			list.add(iterRes);
		}
		return list;
	}
	
	
	private SellingProductDTO mapResultSetToSellingProduct(ResultSet result) throws SQLException {
		if(result == null || !result.next()) {
			return null;
		}
		SellingProductDTO sellingProduct = new SellingProductDTO();
		sellingProduct.setId(result.getInt("id_prodotto"));
		sellingProduct.setName(result.getString("nome_prodotto"));
		sellingProduct.setPrice(result.getBigDecimal("prezzo"));
		sellingProduct.setDescriprion(result.getString("descrizione"));
		sellingProduct.setVersion(result.getString("versione"));
		sellingProduct.setIdaProgetto(result.getString("ida"));
		return sellingProduct;
	}
	
	public boolean insertOrUpdate(SellingProductDTO product) throws SQLException{
		SellingProductDTO dbProduct = getProductById(product.getId());
		int rs;
		PreparedStatement statementUsed;
		if(dbProduct != null) {
			PreparedStatement statementUpdateProduct = conn.prepareStatement(SQLStatemets.updateProduct);
			
			statementUpdateProduct.setString(1, product.getName());
			statementUpdateProduct.setString(2, product.getVersion());
			statementUpdateProduct.setString(3, product.getDescriprion());
			statementUpdateProduct.setString(4, product.getIdaProgetto());
			statementUpdateProduct.setInt(5, product.getId());
			
			rs = statementUpdateProduct.executeUpdate();
			
			statementUsed = statementUpdateProduct;
		} else {
			PreparedStatement statementInsertProduct = conn.prepareStatement(SQLStatemets.insertProduct);
			
			statementInsertProduct.setString(1, product.getName());
			statementInsertProduct.setString(2, product.getVersion());
			statementInsertProduct.setString(3, product.getDescriprion());
			statementInsertProduct.setString(4, product.getIdaProgetto());
			
			rs = statementInsertProduct.executeUpdate();
			
			statementUsed = statementInsertProduct;
		}
		if(rs != 1) {
			statementUsed.close();
			return false;
		}
		statementUsed.close();
		return true;
	}
	
	
	public ArrayList<Review> getRecensioniById(int id) throws SQLException{
		ArrayList<Review> recensioni = new ArrayList<>();
		
		//leggi dal db le recensioni
		PreparedStatement reviewStatementById = conn.prepareStatement(SQLStatemets.recensioniById);
		reviewStatementById.setInt(1, id);
		ResultSet rs = reviewStatementById.executeQuery();
		
		//itera finchè ci sono recensioni nei risultati
		while(rs.next()) {
			recensioni.add(new Review(rs.getString(0), rs.getInt(1)));
		}
		
		reviewStatementById.close();

		return recensioni;
	}
	
	
	public ArrayList<SellingProductDTO> getAllProducts() throws SQLException{		
		PreparedStatement getAllPr = conn.prepareStatement(SQLStatemets.allProducts);
		ResultSet rs = getAllPr.executeQuery();
		return mapAllResultSetToSellingProduct(rs);
	}
	
	@Override
	protected void finalize() throws Throwable {
		try{conn.close();}
		finally{super.finalize();}
	}
	
}


