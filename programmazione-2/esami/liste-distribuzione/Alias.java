import java.util.HashSet;
import java.util.Iterator;
import java.util.Objects;
import java.util.Set;

/**
 * Alias
 */
public class Alias implements Iterable<Indirizzo> {

    public final String nome;
    public final Dominio dominio;
    private final Set<Locale> locales;

    public Alias(final String nome, final Dominio dominio) {
        if (Objects.requireNonNull(nome, "il nome non può essere nullo").isEmpty())
            throw new IllegalArgumentException("il nome non può essere vuoto");

        this.nome = nome;
        this.dominio = Objects.requireNonNull(dominio, "il dominio non può essere nullo");
        locales = new HashSet<Locale>();
    }

    public void addLocale(final Locale locale) {
        Objects.requireNonNull(locale);
        locales.add(locale);
    }

    public void removeLocale(final Locale locale) {
        Objects.requireNonNull(locale);
        locales.remove(locale);
    }

    public boolean containsLocale(Locale locale) {
        Objects.requireNonNull(locale, "locale non può essere nullo");
        return locales.contains(locale);
    }

    public boolean containsIndirizzo(Indirizzo indirizzo) {
        if (!indirizzo.dominio.equals(dominio))
            return false;

        return locales.contains(indirizzo.locale);
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Alias))
            return false;

        Alias other = (Alias) obj;

        return other.nome.equals(nome);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nome);
    }

    @Override
    public Iterator<Indirizzo> iterator() {

        return new Iterator<Indirizzo>() {
            Iterator<Locale> it = locales.iterator();

            @Override
            public boolean hasNext() {
                return it.hasNext();
            }

            @Override
            public Indirizzo next() {
                return new Indirizzo(it.next(), dominio);
            }
            
        };
    }
}