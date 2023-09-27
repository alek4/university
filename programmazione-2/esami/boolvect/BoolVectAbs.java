import java.util.Objects;

public abstract class BoolVectAbs implements BoolVect {

    @Override
    public boolean and(BoolVect bv) throws NullPointerException {
        Objects.requireNonNull(bv, "bv non può essere nullo");

        int maxDim = 0;
        if (this.dimensione() > bv.dimensione()) {
            maxDim = dimensione();
        } else {
            maxDim = bv.dimensione();
        }

        
    }

    @Override
    public String toString() {
        if (dimensione() == 0)
            return "F";
        StringBuilder sb = new StringBuilder();
        for (int i = dimensione() - 1; i >= 0; i--)
            sb.append(get_value(i) ? "V" : "F");
        return sb.toString();
    }
}
