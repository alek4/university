import java.util.Arrays;

public class CanaleElementare extends CanaleAbs {

  public CanaleElementare(Destinatario destinatario) {
    super(destinatario);
  }

  @Override
  public boolean inoltra(Pacchetto pacchetto) {
    // if (pacchetto != null) 
    //   System.out.println("Canale: Sto inviando" + Arrays.toString(pacchetto.contenuto()));
    // else System.out.println("Canale: Termina!");
    destinatario.ricevi(pacchetto);
    return true;
  }

}
