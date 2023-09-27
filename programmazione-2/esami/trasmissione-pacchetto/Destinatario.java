/**
 * Destinatario
 */
public interface Destinatario {

  public Parametri parametri();

  public boolean ricevi(Pacchetto pacchetto);
}