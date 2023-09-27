import java.util.Objects;

/**
 * Punto
 */
public record Punto(int x, int y, int z) {

    public Punto somma(Punto q) {
        Objects.requireNonNull(q);

        return new Punto(x + q.x, y + q.y, z + q.z);
    }

    public Punto sottrai(Punto q) {
        Objects.requireNonNull(q);
        
        return new Punto(x - q.x, y - q.y, z - q.z);
    }

    public int norma() {
       return Math.abs(x) + Math.abs(y) + Math.abs(z); 
    }

    @Override
    public String toString() {
        return String.format("(null%d %d %d)", x, y, z);
    }
}