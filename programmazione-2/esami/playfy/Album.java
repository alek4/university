import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Album {

  /**
   * Brano
   */
  public class Brano {

    public final String titolo;
    public final Durata durata;

    private Brano(final String titolo, final Durata durata) {
      if (Objects.requireNonNull(titolo, "il titolo non può essre nullo").isEmpty())
        throw new IllegalArgumentException("il titolo non può essere vuoto");

      this.titolo = titolo;
      this.durata = Objects.requireNonNull(durata, "la durata non può essere nulla");
    }

    public Album album() {
      return this.album();
    }

  }

  public final String titolo;
  private final List<Brano> brani;

  public Album(final List<String> titoli, final List<Durata> durate, final String titolo) {
    if (Objects.requireNonNull(titoli, "la lista non può essere nulla").contains(null))
      throw new IllegalArgumentException("la lista di titoli non può contenere nulli");
    if (Objects.requireNonNull(durate, "la lista non può essere nulla").contains(null))
      throw new IllegalArgumentException("la lista di durate non può contenere nulli");

    brani = new ArrayList<>();
    if (durate.size() != titoli.size())
      throw new IllegalArgumentException("le due liste non hanno la stessa lunghezza");

    for (int i = 0; i < titoli.size(); i++) {
      if (titoli.get(i).isEmpty())
        throw new IllegalArgumentException("il titolo dell' " + i + " brano non può essere nullo");

      brani.add(new Brano(titoli.get(i), durate.get(i)));
    }

    this.titolo = Objects.requireNonNull(titolo, "il titolo dell'album non può essere nullo");
  }
}
