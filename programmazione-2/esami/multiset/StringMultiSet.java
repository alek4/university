/**
 * Questa interfaccia rappresenta un multiset di tipo stringa
 */
interface StringMultiSet extends Iterable<String> {
  int add(String s);
  int remove(String s);
  boolean contains(String s);
  int multiplicity(String s);
  int size();
  StringMultiSet union(StringMultiSet o);
  StringMultiSet intersection(StringMultiSet o);
}
