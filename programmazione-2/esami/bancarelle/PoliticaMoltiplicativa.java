import java.util.HashMap;

/**
 * Classe concreta che rappresenta i listini che applicano una semplice politica 
 * moltiplicativa (prezzo giocattolo * n) per calcolare il prezzo totale della 
 * quantità di un certo tipo di giocattolo
 */
public class PoliticaMoltiplicativa extends AbstractListino {

  public PoliticaMoltiplicativa(HashMap<Giocattolo, Integer> g2p) {
    super(g2p);
  }

  @Override
  public int calcolaPrezzo(Giocattolo g, int qta) {
    if (qta < 0) throw new IllegalArgumentException("la quantità deve essere positiva");
    return this.prezzoUnitario(g) * qta;
  }

}
