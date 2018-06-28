package pattern_dao;

public class CartProduct extends SellingProductDTO {

	public CartProduct(int id, String name, int price, String description, String version, String idaProgetto, int quantita) {
		super(id, name, price, description, version, idaProgetto);
		this.quantita = quantita;
	}
	
	
	public CartProduct(int id, String name, int price, String description, String version, String idaProgetto) {
		super(id, name, price, description, version, idaProgetto);
		this.quantita = 0;
	}
	
	public CartProduct(SellingProductDTO product, int quantity) {
		this(product.getId(), product.getName(), product.getPrice(), product.getDescriprion(), product.getVersion(), product.getIdaProgetto(), quantity);
	}
	
	public CartProduct(SellingProductDTO product) {
		this(product, 1);
	}

	public void addQuantity(int numero) {
		
		if(numero <= 0) {
			
			throw new IllegalArgumentException("Impossibile aggiungere quantità negativa!");
		}
		this.quantita += numero;
	}
	
	public void addQuantity1() {
		
		this.quantita += 1;
	}
	
	
	public void subQuantity(int numero) {
		
		if(numero <=0) {
			
			throw new IllegalArgumentException("Impossibile sottrarre quantità negativa!");
		}
		
		this.quantita -= numero;
	}
	
	public void subQuantity1() {
		
		this.quantita -=1;
	}
	
	public int getQuantity() {
		return quantita;
	}


	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}


	private int quantita;
}
