/**
 * Clase che gestisce  i prodotti nel carrello.
 */

package utility;
import java.math.BigDecimal;
import java.util.ArrayList;
import pattern_dao.CartProduct;
import pattern_dao.SellingProductDTO;

/**
 * 
 * @author Raffaele, Vittorio.
 *
 */

public class Cart  {
	
	/**
	 * Costruttore che crea un ArrayList.
	 */
	
	public Cart() {
		
		productList = new ArrayList<CartProduct>();
	}
	
	/**
	 * Costruttore che inizializza un ArrayList passato dall'utente.
	 * @param productList
	 */
	
	public Cart( ArrayList <CartProduct> productList) {
		
		this.productList = productList;
	}
	
	/**
	 * Metodo che aggiunge un prodotto ai prodotti in vendita.
	 * @param product
	 * @param quantity
	 */
	
	public void addProduct(SellingProductDTO product, int quantity) {
		this.addProduct(new CartProduct(product), quantity);
	}
	
	/**
	 * Metodo che aggiunge un prodotto al carrello se esso non è già presente.
	 * @param productToAdd
	 */
	public void addProduct(CartProduct productToAdd) {
		
		boolean isPresent = false;
		
		for (CartProduct cartProduct : productList) {
			if(cartProduct.getId() == productToAdd.getId()) {
				cartProduct.addQuantity(productToAdd.getQuantity());
				isPresent = true;
				break;
			}
		}
		if(!isPresent) {
			productList.add(productToAdd);
		}	
		 
	}
	
	/**
	 * Metodo che rimuove un prodotto dal carrello.
	 * @param productToRemove
	 */
	
	public boolean removeProduct(CartProduct productToRemove) {
		
		return productList.remove(productToRemove);
		
	}
	
	/**
	 * Metodo che rimuove tutti i prodotti dal carrello.
	 */
	
	public void removeAll() {
		
		productList.removeAll(productList);
	}
	
	public void modElement() {
		
		
	}
	
	/**
	 * Metodo che restituisce la somma dei prezzi appartenenti al prodotti del carrello.
	 * @return 
	 * @return
	 */
	
	public BigDecimal totalPrice() {
		
		BigDecimal tot = new BigDecimal(0);
		
		 	for(int i=0;i<productList.size();i++) {
			 
			 tot.add(productList.get(i).getPrice());
		 }
			return tot; 
	}
	
	ArrayList<CartProduct> productList;
}
