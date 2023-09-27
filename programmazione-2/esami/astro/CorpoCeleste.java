import java.util.Objects;

public abstract class CorpoCeleste {
    
    public final String nome;
    
    public CorpoCeleste(String nome) {
        this.nome = Objects.requireNonNull(nome, "il nome non può essere nullo");
    }

    public abstract Punto posizione();
    public abstract Punto velocita();

    public int energia() {
        return posizione().norma() + velocita().norma();
    }

    public abstract void modificaVelocita(final CorpoCeleste c);
    public abstract void modificaPosizione();
}
