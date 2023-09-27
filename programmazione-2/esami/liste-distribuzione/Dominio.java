import java.util.Objects;
import java.util.function.Predicate;
import java.util.regex.Pattern;

public record Dominio(String dominio) {

    final static private String er = "^[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
    final static Predicate<String> VALIDO = Pattern.compile(er).asPredicate();

    public Dominio(final String dominio) {
        if (!VALIDO.test(Objects.requireNonNull(dominio, "dominio non può essere nullo")))
            throw new IllegalArgumentException("la stringa dominio non rispetta l'espressione regolare: " + er);

        this.dominio = dominio;
    }

    @Override
    public String toString() {
        return dominio;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Dominio))
            return false;

        Dominio other = (Dominio) obj;
        return dominio.equals(other.dominio);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dominio);
    }
}