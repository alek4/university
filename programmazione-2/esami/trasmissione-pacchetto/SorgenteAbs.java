import java.util.Objects;

public abstract class SorgenteAbs implements Sorgente {

  protected final Canale canale;
  protected final Parametri parametri;

  public SorgenteAbs(final Canale canale) {
    this.canale = Objects.requireNonNull(canale, "il canale non può essere nullo");
    this.parametri = canale.parametri();
  }
  
}
