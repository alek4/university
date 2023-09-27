/**
 * Classe astratta che rappresenta una  Piastrella
 */
public abstract class Piastrella implements Rivestimento {

    // il costo unitario della singola piastrella
    private final int costoUnitario;

    /**
     * Costruisce una piastrella a partire dal costo unitario
     * 
     * @param costoUnitario
     * @throws IllegalArgumentException se il costo non è positivo
     */
    protected Piastrella(final int costoUnitario) {
        if (costoUnitario <= 0)
            throw new IllegalArgumentException("il costo unitario deve essere maggiore di 0");

        this.costoUnitario = costoUnitario;
    }

    @Override
    public int costo() {
        return costoUnitario;
    }
    
}