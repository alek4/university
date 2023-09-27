public class StellaFissa extends CorpoCeleste {

    final private Punto posizione, velocita = new Punto(0,0,0);
    
    public StellaFissa(String nome, int x, int y, int z) {
        super(nome);
        posizione = new Punto(x,y,x);
    }

    @Override
    public Punto posizione() {
        return posizione;
    }

    @Override
    public Punto velocita() {
        return velocita;
    }

    @Override
    public void modificaVelocita(CorpoCeleste c) {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void modificaPosizione() {
        // TODO Auto-generated method stub
        
    }
    
    @Override
    public String toString() {
        return String.format("Stella fissa, %s: %s", nome, posizione);
    }
}
