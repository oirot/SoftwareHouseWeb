package utility;
import java.util.ArrayList;
import pattern_dao.CartProduct;
import pattern_dao.SellingProductDTO;

public class Cart  {
	
	public Cart() {
		
		productList = new ArrayList<CartProduct>();
	}
	
	public Cart( ArrayList <CartProduct> productList) {
		
		this.productList = productList;
	}
	
	public void addProduct(SellingProductDTO product, int quantity) {
		this.addProduct(new CartProduct(product), quantity);
	}
	
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
	
	public void removeProduct(CartProduct productToRemove) {
		
				productList.remove(productToRemove);
		
	}
	
	public void removeAll() {
		
		
	}
	
	public void modElement() {
		
		
	}
	
	public void totalPrice() {
		
		
	}
	
	ArrayList<CartProduct> productList;
}
