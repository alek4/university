import java.util.Objects;

/**
 * Pianeta
 */
public class Pianeta extends CorpoCeleste {

    public Pianeta() {}

    @Override
    public Punto posizione() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Punto velocita() {
        return velocita;
    }

    @Override
    public void modificaVelocita(CorpoCeleste c) {
       Objects.requireNonNull(c);
       Punto delta = posizione.sottrai(c.posizione());
       velocita = velocita.sottrai(new Punto(Math.signum(delta.x()), delta.y(), delta.z()))
    }

    @Override
    public void modificaPosizione() {
        // TODO Auto-generated method stub
        
    }

    
}