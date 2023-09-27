import java.util.Objects;
import java.util.function.Predicate;
import java.util.regex.Pattern;

public record Locale(String locale) {

    final static private String er = "^[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*$";
    final static Predicate<String> VALIDO = Pattern.compile(er).asPredicate();

    public Locale(final String locale) {
        if (!VALIDO.test(Objects.requireNonNull(locale, "locale non può essere nullo")))
            throw new IllegalArgumentException("la stringa locale non rispetta l'espressione regolare: " + er);

        this.locale = locale;
    }

    @Override
    public String toString() {
        return locale;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Locale))
            return false;

        Locale other = (Locale) obj;
        return locale.equals(other.locale);
    }

    @Override
    public int hashCode() {
        return Objects.hash(locale);
    }
}
