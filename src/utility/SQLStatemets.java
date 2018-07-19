package utility;

public final class SQLStatemets {
	public static final String productById = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p.id_prodotto = piv.id_prodotto WHERE p.id_prodotto = ?";
	public static final String productByPriceLower = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p.id_prodotto = piv.id_prodotto WHERE piv.prezzo < ?";
	public static final String productByPriceHigher = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p.id_prodotto = piv.id_prodotto WHERE piv.prezzo > ?";
	public static final String productByPriceRange = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p.id_prodotto = piv.id_prodotto WHERE piv.prezzo > ? AND piv.prezzo < ?";
	public static final String insertProduct = "INSERT prodotto(nome_prodotto, versione, descrizione, ida, id_prodotto) VALUES(?,?,?,?,?)";
	public static final String updateProduct = "UPDATE prodotto p SET nome_prodotto = ?, versione = ?, descrizione = ?, ida = ? WHERE p.id_prodotto = ?";
	public static final String updateSelling = "UPDATE prodotto_in_vendita SET prezzo = ? WHERE id_prodotto = ?";
	public static final String insertSelling = "INSERT prodotto_in_vendita(id_prodotto, prezzo) VALUES(?,?)";
	public static final String deleteProduct = "DELETE FROM prodotto_in_vendita WHERE id_prodotto = ?";
	public static final String deleteProductSelling = "DELETE FROM prodotto WHERE id_prodotto = ?";
	public static final String recensioniById = "SELECT commento, no_stelle FROM recensione WHERE id_prodotto = ?";
	public static final String allProducts ="SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p.id_prodotto = piv.id_prodotto";
}
