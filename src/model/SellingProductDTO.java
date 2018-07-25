/**
 * Clase che identifica un prodotto in vendita.
 */

package model;

import java.math.BigDecimal;

/**
 * 
 * @author Raffaele, Vittorio.
 *
 */

public class SellingProductDTO {
	private BigDecimal price;
	private String name;
	private String descriprion;
	private String version;
	private int id;
	private String idaProgetto;
	
	/**
	 * Costruttore vuoto.
	 */
	
	public SellingProductDTO(){
	}
	
	/**
	 * Costruttore con parametri impostati dall'utente.
	 * @param id
	 * @param name
	 * @param price
	 * @param description
	 * @param version
	 * @param idaProgetto
	 */
	
	public SellingProductDTO(int id, String name, BigDecimal price, String description, String version, String idaProgetto) {
		this.id = id;
		this.name = replaceIfNull(name, "non specificato");
		this.descriprion = replaceIfNull(description, "nessuna descrizione");
		this.version = replaceIfNull(version, "0.0");
		this.idaProgetto = replaceIfNull(idaProgetto, "non specificato");
		if(price == null) {
			price = new BigDecimal(1);
		}
		this.price = price;
	}
	
	public SellingProductDTO(String name, BigDecimal price, String description, String version, String idaProgetto) {
		this(0, name, price, description, version, idaProgetto);
	}
	
	
	private String replaceIfNull(String value, String def) {
		if(value == null)
			return def;
		return value;
	}
	
	/**
	 * Metodo per ottenere il valore di price.
	 * @return price
	 */

	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * Metodo per impostare il valore di price.
	 * @param price
	 */

	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * Metodo per ottenere il valore di name.
	 * @return name
	 */

	public String getName() {
		return name;
	}

	/**
	 * Metodo per impostare il valore di name
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * Metodo per ottenere il valore di description.
	 * @return description
	 */

	public String getDescriprion() {
		return descriprion;
	}
	
	/**
	 * Metodo per impostare il valore di description.
	 * @param descriprion
	 */

	public void setDescriprion(String descriprion) {
		this.descriprion = descriprion;
	}
	
	/**
	 * Metodo per ottenere il valore di version.
	 * @return version
	 */

	public String getVersion() {
		return version;
	}
	
	/**
	 * Metodo per impostare il valore di version.
	 * @param version
	 */

	public void setVersion(String version) {
		this.version = version;
	}
	
	/**
	 * Metodo per ottenere il valore di id
	 * @return id
	 */

	public int getId() {
		return id;
	}
	
	/**
	 * Metodo per impostare il valore di id.
	 * @param id
	 */

	public void setId(int id) {
		this.id = id;
	}
	
	/**
	 * Metodo per ottenere il valore di idaProgetto.
	 * @return idaProgetto
	 */

	public String getIdaProgetto() {
		return idaProgetto;
	}
	
	/**
	 * Metodo per impostare il valore di idaProgetto.
	 * @param idaProgetto
	 */

	public void setIdaProgetto(String idaProgetto) {
		this.idaProgetto = idaProgetto;
	}
	
}
