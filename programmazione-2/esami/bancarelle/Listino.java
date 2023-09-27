import java.util.NoSuchElementException;

/**
 * Interfaccia che rappresenta un listino prezzi
 * 
 * Il listino indica il prezzo totale dato un certo tipo di 
 * giocattolo e la quantità e se è a conoscenza del prezzo del giocattolo
 */
public interface Listino {
  /**
   * @param g il giocattolo
   * @return se il listino conosce il prezzo unitario del giocattolo
   * @throws NullPointerException se il giocattolo è nullo
   */
  public boolean conosce(Giocattolo g); 

  /**
   * Indica il prezzo di un certo numero di giocattoli di un certo tipo
   * 
   * @param g il giocattolo
   * @param qta il numero di giocattoli
   * @return il prezzo totale per il numero di giocattoli
   * @throws NoSuchElementException se il giocattolo non è presente nel listino
   * @throws IllegalArgumentException se la quantità è < 0
   * @throws NullPointerException se il giocattolo è nullo
   */
  public int calcolaPrezzo(Giocattolo g, int qta);
}
