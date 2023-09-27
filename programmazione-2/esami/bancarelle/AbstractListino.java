import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Objects;

/**
 * Classe immutabile astratta che rappresenta i listini
 * in cui il prezzo di un certo numero di un tipo di giocattoli
 * varia in base al suo prezzo unitario
 */
public abstract class AbstractListino implements Listino {
  HashMap<Giocattolo, Integer> giocattolo2prezzo;

  /**
   * Costruisce un listino data una mappa giocattolo -> prezzo unitario
   * 
   * @param g2p
   * @throws NullPointerException se la mappa o una sua chiave/valore sono nulli
   * @throws IllegalArgumentException se uno dei suoi prezzi è negativo
   */
  public AbstractListino(HashMap<Giocattolo,Integer> g2p) {
    Objects.requireNonNull(g2p);

    giocattolo2prezzo = new HashMap<>();
    for (Map.Entry<Giocattolo,Integer> e : g2p.entrySet()) {
      final Giocattolo g = Objects.requireNonNull(e.getKey(), "la mappa non può contenere chiavi nulle");
      final int qta = Objects.requireNonNull(e.getValue(), "la mappa non può contenere valori nulli");

      if (qta < 0) throw new IllegalArgumentException("il prezzo non può essere negativo");

      giocattolo2prezzo.put(g, qta);
    }
  }

  /**
   * Restituisce il prezzo unitario di un giocattolo
   * 
   * @param g giocattolo
   * @return il prezzo unitario del giocattolo
   * @throws NullPointerException se il giocattolo è nullo
   * @throws NoSuchElementException se il giocattolo non è presente nel listino
   */
  public int prezzoUnitario(Giocattolo g) {
    Objects.requireNonNull(g, "il giocattolo non può essere nullo");
    
    if (!giocattolo2prezzo.containsKey(g)) throw new NoSuchElementException();
    return giocattolo2prezzo.get(g);
  }

  @Override
  public boolean conosce(Giocattolo g) {
    Objects.requireNonNull(g, "il giocattolo non può essere nullo");
    return giocattolo2prezzo.containsKey(g);
  }

  @Override
  public abstract int calcolaPrezzo(Giocattolo g, int qta);
}
