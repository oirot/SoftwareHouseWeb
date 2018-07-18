package utility;

public final class SQLStatemets {
	public static final String productById = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p_id_prodotto = piv.id_prodottoWHERE p.id = ?";
	public static final String productByPriceLower = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p_id_prodotto = piv.id_prodottoWHERE piv.prezzo < ?";
	public static final String productByPriceHigher = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p_id_prodotto = piv.id_prodotto WHERE piv.prezzo > ?";
	public static final String productByPriceRange = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p_id_prodotto = piv.id_prodotto WHERE piv.prezzo > ? AND piv.prezzo < ?";
	public static final String insertProduct = "INSERT prodotto(nome_prodotto, versione, descrizione, ida) VALUES(?,?,?,?)";
	public static final String updateProduct = "UPDATE prodotto SET nome_prodotto = ?, versione = ?, descrizione = ?, ida = ? WHERE p.id = ?";
	public static final String recensioniById = "SELECT commento, no_stelle FROM recensione WHERE id_prodotto = ?";
	public static final String allProducts ="SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv ON p.id_prodotto = piv.id_prodotto";
}
