/**
 * BoolVect
 */
public interface BoolVect {

    public int dimensione();

    public int taglia();

    public boolean get_value(int i) throws IndexOutOfBoundsException;

    public boolean set_value(int i, boolean value) throws IndexOutOfBoundsException;

    public boolean and(BoolVect bv) throws NullPointerException;

    public boolean or(BoolVect bv) throws NullPointerException;

    public boolean xor(BoolVect bv) throws NullPointerException;
}