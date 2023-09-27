import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class StringMultiSetMap implements StringMultiSet {

    private final HashMap<String, Integer> multiSetMap;

    public StringMultiSetMap(final List<String> input) {
        Objects.requireNonNull(input);
        multiSetMap = new HashMap<>();

        for (String string : input) {
            Objects.requireNonNull(string);
            Integer num = multiSetMap.get(string);
            if (num == null) {
                multiSetMap.put(string, 1);
            } else {
                multiSetMap.put(string, num);
            }
        }
    }

    @Override
    public Iterator<String> iterator() {
        final List<String> ll = new ArrayList<>(multiSetMap.keySet());
        return ll.iterator();
    }

    @Override
    public int add(String s) {
        Objects.requireNonNull(s);
        Integer num = multiSetMap.get(s);
        if (num == null) {
            multiSetMap.put(s, 1);
        } else {
            multiSetMap.put(s, num);
        }
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
        Objects.requireNonNull(s);
        Objects.requireNonNull(multiSetMap.get(s));
        Integer n = multiSetMap.get(s);
        if (n == null) return 0;
        return n;
    }

    @Override
    public int size() {
        int mul = 0;
        for (Map.Entry<String,Integer> e : multiSetMap.entrySet()) {
            mul = mul + e.getValue();
        }
        return mul;
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
