import java.util.Objects;

public class Bancarella {
    final String proprietario;
    final Inventario inventario;
    final Listino listino;

    public Bancarella(String p, Inventario inv, Listino l) {
        Objects.requireNonNull(p, "proprietario non può essere una stringa nulla");
        Objects.requireNonNull(inv, "inventario non può essere nullo");
        Objects.requireNonNull(l, "listino non può essere una nullo");

        if (p.isEmpty()) throw new IllegalArgumentException("il nome del proprietario non può essere una stringa vuota");
        inventario = new Inventario(inv);

        
        proprietario = p;
    }
}
