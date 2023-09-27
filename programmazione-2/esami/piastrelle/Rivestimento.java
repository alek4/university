/**
 * Interfaccia che rappresenta un rivestimento
 */
public interface Rivestimento {
    
    /**
     * Calcola la superficie del rivestimento
     * 
     * @return la superficie
     */
    public int superficie();

    /**
     * Calcola il costo del rivestimento in base alla superficie
     * 
     * @return il costo del rivestimento
     */
    public int costo();
}
