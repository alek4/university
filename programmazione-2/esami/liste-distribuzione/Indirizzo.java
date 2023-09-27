import java.util.Objects;

public class Indirizzo {
    public final Locale locale;
    public final Dominio dominio;

    public Indirizzo(final String locale, final String dominio) {
        this.locale = new Locale(locale);
        this.dominio = new Dominio(dominio);
    }
    public Indirizzo(final Locale locale, final Dominio dominio) {
        this.locale = Objects.requireNonNull(locale, "locale non può essere nullo");
        this.dominio = Objects.requireNonNull(dominio, "dominuo non può essere nullo");
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Indirizzo))
            return false;

        Indirizzo other = (Indirizzo) obj;
        return locale.equals(other.locale) && dominio.equals(other.dominio);
    }

    @Override
    public int hashCode() {
        return Objects.hash(locale, dominio);
    }

    @Override
    public String toString() {
        return locale + "@" + dominio;
    }
}
