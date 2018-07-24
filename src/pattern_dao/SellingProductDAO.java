
package pattern_dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;

import com.mysql.jdbc.Statement;

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
		SellingProductDTO dbProduct = null;
		if(product.getId() != 0) {
			dbProduct = getProductById(product.getId());
		}
		int rs;
		if(dbProduct != null) {
			PreparedStatement statementUpdateProduct = conn.prepareStatement(SQLStatemets.updateProduct);
			
			statementUpdateProduct.setString(1, product.getName());
			statementUpdateProduct.setString(2, product.getVersion());
			statementUpdateProduct.setString(3, product.getDescriprion());
			statementUpdateProduct.setString(4, product.getIdaProgetto());
			statementUpdateProduct.setInt(5, product.getId());
			
			rs = statementUpdateProduct.executeUpdate();
			
			statementUpdateProduct.close();
			
			if(rs == 1) {
				PreparedStatement statementUpdateSellingProduct = conn.prepareStatement(SQLStatemets.updateSelling);
				statementUpdateSellingProduct.setBigDecimal(1, product.getPrice());
				statementUpdateSellingProduct.setInt(2, product.getId());
				rs = statementUpdateSellingProduct.executeUpdate();
				statementUpdateSellingProduct.close();
			}
		} else {
			
			java.sql.Statement getLastId = conn.createStatement();
			ResultSet idSet = getLastId.executeQuery("SELECT id_prodotto FROM prodotto ORDER BY(id_prodotto) DESC LIMIT 1");
			int id = 0;
			if(idSet.next())
				id = idSet.getInt(1) + 1;
			
			
			
			PreparedStatement statementInsertProduct = conn.prepareStatement(SQLStatemets.insertProduct);

			statementInsertProduct.setString(1, product.getName());
			statementInsertProduct.setString(2, product.getVersion());
			statementInsertProduct.setString(3, product.getDescriprion());
			statementInsertProduct.setString(4, product.getIdaProgetto());
			statementInsertProduct.setInt(5, id);
			rs = statementInsertProduct.executeUpdate();
			statementInsertProduct.close();
			
			if(rs == 1 && id != 0) {
				PreparedStatement statementInsertSellingProduct = conn.prepareStatement(SQLStatemets.insertSelling);
				statementInsertSellingProduct.setInt(1, id);
				statementInsertSellingProduct.setBigDecimal(2, product.getPrice());
				rs = statementInsertSellingProduct.executeUpdate();
				statementInsertSellingProduct.close();
			}else {
				rs = 0;
			}
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
	
	
	public boolean deleteProductById(int id) throws SQLException{
		PreparedStatement deleteSt = conn.prepareStatement(SQLStatemets.deleteProduct);
		deleteSt.setInt(1, id);
		deleteSt.executeUpdate();
		deleteSt.close();
		
		deleteSt = conn.prepareStatement(SQLStatemets.deleteProductSelling);
		deleteSt.setInt(1, id);
		int ret = deleteSt.executeUpdate();
		deleteSt.close();
		if(ret == 1) {
			return true;
		}
		return false;
	}
	
	
	public float RateOfId(int id) throws SQLException{
		ArrayList<Review> reviews = getRecensioniById(id);
		int sum = 0;
		for(int i = 0; i < reviews.size(); i++) {
			sum += reviews.get(i).getStars();
		}
		return (float)sum / reviews.size();
	}
	
	public boolean addReview(int id, Review review) throws SQLException{
		PreparedStatement st = conn.prepareStatement(SQLStatemets.addReview);
		st.setInt(1, id);
		st.setString(2, review.getComment());
		st.setInt(3, review.getStars());
		int ret = st.executeUpdate();
		st.close();
		if(ret == 1) {
			return true;
		}
		return false;
	}
	
	public void close()  {
		try{conn.close();}
		catch(SQLException e) {}
	}
	
}


