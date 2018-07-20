package pattern_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import utility.SQLStatemets;

public class UserDAO {
private Connection conn;
	
	
	public UserDAO(DataSource ds) throws SQLException{
		conn = ds.getConnection();
		conn.setAutoCommit(true);
	}
	
	public void close() {
		try {conn.close();}catch(SQLException e){}
	}

	
	public UserDTO getUserById(int id) throws SQLException{
		PreparedStatement statementUserById = conn.prepareStatement(SQLStatemets.userById);
		statementUserById.setInt(1, id);
		ResultSet rs = statementUserById.executeQuery();
		UserDTO user = mapResultToUserDTO(rs);
		statementUserById.close();
		return user;
	}
	
	
	private UserDTO mapResultToUserDTO(ResultSet rs) throws SQLException{
		UserDTO rest = null;
		if(rs.next()) {
			rest = new UserDTO();
			rest.setNome(rs.getString("nome"));
			rest.setCognome(rs.getString("cognome"));
			rest.setUserId(rs.getInt("id_utente"));
			rest.setData_nascita(rs.getDate("data_nascita"));
			rest.setEmail(rs.getString("email"));
			rest.setHashed_psw(rs.getString(("hashed_password")));
		}
		return rest;
	}
	
	public boolean checkEmail(String email) throws SQLException{
		PreparedStatement st = conn.prepareStatement(SQLStatemets.userByEmail);
		st.setString(1, email);
		ResultSet rs = st.executeQuery();
		if(rs.next())
			return false;
		return true;
	}
	
	
	public boolean addUser(UserDTO user) throws SQLException{
		PreparedStatement st = conn.prepareStatement(SQLStatemets.addUser);
		st.setString(1, user.getNome());
		st.setString(2, user.getCognome());
		st.setString(3, user.getEmail());
		st.setString(4, user.getHashed_psw());
		st.setDate(5, user.getData_nascita());
		boolean ret = false;
		if(st.executeUpdate() > 0) {
			ret = true;
		}
		st.close();
		return ret;
	}


}
