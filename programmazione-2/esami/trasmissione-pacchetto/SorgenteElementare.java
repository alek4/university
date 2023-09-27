import java.util.Arrays;
import java.util.Objects;
import java.util.zip.Checksum;

public class SorgenteElementare extends SorgenteAbs {

  public SorgenteElementare(Canale canale) {
    super(canale);
  }

  @Override
  public void trasmetti(String messaggio) {
    Objects.requireNonNull(messaggio, "il messaggio non può essere nullo");

    byte[] bytes = messaggio.getBytes(parametri.charset());
    // System.out.println("Sorgente: mi preparo ad inviare: " + Arrays.toString(bytes));
    // List<Pacchetto> pacchetti = new ArrayList<>();

    int idx = 0;
    Checksum algorithm = parametri.algoritmo();
    for (int i = 0; i < bytes.length; i += parametri.dimensione()) {
      int jump = i + parametri.dimensione();
      if (jump >= bytes.length) {
        jump = bytes.length;
      }
      byte[] content = Arrays.copyOfRange(bytes, i, jump);
      algorithm.reset();
      algorithm.update(content);
      long checksum = algorithm.getValue();
      Pacchetto pacchetto = new Pacchetto(idx, content, checksum);
      // System.out.println("Sorgente: Sto inviando" + Arrays.toString(content));
      canale.inoltra(pacchetto);
      idx++;
    }

    canale.inoltra(null);

  }

}
