import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

public class Pavimentazione implements Rivestimento, Iterable<Rivestimento> {

    private final List<Rivestimento> rivestimenti;

    public Pavimentazione(final List<Rivestimento> rivestimenti) {
        this.rivestimenti = new ArrayList<>();
        Objects.requireNonNull(rivestimenti, "la lista di rivestimenti non può essere nulla");
        for (Rivestimento r : rivestimenti) {
            Objects.requireNonNull(r, "la lista non può contenere rivestimenti nulli");
            if (r == this)
                throw new IllegalArgumentException("questa pavimentazione non può contenere se stessa");
            this.rivestimenti.add(r);
        }
    }

    @Override
    public int superficie() {
        int res = 0;
        for (Rivestimento rivestimento : rivestimenti) {
            res += rivestimento.superficie();
        }
        return res;
    }

    @Override
    public int costo() {
        int res = 0;
        for (Rivestimento rivestimento : rivestimenti) {
            res += rivestimento.costo();
        }
        return res;
    }

    @Override
    public Iterator<Rivestimento> iterator() {
        return Collections.unmodifiableList(rivestimenti).iterator();
    }

}
