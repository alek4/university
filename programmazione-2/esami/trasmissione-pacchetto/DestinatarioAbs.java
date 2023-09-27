import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public abstract class DestinatarioAbs implements Destinatario {
  
  protected final Parametri parametri;
  protected final List<Byte> bytes;

  public DestinatarioAbs(final Parametri parametri) {
    this.parametri = Objects.requireNonNull(parametri, "i parametri non possono essere nulli");
    bytes = new ArrayList<>();
  }

  @Override
  public Parametri parametri() {
    return parametri;
  }
}
