import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Objects;

/**
 * Le istanze di questa classe rappresentano degli inventari,
 * che contengono un certo numero di Giocattoli
 */
public class Inventario {
  private final HashMap<Giocattolo, Integer> giocattoli2quantita;

  /**
   * AF: ogni chiave della mappa rappresenta un gioco
   * e il valore associato la sua quantità
   * [giocattolo1:quantità1, giocattolo2:quantità2, ..., giocattoloN, quantitàN]
   * 
   * RI: l'inventario non può essere nullo,
   * la quantità di ciascun giocattolo deve essere > 0
   */

  /**
   * Inizializza this affinchè rappresenti un inventario vuoto
   */
  public Inventario() {
    giocattoli2quantita = new HashMap<>();
  }

  /**
   * crea un inventario partendo da una mappa giocattolo : quantità
   *
   * @param g2q mappa giocattolo : quantità
   * @throws NullPointerException se la mappa o uno dei giocattoli sono nulli
   * @throws IllegalArgumentException se la quantità non è positiva
   */
  public Inventario(HashMap<Giocattolo, Integer> g2q) {
    giocattoli2quantita = new HashMap<>();

    for (Map.Entry<Giocattolo,Integer> e : Objects.requireNonNull(g2q).entrySet()) {
      if (e.getValue() <= 0) throw new IllegalArgumentException("la quantità di una giocattolo deve essere positiva");
      giocattoli2quantita.put(Objects.requireNonNull(e.getKey()), e.getValue());
    }
  }

  /**
   * Costruisce una copia dell'inventario dato
   * 
   * @param og inventario da copiare
   */
  public Inventario(Inventario og) {
    this(og.giocattoli2quantita);
  }


  /**
   * Aggiungi n giocattoli a this inventario
   * 
   * @param g
   * @param qta
   * @throws IllegalArgumentException se la qta è <= 0
   */
  public void aggiungi(int qta, Giocattolo g) {
    if (qta <= 0)
      throw new IllegalArgumentException("La quantità deve essere >= 0.");
    if (giocattoli2quantita.get(g) != null) {
      giocattoli2quantita.put(g, giocattoli2quantita.get(g) + qta);
    } else {
      giocattoli2quantita.put(g, qta);
    }
  }

  /**
   * Rimuove n giocattoli da this inventario,
   * se la nuova quantità è 0 allora verrà rimosso direttamente il giocattolo
   * 
   * @param g
   * @param qta
   * @throws NoSuchElementException se il giocattolo non è presente
   *                                nell'inventario
   * @throws IllegalArgumentException se la nuova quantità diventa negativa
   */
  public void rimuovi(Giocattolo g, int qta) {
    if (giocattoli2quantita.get(g) == null) {
      throw new NoSuchElementException("Il giocattolo non è presente nell'inventario.");
    }

    int currentQta = giocattoli2quantita.get(g);
    if (currentQta - qta < 0) {
      throw new IllegalArgumentException("La quantità di un giocattolo non può essere negativa");
    }

    if (currentQta - qta == 0) {
      giocattoli2quantita.remove(g);
    } else {
      giocattoli2quantita.put(g, currentQta - qta);
    }
  }

  /**
   * Restituisce la quantità del giocattolo passato
   * 
   * @param g
   * @return int
   * @throws NoSuchElementException se il giocattolo non è presente
   *                                nell'inventario
   */
  public int getQuantity(Giocattolo g) {
    if (giocattoli2quantita.get(g) == null) {
      throw new NoSuchElementException("Il giocattolo non è presente nell'inventario.");
    }

    return giocattoli2quantita.get(g);
  }

  public Iterator<Giocattolo> iterator() {
    final List<Giocattolo> giocattoli = new ArrayList<>(giocattoli2quantita.keySet());
    return giocattoli.iterator();
  }
}
