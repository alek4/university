import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Set;

public class ListeDistribuzione implements Iterable<Indirizzo> {

    public final String nome;
    private final Set<Alias> aliases = new HashSet<>();

    public ListeDistribuzione(final String nome, final Alias alias) {
        Objects.requireNonNull(alias, "alias non può essere nullo");
        aliases.add(alias);

        if (Objects.requireNonNull(nome, "il nome non può essere nullo").isEmpty())
            throw new IllegalArgumentException("il nome non può essere vuoto");

        this.nome = nome;
    }

    private ListeDistribuzione(final String nome, final Set<Alias> aliases) {
        Objects.requireNonNull(aliases, "alias non può essere nullo");
        this.aliases.addAll(aliases);

        if (Objects.requireNonNull(nome, "il nome non può essere nullo").isEmpty())
            throw new IllegalArgumentException("il nome non può essere vuoto");

        this.nome = nome;
    }

    public ListeDistribuzione addLista(final String newName, final ListeDistribuzione other) {
        Objects.requireNonNull(other, "la lista non può essere nulla");
        Set<Alias> resultSet = new HashSet<>(aliases);
        resultSet.addAll(other.aliases);
        ListeDistribuzione result = new ListeDistribuzione(newName, resultSet);

        System.out.println("addLadwista: " + Arrays.toString(result.aliases.toArray()));
        return result;
    }

    public ListeDistribuzione subLista(final String newName, final ListeDistribuzione other) {
        Objects.requireNonNull(other, "la lista non può essere nulla");
        Set<Alias> resultSet = new HashSet<>(aliases);
        resultSet.removeAll(other.aliases);
        ListeDistribuzione result = new ListeDistribuzione(newName, resultSet);

        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof ListeDistribuzione))
            return false;

        ListeDistribuzione other = (ListeDistribuzione) obj;

        return nome.equals(other.nome);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nome);
    }

    @Override
    public Iterator<Indirizzo> iterator() {
        return new Iterator<Indirizzo>() {

            Iterator<Alias> it = aliases.iterator();
            Alias currentAlias = it.next();
            Iterator<Indirizzo> it2 = currentAlias.iterator();

            @Override
            public boolean hasNext() {
                return it2.hasNext() || it.hasNext();
            }

            @Override
            public Indirizzo next() {
                if (it2.hasNext())
                    return it2.next();
                else if (it.hasNext()) {
                    currentAlias = it.next();
                    it2 = currentAlias.iterator();
                    return it2.next();
                }

                throw new NoSuchElementException();
            }

        };
    }
}
