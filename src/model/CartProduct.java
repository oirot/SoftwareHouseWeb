/**
 * Classe che identifica un prodotto all'interno di un carrello.
 */

package model;

import java.math.BigDecimal;

/**
 * 
 * @author Raffaele, Vittorio.
 *
 */

public class CartProduct extends SellingProductDTO {
	
	/**
	 * Costruttore della classe con quantita inizializzata dall'utente.
	 * @param id
	 * @param name
	 * @param price
	 * @param description
	 * @param version
	 * @param idaProgetto
	 * @param quantita
	 */

	public CartProduct(int id, String name, BigDecimal price, String description, String version, String idaProgetto, int quantita) {
		super(id, name, price, description, version, idaProgetto);
		this.quantita = quantita;
	}
	
	/**
	 * Costruttore della classe con quantita inizializzata a 1.
	 * @param id
	 * @param name
	 * @param price
	 * @param description
	 * @param version
	 * @param idaProgetto
	 */
	
	
	public CartProduct(int id, String name, BigDecimal price, String description, String version, String idaProgetto) {
		super(id, name, price, description, version, idaProgetto);
		this.quantita = 1;
	}
	
	/**
	 * 
	 * @param product
	 * @param quantity
	 */
	
	public CartProduct(SellingProductDTO product, int quantity) {
		this(product.getId(), product.getName(), product.getPrice(), product.getDescriprion(), product.getVersion(), product.getIdaProgetto(), quantity);
	}
	
	/**
	 * Costruttuore con prodotto e quantita passate dall'utente.
	 * @param product
	 */
	
	public CartProduct(SellingProductDTO product) {
		this(product, 1);
	}
	
	/**
	 * Metodo che aggiunge una quantita definita dall'utente.
	 * @param numero
	 */

	public void addQuantity(int numero) {
		
		if(numero <= 0) {
			
			throw new IllegalArgumentException("Impossibile aggiungere quantità negativa!");
		}
		this.quantita += numero;
	}
	
	/**
	 * Metodo che aggiunge 1 alla quantità nel carrello.
	 */
	
	public void addQuantity() {
		
		addQuantity(1);
	}
	
	/**
	 * Metodo che sottrae una quantità definita dall'utente dal carrello (la quantita sottratta non può essere minore di 0.)
	 * @param numero
	 * @return isEmpty()
	 */
	
	public boolean subQuantity(int numero) {
		
		if(numero <=0) {
			
			throw new IllegalArgumentException("Impossibile sottrarre quantità negativa!");
		}
		
		if(this.quantita - numero < 0)  {
			
			throw new IllegalArgumentException("Impossibile avere quantità negativa!");
		}
		this.quantita -= numero;
		return isEmpty();
	}
	
	/**
	 * Metodo che sottrae 1 alla quantità nel carrello.
	 * @return subQuantity(1)
	 */
	
	public boolean subQuantity() {
		
		return subQuantity(1);
	}
	
	/**
	 * Metodo per stabilire se il carrello è vuoto.
	 * @return this.quantita
	 */
	
	public boolean isEmpty() {
		
		return this.quantita == 0;
	}
	
	/**
	 * Metodo per ottenere il valore di quantita.
	 * @return quantita
	 */
	
	public int getQuantity() {
		return quantita;
	}

	/**
	 * Metodo per impostare la quantita.
	 * @param quantita
	 */

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}


	private int quantita;
}
