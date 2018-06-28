package pattern_dao;

import java.math.BigDecimal;

public class SellingProductDTO {
	private BigDecimal price;
	private String name;
	private String descriprion;
	private String version;
	private int id;
	private String idaProgetto;
	
	public SellingProductDTO(){
	}
	
	public SellingProductDTO(int id, String name, BigDecimal price, String description, String version, String idaProgetto) {
		this.id = id;
		this.name = name;
		this.descriprion = description;
		this.version = version;
		this.idaProgetto = idaProgetto;
		this.price = price;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescriprion() {
		return descriprion;
	}

	public void setDescriprion(String descriprion) {
		this.descriprion = descriprion;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIdaProgetto() {
		return idaProgetto;
	}

	public void setIdaProgetto(String idaProgetto) {
		this.idaProgetto = idaProgetto;
	}
	
}