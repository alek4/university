/**
 * Classe immutabile che rappresenta una piastrella quadrata
 */
public class PiastrellaQuadrata extends Piastrella {

    // il lato della piastrella quadrata
    private final int lato;

    /**
     * Costruisce una piastrella quadrata a partire dal costo unitario e dal suo lato
     * 
     * @param costoUnitario
     * @param lato
     * @throws IllegalArgumentException se il costo è <= 0 oppure se il lato è <= 0
     */
    public PiastrellaQuadrata(final int costoUnitario, final int lato) {
        super(costoUnitario);
        if (lato <= 0)
            throw new IllegalArgumentException("il lato deve essere maggiore di 0");

        this.lato = lato;
    }

    @Override
    public int superficie() {
        return lato * lato;
    }

}
