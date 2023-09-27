import java.util.Objects;

/**
 * Classe concreta che rappresenta la Durata di un brano o album
 */
public class Durata {

  // i secondi che rappresentano la durata
  private final int s;

  /**
   * Cotruisce una durata a partire dai secondi
   * 
   * @param secondi
   * @throws IllegalArgumentException se secondi < 0
   */
  public Durata(final int secondi) {
    if (secondi < 0)
      throw new IllegalArgumentException("i secondi devono essere positivi");

    s = secondi;
  }

  /**
   * Metodi di utilità per calcolare il valore di una componente di una durata in
   * formato stringa
   * 
   * Converte la componente in stringa nel suo valore intero, facendo tutti i
   * controlli necessari
   * 
   * @param componente la componente dell'orario
   * @param bounded    se il valore numerico della componente deve essere minore
   *                   di 60
   * @return il valore numerico della componente
   * @throws NullPointerException     se la componente è nulla
   * @throws IllegalArgumentException se la componente è vuota oppure se
   */
  private static int toSeconds(final String componente, final boolean bounded) {
    if (Objects.requireNonNull(componente, "la componente non può essere nulla").isEmpty())
      throw new IllegalArgumentException("la componente non può esere vuotao");

    int value;
    try {
      value = Integer.parseInt(componente);
    } catch (NumberFormatException e) {
      throw new IllegalArgumentException("la componente " + componente + " non è un numero");
    }

    if (value < 0)
      throw new IllegalArgumentException("la componente non può essere negativa");

    if (bounded && value >= 60)
      throw new IllegalArgumentException("la componente deve essere compresa tra 0 e 59");

    return value;
  }

  /**
   * Fabbrica uuna durata data una stringa del formato HH:MM:SS, MM:SS, SS
   * 
   * @param str
   * @return
   */
  public static Durata fromString(final String str) {
    if (Objects.requireNonNull(str, "la durata non può essere nulla").isEmpty())
      throw new IllegalArgumentException("la surata non può essere vuota");

    String[] parts = str.split(":");
    int numParts = parts.length;

    if (numParts > 3)
      throw new IllegalArgumentException("la durata non può contenere ':' più di 2 volte");

    try {

      int hours = numParts < 3 ? 0 : toSeconds(parts[numParts - 3], false);
      int minutes = numParts < 2 ? 0 : toSeconds(parts[numParts - 2], true);
      int seconds = toSeconds(parts[numParts - 1], true);

      int totSecs = hours * 3600 + minutes * 60 + seconds;

      return new Durata(totSecs);
    } catch (IllegalArgumentException e) {
      throw new IllegalArgumentException("formato della durata invalido. " + e.getMessage());
    }
  }

  /**
   * Calcola una nuova durata risultante dalla somma di questa durata e other
   *
   * @param other
   * @return la durata risutltante
   * @throws NullPointerException     se other è nullo
   */
  public Durata somma(final Durata other) {
    Objects.requireNonNull(other, "la durata other non può essere nulla");
    return new Durata(s + other.s);
  }

  /**
   * Calcola una nuova durata risultante dalla sottrazione di questa durata e
   * other
   *
   * @param other
   * @return la durata risultante
   * @throws NullPointerException     se other è nullo
   * @throws IllegalArgumentException se il risultato è negativo
   */
  public Durata sottrazione(final Durata other) {
    Objects.requireNonNull(other, "la durata other non può essere nulla");
    if (s - other.s < 0)
      throw new IllegalArgumentException("il risultato della sottrazione non può essere negativo");

    return new Durata(s - other.s);
  }

  @Override
  public String toString() {
    final int hh = s / 3600;
    return String.format("%s%02d:%02d", hh > 0 ? hh + ":" : "", s / 60 % 60, s % 60);
  }
}