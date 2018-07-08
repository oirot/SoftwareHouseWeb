package pattern_dao;

/**
 * Classe che rappresenta una recensione
 * @author Vittorio
 *
 */
public class Review {
	//costanti statiche che definiscono i vincoli
	private static final int maxCommLen = 250;
	private static final int minStars = 0;
	private static final int maxStars = 5;
	
	
	private String comment;
	private int stars;
	
	//validate the comment
	private void validateComment(String comment) throws IllegalArgumentException{
		if(comment == null)
			throw new IllegalArgumentException("void comment");
		if(comment.length() > maxCommLen)
			throw new IllegalArgumentException("comment string too long");
	}
	
	//validate the no of stars
	private void validateStars(int stars) throws IllegalArgumentException{
		if(stars < minStars || stars > maxStars) {
			throw new IllegalArgumentException("stars rating out of range");
		}
	}
	
	
	/**
	 * Costruttore di classe
	 * @param comment il commento associato alla recensione
	 * @param stars il numero di stelle associato alla recensione
	 * @throws IllegalArgumentException nel caso in cui uno dei due parametri non rispettassero i vincoli
	 */
	public Review(String comment, int stars) throws IllegalArgumentException{
		validateComment(comment);
		validateStars(stars);
		this.comment = comment;
		this.stars = stars;
	}

	/**
	 * 
	 * @return il commento associato alla recensione
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * 
	 * @param comment il commento associato alla recensione
	 * @throws IllegalArgumentException nel caso in cui il commento non rispetti i vincoli
	 */
	public void setComment(String comment) throws IllegalArgumentException{
		validateComment(comment);
		this.comment = comment;
	}

	/**
	 * 
	 * @return il numero di stelle associato alla recensione
	 */
	public int getStars() {
		return stars;
	}

	/**
	 * 
	 * @param stars il numero di stelle associato alla recensione
	 * @throws IllegalArgumentException nel caso in cui il numero di stelle non rispetti i vincoli
	 */
	public void setStars(int stars) throws IllegalArgumentException{
		validateStars(stars);
		this.stars = stars;
	}
	
	
	
}
