package utility;

public final class SQLStatemets {
	public static final String productById = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv WHERE p.id = ?";
	public static final String productByPriceLower = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv WHERE piv.prezzo < ?";
	public static final String productByPriceHigher = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv WHERE piv.prezzo > ?";
	public static final String productByPriceRange = "SELECT * FROM prodotto p INNER JOIN prodotto_in_vendita piv WHERE piv.prezzo > ? AND piv.prezzo < ?";
	public static final String insertProduct = "INSERT prodotto(nome_prodotto, versione, descrizione, ida) VALUES(?,?,?,?)";
	public static final String updateProduct = "UPDATE prodotto SET nome_prodotto = ?, versione = ?, descrizione = ?, ida = ? WHERE p.id = ?";
}
