import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

public class StringMutiSetList implements StringMultiSet {
    private final List<String> list;

    /**
     * Genera un multiset da una lista di stringhe
     * @param input lista di stringhe
     * @throws NullPointerException se l'input o una delle sue stringhe sono nulle
     */
    public StringMutiSetList(final List<String> input) {
        list = new ArrayList<>();

        Objects.requireNonNull(input);

        for (String s : input) {
            Objects.requireNonNull(s);
            list.add(s);
        }
    }

    @Override
    public Iterator<String> iterator() {
        
        return list.iterator();
    }

    @Override
    public int add(String s) {
        Objects.requireNonNull(s);
        list.add(s);
        return multiplicity(s);
    }

    @Override
    public int remove(String s) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public boolean contains(String s) {
        return multiplicity(s) > 0;
    }

    @Override
    public int multiplicity(String s) {
        int count = 0;
    
        for (String str : list) {
            if (str == s) count++;
        }

        return count;
    }

    @Override
    public int size() {
        
        return 0;
    }

    @Override
    public StringMultiSet union(StringMultiSet o) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public StringMultiSet intersection(StringMultiSet o) {
        // TODO Auto-generated method stub
        return null;
    }
    
}
