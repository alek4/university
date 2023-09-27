import java.util.Objects;

public abstract class CanaleAbs implements Canale {
  
  protected final Destinatario destinatario;
  protected final Parametri parametri;

  public CanaleAbs(Destinatario destinatario) {
    this.destinatario = Objects.requireNonNull(destinatario, "il destinatario non può essere nullo");
    this.parametri = destinatario.parametri();
  }

  @Override
  public Parametri parametri() {
    return parametri;
  }
}
