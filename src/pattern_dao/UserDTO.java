package pattern_dao;

import java.sql.Date;

public class UserDTO {
	private int userId;
	private String nome;
	private String cognome;
	private String email;
	private Date data_nascita;
	private String hashed_psw;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getData_nascita() {
		return data_nascita;
	}
	public void setData_nascita(Date data_nascita) {
		this.data_nascita = data_nascita;
	}
	public String getHashed_psw() {
		return hashed_psw;
	}
	public void setHashed_psw(String hashed_psw) {
		this.hashed_psw = hashed_psw;
	}
}
